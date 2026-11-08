import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.apk.ApkUtils.applyTo
import app.morphe.patcher.dex.BytecodeMode
import app.morphe.patcher.patch.loadPatchesFromJar
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import kotlinx.coroutines.runBlocking
import java.io.File
import java.security.MessageDigest
import java.util.zip.ZipFile

private fun classes(apk: File): Map<String, ClassDef> {
    val dex = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault())
    return dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }.associateBy { it.type }
}
private fun Method.key() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
private const val EXT = "Lapp/morphe/extension/boost/"

fun main(args: Array<String>) = runBlocking {
    val (bundle, apk, output) = args.map(::File)
    check(apk.isFile) { "Missing original APK: $apk" }
    val hash = MessageDigest.getInstance("SHA-256").digest(apk.readBytes()).joinToString("") { "%02x".format(it) }
    check(hash == "a273eca565f5f6e811db4bfbe63e5c9d5ece6d0cc2e1c38ac1a3a50b411ffe5c") {
        "Validation requires the official, unchanged Boost 1.14.3 APK, got SHA-256 $hash"
    }
    ZipFile(bundle).use { zip ->
        check(zip.getEntry("classes.dex") != null) { "Bundle lacks Android patch DEX" }
        check(zip.getEntry("extensions/extension.mpe") != null) { "Bundle lacks runtime extension" }
        check(zip.entries().asSequence().none { it.name.startsWith("app/template/") }) { "Template example included" }
    }
    val patches = loadPatchesFromJar(setOf(bundle))
    val expectedNames = setOf(
        "Bottom gallery action buttons",
        "Expand inline comment media",
        "HTTP/2 Reddit connection",
        "Hide horizontal comment dividers",
        "Hold to peek at media",
        "Home account avatar",
        "Improved online check",
        "Inline flairs",
        "Instant saved login",
        "Material dialogs",
        "Material loading animation",
        "Material notices",
        "Parallel content loading",
        "Polish comment layout",
        "Polish media viewer",
        "Predictive back navigation",
        "Remove startup request queue",
        "Show post in comments header",
        "Sliding screen transitions",
        "Smaller first page",
        "Swipe comment actions",
        "Swipe post actions",
        "Material You",
        "Material search",
        "Use system font"
    )
    check(patches.size == 25 && patches.map { it.name }.toSet() == expectedNames) {
        "Expected 25 unprefixed public patches, got ${patches.map { it.name }}"
    }
    for (patch in patches) {
        check(patch.compatibility!!.single().packageName == "com.rubenmayayo.reddit")
        check(patch.compatibility!!.single().targets.single().version == "1.14.3")
        println("BUNDLE: ${patch.name}")
    }
    val original = classes(apk)
    fun field(type: String, name: String, descriptor: String) {
        check(original[type]!!.fields.any { it.name == name && it.type == descriptor }) { "Wrong field mapping: $type->$name" }
    }
    val fragment = "Lcom/rubenmayayo/reddit/ui/comments/CommentsFragment;"
    val model = "Lcom/rubenmayayo/reddit/models/reddit/SubmissionModel;"
    field("Lcom/rubenmayayo/reddit/ui/submissions/subreddit/SubredditActivity;", "F0", "Z")
    field(fragment, "c", model)
    field(fragment, "B", "Ljava/util/ArrayList;")
    field(fragment, "D", "Lcom/rubenmayayo/reddit/ui/customviews/ScrollingLinearLayoutManager;")
    field(fragment, "mRecyclerView", "Landroidx/recyclerview/widget/RecyclerView;")
    field(model, "S", "Ljava/lang/String;")
    field(model, "a0", "Ljava/lang/String;")
    field("Lcom/rubenmayayo/reddit/ui/adapters/CommentViewHolder;", "topLine", "Lcom/google/android/material/divider/MaterialDivider;")
    field("Lcom/rubenmayayo/reddit/ui/adapters/CommentViewHolder;", "mediaPreviewIv", "Landroid/widget/ImageView;")
    field("Lcom/rubenmayayo/reddit/ui/adapters/SubmissionViewHolder;", "previewImageview", "Lcom/rubenmayayo/reddit/ui/customviews/BadgeImageView;")
    field("Lcom/rubenmayayo/reddit/ui/adapters/SubmissionViewHolder;", "thumbnailIv", "Lcom/rubenmayayo/reddit/ui/customviews/RoundImageView;")
    field("Lcom/rubenmayayo/reddit/ui/adapters/CommentViewHolder;", "authorAvatarIv", "Landroid/widget/ImageView;")
    field("Lcom/rubenmayayo/reddit/ui/adapters/CommentViewHolder;", "authorRichFlairTv", "Lcom/rubenmayayo/reddit/models/reddit/RichFlairView;")
    field("Lcom/rubenmayayo/reddit/ui/adapters/CommentViewHolder;", "authorTagTv", "Landroid/widget/TextView;")
    field("Lcom/rubenmayayo/reddit/ui/adapters/CommentViewHolder;", "authorTv", "Landroid/widget/TextView;")
    field("Lcom/rubenmayayo/reddit/ui/adapters/CommentViewHolder;", "awardsView", "Lcom/rubenmayayo/reddit/ui/customviews/AwardsView;")
    field("Lcom/rubenmayayo/reddit/ui/adapters/CommentViewHolder;", "collapsedTv", "Landroid/widget/TextView;")
    field("Lcom/rubenmayayo/reddit/ui/adapters/CommentViewHolder;", "commentTv", "Lcom/rubenmayayo/reddit/ui/customviews/TableTextView;")
    field("Lcom/rubenmayayo/reddit/ui/adapters/CommentViewHolder;", "distinguishedTv", "Lcom/rubenmayayo/reddit/ui/customviews/BabushkaText;")
    field("Lcom/rubenmayayo/reddit/ui/adapters/CommentViewHolder;", "indentView", "Lcom/rubenmayayo/reddit/ui/customviews/IndentView;")
    field("Lcom/rubenmayayo/reddit/ui/adapters/CommentViewHolder;", "plusCollapsedTv", "Landroid/widget/TextView;")
    field("Lcom/rubenmayayo/reddit/ui/adapters/CommentViewHolder;", "scoreTv", "Lcom/rubenmayayo/reddit/ui/customviews/ScoreTextView;")
    field("Lcom/rubenmayayo/reddit/ui/adapters/CommentViewHolder;", "timeTv", "Landroid/widget/TextView;")
    field("Lcom/rubenmayayo/reddit/ui/adapters/SubmissionViewHolder;", "commentsTv", "Lcom/rubenmayayo/reddit/ui/customviews/CommentsCountTextView;")
    field("Lcom/rubenmayayo/reddit/ui/adapters/SubmissionViewHolder;", "infoTop", "Lcom/rubenmayayo/reddit/ui/customviews/BabushkaText;")
    field("Lcom/rubenmayayo/reddit/ui/adapters/SubmissionViewHolder;", "overFlowButton", "Landroid/widget/ImageButton;")
    field("Lcom/rubenmayayo/reddit/ui/adapters/SubmissionViewHolder;", "title", "Landroid/widget/TextView;")
    field("Lcom/rubenmayayo/reddit/ui/adapters/SubmissionViewHolder;", "voteDownButton", "Lcom/rubenmayayo/reddit/ui/customviews/buttons/DownActiveImageButton;")
    field("Lcom/rubenmayayo/reddit/ui/adapters/SubmissionViewHolder;", "voteUpButton", "Lcom/rubenmayayo/reddit/ui/customviews/buttons/UpActiveImageButton;")
    field("Lcom/rubenmayayo/reddit/ui/customviews/IndentView;", "A", "I")
    field("Lcom/rubenmayayo/reddit/ui/customviews/IndentView;", "c", "I")
    field("Lcom/rubenmayayo/reddit/ui/customviews/IndentView;", "y", "I")
    field("Lcom/rubenmayayo/reddit/ui/customviews/IndentView;", "z", "I")
    field("Landroidx/recyclerview/widget/RecyclerView\$a0;", "a", "Landroid/view/View;")
    check(original["Landroidx/recyclerview/widget/LinearLayoutManager;"]!!.methods.any {
        it.name == "C" && it.parameterTypes.map { p -> p.toString() } == listOf("I") && it.returnType == "Landroid/view/View;"
    })
    check(original["Landroidx/recyclerview/widget/LinearLayoutManager;"]!!.methods.any {
        it.name == "Z0" && it.parameterTypes.isEmpty() && it.returnType == "I"
    })
    field("Lcom/rubenmayayo/reddit/ui/adapters/SubmissionViewHolder;", "P", "Ljh1;")
    field("Lcom/rubenmayayo/reddit/ui/adapters/SubmissionViewHolder;", "Q", "Z")
    field("Lcom/rubenmayayo/reddit/ui/adapters/SubmissionViewHolder;", "b0", "Lcom/rubenmayayo/reddit/models/reddit/SubmissionModel;")
    field("Lcom/rubenmayayo/reddit/ui/adapters/CommentViewHolder;", "c0", "Lcom/rubenmayayo/reddit/models/reddit/CommentModel;")
    field("Lcom/rubenmayayo/reddit/ui/adapters/LoadMoreViewHolder;", "R", "Lcom/rubenmayayo/reddit/models/reddit/LoadMoreModel;")
    field("Lcom/rubenmayayo/reddit/models/reddit/CommentViewModel;", "R", "I")
    field("Lcom/rubenmayayo/reddit/models/reddit/CommentViewModel;", "S", "Z")
    field(fragment, "C", "Lcom/rubenmayayo/reddit/ui/comments/CommentsFragment\$m;")
    fun nativeMethod(type: String, name: String, parameters: List<String>, returns: String = "V") {
        check(original[type]!!.methods.any { it.name == name && it.parameterTypes.map { p -> p.toString() } == parameters && it.returnType == returns }) {
            "Wrong native method mapping: $type->$name"
        }
    }
    val observer = "Landroidx/recyclerview/widget/RecyclerView\$g;"
    nativeMethod(observer, "<init>", emptyList())
    for (name in listOf("a", "b", "g")) nativeMethod(observer, name, emptyList())
    for (name in listOf("d", "e", "f")) nativeMethod(observer, name, listOf("I", "I"))
    nativeMethod(observer, "c", listOf("I", "I", "Ljava/lang/Object;"))
    for (name in listOf("registerAdapterDataObserver", "unregisterAdapterDataObserver"))
        nativeMethod("Landroidx/recyclerview/widget/RecyclerView\$e;", name, listOf(observer))
    val subscription = "Lcom/rubenmayayo/reddit/models/reddit/SubscriptionViewModel;"
    nativeMethod(subscription, "<init>", listOf(model))
    nativeMethod("Laz1;", "G", listOf("Landroid/content/Context;", subscription))
    field("Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;","N","Lns;")
    field("Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;","T","Lrs;")
    field("Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;","c","Z")
    field("Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;","z","F")
    field("Lcom/pnikosis/materialishprogress/ProgressWheel;","O","Z")
    field(subscription,"a","Ljava/lang/String;");field(subscription,"b","Z")
    field("Lpd2;","r","Lpd2;");field("Lld2;","a","Lcom/rubenmayayo/reddit/aa/User;")
    field("Lcom/rubenmayayo/reddit/aa/User;","name","Ljava/lang/String;")
    nativeMethod("Ldh0;","i",listOf("Landroid/view/View;"),"Lq41;")
    nativeMethod("Lhg2;","o",listOf("Landroid/view/View;"))
    nativeMethod("Lq41;","v",listOf("Ljava/lang/String;"),"Lp41;")
    nativeMethod("Lp41;","Z",emptyList(),"Lp41;")
    nativeMethod("Lp41;","e0",listOf("I","I"),"Lp41;")
    nativeMethod("Lxf2;","P",listOf("Landroid/widget/ImageView;"))
    field("Landroidx/core/view/insets/ProtectionLayout;","a","Ljava/util/ArrayList;")
    field("Lcom/rubenmayayo/reddit/models/reddit/LoadMoreModel;", "W", "I")
    field("Lcom/rubenmayayo/reddit/models/reddit/LoadMoreModel;", "X", "I")
    field("Lcom/rubenmayayo/reddit/ui/customviews/fab/FloatingActionMenu;", "z", "Lcom/rubenmayayo/reddit/ui/customviews/fab/FloatingActionSubmenu;")
    nativeMethod("Lcom/google/android/material/floatingactionbutton/FloatingActionButton;","getShapeAppearanceModel",emptyList(),"Lus2;")
    nativeMethod("Lcom/google/android/material/floatingactionbutton/FloatingActionButton;","setShapeAppearanceModel",listOf("Lus2;"))
    nativeMethod("Lcom/google/android/material/floatingactionbutton/FloatingActionButton;","setBackgroundTintList",listOf("Landroid/content/res/ColorStateList;"))
    nativeMethod("Lus2;","e",listOf("Lqe2;"),"Lus2;")
    nativeMethod("Lcom/rubenmayayo/reddit/ui/activities/MediaVideoActivity;","d1",emptyList())
    nativeMethod("Landroidx/core/view/insets/ProtectionLayout;","setProtections",listOf("Ljava/util/List;"))
    nativeMethod("Lcom/aurelhubert/ahbottomnavigation/AHBottomNavigation;","setDefaultBackgroundColor",listOf("I"))
    nativeMethod("Lcom/aurelhubert/ahbottomnavigation/AHBottomNavigation;","getDefaultBackgroundColor",emptyList(),"I")
    nativeMethod("Lcom/google/android/material/appbar/CollapsingToolbarLayout;","setContentScrimColor",listOf("I"))
    nativeMethod("Lcom/google/android/material/appbar/CollapsingToolbarLayout;","setStatusBarScrimColor",listOf("I"))
    nativeMethod("Ljm3;","s",listOf("I","I"),"Z")
    field("Ljm3;","s","Ljm3\$d;")
    field("Lcom/liuguangqiang/swipeback/SwipeBackLayout\$e;","a","Lcom/liuguangqiang/swipeback/SwipeBackLayout\$c;")
    nativeMethod("Lcom/liuguangqiang/swipeback/SwipeBackLayout\$c;","a",emptyList())
    nativeMethod("Lcom/mikepenz/materialize/view/ScrimInsetsRelativeLayout;","setTintStatusBar",listOf("Z"))
    nativeMethod("Lcom/mikepenz/materialize/view/ScrimInsetsRelativeLayout;","setTintNavigationBar",listOf("Z"))
    nativeMethod("Lcom/mikepenz/materialize/view/ScrimInsetsRelativeLayout;","setInsetForeground",listOf("Landroid/graphics/drawable/Drawable;"))
    // Reflective class names are plain strings: nothing else fails if R8 reassigns them.
    nativeMethod("La03;","a",listOf("Ljava/lang/String;"),"Ljava/lang/String;")
    for (handler in listOf("Luj0;","Lgh;","Lai0;","Lgq1;","Lny;")) nativeMethod(handler,"onBackPressed",emptyList())
    nativeMethod("Lbn2;","<init>",listOf("I","Ljava/lang/String;"))
    field("Lbn2;","a","I");field("Lbn2;","b","Ljava/lang/String;");field("Lbn2;","c",subscription)
    nativeMethod("Lpd2;","K",emptyList(),"Ljava/util/ArrayList;")
    for(factory in listOf("c","o","a"))nativeMethod(subscription,factory,emptyList(),subscription)
    nativeMethod("Lcom/rubenmayayo/reddit/ui/search/SearchGenericActivity;","y1",emptyList())
    field("Lcom/rubenmayayo/reddit/ui/search/SearchAbstractActivity;","a","Ljava/util/ArrayList;")
    field("Lcom/rubenmayayo/reddit/ui/search/SearchAbstractActivity;","b","Lcom/rubenmayayo/reddit/ui/search/SearchAbstractActivity\$e;")
    nativeMethod("Lcom/google/android/material/navigation/NavigationBarView;","getMenu",emptyList(),"Landroid/view/Menu;")
    for(loader in listOf("Lr83;","Lak1;","Ldk1;","Lgk1;"))check(original[loader]!!.superclass=="Landroid/os/AsyncTask;") { "Wrong content loader mapping: $loader" }
    check(original["Ldp1;"]!!.methods.any { it.name == "show" && it.parameterTypes.isEmpty() }) { "Wrong dialog mapping" }
    check(original["Lfp1;"]!!.superclass == "Landroidx/recyclerview/widget/RecyclerView\$l;") { "Wrong divider decoration mapping" }
    check(original["Lpd2;"]!!.fields.any { it.name == "j" && it.type == "Lnet/dean/jraw/models/LoggedInAccount;" }) { "Wrong account mapping" }
    check(original["Lgg2;"]!!.methods.any { it.name == "a" }) { "Wrong Glide listener mapping" }
    println("MAPPINGS: verified against official APK $hash")
    output.parentFile.mkdirs()
    Patcher(PatcherConfig(apkFile = apk,
        temporaryFilesPath = output.parentFile.resolve("patcher-tmp"),
        useBytecodeMode = BytecodeMode.FULL, validate = true)).use { patcher ->
        patcher += patches
        patcher().collect { result ->
            result.exception?.let { throw it }
            println("APPLIED: ${result.patch.name}")
        }
        apk.copyTo(output, overwrite = true)
        patcher.get().applyTo(output)
    }
    val patched = classes(output)
    val transport="Lnet/dean/jraw/http/OkHttpAdapter;"
    val staticInit=patched[transport]!!.methods.single { it.name=="<clinit>" }.implementation!!.instructions.toList()
    check(staticInit.any { instruction->
        val ref=(instruction as? ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.FieldReference
        instruction.opcode==Opcode.SGET_OBJECT && ref?.definingClass=="Lokhttp3/Protocol;" && ref.name=="HTTP_2"
    }) { "Reddit default transport is not HTTP/2" }
    val constructor=patched[transport]!!.methods.single { it.name=="<init>" && it.parameterTypes.map { p->p.toString() }==listOf("Lokhttp3/OkHttpClient;","Lokhttp3/Protocol;") }
    val originalConstructor=original[transport]!!.methods.single { it.key()==constructor.key() }
    check(constructor.implementation!!.registerCount==originalConstructor.implementation!!.registerCount)
    val transportBody=constructor.implementation!!.instructions.toList()
    val reverse=transportBody.withIndex().single { (_,instruction)->((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.let { it.definingClass=="Ljava/util/Collections;" && it.name=="reverse" }==true }.index
    val argument=transportBody[reverse] as RegisterRangeInstruction
    check(argument.registerCount==1 && argument.startRegister==constructor.implementation!!.registerCount-2 && transportBody[reverse-1].opcode==Opcode.MOVE_RESULT_OBJECT)
    check(((transportBody[reverse+1] as ReferenceInstruction).reference as MethodReference).name=="protocols")
    println("TRANSPORT: HTTP/2 preferred, native local protocol list reordered without new registers or interceptor edits")
    com.reandroid.apk.ApkModule.loadApkFile(output).use { module ->
        val enabled = module.androidManifest.applicationElement.searchAttributeByResourceId(0x0101066c)
        check(enabled?.valueAsBoolean == true) { "Predictive Back was not enabled in the compiled manifest" }
    }
    println("MANIFEST: predictive Back enabled in the compiled APK")
    check(patched.size == original.size + patched.keys.count { it.startsWith(EXT) }) {
        "Unexpected classes were merged or removed"
    }
    for ((name, before) in original) {
        val after = patched[name] ?: error("Original class removed: $name")
        check(before.methods.map { it.key() }.toSet() == after.methods.map { it.key() }.toSet()) {
            "Original class methods replaced: $name"
        }
        check(before.fields.map { "${it.name}:${it.type}" }.toSet() == after.fields.map { "${it.name}:${it.type}" }.toSet()) {
            "Original class fields replaced: $name"
        }
    }
    check((patched.keys - original.keys).all { it.startsWith(EXT) }) { "Unexpected extension class namespace" }
    for ((owner, names) in listOf(
        "${EXT}CommentsChromeTweaks;" to listOf("mediaPeekEnabled", "inlineMediaEnabled", "commentLayoutEnabled", "materialYouEnabled", "dynamicHeaderEnabled"),
        "${EXT}CommentSwipeActions;" to listOf("postSwipesEnabled"))) {
        for (name in names) {
            val getter = patched[owner]!!.methods.single { it.name == name }
            val constant = getter.implementation!!.instructions.first() as com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
            check(constant.narrowLiteral == 1) { "Feature flag was not enabled: $owner->$name" }
        }
    }
    println("MEDIA: target views and independently enabled feature flags verified")
    val hooks = mutableMapOf<String, Int>()
    var platformHooks = 0
    var loadingAvatarHooks = 0
    var anchorHooks = 0
    var completionHooks = 0
    var feedCompletionHooks = 0
    var profileCompletionHooks = 0
    var settleHooks = 0
    var flairHooks = 0
    var noticeHooks = 0
    var tagHooks = 0
    var dialogHooks = 0
    var networkHooks = 0
    var startupHooks = 0
    var initHooks = 0
    var tokenHooks = 0
    var taskHooks = 0
    var searchHooks = 0
    for (type in patched.values) for (method in type.methods) {
        if (type.type.startsWith(EXT)) continue
        val instructions = method.implementation?.instructions?.toList() ?: continue
        var modified = false
        for ((index, instruction) in instructions.withIndex()) {
            val target = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: continue
            if (!target.definingClass.startsWith(EXT)) continue
            modified = true
            if(target.definingClass=="${EXT}NoticeTweaks;") {
                check(instruction.opcode==Opcode.INVOKE_STATIC || instruction.opcode==Opcode.INVOKE_STATIC_RANGE)
                if(target.name=="make") check(instructions[index+1].opcode==Opcode.MOVE_RESULT_OBJECT)
                noticeHooks++
                continue
            }
            if(target.definingClass=="${EXT}SearchTweaks;") {
                check(type.type=="Lcom/rubenmayayo/reddit/ui/search/SearchGenericActivity;" && method.name in setOf("s1","e0") && index==0 && instruction.opcode==Opcode.INVOKE_STATIC_RANGE)
                searchHooks++
                continue
            }
            if(target.definingClass=="${EXT}NetworkTweaks;" && target.name=="init") {
                check(type.type=="Lcom/rubenmayayo/reddit/MyApplication;" && method.name=="onCreate" && instruction.opcode==Opcode.INVOKE_STATIC_RANGE)
                initHooks++
                continue
            }
            if(target.definingClass=="${EXT}NetworkTweaks;" && target.name=="execute") {
                check(instruction.opcode==Opcode.INVOKE_STATIC || instruction.opcode==Opcode.INVOKE_STATIC_RANGE)
                taskHooks++
                continue
            }
            if(target.definingClass=="${EXT}NetworkTweaks;" && target.name in setOf("rate","remaining","clearAccount","keepAccount","takeAccount","accountCheck","pageLimit")) {
                val expected=when(target.name) {
                    "rate" -> "Lnet/dean/jraw/http/RestClient;" to "setRatelimit"
                    "remaining" -> "Lnet/dean/jraw/RedditClient;" to "adjustRatelimit"
                    "takeAccount" -> "Lpd2;" to "M"
                    "pageLimit" -> "Lnet/dean/jraw/paginators/Paginator;" to "next"
                    else -> "Lnet/dean/jraw/RedditClient;" to "authenticate"
                }
                check(type.type==expected.first && method.name==expected.second && instruction.opcode==Opcode.INVOKE_STATIC) { "Startup hook ${target.name} moved" }
                if(target.name=="rate") check(index==0 && instructions[1].opcode==Opcode.MOVE_RESULT)
                if(target.name=="takeAccount") check(instructions[index+1].opcode==Opcode.MOVE_RESULT_OBJECT && instructions[index+2].opcode==Opcode.CHECK_CAST && instructions[index+3].opcode==Opcode.IF_NEZ)
                if(target.name=="accountCheck") check(instructions[index+1].opcode==Opcode.MOVE_RESULT)
                if(target.name=="keepAccount") check(instructions[index-1].opcode==Opcode.MOVE_RESULT_OBJECT)
                startupHooks++
                continue
            }
            if(target.definingClass=="${EXT}NetworkTweaks;" && target.name=="token") {
                check(type.type=="Lpd2;" && method.name=="b" && method.parameterTypes.isEmpty() && (method.accessFlags and com.android.tools.smali.dexlib2.AccessFlags.PUBLIC.value)!=0 && index==0)
                check(instructions[1].opcode==Opcode.MOVE_RESULT && instructions[2].opcode==Opcode.IF_EQZ && instructions[3].opcode==Opcode.RETURN_VOID)
                tokenHooks++
                continue
            }
            if(target.definingClass=="${EXT}NetworkTweaks;") {
                check(type.type=="Lkk3;" && method.name=="D" && index==0 && instruction.opcode==Opcode.INVOKE_STATIC_RANGE && instructions[1].opcode==Opcode.MOVE_RESULT && instructions[2].opcode==Opcode.RETURN)
                networkHooks++
                continue
            }
            if(target.name=="tagColor") {
                check(instruction.opcode==Opcode.INVOKE_STATIC && instructions[index+1].opcode==Opcode.MOVE_RESULT)
                tagHooks++
                continue
            }
            if(target.name=="onShow" && target.definingClass=="${EXT}DialogTweaks;") {
                check(type.type=="Ldp1;" && method.name=="show" && index==0 && instruction.opcode==Opcode.INVOKE_STATIC_RANGE)
                dialogHooks++
                continue
            }
            if(target.name=="flairText") {
                check(target.definingClass=="${EXT}MaterialYouTweaks;" && type.type=="Lcom/rubenmayayo/reddit/models/reddit/RichFlairView;" && method.name=="c")
                check(instruction.opcode==Opcode.INVOKE_STATIC && instructions[index+1].opcode==Opcode.MOVE_RESULT)
                check((instruction as FiveRegisterInstruction).registerC==method.implementation!!.registerCount-3) { "flairText lost the flair view" }
                flairHooks++
                continue
            }
            if(target.name=="settle") {
                check(target.definingClass=="${EXT}ViewerPolishTweaks;" && type.type=="Lcom/liuguangqiang/swipeback/SwipeBackLayout\$e;" && method.name=="j")
                check(instruction.opcode==Opcode.INVOKE_STATIC && instructions[index+1].opcode==Opcode.MOVE_RESULT)
                check((instruction as FiveRegisterInstruction).registerC==method.implementation!!.registerCount-4) { "settle lost the SwipeBackLayout receiver" }
                settleHooks++
                continue
            }
            if(target.name=="onProfileCommentBound") {
                check(target.definingClass=="${EXT}UnifiedChromeTweaks;" && type.type=="Lcom/rubenmayayo/reddit/ui/profile/UserContributionListFragment\$f;" && method.name=="onBindViewHolder")
                check(instruction.opcode==Opcode.INVOKE_STATIC_RANGE)
                val call=instruction as RegisterRangeInstruction
                val native=instructions[index-1] as RegisterRangeInstruction
                val ref=(instructions[index-1] as ReferenceInstruction).reference as MethodReference
                check(ref.definingClass=="Lcom/rubenmayayo/reddit/ui/adapters/CommentViewHolder;" && ref.name=="w" && call.registerCount==1 && call.startRegister==native.startRegister)
                val before=original[type.type]!!.methods.single { it.key()==method.key() };check(before.implementation!!.registerCount==method.implementation!!.registerCount)
                profileCompletionHooks++;println("SAFE PROFILE: completed native comment holder remains live after binder");continue
            }
            if(target.name=="findActionAnchor") {
                check(type.type=="Lcom/rubenmayayo/reddit/ui/activities/MediaVideoActivity;" && method.name=="c1")
                check(instruction.opcode==Opcode.INVOKE_STATIC)
                val call=instruction as FiveRegisterInstruction
                check(call.registerCount==2 && call.registerC==0 && call.registerD==1)
                check(instructions[index-1].opcode==Opcode.CONST && (instructions[index-1] as com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction).narrowLiteral==0x7f0a0053)
                check(instructions[index+1].opcode==Opcode.MOVE_RESULT_OBJECT && (instructions[index+1] as OneRegisterInstruction).registerA==0)
                val before=original[type.type]!!.methods.single { it.key()==method.key() }
                check(before.implementation!!.registerCount==method.implementation!!.registerCount)
                anchorHooks++;println("SAFE ANCHOR: native video/GIF download retains v0/v1 lookup and result registers")
                continue
            }
            if (target.name in setOf("onPull","drawRefresh","drawWheel","onTitleBind")) {
                check(instruction.opcode == Opcode.INVOKE_STATIC_RANGE)
                val call=instruction as RegisterRangeInstruction
                val p0=method.implementation!!.registerCount-1-method.parameterTypes.size
                check(call.registerCount==2)
                if(target.name=="onTitleBind") {
                    check(type.type=="Lcom/rubenmayayo/reddit/ui/submissions/subreddit/MainActivity\$d;" && method.name=="getView")
                    check(call.startRegister==p0+1)
                    check(instructions[index-1].opcode==Opcode.CHECK_CAST &&
                        (instructions[index-1] as OneRegisterInstruction).registerA==p0+1)
                    check(instructions[index+1].let { (it as ReferenceInstruction).reference as MethodReference }.name=="b0")
                } else {
                    check(call.startRegister==p0 && index==0)
                    if(target.name=="onPull")check(type.type=="Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;" && method.name=="d")
                    else {
                        check((target.name=="drawRefresh" && type.type=="Lrs;" && method.name=="draw") ||
                            (target.name=="drawWheel" && type.type=="Lcom/pnikosis/materialishprogress/ProgressWheel;" && method.name=="onDraw"))
                        check(instructions[1].opcode==Opcode.MOVE_RESULT && (instructions[1] as OneRegisterInstruction).registerA==0)
                        check(instructions[2].opcode==Opcode.IF_EQZ && instructions[3].opcode==Opcode.RETURN_VOID)
                        val pcBranch=instructions.take(2).sumOf { it.codeUnits }
                        val pcNative=instructions.take(4).sumOf { it.codeUnits }
                        check(pcBranch+(instructions[2] as OffsetInstruction).codeOffset==pcNative)
                        // The scratch local's first native assignment must precede its use.
                        val assignment=instructions.drop(4).indexOfFirst { it.opcode.setsRegister() && (it as? OneRegisterInstruction)?.registerA==0 }
                        check(assignment in 0..1)
                        if(assignment==1)check(((instructions[4] as ReferenceInstruction).reference as MethodReference).name=="getBounds" && instructions[5].opcode==Opcode.MOVE_RESULT_OBJECT)
                    }
                }
                val before=original[type.type]!!.methods.single { it.key()==method.key() }
                check(before.implementation!!.registerCount==method.implementation!!.registerCount)
                loadingAvatarHooks++
                println("SAFE LOADING/AVATAR: ${method.key()} -> ${target.name}")
                continue
            }
            if (target.name == "onRowBound" || target.name == "onPostBound") {
                check(method.name == "onBindViewHolder")
                if(target.name == "onRowBound")check(type.type == "Lcom/rubenmayayo/reddit/ui/comments/CommentsFragment\$m;")
                else check(type.type in setOf("Lcom/rubenmayayo/reddit/ui/fragments/k\$a;",
                    "Lcom/rubenmayayo/reddit/ui/fragments/m\$a;", "Lft0;",
                    "Lcom/rubenmayayo/reddit/ui/profile/UserContributionListFragment\$f;"))
                check(instruction.opcode == Opcode.INVOKE_STATIC_RANGE)
                val call = instruction as RegisterRangeInstruction
                val preceding = instructions[index - 1]
                val native = (preceding as ReferenceInstruction).reference as MethodReference
                check(native.name == "w" && native.returnType == "V" && native.definingClass in setOf(
                    "Lcom/rubenmayayo/reddit/ui/adapters/CommentViewHolder;",
                    "Lcom/rubenmayayo/reddit/ui/adapters/SubmissionViewHolder;",
                    "Lcom/rubenmayayo/reddit/ui/adapters/LoadMoreViewHolder;"))
                val holder = when (preceding) {
                    is RegisterRangeInstruction -> preceding.startRegister
                    is FiveRegisterInstruction -> preceding.registerC
                    else -> error("Unexpected native binder instruction")
                }
                check(call.registerCount == 1 && call.startRegister == holder) { "Wrong holder register at bind completion" }
                val before = original[type.type]!!.methods.single { it.key() == method.key() }
                check(before.implementation!!.registerCount == method.implementation!!.registerCount)
                if(target.name == "onPostBound") {
                    check(native.definingClass == "Lcom/rubenmayayo/reddit/ui/adapters/SubmissionViewHolder;")
                    feedCompletionHooks++
                } else completionHooks++
                println("SAFE COMPLETION: ${method.key()} after ${native.definingClass}->w; holder=v$holder")
                continue
            }
            if (target.name == "isSupported" || target.name == "legacyTransition") {
                check(type.type == "Lil;" && instruction.opcode == Opcode.INVOKE_STATIC)
                val call = instruction as FiveRegisterInstruction
                if (target.name == "isSupported") {
                    check(method.name == "a1" && call.registerCount == 0)
                    check(instructions[index + 1].opcode == Opcode.MOVE_RESULT &&
                        (instructions[index + 1] as OneRegisterInstruction).registerA == 0)
                    check(instructions[index + 2].opcode == Opcode.IF_EQZ &&
                        (instructions[index + 2] as OneRegisterInstruction).registerA == 0)
                } else check(method.name == "finish" && call.registerCount == 3 &&
                    call.registerC == 1 && call.registerD == 0 && call.registerE == 0)
                val previous = original[type.type]!!.methods.single { it.key() == method.key() }
                check(previous.implementation!!.registerCount == method.implementation!!.registerCount)
                platformHooks++
                continue
            }
            if(target.definingClass=="${EXT}HomeAvatarTweaks;" && target.name=="install")check(type.type=="Lcom/rubenmayayo/reddit/MyApplication;" && method.name=="onCreate")
            if(target.definingClass=="${EXT}SurfaceAppearanceTweaks;") {
                if(target.name=="install")check(type.type=="Lcom/rubenmayayo/reddit/MyApplication;" && method.name=="onCreate")
                else {check(target.name=="onThemeReady" && type.type=="Lcom/rubenmayayo/reddit/ui/activities/a;" && method.name=="onCreate")
                    val native=(instructions[index-1] as ReferenceInstruction).reference as MethodReference
                    check(native.name=="setToolbarTheme" && native.definingClass=="Lcom/rubenmayayo/reddit/ui/activities/a;")}
            }
            if(target.name=="onImageResume")check(type.type=="Lcom/rubenmayayo/reddit/ui/activities/a;" && method.name=="onResume")
            check(instruction.opcode == Opcode.INVOKE_STATIC_RANGE)
            val range = instruction as RegisterRangeInstruction
            val expectedP0 = method.implementation!!.registerCount - 1 - method.parameterTypes.sumOf {
                if (it.toString() == "J" || it.toString() == "D") 2 else 1
            }
            check(range.registerCount == (if (target.name == "onTouch") 2 else 1) && range.startRegister == expectedP0) { "Unsafe argument register in ${method.key()}" }
            // No original instruction before this hook may overwrite the receiver.
            check(instructions.take(index).none { it.opcode.setsRegister() &&
                (it as? OneRegisterInstruction)?.registerA == expectedP0 }) { "p0 clobbered before hook: ${method.key()}" }
            val before = original[type.type]!!.methods.single { it.key() == method.key() }
            check(before.implementation!!.registerCount == method.implementation!!.registerCount)
            hooks[method.key()] = (hooks[method.key()] ?: 0) + 1
            println("SAFE HOOK: ${method.key()} @ instruction $index, p0=v$expectedP0")
        }
        if (modified) {
            var pc = 0
            val addresses = instructions.map { instruction -> pc.also { pc += instruction.codeUnits } }.toSet()
            pc = 0
            for (instruction in instructions) {
                if (instruction is OffsetInstruction) check(pc + instruction.codeOffset in addresses) {
                    "Branch targets a non-instruction address in ${method.key()}"
                }
                pc += instruction.codeUnits
            }
        }
    }
    check(hooks.values.sum() == 21 && hooks.size == 16 && loadingAvatarHooks == 4 && anchorHooks == 1 && platformHooks == 2 && completionHooks == 3 && feedCompletionHooks == 4 && profileCompletionHooks==1) { "Unexpected hook count: $hooks" }
    val fontLookup=patched["Lps2;"]!!.methods.single { it.name=="e0" }.implementation!!.instructions.toList()
    check(((fontLookup[0] as ReferenceInstruction).reference as com.android.tools.smali.dexlib2.iface.reference.FieldReference).name=="DEFAULT" && fontLookup[1].opcode==Opcode.RETURN_OBJECT) { "System font lookup is not patched" }
    check(settleHooks == 4) { "Expected four media dismiss settle hooks, got $settleHooks" }
    check(flairHooks == 1) { "Expected one flair colour hook, got $flairHooks" }
    check(noticeHooks >= 100) { "Expected the Toast callers to be redirected, got $noticeHooks" }
    check(tagHooks >= 2) { "Expected SPOILER and NSFW colour hooks, got $tagHooks" }
    check(dialogHooks == 1) { "Expected one dialog hook, got $dialogHooks" }
    check(networkHooks == 1) { "Expected one network hook, got $networkHooks" }
    check(startupHooks == 7) { "Expected seven startup hooks, got $startupHooks" }
    check(initHooks == 1) { "Expected one network settings hook, got $initHooks" }
    for(name in listOf("a","e"))check(patched["Lpd2;"]!!.fields.plus(patched["Lld2;"]!!.fields).any { it.name==name && (it.accessFlags and com.android.tools.smali.dexlib2.AccessFlags.PUBLIC.value)!=0 }) { "Login field $name changed" }
    check(patched["Lpd2;"]!!.methods.any { it.name=="M" && it.parameterTypes.isEmpty() && (it.accessFlags and com.android.tools.smali.dexlib2.AccessFlags.PUBLIC.value)!=0 }) { "Login method changed" }
    check(patched["Lnet/dean/jraw/RedditClient;"]!!.fields.any { it.name=="authenticatedUser" } && patched["Lnet/dean/jraw/http/oauth/OAuthHelper;"]!!.fields.any { it.name=="authStatus" }) { "Login fields changed" }
    check(taskHooks >= 100) { "Expected AsyncTask starts to be routed, got $taskHooks" }
    check(tokenHooks == 1) { "Expected one token lock, got $tokenHooks" }
    println("TASKS: $taskHooks AsyncTask starts routed")
    check(searchHooks == 2) { "Expected two search hooks, got $searchHooks" }
    println("REDIRECTS: $noticeHooks Toast calls, $tagHooks label colours, $dialogHooks dialog hook")
    // All non-framework method references in the runtime extension must exist in Boost or the extension.
    fun resolves(ref: MethodReference, name: String = ref.definingClass, visited: MutableSet<String> = mutableSetOf()): Boolean {
        if (!visited.add(name)) return false
        val type = patched[name] ?: return name.startsWith("Ljava/") || name.startsWith("Landroid/")
        return type.methods.any { it.name == ref.name && it.returnType == ref.returnType && it.parameterTypes == ref.parameterTypes } ||
            type.superclass?.let { resolves(ref, it, visited) } == true || type.interfaces.any { resolves(ref, it, visited) }
    }
    for (type in patched.values.filter { it.type.startsWith(EXT) }) for (method in type.methods) {
        for (instruction in method.implementation?.instructions ?: emptyList()) {
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: continue
            if (ref.definingClass.startsWith("Landroidx/") || ref.definingClass.startsWith(EXT))
                check(resolves(ref)) { "Unresolved runtime method: $ref" }
        }
    }
    println("PASS: all 25 patches applied, 41 register-safe hooks, runtime references resolved")
    println("APK: ${output.absolutePath} (unsigned; Android UI testing still required)")
}
