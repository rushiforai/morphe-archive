package app.morphe.patches.shared.morphe.kotlin.collections

import app.morphe.patcher.Fingerprint
import app.morphe.patches.shared.Type
import app.morphe.patches.shared.morphe.java.lang.CharSequence
import app.morphe.patches.shared.morphe.java.lang.Iterable
import app.morphe.patches.shared.morphe.java.lang.Object
import app.morphe.patches.shared.morphe.java.lang.String
import app.morphe.patches.shared.morphe.java.util.Collection
import app.morphe.patches.shared.morphe.java.util.List
import app.morphe.patches.shared.morphe.kotlin.Function1
import com.android.tools.smali.dexlib2.AccessFlags

object CollectionsKt {
    override fun toString() = "Lkotlin/collections/CollectionsKt;"
}

@Suppress("ktlint:standard:class-naming")
object _Collections {
    override fun toString() = "Lkotlin/collections/CollectionsKt___CollectionsKt;"

    object JoinToStringFingerprint :
        Fingerprint(
            definingClass = _Collections.toString(),
            name = $$"joinToString$default",
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
}

object Collections {
    override fun toString() = "Lkotlin/collections/CollectionsKt__CollectionsKt;"

    object EmptyListFingerprint :
        Fingerprint(
            definingClass = Collections.toString(),
            name = "emptyList",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
            returnType = List.toString(),
            parameters = emptyList(),
        )

    object ListOfFingerprint :
        Fingerprint(
            definingClass = Collections.toString(),
            name = "listOf",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.VARARGS),
            returnType = List.toString(),
            parameters = listOf("[$Object"),
        )
}

object Iterables {
    override fun toString() = "Lkotlin/collections/CollectionsKt__IterablesKt;"

    object CollectionSizeOrDefault :
        Fingerprint(
            definingClass = Iterables.toString(),
            name = "collectionSizeOrDefault",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
            returnType = Type.int,
            parameters = listOf(Iterable.toString(), Type.int),
        )
}

object MutableCollections {
    override fun toString() = "Lkotlin/collections/CollectionsKt__MutableCollectionsKt;"

    object AddAllFingerprint :
        Fingerprint(
            definingClass = MutableCollections.toString(),
            name = "addAll",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
            returnType = Type.boolean,
            parameters = listOf(Collection.toString(), Iterable.toString()),
        )
}
