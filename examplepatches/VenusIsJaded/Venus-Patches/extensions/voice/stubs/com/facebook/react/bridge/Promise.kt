package com.facebook.react.bridge

// Compile-only ABI stub. Never included in the extension; Discord supplies the real interface.
interface Promise {
    fun resolve(value: Any?)
    fun reject(code: String, message: String)
}
