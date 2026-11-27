package app.xposed.patches.twitter.badges

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.matchSingle
import app.xposed.patches.twitter.Constants.HOOKS_CLASS
import app.xposed.patches.twitter.Constants.MODEL_BRIDGE_CLASS
import app.xposed.patches.twitter.util.descriptor
import app.xposed.patches.twitter.util.field
import app.xposed.patches.twitter.util.fieldRef
import app.xposed.patches.twitter.util.instructionList
import app.xposed.patches.twitter.util.methodRef
import app.xposed.patches.twitter.util.replaceStub
import app.xposed.patches.twitter.util.single
import app.xposed.patches.twitter.util.stringRef
import app.xposed.patches.twitter.util.toStringFields
import app.xposed.patches.twitter.util.typeRef
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private object GraphqlUserToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("GraphqlUser(rest_id="),
)

private object GraphqlUrlsEntityToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("GraphqlUrlsEntity(display_url="),
)

private const val GRAPHQL_URL = "https://api.x.com/graphql"
private const val APOLLO_API = "Lcom/apollographql/apollo/api/"

/**
 * Profile details for timeline users. X's timeline queries leave out the GraphQL user fields
 * only profiles show (location, website, post count), so X-Posed's filters on them only worked
 * after opening a profile. When a saved filter needs them, the extension sets the query
 * variable that includes them, and reads them from each GraphQL user before X maps it to the
 * timeline's user model, which has no place for them.
 */
internal fun BytecodePatchContext.hookTimelineProfiles(minimalUser: String) {
    writeGraphqlUserBridge(minimalUser)
    hookQueryVariables()
}

private fun BytecodePatchContext.toStringOf(type: String, what: String): Map<String, FieldReference> {
    val toString = classDefBy(type).methods.firstOrNull { it.name == "toString" && it.parameterTypes.isEmpty() }
        ?: throw PatchException("$what ($type) has no toString")
    return toStringFields(toString)
}

/** ModelBridge stubs for the GraphQL user and its profile-only part, and the mapper hook. */
private fun BytecodePatchContext.writeGraphqlUserBridge(minimalUser: String) {
    val graphqlUser = GraphqlUserToStringFingerprint.matchSingle()
    val userType = graphqlUser.originalClassDef.type
    val userFields = toStringFields(graphqlUser.originalMethod)
    val restId = userFields.field("GraphqlUser", "rest_id", "J")
    val profileOnly = userFields.field("GraphqlUser", "userProfileOnly")

    val profileFields = toStringOf(profileOnly.type, "UserProfileOnly")
    val website = profileFields.field("UserProfileOnly", "website")
    val tweetCounts = profileFields.field("UserProfileOnly", "tweet_counts")
    val location = profileFields.field("UserProfileOnly", "location")
    val bio = profileFields.field("UserProfileOnly", "profile_bio")
    val websiteUrl = toStringOf(website.type, "Website").field("Website", "url", STRING)
    val tweets = toStringOf(tweetCounts.type, "Tweet_counts").field("Tweet_counts", "tweets", "Ljava/lang/Long;")
    val locationText = toStringOf(location.type, "Location").field("Location", "location", STRING)
    val bioEntities = toStringOf(bio.type, "Profile_bio").field("Profile_bio", "entities")
    val entitiesUrl = toStringOf(bioEntities.type, "Entities").field("Entities", "url")
    val entitySet = toStringOf(entitiesUrl.type, "Url").field("Url", "graphqlEntitySet")
    val urls = toStringOf(entitySet.type, "GraphqlEntitySet").field("GraphqlEntitySet", "urls", "Ljava/util/List;")
    val urlsEntity = GraphqlUrlsEntityToStringFingerprint.matchSingle()
    val urlsEntityType = urlsEntity.originalClassDef.type
    val urlsEntityFields = toStringFields(urlsEntity.originalMethod)
    val entityUrl = urlsEntityFields.field("GraphqlUrlsEntity", "url", STRING)
    val entityExpanded = urlsEntityFields.field("GraphqlUrlsEntity", "expanded_url", STRING)

    // GraphqlUser to MinimalUser: what every timeline author, quote and user row goes through.
    val mapper = Fingerprint(
        isStatic = true,
        returnType = minimalUser,
        parameters = listOf(userType),
        custom = { method, _ -> method.instructionList.any { it.stringRef?.startsWith("Missing GraphqlUser.screen_name") == true } },
    ).matchSingle()

    requirePublic(
        userType, restId, profileOnly, website, tweetCounts, location, bio, websiteUrl, tweets, locationText, bioEntities,
        entitiesUrl, entitySet, urls, urlsEntityType, entityUrl, entityExpanded,
    )

    fun stub(name: String, locals: Int, smali: String) = replaceStub(MODEL_BRIDGE_CLASS, name, locals, smali)
    stub(
        "graphqlUserId", 2,
        """
        check-cast p0, $userType
        iget-wide v0, p0, ${restId.descriptor}
        return-wide v0
        """,
    )
    stub(
        "graphqlProfile", 1,
        """
        check-cast p0, $userType
        iget-object v0, p0, ${profileOnly.descriptor}
        return-object v0
        """,
    )
    // Each step may be null: the server omits low-priority fields under load.
    fun chain(name: String, steps: List<FieldReference>) = stub(
        name, 1,
        buildString {
            appendLine("check-cast p0, ${profileOnly.type}")
            appendLine("move-object v0, p0")
            steps.forEach { step ->
                appendLine("iget-object v0, v0, ${step.descriptor}")
                appendLine("if-eqz v0, :none")
            }
            appendLine("return-object v0")
            appendLine(":none")
            appendLine("const/4 v0, 0x0")
            appendLine("return-object v0")
        },
    )
    chain("profileOnlyLocation", listOf(location, locationText))
    chain("profileOnlyWebsite", listOf(website, websiteUrl))
    chain("profileOnlyPostCount", listOf(tweetCounts, tweets))
    chain("profileOnlyUrls", listOf(bio, bioEntities, entitiesUrl, entitySet, urls))
    fun entityStub(name: String, field: FieldReference) = stub(
        name, 1,
        """
        instance-of v0, p0, $urlsEntityType
        if-eqz v0, :none
        check-cast p0, $urlsEntityType
        iget-object v0, p0, ${field.descriptor}
        return-object v0
        :none
        const/4 v0, 0x0
        return-object v0
        """,
    )
    entityStub("urlsEntityUrl", entityUrl)
    entityStub("urlsEntityExpanded", entityExpanded)

    mapper.method.addInstructions(0, "invoke-static/range { p0 .. p0 }, $HOOKS_CLASS->onGraphqlUser(Ljava/lang/Object;)V")
}

/**
 * Apollo writes an operation's variables twice: as JSON for the request, and as a map the
 * response parser evaluates `@include(if: ...)` with. Both go through one helper class; the
 * extension changes what they return only for the timeline queries it chose.
 */
private fun BytecodePatchContext.hookQueryVariables() {
    // X's request composer: "https://api.x.com/graphql/<id>/<name>" with the variables JSON.
    val composer = Fingerprint(
        parameters = listOf("L"),
        custom = { method, _ ->
            method.returnType.startsWith("${APOLLO_API}http/") &&
                method.instructionList.any { it.stringRef == GRAPHQL_URL }
        },
    ).matchSingle().originalMethod
    val variablesJson: MethodReference = composer.instructionList.mapNotNull { it.methodRef }
        .filter {
            it.definingClass.startsWith(APOLLO_API) && it.returnType == STRING && it.parameterTypes.size == 2 &&
                it.parameterTypes.all { type -> type.startsWith(APOLLO_API) }
        }
        .distinctBy { it.descriptor }.single("variables JSON writer called by ${composer.descriptor}")
    val helper = mutableClassDefBy(variablesJson.definingClass)
    val variableMethods = helper.methods.filter { AccessFlags.STATIC.isSet(it.accessFlags) }
    val jsonMethod = variableMethods.single { it.name == variablesJson.name && it.returnType == STRING }
    val mapMethod = variableMethods.filter { it !== jsonMethod && it.parameterTypes == jsonMethod.parameterTypes }
        .single("variables map writer in ${helper.type}")

    // The operation: what the composer reads from its request first; an interface with name().
    val executable = jsonMethod.parameterTypes[0].toString()
    val operation = composer.instructionList.firstNotNullOfOrNull { instruction ->
        instruction.takeIf { it.opcode == Opcode.IGET_OBJECT }?.fieldRef?.type?.takeIf { type ->
            classDefByOrNull(type)?.let { executable in it.interfaces && AccessFlags.INTERFACE.isSet(it.accessFlags) } == true
        }
    } ?: throw PatchException("Operation type not found in ${composer.descriptor}")
    val name = classDefBy(operation).methods.firstOrNull { it.name == "name" && it.parameterTypes.isEmpty() && it.returnType == STRING }
        ?: throw PatchException("$operation has no name()")
    requirePublic(operation, name)
    replaceStub(
        MODEL_BRIDGE_CLASS, "operationName", 1,
        """
        instance-of v0, p0, $operation
        if-eqz v0, :none
        check-cast p0, $operation
        invoke-interface { p0 }, ${name.descriptor}
        move-result-object v0
        return-object v0
        :none
        const/4 v0, 0x0
        return-object v0
        """,
    )

    // JSON: every returned string goes through the extension.
    jsonMethod.apply {
        instructions.mapIndexedNotNull { i, instruction -> i.takeIf { instruction.opcode == Opcode.RETURN_OBJECT } }
            .reversed().forEach { index ->
                val register = (instructions[index] as OneRegisterInstruction).registerA
                addInstructions(
                    index,
                    """
                    invoke-static/range { v$register .. v$register }, $HOOKS_CLASS->variablesJson(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$register
                    """,
                )
            }
        addInstructions(0, "invoke-static/range { p0 .. p0 }, $HOOKS_CLASS->beginVariables(Ljava/lang/Object;)V")
    }
    // Map: the variables map, right where it is cast before being wrapped.
    mapMethod.apply {
        val cast = instructions.indices.filter { instructions[it].opcode == Opcode.CHECK_CAST && instructions[it].typeRef == "Ljava/util/Map;" }
            .single("Map cast in ${helper.type}->${mapMethod.name}")
        val register = (instructions[cast] as OneRegisterInstruction).registerA
        addInstructions(
            cast + 1,
            """
            invoke-static/range { v$register .. v$register }, $HOOKS_CLASS->variablesMap(Ljava/util/Map;)Ljava/util/Map;
            move-result-object v$register
            """,
        )
        addInstructions(0, "invoke-static/range { p0 .. p0 }, $HOOKS_CLASS->beginVariables(Ljava/lang/Object;)V")
    }
}
