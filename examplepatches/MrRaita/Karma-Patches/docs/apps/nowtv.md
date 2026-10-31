# NOW 7.6.258 reklam analizi (statik, base.apk)

## Banner
- Google Ad Manager. Tek giriş: `AdManagerExtensionsKt.loadAdWithRetry(AdManagerAdView, AdManagerAdRequest, int, long, long)`.
- Adapter'lar (Discover*, Program*), Home/Movies/News/Sport/Series/Programs/ProgramGuide/LiveStream fragment'ları bu yardımcıyı kullanıyor.

## VOD
- `VideoFragment.initPlayer` -> `ProgramHelper.GetVmapUrl` (merlincdn.net VMAP) -> ExoPlayer `MediaItem.AdsConfiguration` + `ImaAdsLoader`.
- `releasePlayer` adsLoader alanını null-güvenli kullanıyor; AdsLoader null dönmesi güvenli.

## Canlı
- `LiveStreamFragment.initPlayer`: `https://nowtv.daioncdn.net/nowtv/nowtv.m3u8` + token, `DaionClient` (Erstream DAION, SSAI).
- `onDaionAdIn/Out` sadece kontrol çubuğunu gösterip gizliyor.
- resources.arsc içinde alternatif düz adres: `https://nowtv-live.ercdn.net/nowtv/playlistm.m3u8` (kullanımı doğrulanmadı).

## DNS ile video açılmama olasılıkları (doğrulanmadı)
- Canlı: akış adresi zaten `daioncdn.net` üzerinde.
- VOD: stream API'si `*.merlincdn.net` üzerinde olabilir; VMAP de aynı alan adında.

## Yamalar ve kanca (hook) noktaları
Tüm yamalar tek bir metodun başına talimat ekler (`addInstructions(0, ...)`); harici kod, ek dex, ağ erişimi, izin ya da manifest değişikliği yoktur.

| Yama | Hedef | Ne ekleniyor | Varsayılan |
|---|---|---|---|
| Remove banner ads | `AdManagerExtensionsKt.loadAdWithRetry` | görünürlük GONE + `return-void` | açık |
| Remove video ads | `VideoFragment` içindeki AdsLoader sağlayıcı lambda'sı | `null` döner; ExoPlayer içeriği reklamsız oynatır | açık |
| Keep player controls during live ads | `LiveStreamFragment.onDaionAdIn` | `return-void` (kontrol çubuğu gizlenmez) | açık |
| Live stream without ad insertion | `LiveStreamFragment.initPlayer` | düz canlı adresi, uygulamanın kendi token üreticisiyle | kapalı (deneysel) |

## Güvenlik / fazlalık değerlendirmesi
- Depoda gizli anahtar yok; deneysel yama imzayı uygulamanın kendi `liveStreamTokenGenerator` metoduyla üretir.
- Tek yeni ağ adresi deneysel yamadaki `nowtv-live.ercdn.net` (uygulamanın kendi kaynaklarından).
- Yamalar yalnızca reklam yükleme/gösterme noktalarını keser. Reklam ve ölçüm SDK'ları (Google Mobile Ads başlatma, Gemius, Spring, IAB OMID) yerinde kalır; izleme engellenmez.
- Deneysel yama enjekte kodunun v3/v4/v5 kayıtlarına dayandığı için, düzen farklıysa artık yamalama sırasında hata verir (çalışma anı VerifyError'u yerine).
- `loadAdWithRetry` gizlenen banner'ın kapsayıcısı (boşluk, başlık) ekranda kalabilir; sadece görsel.

- Debug derlemede (`Release (debug / prerelease)`) her kanca `KarmaPatches` etiketiyle logcat satırı yazar; kararlı derlemede hiçbir log eklenmez. Loglara URL, token ya da kullanıcı verisi yazılmaz.
