package androidx.compose.runtime

/** Minimal host contract; real app interface is validated against original DEX. */
interface DisposableEffectResult {
    fun dispose()
}
