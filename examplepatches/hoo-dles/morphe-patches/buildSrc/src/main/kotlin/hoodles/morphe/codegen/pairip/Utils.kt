/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.codegen.pairip

fun toLiteral(value: String) = value
    .replace("\\", "\\\\")
    .replace("\"", "\\\"")
    .replace("\n", "\\n")
    .replace("\r", "\\r")
    .replace("\t", "\\t")

private val OWNING_CLASS_REGEX = Regex("""\s([^(\s]+)\.[^.(\s]+\(""")
fun getOwningClass(signature: String) =
    OWNING_CLASS_REGEX.find(signature)?.groupValues?.get(1)!!

fun getClassFromFqcn(fqcn: String) = fqcn.substringAfterLast(".")
fun getPackageFromFqcn(fqcn: String) = fqcn.substringBeforeLast(".")

fun safelyReplaceHyphen(str: String) = str.replace("-", "__HYPHEN__")