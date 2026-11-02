package app.morphe.patches.bongobd.content

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patches.shared.Type
import app.morphe.patches.shared.isNotExtension
import app.morphe.patches.shared.morphe.com.google.gson.Gson
import app.morphe.patches.shared.morphe.java.lang.CharSequence
import app.morphe.patches.shared.morphe.java.lang.Class
import app.morphe.patches.shared.morphe.java.lang.Iterable
import app.morphe.patches.shared.morphe.java.lang.Object
import app.morphe.patches.shared.morphe.java.lang.String
import app.morphe.patches.shared.morphe.java.util.List
import app.morphe.patches.shared.morphe.java.util.Set
import app.morphe.patches.shared.morphe.kotlin.Function0
import app.morphe.patches.shared.morphe.kotlin.Function1
import app.morphe.patches.shared.morphe.kotlin.Lazy
import app.morphe.patches.shared.morphe.kotlin.LazyJVM
import app.morphe.patches.shared.morphe.kotlin.collections.Collections
import app.morphe.patches.shared.morphe.kotlin.collections.CollectionsKt
import app.morphe.patches.shared.morphe.kotlin.collections.Iterables
import app.morphe.patches.shared.morphe.kotlin.collections.Sets
import app.morphe.patches.shared.morphe.kotlin.collections._ArraysKt
import app.morphe.patches.shared.morphe.kotlin.collections._Collections
import app.morphe.patches.shared.morphe.kotlin.text.Strings
import app.morphe.patches.shared.morphe.okhttp3.Request
import app.morphe.patches.shared.morphe.okhttp3.Response
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

object GetContentDetailsMethodCallFingerprint :
    Fingerprint(
        filters =
            listOf(
                methodCall(
                    definingClass = "Lcom/bongo/bongobd/view/network/ApiServiceSaas;",
                    name = "getContentDetails",
                    parameters = listOf(Type.STRING, Type.CONTINUATION),
                    returnType = Type.OBJECT,
                    opcode = Opcode.INVOKE_INTERFACE,
                ),
            ),
        custom = ::isNotExtension,
    )

object JoinToStringFingerprint :
    Fingerprint(
        definingClass = _Collections.toString(),
        accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.SYNTHETIC),
        returnType = String.toString(),
        parameters =
            listOf(
                Iterable.toString(),
                CharSequence.toString(),
                CharSequence.toString(),
                CharSequence.toString(),
                Type.int,
                CharSequence.toString(),
                Function1.toString(),
                Type.int,
                Object.toString(),
            ),
    )

object ListOfFingerprint :
    Fingerprint(
        definingClass = Collections.toString(),
        accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.VARARGS),
        returnType = List.toString(),
        parameters = listOf("[$Object"),
        filters =
            listOf(
                methodCall(
                    definingClass = CollectionsKt.toString(),
                    parameters = emptyList(),
                    returnType = List.toString(),
                    opcode = Opcode.INVOKE_STATIC,
                ),
            ),
    )

object CollectionSizeOrDefault :
    Fingerprint(
        definingClass = Iterables.toString(),
        accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
        returnType = Type.int,
        parameters = listOf(Iterable.toString(), Type.int),
    )

object SetOfFingerprint :
    Fingerprint(
        definingClass = Sets.toString(),
        accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.VARARGS),
        returnType = Set.toString(),
        parameters = listOf("[$Object"),
        filters =
            listOf(
                methodCall(
                    definingClass = _ArraysKt.toString(),
                    parameters = listOf("[$Object"),
                    returnType = Set.toString(),
                    opcode = Opcode.INVOKE_STATIC,
                ),
            ),
    )

object SplitFingerprint : Fingerprint(
    definingClass = Strings.toString(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.SYNTHETIC),
    returnType = List.toString(),
    parameters =
        listOf(
            CharSequence.toString(),
            "[$String",
            Type.boolean,
            Type.int,
            Type.int,
            Object.toString(),
        ),
)

object LazyFingerprint : Fingerprint(
    definingClass = LazyJVM.toString(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = Lazy.toString(),
    parameters = listOf(Function0.toString()),
)

object FromJsonFingerprint : Fingerprint(
    definingClass = Gson.toString(),
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = Object.toString(),
    parameters = listOf(String.toString(), Class.toString()),
)

object RequestFingerprint : Fingerprint(
    definingClass = Response.toString(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = Request.toString(),
    parameters = emptyList(),
)

object HeaderFingerprint :
    Fingerprint(
        definingClass = Request.toString(),
        accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
        returnType = String.toString(),
        parameters = listOf(String.toString()),
    )
