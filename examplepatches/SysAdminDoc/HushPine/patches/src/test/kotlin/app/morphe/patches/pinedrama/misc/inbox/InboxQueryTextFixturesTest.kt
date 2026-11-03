package app.morphe.patches.pinedrama.misc.inbox

import app.morphe.Fixtures
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.Assert.*
import org.junit.Test

private const val BEAN = "Lcom/ss/android/ugc/aweme/notice/repo/list/bean/"
private const val TEMPLATE = "Lcom/ss/android/ugc/aweme/notice/repo/list/uitemplate/"
private const val USER = "Lcom/ss/android/ugc/aweme/profile/model/User;"

/** R8 renames the row, view and helper classes every build, so each one is found by what it holds or calls. */
class InboxQueryTextFixturesTest {
    @Test fun `search text follows the typed native notice paths and structured text config fields`() {
        Fixtures.forEachDeclared { apk ->
            val classes = Fixtures.dexContainer(apk, Opcodes.getDefault()).let { dex ->
                dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes } }
            val byType = classes.associateBy { it.type }
            fun type(name: String) = byType.getValue(name)
            // InboxQueryText.MATCHER takes the row model's only MusNotice field by its type.
            val rows = classes.filter { row -> row.methods.any { it.name == "itemUniqueId" } && row.methods.any {
                it.name == "<init>" && it.parameterTypes.firstOrNull()?.toString() == "${BEAN}MusNotice;" } }
            assertEquals(1, rows.size)
            assertEquals(1, rows.single().fields.count { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == "${BEAN}MusNotice;" })
            assertEquals("${BEAN}BaseNotice;", type("${BEAN}MusNotice;").superclass)
            type("${BEAN}BaseNotice;").field("templateNotice", "${BEAN}GeneralTemplateNotice;")
            type("${BEAN}GeneralTemplateNotice;").field("uiTemplate", "${TEMPLATE}NoticeUITemplate;")
            val template = type("${TEMPLATE}NoticeUITemplate;")
            listOf("content", "event", "quoteContent").forEach { template.field(it, "Ljava/lang/String;") }
            listOf("contentTextLinkConfigs", "textPair").forEach { template.field(it, "Ljava/util/List;") }
            template.field("titleTemplate", "${TEMPLATE}TitleTemplate;")
            type("${TEMPLATE}TextLinkConfig;").field("text", "Ljava/lang/String;")
            val title = type("${TEMPLATE}TitleTemplate;")
            title.field("title", "Ljava/lang/String;")
            title.field("fromUsers", "Ljava/util/List;")
            val pair = type("${TEMPLATE}TextPair;")
            listOf("title", "content").forEach { pair.field(it, "${BEAN}NoticeTextStruct;") }
            val struct = type("${BEAN}NoticeTextStruct;")
            struct.field("content", "${BEAN}NoticeTextConfig;")
            struct.field("textConfigs", "Ljava/util/List;")
            type("${BEAN}NoticeTextConfig;").field("text", "Ljava/lang/String;")
            // The native body falls back from content to event in one formatter of a template row view.
            val base = classes.single { view -> view.methods.any { it.name == "getExpandAbility" } }
            val formatters = classes.filter { it.superclass == base.type }.flatMap { it.methods }.filter { method ->
                val reads = method.fieldReads().filter { it.definingClass == template.type }.map { it.name }
                "content" in reads && "event" in reads }
            assertTrue(formatters.isNotEmpty())
        }
    }

    @Test fun `native rich text uses single digit one-based text links and nickname remains a pure fallback`() {
        Fixtures.forEachDeclared { apk ->
            val classes = Fixtures.dexContainer(apk, Opcodes.getDefault()).let { dex ->
                dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes } }
            val rich = classes.flatMap { it.methods }.single { method -> method.implementation?.instructions
                ?.any { it.getReference<StringReference>()?.string == "\\[\\[text_link_(\\d)\\]\\]" } == true }
            assertEquals("${TEMPLATE}NoticeUITemplate;", rich.parameterTypes[1].toString())
            val code = rich.implementation!!.instructions.toList()
            val decrement = code.indexOfFirst { it.opcode == Opcode.SUB_INT_2ADDR }
            val indexedLink = code.indexOfFirst { it.getReference<MethodReference>()?.let { method ->
                method.definingClass == "Lcom/bytedance/mt/protector/impl/collections/ListProtector;" && method.name == "get" } == true }
            assertTrue(decrement >= 0 && decrement < indexedLink)
            assertTrue(code.any { it.getReference<FieldReference>()?.let { field ->
                field.definingClass == "${TEMPLATE}TextLinkConfig;" && field.name == "text" } == true })
            // The (User, Z) display name helper that reads the nickname, next to the IMUser variant.
            val aliases = classes.filter { owner -> owner.methods.any { it.parameterTypes.map(CharSequence::toString)
                .contains("Lcom/ss/android/ugc/aweme/im/contacts/api/model/IMUser;") } }
                .flatMap { it.methods }.filter { it.parameterTypes.map(CharSequence::toString) == listOf(USER, "Z")
                    && it.returnType == "Ljava/lang/String;" && AccessFlags.STATIC.isSet(it.accessFlags) }
            assertTrue(aliases.any { name -> name.references().any { it.definingClass == USER && it.name == "getNickname" } })
            // The expansion ability is not a generic formatter: its base String methods return null.
            val ability = classes.single { view -> view.methods.any { it.name == "getExpandAbility" } }
                .methods.single { it.name == "getExpandAbility" }.returnType
            val natives = classes.single { it.type == ability }.methods.filter { it.returnType == "Ljava/lang/String;" }
            assertEquals(2, natives.size)
            natives.forEach { native ->
                assertEquals(Opcode.RETURN_OBJECT, native.implementation!!.instructions.last().opcode)
                assertTrue(native.references().isEmpty())
            }
        }
    }

    private fun ClassDef.field(name: String, type: String) { assertEquals(type, fields.single { it.name == name }.type) }
    private fun Method.references(): List<MethodReference> = implementation!!.instructions.mapNotNull { it.getReference<MethodReference>() }
    private fun Method.fieldReads(): List<FieldReference> =
        implementation?.instructions?.mapNotNull { it.getReference<FieldReference>() } ?: emptyList()
}
