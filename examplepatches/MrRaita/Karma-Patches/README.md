# Karma Patches

Yamasını bulamadığım uygulamalar için AI ile hazırlayıp yayınladığım yama deposu.

> Bağımsız bir topluluk projesidir; Morphe projesi ya da yamalanan uygulamaların yayıncılarıyla bağlantılı değildir, onlar tarafından onaylanmamıştır. Ayrıntı: [NOTICE](NOTICE).

## Desteklenen uygulamalar

| Uygulama | Paket | Sürümler | Yamalar |
|---|---|---|---|
| NOW TV | `tr.com.nowtv.android` | 7.6.258, 7.0.305 | [docs/apps/nowtv.md](docs/apps/nowtv.md) |

## Manager'a ekleme
Kaynak adresi: `https://github.com/MrRaita/Karma-Patches`

Manager kaynağı, depo kökündeki `patches-bundle.json` dosyasından okur. Bu dosyayı release iş akışları üretir:

| Kanal | Dal | Üreten iş akışı |
|---|---|---|
| Kararlı | `main` | Release |
| Prerelease (debug) | `dev` | Release (debug / prerelease) |

İlk release yayınlanmadan Manager "metadata bulunamadı" der.

## İş akışları (GitHub > Actions)

| İş akışı | Ne zaman | Ne yapar |
|---|---|---|
| Build | Her push ve PR | Kontrol amaçlı derleme, yayın yapmaz |
| Release (debug / prerelease) | Elle | Debug loglu derleme, prerelease, `dev` metadata'sı |
| Release | Elle | Debug'suz kararlı derleme, release, `main` metadata'sı |

İkisini başlatırken sürüm (`1.2.0`, debug için `1.2.0-dev.1`) ve isteğe bağlı not girilir.
Not alanına `\n` yazarsan satır sonu olur. Release notuna, bir önceki release ya da prerelease'den
beri gelen commit ve PR'lar otomatik eklenir.

Debug derlemede kancalar logcat'e yazar: `adb logcat -s KarmaPatches`

## Yeni uygulama eklemek
`patches/src/main/kotlin/dev/karmapatches/patches/<uygulama>/` altında ayrı paket aç; uygulamanın
`Compatibility` tanımı paketin kökünde, fingerprint ve yamalar alt paketlerde olsun.
Debug logu için `debugLogSmali(...)` yardımcısını kullan.

> Yamalar yalnızca belirtilen sürümler için doğrulanır. Derlemenin başarılı olması çalışma anı uyumluluğunu garanti etmez.

## Lisans
GPLv3, bkz. [LICENSE](LICENSE) ve [NOTICE](NOTICE).
