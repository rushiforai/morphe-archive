// 拡張は Android SDK しか使わないので、ほかのパッチのバンドルと同じアプリに
// 入れても、同じクラスが二重に入ることはない。自動で作られる R クラスも、
// この名前空間の中に収まる。
android {
    namespace = "app.morphe.extension.h19e8p"

    defaultConfig {
        minSdk = 26
    }
}
