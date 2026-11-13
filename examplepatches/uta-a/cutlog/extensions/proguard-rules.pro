# extension は setlog のプロセスへ注入されるため、難読化せず最小限のコードだけを残す。
-dontobfuscate
-dontoptimize
-keepattributes *

# パッチが smali から参照するクラスを保持する。
-keep class dev.utaa.cutlog.extension.** {
  *;
}

# extension は Java のみで実装し、Kotlin stdlib は注入しない。
-dontwarn kotlin.**
-dontwarn java.lang.reflect.AnnotatedType
-dontwarn javax.lang.model.element.Modifier

# 付け替えた media3 の R は extension 側で用意する（シェーダーの R.raw のみ）。
# exoplayer の R.string はダウンロード通知専用で、cutlog からは到達しない。
-dontwarn dev.utaa.cutlog.shaded.androidx.media3.exoplayer.R$*
