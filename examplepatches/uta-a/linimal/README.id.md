# Linimal

[English](README.md) | [日本語](README.ja.md) | [繁體中文](README.zh-TW.md) | [ภาษาไทย](README.th.md) | **Bahasa Indonesia**

Linimal adalah bundel patch Morphe untuk klien Android LINE resmi (GPL-3.0). Linimal menyembunyikan iklan dan fitur yang tidak Anda gunakan, serta memungkinkan Anda mengatur pengiriman tanda dibaca. Setiap fitur dapat diaktifkan atau dinonaktifkan satu per satu dari layar pengaturan LINE, dan saat nonaktif, LINE berperilaku sama seperti aplikasi resmi.

![Video promo Linimal (32 detik, tanpa suara)](docs/media/linimal-promo.webp)

Nama dan isi chat yang muncul di video promo adalah fiktif.

Linimal adalah proyek independen dan bukan proyek resmi LINE maupun Morphe.

## Fitur

- **Sembunyikan iklan**: Smart Channel di daftar chat, iklan di Beranda, dan iklan di OpenChat.
- **Sembunyikan pintu masuk Agent i dan LINE AI**: di 9 tempat, termasuk Beranda, Wallet, kolom pencarian daftar chat, chat, menu + chat, penampil foto dan video, serta Pengaturan.
- **Sembunyikan item yang tidak Anda gunakan**: tab bawah, ikon di bagian atas daftar chat, menu + chat, dan bagian-bagian di Beranda.
- **Baca tanpa tanda dibaca**: baca chat yang dibuka dari menu tekan lama atau dari notifikasi sambil tetap belum dibaca. Setelah selesai, gunakan "Tandai semua sebagai dibaca" untuk menandainya sebagai dibaca.
- **Lihat siapa yang membaca di grup**: tampilkan jumlah pembaca dan ikon anggota di samping "Dibaca" atau di pesan orang lain, dan buka daftar anggota yang sudah dan belum membaca dengan mengetuk "Dibaca" atau dari menu tekan lama.
- **Mode gelap hitam pekat**: membuat latar dan tab bawah menjadi hitam (`#000000`) untuk layar OLED.
- **Lainnya**: sembunyikan info LINE Premium, nonaktifkan pratinjau chat atau buat dapat digulir, buka tautan di browser eksternal, serta dukungan untuk notifikasi dan login Google serta cadangan.

Iklan, Premium, dan Agent i / LINE AI hanya disembunyikan. Penayangan iklan, penagihan, dan komunikasi jaringan LINE tidak diubah.

## Versi yang didukung

| Item | Nilai |
| --- | --- |
| Aplikasi | LINE (`jp.naver.line.android`) |
| Versi | 26.16.0 (versionCode 261600106) |
| Arsitektur | arm64-v8a |
| Format input | APKM |

Versi lain tidak didukung. Berikan APKM ke Morphe apa adanya. Penerapan dengan `--force` tidak didukung.

## Pemasangan

### Morphe Manager (Android)

Buka tautan berikut di perangkat Android Anda untuk menambahkan Linimal ke Morphe Manager sebagai sumber patch. Morphe akan mendeteksi rilis baru secara otomatis.

[**➕ Tambahkan Linimal ke Morphe**](https://morphe.software/add-source?github=uta-a/linimal)

Untuk menambahkannya dari file `.mpp`, ketuk `+` di layar sumber patch, pilih `Local`, lalu pilih `patches-*.mpp` dari [rilis](https://github.com/uta-a/linimal/releases). Cara ini tidak diperbarui secara otomatis.

Pilih APKM LINE, lalu terapkan `Linimal`.

### Morphe Desktop (CLI)

Memerlukan Java 21 atau yang lebih baru.

```sh
java -jar morphe-desktop-*-all.jar patch \
  --patches patches-*.mpp \
  --out line-linimal.apk \
  <APKM LINE>
```

### Pindah dari LINE resmi

LINE yang sudah di-patch memiliki tanda tangan yang berbeda dari aplikasi resmi, sehingga tidak dapat dipasang menimpa aplikasi resmi. Pindahlah dengan urutan berikut.

1. Selesaikan [persiapan MicroG-RE](#gunakan-microg-re-untuk-login-google-dan-cadangan).
2. Di LINE resmi, cadangkan chat Anda ke Google Drive.
3. Copot pemasangan LINE resmi, lalu pasang LINE yang sudah diterapkan Linimal.
4. Login, lalu pulihkan dari Google Drive.

## Cara penggunaan

`Linimal` ditambahkan di bagian paling bawah layar pengaturan LINE. Pengaturannya dibagi menjadi 7 halaman: `Iklan`, `Agent i & LINE AI`, `Sembunyikan item`, `Dibaca`, `Pembaca`, `Tema`, dan `Umum`.

Layar pengaturan, pemberitahuan, dan notifikasi Linimal mengikuti bahasa tampilan LINE dan ditampilkan dalam bahasa Jepang, Inggris, Tionghoa Tradisional, Thai, atau Indonesia. Bahasa lain akan ditampilkan dalam bahasa Inggris.

Nilai default berlaku untuk pemasangan baru. Pengaturan Anda tetap dipertahankan saat memperbarui. Fitur yang targetnya tidak dapat ditemukan (misalnya karena perubahan pada LINE) akan dinonaktifkan secara otomatis dan tidak dapat diubah di layar pengaturan.

Pengaturan tampilan yang menyembunyikan elemen layar berlaku setelah aplikasi dimulai ulang. Saat Anda mengubahnya, Linimal akan menanyakan apakah ingin memulai ulang.

## Daftar pengaturan

| Halaman | Pengaturan | Default | Keterangan |
| --- | --- | --- | --- |
| Iklan | Sembunyikan iklan Smart Channel | ON | Menyembunyikan Smart Channel di bagian atas daftar chat. |
| Iklan | Sembunyikan iklan di Beranda | ON | Menyembunyikan slot iklan di Beranda dan kartu iklan di feed. |
| Iklan | Sembunyikan iklan OpenChat | ON | Menyembunyikan iklan di chat, thread, dan catatan OpenChat. |
| Agent i & LINE AI | Sembunyikan Agent i di atas Beranda | ON | |
| Agent i & LINE AI | Sembunyikan Agent i di atas Wallet | ON | |
| Agent i & LINE AI | Sembunyikan Agent i di kolom pencarian daftar chat | ON | Kolom pencarian melebar mengisi ruang tersebut. |
| Agent i & LINE AI | Sembunyikan Agent i di info chat | ON | |
| Agent i & LINE AI | Sembunyikan Agent i di kolom pesan | ON | Menyembunyikan Agent i dan saran balasan AI di kolom pesan. |
| Agent i & LINE AI | Sembunyikan Agent i di menu + | ON | Menyembunyikan tombol "Tampilkan Agent i di ruang chat" di bagian atas menu + chat. |
| Agent i & LINE AI | Sembunyikan LINE AI di menu tekan lama pesan | ON | Tombol LINE AI di samping pesan gambar juga dihilangkan. |
| Agent i & LINE AI | Sembunyikan LINE AI di penampil foto dan video | ON | |
| Agent i & LINE AI | Sembunyikan Agent i di Pengaturan | ON | |
| Sembunyikan item | Sembunyikan Belanja / Berita / Wallet / Aplikasi | OFF | Menghapusnya dari tab bawah. VOOM selalu dihapus apa pun pengaturannya karena layanannya telah berakhir. |
| Sembunyikan item | Sembunyikan AI Friends / Kalender / OpenChat | OFF | Menyembunyikan ikon di bagian atas daftar chat. |
| Sembunyikan item | Sembunyikan Kalender / LINE Gift / LINE Pay | OFF | Menghapusnya dari menu + chat. |
| Sembunyikan item | Sembunyikan rekomendasi / topik populer / kartu postingan di Beranda / siaran langsung / bagian unggulan / riwayat terbaru | OFF | Menyembunyikan setiap bagian di Beranda. |
| Dibaca | Tambahkan "Baca tanpa tanda dibaca" ke menu | OFF | Chat yang dibuka dari menu tekan lama (atau dari menu pratinjau saat pratinjau gulir ditampilkan) tetap belum dibaca. Menampilkan tombol tandai dibaca manual untuk setiap pesan yang diterima dan tombol untuk menandai seluruh chat sebagai dibaca. Secara default, mengirim pesan akan menandai chat sebagai dibaca. |
| Dibaca | Buka dari notifikasi tanpa tanda dibaca | OFF | Menerapkan penanganan belum dibaca dan tombol tandai dibaca manual yang sama ke chat biasa yang dibuka dari notifikasi. Secara default, mengirim pesan akan menandai chat sebagai dibaca. Tidak bergantung pada pengaturan menu. |
| Dibaca | Tetap belum dibaca setelah mengirim | OFF | Di chat yang dibuka tanpa tanda dibaca, tanda dibaca tetap ditahan meskipun Anda mengirim pesan. Apa yang Anda baca dan balas tidak akan sesuai dengan tampilan tanda dibaca di pihak lain, yang dapat menimbulkan salah paham atau masalah. |
| Dibaca | Hentikan tanda dibaca otomatis di chat | OFF | Di chat biasa, hanya tindakan tandai dibaca manual yang dikirim. Saat membaca tanpa tanda dibaca, jika "Tetap belum dibaca setelah mengirim" nonaktif, tanda dibaca diizinkan satu kali saat Anda mengirim pesan. OpenChat dan sejenisnya tidak termasuk. |
| Pembaca | Tampilkan ikon di samping tanda dibaca | OFF | Di grup dan chat multi-orang, menampilkan ikon hingga 4 anggota yang telah membaca pesan Anda di samping "Dibaca". |
| Pembaca | Tampilkan jumlah pembaca di pesan orang lain | OFF | Menampilkan "Dibaca N" di atas waktu pada pesan orang lain, yaitu jumlah orang yang telah membaca tidak termasuk pengirim dan Anda. |
| Pembaca | Tampilkan ikon pembaca di pesan orang lain | OFF | Menampilkan ikon anggota yang telah membaca di atas waktu pada pesan orang lain. Jika jumlah pembaca juga aktif, ikon muncul di sisi luar jumlah pembaca (sisi yang jauh dari gelembung). |
| Pembaca | Ketuk tanda dibaca untuk membuka daftar | OFF | Mengetuk "Dibaca" di pesan Anda, atau jumlah pembaca dan ikon di pesan orang lain, akan membuka daftar anggota yang sudah dan belum membaca. |
| Pembaca | Tambahkan "Pembaca" ke menu tekan lama | OFF | Membuka daftar yang sama dari menu tekan lama pesan. Juga berfungsi untuk pesan orang lain. |
| Pembaca | Sinkronkan dengan server saat membuka daftar | OFF | Lihat di bawah. |
| Tema | Latar hitam pekat di mode gelap | OFF | Saat perangkat dalam mode gelap, latar layar, tab bawah, dan bilah navigasi menjadi hitam pekat (`#000000`). Kartu dan gelembung pesan tetap berwarna seperti semula. Bagian yang warnanya ditentukan oleh tema tidak berubah. Berlaku setelah dimulai ulang. |
| Umum | Sembunyikan info Premium | OFF | Menyembunyikan info LINE Premium yang muncul saat membatalkan pengiriman pesan. |
| Umum | Sembunyikan Premium di Pengaturan | OFF | Menyembunyikan baris Premium di layar pengaturan LINE. |
| Umum | Nonaktifkan pratinjau chat | OFF | Menekan lama chat di daftar chat membuka menu tekan lama klasik, bukan pratinjau. Selama aktif, dua pengaturan pratinjau di bawah tidak dapat diubah (nilai yang tersimpan tetap ada). LINE Labs dan status langganan Premium tidak berubah. Berlaku setelah dimulai ulang. |
| Umum | Sembunyikan info Premium di pratinjau | OFF | Menyembunyikan info LINE Premium dan baris menu di pratinjau gulir. Pemberitahuan "Anda dapat menggulir layar" tetap ada. |
| Umum | Pratinjau dapat digulir | OFF | Membuat pratinjau chat yang dibuka dengan tekan lama dapat digulir. Tidak mengubah ketentuan penyediaan pratinjau itu sendiri. Berlaku setelah dimulai ulang. |
| Umum | Buka tautan di browser eksternal | OFF | Membuka tautan http / https di teks chat, pesan kaya, menu kaya, dan kartu di browser perangkat. Tautan login dan pembayaran LINE tetap dibuka seperti biasa. |
| Umum | Terima notifikasi saat aplikasi ditutup | ON | Lihat di bawah. |
| Umum | Gunakan MicroG-RE untuk login Google dan cadangan | ON | Lihat di bawah. |

## Baca tanpa tanda dibaca

Pengiriman tanda dibaca dan penghapusan status belum dibaca lokal hanya ditahan selama sesi membaca chat biasa yang dibuka dari menu tekan lama.

### Cara membuka

Di LINE 26.16.0, pada akun yang dapat menggunakan pratinjau gulir, menekan lama chat akan membuka layar pratinjau, bukan menu. Dalam hal ini, Linimal menambahkan baris yang sama di bagian paling atas menu di bawah pratinjau. Jika Anda mengaktifkan "Nonaktifkan pratinjau chat" di "Umum" lalu memulai ulang, tekan lama akan membuka menu klasik, dan baris yang sama muncul di menu tersebut. Mengetuknya akan menutup pratinjau dan membuka chat tanpa tanda dibaca. Secara default, apakah pratinjau dapat digulir mengikuti logika resmi LINE. Aktifkan "Pratinjau dapat digulir" di "Umum" lalu mulai ulang agar dapat digulir. Pengaturan ini tidak menambahkan layar pratinjau ke akun yang tidak menyediakannya, dan tidak mengubah penagihan maupun komunikasi jaringan. Penahanan tidak dilepas saat aplikasi sementara berpindah ke latar belakang, layar terkunci, Anda melihat foto atau video, atau membaca dalam waktu lama. Saat layar dibuat ulang karena perubahan konfigurasi, sesi hanya dilanjutkan jika penanda sesi yang tersimpan cocok.

### Tampilan saat membaca dan "Tandai semua sebagai dibaca"

Selama tanda dibaca nonaktif, "Tanda dibaca sedang nonaktif. Mengirim pesan akan menandai chat ini sebagai dibaca" terus ditampilkan tepat di bawah header nama chat. Posisi header itu sendiri tidak berubah. Pemberitahuan ini ditampilkan kembali saat Anda kembali dari latar belakang atau layar kunci, dan hilang saat tanda dibaca aktif kembali karena mengirim pesan atau saat Anda keluar dari chat. Pemberitahuan ini tidak ditampilkan di chat yang dibuka seperti biasa.

"Tandai semua sebagai dibaca" ditampilkan melayang di atas kolom pesan.
Ruang setinggi tombol ditambahkan di bagian bawah daftar agar pesan terbaru tidak tertutup tombol.

Mengetuknya akan menjalankan proses tanda dibaca dan penghapusan status belum dibaca resmi LINE, dan jika berhasil, sesi membaca berakhir dan LINE kembali berperilaku seperti biasa.
Jika terhenti sebelum pengiriman, sesi tetap berlanjut. Jika komunikasi jaringan gagal, proses tanda dibaca resmi LINE menyimpan permintaan dan mengirimnya ulang, sehingga LINE langsung kembali berperilaku seperti biasa.
Tindakan ini tetap dapat dijalankan meskipun "Tetap belum dibaca setelah mengirim" atau "Hentikan tanda dibaca otomatis di chat" aktif.

Tidak ada cara untuk menandai pesan sebagai dibaca hanya sampai titik tertentu. Fitur ini dihapus karena di perangkat nyata telah dipastikan bahwa meskipun hanya posisi yang diketuk yang dikirim, semua pesan tetap ditandai dibaca di LINE versi web resmi milik pihak lain.

### Saat mengirim pesan

Secara default, mengirim pesan saat membaca akan mengakhiri penahanan, dan status belum dibaca lokal serta tanda dibaca untuk pihak lain pada saat itu diterapkan oleh proses bawaan LINE. Ini berlaku untuk pengiriman teks, stiker, gambar, dan lainnya yang dimasukkan ke antrean kirim dari bagian UI chat yang telah diverifikasi. Membatalkan input atau gagal sebelum dimasukkan ke antrean tidak mengakhiri penahanan. Linimal tidak menunggu pengiriman jaringan selesai. Meskipun "Hentikan tanda dibaca otomatis di chat" aktif, penerapan tanda dibaca ini tetap diizinkan satu kali, lalu pengaturan yang ada kembali berlaku.

"Tetap belum dibaca setelah mengirim" nonaktif secara default. Jika diaktifkan, di chat yang dibuka tanpa tanda dibaca dari menu atau notifikasi, penahanan dan lencana belum dibaca tetap dipertahankan meskipun Anda mengirim pesan, dan pemberitahuan di bagian atas berubah menjadi "Tanda dibaca sedang nonaktif. Mengirim pesan tidak akan menandai chat ini sebagai dibaca". Tanda dibaca di chat yang dibuka seperti biasa tidak diubah. Nilai pengaturan yang ada tetap dipertahankan, dan pembaruan tidak akan mengaktifkan pengaturan baru ini dengan sendirinya.

**Perhatian: meskipun Anda membaca dan membalas, pihak lain tetap melihat pesannya belum dibaca. Percakapan yang sebenarnya tidak akan sesuai dengan tampilan tanda dibaca, yang dapat menimbulkan salah paham atau masalah, jadi aktifkan hanya jika diperlukan.**

### Akhir sesi membaca

Penahanan dilepas saat Anda menutup chat, beralih ke chat lain, atau menonaktifkan pengaturan baca tanpa tanda dibaca yang digunakan untuk membukanya. Membuka kembali chat yang sama seperti biasa tidak akan memulihkan penahanan sebelumnya. Jika Anda hanya menonaktifkan "Tetap belum dibaca setelah mengirim", tanda dibaca akan diterapkan pada pengiriman berikutnya. Hanya reservasi untuk layar chat yang pembukaannya tidak dapat dipastikan yang dibuang setelah 30 menit berdasarkan jam monotonik. Jika Linimal gagal memastikan pemilik sesi atau mengamati akhir sesi, Linimal kembali ke proses tanda dibaca resmi LINE.

### Membuka dari notifikasi

Jika "Buka dari notifikasi tanpa tanda dibaca" diaktifkan, penahanan sesi membaca yang sama juga diterapkan ke chat biasa yang dibuka dari notifikasi pesan. Sekadar menerima notifikasi tidak memulai penahanan. Chat yang dibuka seperti biasa, misalnya dari daftar chat, serta tindakan balas dan tandai dibaca di notifikasi tidak termasuk dalam pengaturan ini. Jalur lain seperti OpenChat juga tidak termasuk. Menonaktifkan pengaturan notifikasi hanya melepas sesi yang dimulai dari notifikasi.

## Pembaca

Daftar dibuat dari catatan baca yang disimpan LINE di perangkat ini untuk menampilkan "Dibaca N". Jumlahnya sama dengan "Dibaca N". Linimal tidak pernah mencatat status baca sendiri atau mengirim tanda dibaca.

- Berlaku untuk grup dan chat multi-orang. Tidak ditampilkan di chat pribadi dan OpenChat.
- Anggota yang belum membaca adalah anggota saat ini dikurangi anggota yang sudah membaca. Anda dan pengirim tidak termasuk dalam daftar.
- Nama tampilan mengutamakan nama yang Anda tetapkan. Ikon diambil dalam versi kecil dari CDN publik yang sama dengan yang digunakan LINE (`profile.line-scdn.net`) dan hanya disimpan di memori.
- Jika `Sinkronkan dengan server saat membuka daftar` diaktifkan, setiap kali daftar dibuka, sinkronisasi tanda dibaca yang sama dengan yang dijalankan LINE secara berkala dijalankan hanya untuk chat tersebut, lalu daftar ditampilkan ulang. Jika nonaktif, hanya catatan di perangkat yang digunakan dan tidak ada komunikasi untuk sinkronisasi.

## Notifikasi dan integrasi Google

### Terima notifikasi saat aplikasi ditutup

Karena tanda tangan LINE yang sudah di-patch berubah, notifikasi tidak akan masuk saat aplikasi ditutup jika dibiarkan apa adanya. Pengaturan ini mengganti info tanda tangan yang dikirim ke Google saat mendaftar notifikasi dengan milik aplikasi LINE resmi. Tidak perlu persiapan khusus.

### Gunakan MicroG-RE untuk login Google dan cadangan

Jika dibiarkan apa adanya, LINE yang sudah di-patch tidak dapat login dengan akun Google maupun mencadangkan ke dan memulihkan dari Google Drive. Pengaturan ini hanya menjalankan otorisasi tersebut melalui [MicroG-RE](https://github.com/MorpheApp/MicroG-RE). Untuk menggunakannya, diperlukan persiapan berikut.

1. Pasang [rilis resmi MicroG-RE](https://github.com/MorpheApp/MicroG-RE/releases). Selain rilis resmi (fork lain atau hasil build sendiri) tidak akan digunakan.
2. Tambahkan akun Google yang Anda gunakan untuk login dan cadangan LINE ke MicroG-RE. Untuk cadangan, hanya akun yang ditambahkan ke MicroG-RE yang muncul sebagai pilihan. Jika sebelumnya Anda mengatur cadangan otomatis dengan akun lain, pilih ulang akun di pengaturan cadangan.

Jika Anda mencoba login dengan akun Google, mencadangkan, atau memulihkan tanpa MicroG-RE, pesan dan notifikasi yang menjelaskan cara memasangnya akan ditampilkan. Pesan tetap ditampilkan meskipun notifikasi belum diizinkan tepat setelah pemasangan baru.

Jika pencadangan atau pemulihan gagal dengan "Tidak dapat mengakses LINE", kegagalan terhubung ke MicroG-RE atau error yang dikembalikan MicroG-RE (seperti `NetworkError`) ditampilkan dalam notifikasi "Otorisasi Google Drive gagal". Notifikasi juga mencantumkan versi MicroG-RE, LINE, dan Android (alamat email tidak dicantumkan). Saat melaporkan masalah, sertakan isi notifikasi ini. Jika gagal tanpa notifikasi, periksa terlebih dahulu apakah notifikasi LINE diizinkan (termasuk kategori "Linimal: Error otorisasi cadangan"). Jika notifikasi diizinkan tetapi tidak ada yang muncul, kegagalan mungkin terjadi di luar pengambilan token (seperti komunikasi dengan Google Drive).

> [!WARNING]
> Fitur notifikasi dan integrasi Google ini melaporkan tanda tangan aplikasi ke Google secara palsu sebagai tanda tangan resmi. Hal ini dapat melanggar ketentuan layanan Google atau LINE, dan dampaknya terhadap akun Google Anda tidak dapat dikesampingkan. Fitur ini juga dapat berhenti berfungsi karena perubahan di sisi Google atau MicroG-RE.

## Pengembangan

Untuk build, diperlukan Java 17 dan kredensial untuk membaca GitHub Packages Morphe. Atur `gpr.user` dan `gpr.key` di `~/.gradle/gradle.properties`, atau berikan melalui variabel lingkungan `GITHUB_ACTOR` dan `GITHUB_TOKEN`. Jangan simpan kredensial di repositori.

```sh
./gradlew test buildAndroid
```

Bundel patch dihasilkan di `patches/build/libs/patches-*.mpp`. APK, APKM, kunci penandatanganan, dan hasil dekompilasi tidak di-commit. Keputusan desain ada di [docs/adr](docs/adr) dan analisis ada di [docs/analysis](docs/analysis) (keduanya dalam bahasa Jepang).

## Lisensi

Dirilis di bawah [GNU General Public License v3.0](LICENSE). Lihat [NOTICE](NOTICE) untuk ketentuan tambahan mengenai nama dan merek dagang Morphe.
