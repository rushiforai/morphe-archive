package com.nmnvan.patches.thescore.shared

import app.morphe.patcher.anyInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef

/**
 * Matches a use of a resource id. theScore's feature modules read ids from their (unobfuscated)
 * library R classes, e.g. `sget Lcom/thescore/repositories/R$string;->title_help:I`, instead of
 * inlining the constant. Both forms are accepted in case a future build inlines them.
 */
internal fun resourceReference(type: ResourceType, name: String) = anyInstruction(
    fieldAccess(
        definingClass = "/R\$${type.value};",
        name = name,
        type = "I",
        opcode = Opcode.SGET,
    ),
    resourceLiteral(type, name),
)

/**
 * theScore is obfuscated with R8, but classes keep their Kotlin SourceFile attribute
 * (e.g. "MastheadAdManagerDelegate.kt"). Matching on it is far more stable across
 * app versions than obfuscated class names.
 */
internal fun ClassDef.isFrom(sourceFileName: String) = sourceFile == sourceFileName
