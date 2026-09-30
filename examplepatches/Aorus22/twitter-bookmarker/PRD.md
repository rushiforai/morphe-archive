# Product Requirements Document
## Twitter Bookmarker Chrome Extension

**Status:** Ready for implementation  
**Target:** Personal use / single user  
**Platform:** Google Chrome / Chromium, Linux  
**Backend:** Local Go HTTP server  
**Primary website:** `https://x.com/i/bookmarks`  
**Persistence:** CSV files under `~/.twitter-bookmarker/` (default; lihat §15)

---

# 1. Product Summary

Twitter Bookmarker adalah Chrome Extension untuk membantu mengelompokkan tweet yang tersimpan di halaman X/Twitter Bookmarks ke kategori buatan user.

Extension menambahkan kontrol langsung pada setiap tweet di halaman:

`https://x.com/i/bookmarks`

User dapat memilih kategori untuk tweet tersebut. Setelah kategori dipilih, extension mengekstrak metadata tweet dan mengirimkannya ke backend lokal yang berjalan di komputer user.

Backend kemudian menambahkan satu row ke file CSV milik kategori tersebut.

Contoh:

```text
~/.twitter-bookmarker/
├── ai.csv
├── linux.csv
├── design.csv
└── index.json
```

Jika setting `Unbookmark after save` aktif, tweet baru akan di-unbookmark dari X setelah backend mengonfirmasi bahwa data berhasil ditulis ke CSV.

Extension tidak berfungsi sebagai bookmark manager, database browser, dashboard, ataupun viewer. Tujuan utamanya hanya:

```text
X Bookmarks
    ↓
Categorize
    ↓
Append metadata to CSV
    ↓
Optional unbookmark from X
```

---

# 2. Goals

Produk harus memungkinkan user:

1. Membuat kategori bookmark.
2. Mengatur nama, warna, dan urutan kategori.
3. Memilih bagaimana kategori muncul di halaman X:
   - melalui satu tombol + popover;
   - semua kategori langsung tampil secara inline.
4. Mengelompokkan sebuah tweet ke tepat satu kategori.
5. Menyimpan metadata tweet ke CSV kategori.
6. Mencegah tweet yang sama disimpan dua kali.
7. Mengetahui bahwa tweet sudah pernah diproses.
8. Secara opsional menghapus tweet dari X Bookmarks setelah penyimpanan sukses.
9. Tetap mempertahankan data CSV walaupun kategori dihapus atau di-rename dari extension.
10. Menyimpan seluruh konfigurasi extension di Chrome, bukan backend.

---

# 3. Non-Goals

MVP tidak mencakup:

- dashboard tweet;
- search;
- filtering;
- viewer CSV;
- edit CSV dari extension;
- move tweet antar kategori;
- undo;
- import;
- export;
- cloud sync;
- multi-device synchronization;
- authentication;
- account system;
- remote backend;
- quoted tweet text;
- download image/video;
- keyboard shortcut;
- category icon;
- favorite category;
- automatic category classification;
- AI classification;
- Twitter/X API resmi;
- support halaman selain X Bookmarks;
- support legacy `twitter.com`;
- mobile browser support.

---

# 4. Core Product Principles

## 4.1 CSV is the source of truth

Bookmark yang berhasil dikategorikan harus tersimpan secara permanen dalam file CSV.

`index.json` hanya merupakan derived index/cache untuk mempercepat duplicate lookup.

Jika index hilang atau rusak, backend harus mampu membangunnya kembali dari seluruh CSV yang ada.

---

## 4.2 Save first, unbookmark second

Extension tidak boleh menghapus bookmark dari X sampai backend mengonfirmasi bahwa penulisan CSV berhasil.

Flow wajib:

```text
Extract tweet
    ↓
POST to backend
    ↓
CSV append succeeds
    ↓
Backend responds success
    ↓
Optional X unbookmark
```

Jika proses penyimpanan gagal:

```text
DO NOT UNBOOKMARK
```

---

## 4.3 Backend does not own categories

Backend tidak menyimpan daftar kategori ataupun settings extension.

Backend hanya mengetahui:

- storage directory;
- filename tujuan;
- metadata tweet;
- duplicate index.

Backend tidak perlu memahami category ID, warna, urutan kategori, display mode, atau setting unbookmark.

---

# 5. High-Level Architecture

```text
┌───────────────────────────────┐
│        Chrome Extension       │
│                               │
│ chrome.storage.local          │
│ ├── categories               │
│ └── settings                 │
│                               │
│ Content Script               │
│ ├── detect X bookmark tweets │
│ ├── extract metadata         │
│ └── inject UI                │
│                               │
│ Extension Service Worker     │
│ └── HTTP client              │
└───────────────┬───────────────┘
                │
                │ HTTP localhost
                ▼
┌───────────────────────────────┐
│        Local Go Backend       │
│                               │
│ 127.0.0.1:<fixed-port>        │
│                               │
│ ├── validation               │
│ ├── URL normalization        │
│ ├── duplicate detection      │
│ ├── CSV append               │
│ └── index maintenance        │
└───────────────┬───────────────┘
                │
                ▼
~/.twitter-bookmarker/
├── ai.csv
├── linux.csv
├── design.csv
└── index.json
```

Recommended default backend address:

```text
http://127.0.0.1:43121
```

Port harus disimpan sebagai satu constant sehingga mudah diganti di source code. Extension popup menyediakan pilihan **Localhost** (default di atas) atau **Custom**: user boleh mengisi URL sendiri, baik host dengan port (`192.168.1.10:8080`) maupun URL lengkap dengan base path (`https://server.example/tw-bookmarker`). Lihat §50.

Backend dijalankan manual oleh user.

Contoh:

```bash
twitter-bookmarker-server
```

Tidak perlu systemd service atau automatic startup pada MVP.

---

# 6. Chrome Extension Architecture

Extension menggunakan Manifest V3.

Recommended implementation:

```text
TypeScript
Plain DOM APIs
Minimal CSS
No frontend framework required
```

React/Vue/Svelte tidak diperlukan untuk MVP.

Main components:

```text
extension/
├── manifest.json
├── background/
│   └── service-worker
├── content/
│   ├── bookmark-page
│   ├── tweet-extractor
│   ├── ui-injector
│   └── toast
├── popup/
│   ├── category-manager
│   ├── settings
│   └── backend-status
└── shared/
    ├── types
    ├── storage
    └── filename
```

---

# 7. Extension Storage

Gunakan:

```text
chrome.storage.local
```

Jangan gunakan cloud sync.

Suggested schema:

```json
{
  "version": 1,
  "settings": {
    "unbookmarkAfterSave": false,
    "displayMode": "popover"
  },
  "categories": [
    {
      "id": "uuid",
      "name": "Linux",
      "filename": "linux.csv",
      "color": "#xxxxxx",
      "order": 0
    }
  ]
}
```

## Category fields

### `id`

Stable internal identifier.

Generate ketika kategori dibuat.

Rename kategori tidak mengubah ID.

---

### `name`

Human-readable category name.

Contoh:

```text
AI & LLM
Linux
Design
Read Later
```

---

### `filename`

CSV filename yang saat ini digunakan category.

Contoh:

```text
AI & LLM
→ ai-llm.csv
```

Filename berubah ketika nama category di-rename.

File CSV lama tidak ikut di-rename.

---

### `color`

Hanya digunakan di UI extension.

Tidak disimpan ke CSV.

Tidak dikirim ke backend.

---

### `order`

Menentukan posisi category.

Order yang sama harus digunakan untuk:

- extension popup;
- popover pada tweet;
- inline category buttons.

---

# 8. Category Filename Generation

Category name harus dikonversi menjadi safe filename.

Contoh:

```text
Linux
→ linux.csv

AI & LLM
→ ai-llm.csv

Read Later
→ read-later.csv
```

Suggested slug behavior:

```text
lowercase
trim whitespace
spaces → "-"
remove unsafe filename characters
collapse multiple "-"
append ".csv"
```

Backend wajib melakukan validasi filename kembali.

Backend tidak boleh menerima path arbitrary seperti:

```text
../../something
/etc/passwd
~/other-directory
```

Allowed filename should follow behavior equivalent to:

```regex
^[a-z0-9][a-z0-9-]*\.csv$
```

Jika hasil slug kosong, extension dapat menggunakan fallback:

```text
category-<short-id>.csv
```

---

# 9. Category Rename Semantics

Rename hanya mengubah konfigurasi extension.

Contoh awal:

```text
Category:
Linux

Filename:
linux.csv
```

Setelah rename:

```text
Category:
Linux Stuff

Filename:
linux-stuff.csv
```

Filesystem menjadi:

```text
~/.twitter-bookmarker/
├── linux.csv
└── linux-stuff.csv
```

`linux.csv` tidak dihapus.

`linux.csv` tidak di-rename.

`linux.csv` tidak dimigrasikan.

Bookmark baru untuk category tersebut akan masuk ke:

```text
linux-stuff.csv
```

Bookmark lama tetap berada di:

```text
linux.csv
```

---

# 10. Category Delete Semantics

Delete category hanya menghapus category dari:

```text
chrome.storage.local
```

Backend tidak menerima delete operation.

CSV lama tidak boleh dihapus.

Contoh:

```text
Delete "Linux"
```

Extension:

```text
categories -= Linux
```

Filesystem:

```text
linux.csv
```

tetap ada.

Bookmark yang pernah tersimpan di file tersebut tetap dianggap sudah diproses karena global duplicate index tetap menyimpan tweet tersebut.

---

# 11. Global Duplicate Policy

Satu tweet hanya boleh disimpan satu kali secara global.

Contoh:

```text
linux.csv
→ tweet ID 123
```

Kemudian user mencoba memasukkan tweet yang sama ke:

```text
ai.csv
```

Backend harus menolak.

Expected response:

```text
HTTP 409 Conflict
```

Tweet tersebut tidak boleh ditambahkan ke `ai.csv`.

Global uniqueness menggunakan Tweet Status ID sebagai primary duplicate key.

Contoh URL:

```text
https://x.com/foo/status/123456
```

Duplicate key:

```text
123456
```

Menggunakan status ID lebih robust dibanding menggunakan full URL karena username dapat berubah.

---

# 12. URL Normalization

Input seperti:

```text
https://x.com/foo/status/123?s=20
https://x.com/foo/status/123#something
```

harus disimpan sebagai:

```text
https://x.com/foo/status/123
```

Backend harus:

1. parse URL;
2. memastikan host valid;
3. menemukan `/status/<tweet-id>`;
4. membuang query parameters;
5. membuang hash;
6. menghasilkan canonical X URL.

CSV menyimpan canonical URL.

---

# 13. CSV Format

Setiap category memiliki satu CSV.

Header wajib:

```csv
url,media,author,username,tweet_date,saved_at,text
```

Kolom `media` berada tepat setelah `url` (lihat §14). File lama yang masih
memakai header enam kolom tidak boleh di-append; migrasinya dilakukan oleh
folder `Scripts/` di repo data (`hehenugas/twitter-bookmarker-csv`, private).

Encoding:

```text
UTF-8
```

Format harus kompatibel dengan standard CSV quoting behavior.

Backend disarankan menggunakan Go `encoding/csv`, bukan membuat escaping manual.

---

# 14. CSV Fields

## `url`

Canonical X tweet URL.

Example:

```text
https://x.com/foobar/status/123456789
```

---

## `media`

Array URL media milik tweet utama, dikodekan sebagai JSON array di dalam satu
field CSV.

Tweet tanpa media:

```text
[]
```

Tweet dengan media:

```text
["https://pbs.twimg.com/media/ABC.jpg","https://pbs.twimg.com/media/DEF.jpg"]
```

Aturan normalisasi (dipakai identik oleh extension dan backend):

- hanya URL `https://pbs.twimg.com/...` yang diterima;
- query sizing (`?format=…&name=…`) dibuang; kalau path belum punya ekstensi,
  ekstensi diambil dari parameter `format`;
- path card/avatar/banner (`/card_img/`, `/profile_images/`, `/profile_banner/`,
  `/profile_background/`) ditolak;
- duplikat dibuang, urutan asli dipertahankan, maksimum 8 entri;
- video dan animated GIF menyimpan **poster frame**-nya, bukan URL mp4, karena
  DOM X hanya mengekspos `blob:` untuk pemutaran;
- media milik quoted tweet tidak pernah ikut.

URL media tidak boleh ditaruh di field `text`.

---

## `author`

Display name tweet author.

Example:

```text
Foo Bar
```

Jika mengandung koma:

```text
Foo, Bar
```

CSV writer wajib melakukan quoting otomatis.

---

## `username`

X handle dengan prefix `@`.

Example:

```text
@foobar
```

---

## `tweet_date`

Waktu original tweet berdasarkan metadata DOM.

Format:

```text
ISO 8601 UTC
```

Example:

```text
2026-09-27T01:10:42Z
```

---

## `saved_at`

Dibuat backend tepat ketika bookmark berhasil dipersist.

Format:

```text
ISO 8601 UTC
```

Example:

```text
2026-09-27T01:15:32Z
```

Backend menjadi authority untuk `saved_at`.

---

## `text`

Text hanya dari tweet utama.

Quoted tweet tidak ikut.

Jika tweet:

```text
Main tweet

[quoted tweet]
```

yang disimpan hanya:

```text
Main tweet
```

Jika tweet berisi multiline text:

```text
Hello

This is line two.
```

newline harus dipertahankan di CSV field.

Jika tweet hanya berisi media tanpa caption:

```text
text = ""
```

Jangan menyimpan URL image/video di dalam `text`. URL media disimpan di kolom
`media` (§14).

---

# 15. Backend Storage Directory

Default directory:

```text
~/.twitter-bookmarker/
```

Lokasi bisa dipindah lewat environment variable `TWITTER_BOOKMARKER_DIR`
(absolute atau diawali `~/`); kalau kosong/tidak diset, default di atas dipakai.
Path relatif ditolak supaya CSV tidak tersebar tergantung working directory.

`make run` meneruskan variable ini ke server, jadi nilainya cukup ditaruh di file
`.env.local` (gitignored) di root repo — tidak perlu di shell profile:

```make
# .env.local
TWITTER_BOOKMARKER_DIR := $(HOME)/Personal/twitter-bookmarker
```

Backend membuat directory otomatis jika belum ada, dan mencatat lokasi yang
dipakai di log startup.

Recommended permissions:

```text
directory: user-only
files: user-readable/writable only
```

Backend tidak menyediakan setting lokasi folder di UI extension; hanya lewat
environment variable di atas.

---

# 16. Backend Responsibilities

Go backend bertanggung jawab atas:

```text
health check
input validation
filename validation
tweet URL normalization
tweet ID extraction
duplicate detection
CSV header creation
CSV append
CSV escaping
saved_at generation
index creation
index rebuild
index update
filesystem errors
concurrency protection
```

Backend tidak bertanggung jawab atas:

```text
category management
category rename
category delete
category colors
category order
extension display mode
X DOM manipulation
X unbookmark
settings persistence
```

---

# 17. Backend API

## GET `/health`

Purpose:

Mengetahui apakah backend sedang berjalan.

Response:

```json
{
  "status": "ok"
}
```

HTTP:

```text
200
```

---

# 18. GET `/v1/index`

Mengembalikan semua Tweet Status ID yang sudah tersimpan.

Possible response:

```json
{
  "items": {
    "123456789": {
      "url": "https://x.com/foo/status/123456789",
      "filename": "linux.csv",
      "saved_at": "2026-09-27T01:15:32Z"
    },
    "987654321": {
      "url": "https://x.com/bar/status/987654321",
      "filename": "ai.csv",
      "saved_at": "2026-09-27T02:20:10Z"
    }
  }
}
```

Extension tidak perlu menampilkan filename/category dari data ini.

Untuk tweet yang ditemukan di index cukup tampilkan:

```text
✓ Saved
```

---

# 19. POST `/v1/bookmarks`

Example request:

```json
{
  "filename": "linux.csv",
  "tweet": {
    "url": "https://x.com/foobar/status/123456789?s=20",
    "author": "Foo Bar",
    "username": "@foobar",
    "tweet_date": "2026-09-27T01:10:42Z",
    "text": "Example tweet"
  }
}
```

Backend menentukan:

```text
saved_at
tweet ID
canonical URL
```

Successful response:

```json
{
  "status": "saved",
  "tweet_id": "123456789",
  "url": "https://x.com/foobar/status/123456789",
  "filename": "linux.csv",
  "saved_at": "2026-09-27T01:15:32Z"
}
```

HTTP:

```text
201 Created
```

---

# 20. Duplicate Response

Jika tweet sudah ada:

```text
409 Conflict
```

Example:

```json
{
  "status": "duplicate",
  "tweet_id": "123456789"
}
```

Tidak boleh append CSV kedua kali.

Tidak boleh melakukan X unbookmark sebagai akibat response duplicate.

UI cukup berubah menjadi:

```text
✓ Saved
```

---

# 21. Backend Validation Errors

Invalid payload:

```text
400 Bad Request
```

Examples:

- invalid filename;
- invalid X URL;
- missing author;
- missing username;
- invalid tweet date;
- invalid payload structure.

Filesystem/internal errors:

```text
500 Internal Server Error
```

Extension tidak boleh unbookmark tweet jika mendapatkan error ini.

---

# 22. Index Design

File:

```text
~/.twitter-bookmarker/index.json
```

Index merupakan derived data.

Suggested structure:

```json
{
  "version": 1,
  "tweets": {
    "123456789": {
      "url": "https://x.com/foo/status/123456789",
      "filename": "linux.csv",
      "saved_at": "2026-09-27T01:15:32Z"
    }
  }
}
```

Tweet Status ID adalah key.

---

# 23. Index Startup Behavior

Ketika backend mulai:

### Case A — index exists and valid

Load index ke memory.

### Case B — index missing

Scan semua:

```text
~/.twitter-bookmarker/*.csv
```

dan rebuild index.

### Case C — index malformed/corrupted

Rebuild dari semua CSV.

### Case D — empty directory

Create empty in-memory index.

CSV adalah authority.

Index tidak boleh menyebabkan kehilangan data CSV.

---

# 24. Backend Write Semantics

Backend harus memiliki concurrency protection.

Pada `POST /v1/bookmarks`:

```text
Acquire lock
↓
Normalize URL
↓
Extract Tweet ID
↓
Check in-memory index
↓
If exists → 409
↓
Open/create CSV
↓
Create header if required
↓
Append row
↓
Flush write
↓
Update in-memory index
↓
Persist index.json atomically/best effort
↓
Return 201
↓
Release lock
```

Jika CSV append sudah berhasil tetapi index persistence gagal:

- CSV tetap dianggap source of truth;
- update in-memory index;
- log warning;
- save dapat tetap dianggap berhasil;
- index akan bisa dibangun ulang dari CSV pada restart.

Hal ini mencegah data CSV yang valid dianggap gagal hanya karena derived cache tidak dapat diperbarui.

---

# 25. Extension ↔ Backend Communication

Content script tidak perlu melakukan backend HTTP request secara langsung.

Recommended flow:

```text
Content Script
    ↓ chrome.runtime.sendMessage
Service Worker
    ↓ HTTP
Local Go Backend
```

Ini memusatkan seluruh backend communication pada extension service worker.

Message types:

```text
HEALTH_CHECK
GET_SAVED_INDEX
SAVE_TWEET
```

---

# 26. Supported Page

Extension hanya aktif pada:

```text
https://x.com/i/bookmarks
```

Tidak inject organizer pada:

```text
Home
Explore
Notifications
Messages
Profile
Individual tweet page
Lists
Search
```

Karena X adalah SPA, content script harus mendeteksi route changes tanpa bergantung pada full page reload.

Ketika route meninggalkan `/i/bookmarks`, bookmark organizer tidak boleh diinject ke tweet lain.

---

# 27. X DOM Observation

Bookmark timeline menggunakan dynamic/infinite loading.

Implementation harus menggunakan DOM observation.

Recommended approach:

```text
MutationObserver
```

Setiap tweet container yang ditemukan:

1. cek apakah berada pada `/i/bookmarks`;
2. cek apakah sudah pernah diproses;
3. extract Tweet Status ID;
4. cek cached saved index;
5. inject UI.

Tweet container harus diberi internal marker agar UI tidak diinjeksi dua kali.

Example:

```text
data-twitter-bookmarker-injected="true"
```

Injection harus idempotent.

Repeated DOM mutations tidak boleh menghasilkan multiple buttons.

---

# 28. Tweet Metadata Extraction

Untuk setiap tweet, extension harus mengekstrak:

```text
url
author
username
tweet_date
text
tweet_id
```

Extraction harus dilakukan relatif terhadap tweet container saat ini.

Jangan melakukan global query ke seluruh document untuk mengambil metadata tweet.

Hal ini penting agar data tweet A tidak tercampur dengan tweet B.

DOM selector logic harus dikapsulasi dalam module terpisah karena struktur DOM X dapat berubah.

Example:

```text
TweetExtractor
├── getTweetId()
├── getCanonicalUrl()
├── getAuthor()
├── getUsername()
├── getTweetDate()
└── getMainText()
```

---

# 29. Quoted Tweet Handling

Jika tweet mempunyai embedded quoted tweet, extractor harus mengabaikan text quoted tweet.

Only top-level tweet text is persisted.

Example:

```text
Main text

┌─────────────────────┐
│ Quoted tweet text   │
└─────────────────────┘
```

CSV:

```text
text = "Main text"
```

---

# 30. Tweet Without Text

Untuk image-only/video-only tweet:

```text
text = ""
```

Tweet tetap valid selama metadata utama lain bisa diekstrak.

---

# 31. Main Tweet UI Placement

Organizer controls harus ditempatkan pada action area di bagian bawah tweet, berdekatan dengan action buttons X.

Tujuannya agar interaction terasa sebagai bagian dari tweet action bar.

Jangan tempatkan control pada global page header.

---

# 32. Display Mode — Popover

Setting:

```text
displayMode = "popover"
```

Tweet UI:

```text
Reply  Retweet  Like  Bookmark  [Organize]
                                  ↓
                           ┌─────────────┐
                           │ AI          │
                           │ Linux       │
                           │ Design      │
                           └─────────────┘
```

Popover menampilkan seluruh kategori.

Urutan mengikuti `category.order`.

Color kategori harus terlihat sebagai visual indicator.

Popover ditutup ketika:

- category dipilih;
- user click outside;
- tweet removed from DOM.

---

# 33. Display Mode — Inline

Setting:

```text
displayMode = "inline"
```

Example:

```text
Reply Retweet Like Bookmark

[AI] [Linux] [Design]
```

Semua category harus dirender.

Tidak perlu overflow strategy khusus karena user memperkirakan jumlah kategori sedikit.

---

# 34. Saved Tweet State

Ketika halaman bookmarks dibuka:

```text
GET /v1/index
```

Extension menyimpan hasil ke in-memory Set berdasarkan Tweet Status ID.

Contoh:

```text
Set(
  "123",
  "456",
  "789"
)
```

Jika tweet ID sudah ada:

Jangan tampilkan normal category controls.

Tampilkan:

```text
✓ Saved
```

Tidak perlu menampilkan nama kategori.

Alasan:

- category bisa sudah di-rename;
- category bisa sudah di-delete;
- old filename bisa tidak lagi mempunyai active category.

---

# 35. Save Interaction

User memilih kategori.

Flow:

```text
Category click
↓
Disable all organizer controls on tweet
↓
Show "Saving..."
↓
Extract metadata
↓
SAVE_TWEET message to service worker
↓
POST /v1/bookmarks
```

Selama request berjalan:

- semua category buttons tweet tersebut disabled;
- click kedua tidak boleh memulai request kedua.

---

# 36. Save Success — Auto Unbookmark OFF

Setting:

```text
unbookmarkAfterSave = false
```

Flow:

```text
Backend returns 201
↓
Add Tweet ID to local index cache
↓
Replace category controls
↓
Show:
✓ Saved
↓
Show success toast
```

Toast:

```text
Saved to Linux
```

Tweet tetap berada di halaman X Bookmarks.

---

# 37. Save Success — Auto Unbookmark ON

Setting:

```text
unbookmarkAfterSave = true
```

Flow:

```text
Backend returns 201
↓
Add Tweet ID to cache
↓
Trigger native X unbookmark action
↓
Verify bookmark state changed
```

Success toast:

```text
Saved to Linux
```

Tweet kemungkinan akan hilang dari bookmark timeline setelah X memperbarui DOM.

---

# 38. Unbookmark Verification

Extension tidak cukup hanya melakukan `.click()`.

Setelah triggering native X bookmark control, extension harus memastikan state berubah.

Verification dapat menggunakan perubahan DOM/state dari bookmark button.

Jika berhasil:

```text
complete
```

Jika gagal:

```text
CSV remains saved
index remains saved
tweet remains marked Saved
```

Show warning:

```text
Saved to Linux, but failed to remove from X bookmarks
```

Jangan rollback CSV.

---

# 39. Backend Unavailable

Jika backend tidak berjalan:

```text
POST localhost
→ connection failure
```

Extension harus:

- tidak unbookmark;
- mengembalikan category buttons ke usable state;
- menampilkan error toast.

Example:

```text
Backend unavailable
```

Tidak perlu retry otomatis.

User dapat menjalankan server dan mencoba kembali.

---

# 40. Extraction Failure

Jika metadata penting tidak dapat dibaca dari DOM:

```text
url
author
username
tweet_date
```

extension tidak boleh mengirim partial record.

Display:

```text
Could not read tweet data
```

Tweet tetap bookmarked.

`text` adalah satu-satunya field yang boleh kosong.

---

# 41. Duplicate Interaction

Jika backend mengembalikan:

```text
409
```

extension:

```text
add tweet ID to local saved cache
replace controls with ✓ Saved
show optional informational toast
```

Example:

```text
Already saved
```

Jangan unbookmark tweet.

---

# 42. Toast System

Extension membutuhkan lightweight toast UI pada halaman X.

States:

```text
Success
Error
Warning
Info
```

Examples:

```text
Saved to Linux

Backend unavailable

Could not save tweet

Saved to Linux, but failed to remove from X bookmarks

Already saved
```

Toast harus hilang otomatis setelah beberapa detik.

Tidak diperlukan notification API OS.

---

# 43. Extension Popup

Klik icon extension membuka popup.

Tidak membuka full-tab settings page.

Suggested structure:

```text
Twitter Bookmarker
────────────────────────

Backend
● Connected

Categories

● AI                  ≡
● Linux               ≡
● Design              ≡

[ + Add category ]

────────────────────────

Unbookmark after save
[ ON / OFF ]

Category display
[ Popover / Inline ]
```

---

# 44. Backend Status

Setiap popup dibuka:

```text
GET /health
```

State:

```text
● Connected
```

atau:

```text
● Disconnected
```

Tidak perlu auto-start backend.

Tidak perlu button untuk menjalankan executable.

Optional:

```text
Retry
```

button diperbolehkan.

---

# 45. Add Category

User memilih:

```text
+ Add category
```

Input:

```text
Name
Color
```

On save:

1. generate ID;
2. generate filename;
3. assign order terakhir;
4. persist ke `chrome.storage.local`.

Tidak ada backend call.

---

# 46. Rename Category

User dapat mengganti:

```text
name
```

Rename juga menghitung filename baru.

Example:

```text
Linux
linux.csv
```

menjadi:

```text
Linux Stuff
linux-stuff.csv
```

Tidak ada filesystem rename.

Tidak ada backend request.

---

# 47. Change Category Color

User dapat mengganti warna category.

Warna hanya mempengaruhi extension UI.

Tidak mempengaruhi CSV.

Tidak perlu menyimpan warna ke backend/index.

---

# 48. Delete Category

User dapat menghapus category dari extension popup.

Recommended confirmation:

```text
Delete category "Linux"?

Existing CSV data will not be deleted.
```

Delete hanya mengubah `chrome.storage.local`.

---

# 49. Reorder Categories

Popup mendukung drag-and-drop.

Example:

```text
Linux
AI
Design
```

menjadi:

```text
AI
Design
Linux
```

Update `order`.

Perubahan harus langsung tercermin pada:

```text
popup order
popover order
inline button order
```

Content script harus merespons perubahan storage tanpa reload browser jika memungkinkan.

---

# 50. Settings

## `unbookmarkAfterSave`

Type:

```text
boolean
```

Recommended default:

```text
false
```

---

## `displayMode`

Possible:

```text
popover
inline
```

Recommended default:

```text
popover
```

---

## `backendMode`

Possible:

```text
localhost
custom
```

Recommended default:

```text
localhost
```

`localhost` selalu memakai alamat loopback default (`http://127.0.0.1:43121`).

---

## `backendUrl`

Type:

```text
string
```

Base URL yang dipakai saat `backendMode` = `custom`. Boleh host dengan port
(`192.168.1.10:8080`) atau URL lengkap dengan base path
(`https://server.example/tw-bookmarker`). Skema yang diterima hanya `http` dan
`https`; kalau skema tidak ditulis, dianggap `http`. Trailing slash, query, dan
fragment dibuang saat disimpan. Nilai yang tidak valid diabaikan dan jatuh ke
alamat loopback default.

Recommended default:

```text
http://127.0.0.1:43121
```

---

## `backendToken`

Type:

```text
string
```

Bearer token yang dikirim sebagai `Authorization: Bearer <token>` pada setiap
request ke backend, dipakai saat `backendMode` = `custom`. Isinya sama dengan
`TWITTER_BOOKMARKER_TOKEN` di sisi server. Diperlukan ketika target bukan
loopback — LAN, atau URL publik lewat tunnel: backend menantang peer non-loopback
dan extension tidak bisa menjawab dialog Basic bawaan browser, sedangkan patch
HP/token bisa.

Saat `backendMode` = `localhost` nilai ini diabaikan, karena request dari mesin
ini memang tidak pernah ditantang. String kosong berarti tidak ada header
`Authorization` yang dikirim. Nilai disimpan setelah di-trim, dan prefix
`Bearer ` yang ikut ter-paste dibuang; selain itu tidak divalidasi, karena hanya
server yang bisa menilainya (token yang salah muncul sebagai status
Disconnected, bukan sebagai error saat menyimpan).

Recommended default:

```text
(empty)
```

---

# 51. Extension Storage Change Propagation

Content script harus mendengarkan:

```text
chrome.storage.onChanged
```

Jika categories/settings berubah:

- injected controls berikutnya menggunakan config baru;
- existing visible controls sebaiknya di-render ulang.

Tidak perlu reload tab manual.

---

# 52. Security Requirements

> **Amended (mobile ingest).** Loopback remains the default and the rule for
> everything on this machine. A phone on the same network cannot reach
> `127.0.0.1`, so the listener can now be moved with
> `TWITTER_BOOKMARKER_ADDR` — and that is refused at startup unless
> `TWITTER_BOOKMARKER_TOKEN` is also set, with `Authorization: Bearer <token>`
> then required from every non-loopback peer. `0.0.0.0` is no longer forbidden
> outright, but it is no longer silent either: it cannot be reached without the
> token. See `README.md` → "Where the server listens".

Backend wajib bind hanya ke:

```text
127.0.0.1
```

Jangan:

```text
0.0.0.0
```

Tidak boleh expose server ke LAN secara default.

Extension hanya boleh mengirim data ke base URL yang dikonfigurasi user di
popup: alamat loopback default, atau `backendUrl` saat `backendMode` = `custom`
(§50), dengan `backendToken` sebagai kredensialnya saat target itu bukan
loopback. Karena targetnya bisa berubah, `host_permissions` extension memuat
`http://*/*` dan `https://*/*`; tidak ada request ke host lain yang pernah
dilakukan, dan user adalah satu-satunya pihak yang bisa mengubah targetnya.

Backend harus menolak arbitrary path.

Client hanya mengirim filename.

Server sendiri yang join filename dengan:

```text
~/.twitter-bookmarker/
```

Input filename tidak boleh mengandung:

```text
/
\
..
~
```

No shell commands should be constructed using request values.

CSV writing harus menggunakan native Go file APIs.

---

# 53. Chrome Permissions

Extension harus meminta hanya permissions yang diperlukan.

Expected concepts:

```text
storage
x.com access
localhost backend access
```

Tidak perlu permission yang tidak digunakan seperti:

```text
history
downloads
bookmarks
geolocation
notifications
```

Backend HTTP request sebaiknya dilakukan dari extension service worker.

---

# 54. Performance Requirements

Page X Bookmarks menggunakan infinite scroll dan banyak DOM mutation.

Implementation tidak boleh:

- scan seluruh document pada setiap mutation;
- membuat observer per tweet;
- melakukan GET index untuk setiap tweet;
- melakukan backend request hanya untuk menentukan saved state setiap row.

Index harus diambil sekali ketika memasuki Bookmarks page.

Saved lookup harus:

```text
O(1)
```

menggunakan:

```text
Set<TweetID>
```

---

# 55. Backend Performance

Expected workload kecil dan personal.

Tidak diperlukan database.

Target architecture:

```text
single Go process
in-memory index
CSV persistence
global write mutex
```

Tidak perlu:

```text
PostgreSQL
SQLite
Redis
queue
workers
Docker
Kubernetes
```

---

# 56. Logging

Backend harus mempunyai minimal structured/readable logging untuk:

```text
startup
storage directory
server address
index rebuild
save success
duplicate
invalid request
filesystem errors
index persistence warning
```

Jangan log full tweet text by default.

Example startup:

```text
Twitter Bookmarker server
Listening: 127.0.0.1:43121
Storage: /home/user/.twitter-bookmarker
Indexed tweets: 842
```

---

# 57. Startup Behavior

Running:

```bash
twitter-bookmarker-server
```

harus:

```text
resolve home directory
↓
create ~/.twitter-bookmarker if missing
↓
load/rebuild index
↓
start HTTP server
```

Jika storage directory tidak dapat dibuat:

```text
exit with clear error
```

Jika port sudah digunakan:

```text
exit with clear error
```

---

# 58. Graceful Shutdown

Backend harus menangani normal process termination.

Contoh:

```text
Ctrl+C
```

Server ditutup secara clean.

Karena CSV ditulis synchronously per request, tidak boleh ada pending in-memory bookmark yang belum dipersist.

---

# 59. Recommended Repository Structure

```text
twitter-bookmarker/
│
├── extension/
│   ├── manifest.json
│   ├── package.json
│   ├── src/
│   │   ├── background/
│   │   ├── content/
│   │   ├── popup/
│   │   └── shared/
│   └── dist/
│
├── backend/
│   ├── go.mod
│   ├── cmd/
│   │   └── server/
│   │       └── main.go
│   └── internal/
│       ├── api/
│       ├── storage/
│       ├── index/
│       └── model/
│
├── README.md
└── Makefile
```

Agent boleh menyesuaikan struktur internal selama separation of concerns tetap jelas.

---

# 60. Primary User Flow

User menjalankan:

```bash
twitter-bookmarker-server
```

Kemudian membuka:

```text
https://x.com/i/bookmarks
```

Extension:

```text
detect bookmarks route
↓
load categories/settings
↓
fetch saved index
↓
observe tweets
↓
inject organizer UI
```

User melihat tweet.

Popover mode:

```text
[Organize]
```

User klik.

```text
AI
Linux
Design
```

User memilih:

```text
Linux
```

Extension:

```text
Saving...
```

Backend:

```text
linux.csv append
index update
```

Extension menerima success.

Jika auto-unbookmark OFF:

```text
✓ Saved
```

Jika auto-unbookmark ON:

```text
trigger X unbookmark
```

---

# 61. First-Run Flow

Pada fresh install:

```text
categories = []
```

User membuka extension popup.

Backend status ditampilkan.

User membuat:

```text
Linux
AI
Design
```

Categories disimpan di Chrome.

Tidak diperlukan onboarding wizard.

Tidak diperlukan account creation.

---

# 62. Empty Category State

Jika tidak ada kategori, extension tidak perlu menampilkan category organizer pada tweets.

Popup tetap menampilkan:

```text
No categories yet

[+ Add category]
```

---

# 63. CSV Example

`linux.csv`:

```csv
url,media,author,username,tweet_date,saved_at,text
https://x.com/foo/status/123,"[""https://pbs.twimg.com/media/AAA.jpg""]",Foo Bar,@foo,2026-09-27T01:00:00Z,2026-09-27T03:00:00Z,"Testing Linux today"
https://x.com/bar/status/456,[],"Foo, Bar 🐧",@bar,2026-09-26T14:21:00Z,2026-09-27T03:02:00Z,"Line one

Line two"
```

CSV writer harus menangani:

```text
commas
quotes
emoji
unicode
newlines
```

secara otomatis.

---

# 64. Important Edge Cases

Implementation harus menangani:

### Tweet already saved

Display:

```text
✓ Saved
```

### Tweet saved in category that no longer exists

Tetap:

```text
✓ Saved
```

### Category renamed

Old CSV untouched.

New bookmarks use new filename.

### Category deleted

CSV untouched.

Index entries untouched.

### Backend stopped

No unbookmark.

### Backend stops during save

No assumption of success unless valid success response diterima.

### CSV contains comma/newline/emoji

Must remain valid CSV.

### Media-only tweet

Save with empty text.

### Quoted tweet

Save main text only.

### Double-click category

Only one request.

### Tweet DOM re-render

No duplicate injected controls.

### Infinite scrolling

New tweet rows receive controls.

### User navigates away from Bookmarks

Do not organize unrelated timelines.

### User returns to Bookmarks via SPA navigation

Injection functionality resumes.

---

# 65. Acceptance Criteria — Backend

Backend dianggap selesai ketika:

1. executable Go dapat dijalankan manual;
2. server bind hanya ke loopback;
3. folder `~/.twitter-bookmarker/` otomatis dibuat;
4. `GET /health` bekerja;
5. `GET /v1/index` bekerja;
6. `POST /v1/bookmarks` membuat CSV bila belum ada;
7. header CSV hanya dibuat satu kali;
8. subsequent saves append row;
9. URL dinormalisasi;
10. Tweet ID diekstrak;
11. `saved_at` menggunakan UTC;
12. duplicate global ditolak dengan `409`;
13. duplicate detection berlaku lintas semua CSV;
14. index dapat direbuild dari CSV;
15. malformed index tidak merusak data;
16. Unicode/newline/comma valid di CSV;
17. filename traversal ditolak;
18. concurrent duplicate request tidak membuat row ganda;
19. CSV success tidak di-rollback hanya karena derived index persistence gagal;
20. backend tidak menyimpan extension settings/categories.

---

# 66. Acceptance Criteria — Extension Popup

Popup dianggap selesai ketika:

1. backend connection status terlihat;
2. user dapat add category;
3. user dapat rename category;
4. rename mengubah filename config;
5. rename tidak menyentuh old CSV;
6. user dapat delete category;
7. delete tidak melakukan backend filesystem action;
8. user dapat memilih warna category;
9. user dapat drag reorder;
10. order tersimpan;
11. user dapat toggle auto-unbookmark;
12. user dapat memilih Popover/Inline;
13. seluruh settings tersimpan di `chrome.storage.local`;
14. popup tidak membutuhkan full-page settings UI.

---

# 67. Acceptance Criteria — X Integration

Integration dianggap selesai ketika:

1. organizer hanya aktif di `/i/bookmarks`;
2. setiap bookmark tweet mendapatkan organizer UI;
3. infinite-loaded tweets juga mendapatkan UI;
4. UI tidak terinject dua kali;
5. Popover mode bekerja;
6. Inline mode bekerja;
7. order category sesuai settings;
8. color category terlihat;
9. klik category men-disable controls selama saving;
10. tweet metadata diekstrak dengan benar;
11. quoted text tidak ikut;
12. media-only tweet tetap dapat disimpan;
13. saved tweet langsung berubah menjadi `✓ Saved`;
14. previously saved tweets ditandai ketika page dibuka;
15. duplicate tidak disimpan kembali;
16. backend failure tidak menghapus bookmark X;
17. auto-unbookmark hanya berjalan setelah `201`;
18. failed X unbookmark tidak rollback CSV;
19. toast success/error/warning bekerja;
20. SPA navigation tidak menghasilkan broken state.

---

# 68. Test Scenarios

Minimum manual/integration test set:

### Normal save

```text
Tweet → Linux → linux.csv receives one row
```

### Second save same tweet

```text
Tweet → AI → 409 → no ai.csv row
```

### Backend offline

```text
Click Linux → error → tweet remains bookmarked
```

### Auto-unbookmark enabled

```text
CSV success → X bookmark removed
```

### Auto-unbookmark fails

```text
CSV remains → warning shown
```

### Rename category

```text
Linux → Linux Stuff
```

Existing:

```text
linux.csv
```

remains.

Next save creates/appends:

```text
linux-stuff.csv
```

### Delete category

Existing CSV remains untouched.

### Browser reload

Previously saved tweet displays:

```text
✓ Saved
```

### Backend restart without index.json

Backend rebuilds index from CSV.

### Corrupt index.json

Backend rebuilds index from CSV.

### Multiline tweet

CSV remains parseable.

### Emoji author

CSV remains UTF-8 valid.

### Quoted tweet

Only parent text saved.

### Image-only tweet

Row created with empty `text`.

---

# 69. Implementation Priority

Recommended build order:

## Phase 1 — Go persistence layer

Implement:

```text
storage directory
CSV writer
URL normalization
tweet ID
duplicate index
index rebuild
HTTP API
```

Complete backend tests before X integration.

---

## Phase 2 — Extension settings

Implement:

```text
chrome.storage.local
popup
category CRUD
colors
drag order
display mode
auto-unbookmark setting
health status
```

---

## Phase 3 — X DOM integration

Implement:

```text
route detection
MutationObserver
tweet detection
metadata extraction
popover UI
inline UI
saved marker
```

---

## Phase 4 — Save integration

Implement:

```text
content → service worker messaging
service worker → backend HTTP
loading state
success/error state
toast
index cache
```

---

## Phase 5 — Auto unbookmark

Implement only after storage path is reliable.

Flow must preserve invariant:

```text
Never unbookmark before CSV success.
```

---

## Phase 6 — Hardening

Cover:

```text
SPA navigation
DOM replacement
duplicate race
quoted tweets
multiline text
backend downtime
index recovery
```

---

# 70. Definition of Done

MVP dianggap selesai ketika user dapat:

```text
1. Start Go backend manually

2. Open X Bookmarks

3. Open extension popup

4. Create categories:
   AI
   Linux
   Design

5. Choose Popover or Inline

6. Click Linux on a bookmarked tweet

7. See the tweet metadata appear in:
   ~/.twitter-bookmarker/linux.csv

8. Reload X Bookmarks

9. See the same tweet marked:
   ✓ Saved

10. Attempting another category does not duplicate it

11. Enable auto-unbookmark

12. Save another tweet

13. Confirm CSV is written first

14. Confirm tweet is then removed from X Bookmarks
```

No dashboard, database, cloud infrastructure, authentication, or additional product surface is required for MVP.

---

# 71. Final Engineering Constraints

The implementation agent should prioritize simplicity.

Preferred system:

```text
Chrome Extension
+
Small Go localhost server
+
CSV
+
Derived JSON index
```

Avoid introducing infrastructure that does not directly satisfy the requirements.

Most important invariants:

```text
CSV is the durable source of truth.

One Tweet Status ID may only exist once globally.

Backend never owns extension category configuration.

Rename never renames old CSV files.

Delete never deletes CSV files.

Never unbookmark before CSV persistence succeeds.

A failed X unbookmark never rolls back saved CSV data.

Previously saved tweets must be identifiable before user clicks them.
```
