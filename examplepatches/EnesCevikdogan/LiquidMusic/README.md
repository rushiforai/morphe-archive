# LiquidMusic (Sıfırdan Morphe Yama Projesi)

Apple Music Android (`com.apple.android.music`) için **saf Android Framework API'leri** (AGSL `RuntimeShader`, `RenderEffect`, `RenderNode`, Native `View`) ile sıfırdan geliştirilmiş Liquid Glass Morphe yama paketi.

Harici Jetpack Compose veya `Backdrop` kütüphanesi gömmez; Apple Music'in R8 ile küçültülmüş kendi Compose yapısıyla çakışma riskini ortadan kaldırır.

## Yamalar

1. **Liquid Glass**:
   - Android 13+ (API 33+): AGSL `RuntimeShader` ile kenar kırılması (refraction), kromatik aberasyon ve specular rim parlaması.
   - Android 12 (API 31–32): `RenderEffect` ile canlılık (vibrancy), isteğe bağlı bulanıklık ve kenar parlaması.
   - **Liquid Tab Bar**: Sürüklenebilir cam damla kapsülü, sekme gizleme (*New* / *Radio*), başlangıç sekmesi ve dokunsal geri bildirim.
   - **Uygulama İçi Canlı Ayarlar**: Tab bar'a uzun basarak açılan native ayar penceresi (`SharedPreferences` ile kalıcı).
2. **Accent color**: Karanlık ve aydınlık tema için özel vurgu rengi.
3. **Liquid Glass icon**: Sıfırdan oluşturulmuş adaptive ve Android 13+ temalı (monochrome) ikon.

## GitHub Actions ile Derleme ve Morphe'ye Ekleme

1. Bu projeyi kendi GitHub repona yükle (`git init && git add . && git commit -m "Initial" && git push`).
2. `Settings → Actions → General → Workflow permissions` altından **Read and write permissions** seçeneğini aç.
3. `main` dalına push yaptığında GitHub Actions otomatik olarak `.mpp` paketini derleyip Release oluşturacaktır.
4. Telefonunda **Morphe Manager → Patch Sources** kısmına `https://github.com/<kullanici-adin>/<repo-adin>` adresini ekle.
5. Apple Music APKM dosyasını seçip yamala ve kur.
