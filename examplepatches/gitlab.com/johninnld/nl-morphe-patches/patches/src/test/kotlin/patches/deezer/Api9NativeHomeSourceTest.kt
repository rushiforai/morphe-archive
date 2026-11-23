package patches.deezer

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.io.File
import org.junit.Assert.*
import org.junit.Assume.assumeNotNull
import org.junit.Test

class Api9NativeHomeSourceTest {
    @Test fun originalSupplierUsesBothPhonePageKeysWithoutChangingItsRepositoryOrOtherCases() {
        val path=System.getenv("DEEZER_ORIGINAL_2703_APK");assumeNotNull(path)
        val dex=DexFileFactory.loadDexContainer(File(path!!),Opcodes.getDefault())
        val cls=dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }.single { it.type=="LIlIllIIlllIlIIll;" }
        val method=MutableMethod(cls.methods.single { it.name=="get" })
        val before=method.instructions.toList()
        val replacements=mapOf("/channels/automotive/auto-home" to "home", "/channels/automotive/auto-explore" to "explore-all")
            .map { (source,page) -> before.indices.single { ((before[it] as? ReferenceInstruction)?.reference as? StringReference)?.string==source } to page }.toMap()
        useNativePhonePages2703(method)
        val after=method.instructions.toList()
        assertEquals(before.size,after.size)
        replacements.forEach { (index,page) -> assertEquals(page,((after[index] as ReferenceInstruction).reference as StringReference).string) }
        before.indices.filter { it !in replacements }.forEach { assertSame(before[it],after[it]) }
        val activity=dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            .single { it.type=="Lcom/deezer/ui/dynamicpage/DynamicPageRootActivity;" }
        val nativePageKeys=activity.methods.single { it.name=="onCreate" }.implementation!!.instructions.mapNotNull {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
        }
        assertTrue(nativePageKeys.containsAll(listOf("highlighted_tab","page_key","home","explore-all")))
    }
}
