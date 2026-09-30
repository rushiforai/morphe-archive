# パッチが拡張の中の置き換え用メソッドを書き換えるので、拡張の中身は
# 名前の変更・インライン化・定数の畳み込みをしてはならない。
-dontobfuscate
-dontoptimize
-keepattributes *
-keep class app.morphe.extension.autoexpand.** {
  *;
}
