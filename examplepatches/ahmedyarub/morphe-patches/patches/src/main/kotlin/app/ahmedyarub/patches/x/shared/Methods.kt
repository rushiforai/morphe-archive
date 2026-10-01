package app.ahmedyarub.patches.x.shared

import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** The method as smali names it in an invoke: Lclass;->name(params)return. */
internal val MethodReference.reference: String
    get() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
