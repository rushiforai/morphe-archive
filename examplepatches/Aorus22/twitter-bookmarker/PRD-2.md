# Product Requirements Document
## Twitter Bookmarker — Phase 2: Local Web Gallery

**Status:** Ready for design & implementation  
**Repository:** `Aorus22/twitter-bookmarker`  
**Phase:** 2  
**Target user:** Personal / single-user  
**Frontend:** Vite + React + TypeScript + shadcn/ui  
**Backend:** Existing Go backend  
**Storage:** Existing CSV files under `~/.twitter-bookmarker/`  
**Deployment:** Localhost only

---

# 1. Product Summary

Phase 2 menambahkan **local web gallery** ke Twitter Bookmarker.

Data bookmark yang sebelumnya dikumpulkan oleh Chrome Extension dan disimpan ke CSV akan dapat dilihat melalui antarmuka web berbentuk media gallery.

Setiap file CSV diperlakukan sebagai satu logical collection/folder.

Contoh:

```text
~/.twitter-bookmarker/
├── ai.csv
├── linux.csv
├── design.csv
└── index.json
```

akan ditampilkan sebagai:

```text
Gallery

AI
Linux
Design
```

Ketika collection dibuka, user melihat kumpulan tweet dalam **Pinterest-style masonry layout**, termasuk:

- media tweet;
- text tweet;
- author;
- username;
- tanggal tweet;
- tanggal bookmark;
- link kembali ke tweet asli.

Gallery juga mendukung:

- search;
- filter tanggal tweet;
- filter tanggal bookmark;
- quick date filters;
- sorting;
- infinite scroll;
- image lightbox.

Gallery juga mendukung **curation** dari arsip lokal:

- menghapus bookmark (soft delete — baris dipindah ke tabel `deleted_bookmarks`, bukan dimusnahkan);
- memindahkan bookmark ke folder lain yang sudah ada.

Web **bukan lagi read-only viewer secara keseluruhan**, tetapi batasnya tegas dan
tidak boleh kabur:

```text
/api/gallery/*  read-only, GET-only — tidak ada satu pun route yang mengubah data
/v1/bookmarks   tempat seluruh mutasi berada
```

Extension tetap bertanggung jawab mengumpulkan bookmark **dan** memiliki nama folder.
Web tidak pernah membuat folder baru: memindahkan bookmark ke slug yang tidak dikenal
ditolak dengan `404`, bukan dengan membuat folder baru.

Backend Go tetap bertanggung jawab membaca data lokal dan menyediakan API.

---

# 2. Existing System Baseline

Phase 2 harus dibangun di atas implementasi yang sudah ada.

Current repository structure:

```text
twitter-bookmarker/
├── backend/
├── extension/
├── docs/
├── Makefile
├── PRD.md
└── README.md
```

Phase 2 menambahkan:

```text
web/
```

sehingga struktur menjadi:

```text
twitter-bookmarker/
├── backend/
├── extension/
├── web/
├── docs/
├── Makefile
├── PRD.md
└── README.md
```

---

# 3. Existing CSV Schema

Backend saat ini menggunakan schema:

```csv
url,media,author,username,tweet_date,saved_at,text
```

Field `media` merupakan JSON array yang disimpan sebagai CSV field.

Contoh logical value:

```json
[
  "https://pbs.twimg.com/media/example1.jpg",
  "https://pbs.twimg.com/media/example2.jpg"
]
```

Tweet tanpa media:

```json
[]
```

Backend dan extension saat ini sudah melakukan media normalization.

Phase 2 tidak boleh memperkenalkan schema CSV baru kecuali benar-benar diperlukan.

Gallery harus membaca schema yang sudah ada.

---

# 4. Goals

Phase 2 harus memungkinkan user:

1. Melihat semua collection/folder.
2. Melihat summary setiap collection.
3. Membuka collection tertentu.
4. Melihat tweet dalam Pinterest-style gallery.
5. Tetap melihat tweet yang tidak mempunyai media.
6. Melihat seluruh gambar yang tersimpan pada tweet.
7. Melihat metadata tweet.
8. Membuka tweet asli di X.
9. Search berdasarkan text atau author.
10. Filter berdasarkan tanggal tweet.
11. Filter berdasarkan tanggal bookmark.
12. Menggunakan kedua date filter bersamaan.
13. Menggunakan quick date filter.
14. Mengubah urutan sorting.
15. Menjelajahi data besar melalui infinite scroll.
16. Membuka media dalam lightbox.
17. Melihat data terbaru tanpa restart backend.
18. Menghapus bookmark dari gallery (soft delete — baris dipindahkan ke tabel
    `deleted_bookmarks`, tetap dapat dipulihkan lewat resep SQL terdokumentasi).
19. Memindahkan bookmark ke folder lain yang sudah ada.
20. Menggunakan web melalui satu Go backend pada production.

---

# 5. Non-Goals

Phase 2 tidak mencakup:

- category management;
- renaming collection;
- syncing category names dari extension;
- authentication;
- account system;
- cloud hosting;
- multi-user support;
- cloud storage;
- downloading media;
- local media archiving;
- media proxy;
- video playback;
- editing tweet metadata;
- AI tagging;
- AI search;
- recommendation system;
- bookmark notes;
- adding bookmark dari gallery (menyimpan tweet baru tetap hanya lewat extension);
- modifying X bookmarks (mengubah tweet di X — curation di bawah hanya menyentuh
  arsip lokal, bukan platformnya);
- websocket/live streaming updates.

Gallery API bersifat:

```text
read-only
```

Dua hal di daftar lama sudah tidak berlaku dan dihapus dari non-goals: **database
migration** (arsip kini memang satu file SQLite, lihat §6) dan **larangan
delete/move**. Yang tetap berlaku adalah batasnya: seluruh mutasi berada di
`/v1/bookmarks`, dan `/api/gallery/*` tetap GET-only.

---

# 6. Core Product Principle

`tw-bookmarker.db` (SQLite) adalah durable source of truth.

Arsip adalah **satu file** di direktori `$TWITTER_BOOKMARKER_DIR`. Tidak ada CSV di
jalur baca maupun tulis: CSV lama sudah dipindah ke `backup/` oleh skrip migrasi
satu kali, dan backend tidak mengetahuinya sama sekali.

Flow:

```text
Chrome Extension
      ↓
Go Backend  ──  POST  /v1/bookmarks            (menyimpan)
      ↓         DELETE/PUT /v1/bookmarks/{id}  (curation)
tw-bookmarker.db (SQLite, journal_mode=DELETE)
      ↓
Gallery Read API  (/api/gallery/*, GET-only)
      ↓
React Web Gallery
```

Web tidak membaca filesystem secara langsung.

Semua akses data melalui Go backend.

---

# 7. Collection Definition

Satu baris di tabel `collections` dipandang sebagai satu gallery collection.

```sql
CREATE TABLE collections (
  id         INTEGER PRIMARY KEY,
  slug       TEXT NOT NULL UNIQUE,
  name       TEXT NOT NULL,
  created_at TEXT NOT NULL
);
```

`slug` adalah public key-nya (dipakai di URL gallery: `/collections/<slug>`), dan
`name` adalah display name-nya. Keduanya berasal dari nama folder yang dibuat
extension, bukan dari nama file.

Contoh:

```text
folder linux        → slug linux        → name "Linux"
folder ai-and-llm   → slug ai-and-llm   → name "AI And LLM"
```

Display name disimpan, bukan diturunkan ulang dari slug, supaya pemisahan kata
(`ai-and-llm` → `AI And LLM`) tidak perlu ditebak berkali-kali.

Satu folder = satu collection. Karena `slug` yang UNIQUE, mengganti nama sebuah
folder berarti membuat collection baru — tidak pernah menomori ulang
`collection_id` yang sudah ada, sehingga tidak ada baris bookmark yang ditulis ulang.

Collection tanpa media tetap tampil (lihat §88).

Backend tidak mencoba mencocokkan collection dengan category configuration extension.

---

# 8. Historical Category Behavior

Jika extension sebelumnya mempunyai:

```text
linux.csv
```

kemudian category di-rename sehingga bookmark berikutnya masuk:

```text
linux-stuff.csv
```

gallery memperlakukan keduanya sebagai dua collection berbeda:

```text
Linux
Linux Stuff
```

Tidak ada automatic merge.

CSV adalah authority.

---

# 9. Collection Without Media

Collection yang tidak mempunyai media tetap harus muncul.

Contoh:

```text
Research
27 posts
0 media
```

Cover menggunakan placeholder visual.

Collection tidak boleh disembunyikan hanya karena `media_count === 0`.

---

# 10. High-Level Architecture

## Development

```text
Browser
   ↓
Vite dev server
http://localhost:5173
   │
   ├── React application
   │
   └── /api/*
          ↓ Vite proxy
       Go backend
       http://127.0.0.1:43121
```

Frontend tidak menggunakan CORS pada development karena API requests dibuat ke relative URL:

```text
/api/...
```

dan Vite melakukan proxy.

---

# 11. Production Architecture

Production menggunakan satu Go process.

```text
Browser
   ↓
http://127.0.0.1:43121
   │
   ├── /
   │    └── web/dist
   │
   ├── /api/*
   │    └── Gallery API
   │
   ├── /v1/*
   │    └── Existing extension API
   │
   └── /health
```

Backend Go bertanggung jawab:

```text
serve gallery API
+
serve web/dist
```

Tidak diperlukan Vite runtime pada production.

---

# 12. Existing API Compatibility

Existing extension endpoints tidak boleh mengalami breaking changes.

Current endpoints tetap:

```text
GET  /health
GET  /v1/index
POST /v1/bookmarks
```

Gallery API ditambahkan secara terpisah:

```text
/api/gallery/*
```

Extension tidak perlu dimigrasikan menggunakan Gallery API.

---

# 13. Frontend Stack

Required:

```text
Vite
React
TypeScript
shadcn/ui
```

Preferred package manager:

```text
pnpm
```

Project harus dibuat menggunakan **official shadcn CLI**, bukan membuat konfigurasi shadcn secara manual.

Preferred command:

```bash
pnpm dlx shadcn@latest init -t vite -n web
```

shadcn CLI saat ini secara resmi mendukung template Vite dan opsi `--name` untuk membuat project baru.

Jika CLI behavior berubah saat implementasi, agent harus mengikuti dokumentasi resmi shadcn terkini, tetapi hasil akhirnya tetap harus berada dalam:

```text
web/
```

---

# 14. Suggested Frontend Dependencies

Gunakan shadcn components sebisa mungkin.

Likely components:

```text
Button
Card
Dialog
Popover
Sheet
Calendar / Date Picker
Input
Select
Badge
Skeleton
Separator
Dropdown Menu
Tooltip
Scroll Area
```

React Router direkomendasikan untuk routing.

Tidak perlu full frontend framework selain React.

TanStack Query boleh digunakan untuk request/cache/infinite query jika agent menilai membantu, tetapi bukan requirement wajib.

---

# 15. Frontend Routes

Required routes:

```text
/
```

Gallery homepage.

```text
/collections/:filename
```

Collection detail.

Optional internal route/state untuk lightbox tidak wajib mempunyai URL sendiri.

---

# 16. Gallery Homepage

Homepage menampilkan semua CSV sebagai collection card.

Example:

```text
Twitter Bookmarker
Your saved collections

┌────────────────────────┐
│ image │ image          │
│───────┼────────────────│
│ image │ image          │
│                        │
│ Linux                  │
│ 83 posts · 126 media   │
│ Last saved Sep 27      │
└────────────────────────┘
```

Required card information:

```text
cover collage
collection name
post count
media count
last bookmarked date
```

Click pada card membuka collection.

---

# 17. Collection Cover

Cover menggunakan maksimal:

```text
4 media
```

terbaru berdasarkan:

```text
saved_at DESC
```

Layout default:

```text
2 × 2 collage
```

Jika media:

```text
4+
```

gunakan empat terbaru.

Jika:

```text
3
```

layout harus tetap visually balanced.

Jika:

```text
1
```

gunakan satu image cover.

Jika:

```text
0
```

gunakan placeholder collection.

Jangan mengambil avatar sebagai cover.

---

# 18. Collection Detail Page

Header:

```text
← Gallery

Linux
83 posts · 126 media

[ Search... ]   [ Filter ]   [ Sort ]
```

Content menggunakan Pinterest-style masonry.

Default sorting:

```text
Newest Bookmarked
```

---

# 19. Gallery Item Unit

Primary gallery unit adalah:

```text
tweet/post
```

bukan image.

Tweet dengan empat image tetap merupakan satu card.

Contoh:

```text
┌──────────────────────────────┐
│       IMAGE 1               │
│──────────────┬───────────────│
│ IMAGE 2      │ IMAGE 3       │
│──────────────┴───────────────│
│       IMAGE 4               │
│                              │
│ Author                       │
│ @username                    │
│ Tweet text...                │
│                              │
│ Posted Sep 20                │
│ Saved Sep 27                 │
│                              │
│ Open on X ↗                  │
└──────────────────────────────┘
```

---

# 20. Multi-Media Posts

Semua media dalam tweet harus dapat dilihat.

Default card behavior:

- satu media → single image;
- dua media → split grid;
- tiga media → adaptive 2/1 grid;
- empat atau lebih → compact media grid.

Tidak hanya menampilkan image pertama.

Maximum media mengikuti data CSV saat ini.

---

# 21. Pinterest Masonry

Collection detail menggunakan masonry layout.

Desktop target:

```text
4–5 columns
```

Medium:

```text
2–3 columns
```

Small:

```text
1 column
```

Card height mengikuti natural content/media aspect ratio.

Card tidak harus mempunyai uniform height.

Pinterest feel lebih penting daripada table/grid symmetry.

---

# 22. Text-Only Tweets

Tweet dengan:

```json
"media": []
```

tetap tampil.

Text-only card harus dibuat compact.

Example:

```text
┌──────────────────────┐
│ Foo Bar              │
│ @foobar              │
│                      │
│ Interesting thread   │
│ about Linux...       │
│                      │
│ Posted Sep 20        │
│ Saved Sep 27         │
│                      │
│ Open on X ↗          │
└──────────────────────┘
```

Tidak perlu artificial image placeholder pada setiap text-only tweet.

---

# 23. Post Card Metadata

Card harus menyediakan:

```text
author
username
tweet text
tweet date
bookmark date
Open on X
```

Tweet text tidak perlu dipotong secara agresif.

Untuk text yang sangat panjang boleh menggunakan controlled clamp dan:

```text
Show more
```

jika dibutuhkan.

---

# 24. Open on X

Button/link:

```text
Open on X
```

membuka original:

```text
url
```

dalam new tab.

Use:

```text
target="_blank"
rel="noopener noreferrer"
```

---

# 25. Image Rendering

Media URL digunakan langsung dari:

```text
https://pbs.twimg.com/
```

Tidak ada:

```text
Go image proxy
local image download
media cache
```

MVP bergantung pada remote media URL yang sudah tersimpan.

Images harus:

```text
lazy loaded
```

menggunakan browser-native lazy loading bila sesuai.

---

# 26. Image Lightbox

Click pada media membuka lightbox.

Default design:

```text
┌─────────────────────────────────────────────┐
│                                             │
│              LARGE IMAGE                    │
│                                             │
│                                             │
├───────────────────────────────┬─────────────┤
│ prev / next                   │ Post info   │
│                               │ @username   │
│                               │ text        │
│                               │ dates       │
│                               │ Open on X   │
└───────────────────────────────┴─────────────┘
```

Desktop menggunakan large media area + metadata panel.

Mobile metadata dapat berada di bawah image.

---

# 27. Lightbox Navigation

User harus dapat:

```text
next image
previous image
```

di dalam tweet yang sama.

Setelah media terakhir pada tweet, navigation boleh berpindah ke media tweet berikutnya dalam loaded gallery dataset.

Keyboard:

```text
Escape → close
Left Arrow → previous
Right Arrow → next
```

harus didukung.

---

# 28. Search

Collection detail mempunyai search.

Search mencakup:

```text
text
author
username
```

Search bersifat case-insensitive.

Example:

```text
linux
```

dapat match:

```text
"Linux desktop..."
```

Example:

```text
@foobar
```

dapat match username.

Frontend melakukan debounce sekitar:

```text
300 ms
```

Tidak perlu tombol Submit.

Search dilakukan server-side.

---

# 29. Date Filters

Dua date filter independen tersedia:

## Tweet date

Based on:

```text
tweet_date
```

## Bookmarked date

Based on:

```text
saved_at
```

Keduanya dapat aktif secara bersamaan.

Example:

```text
Tweet Date:
2026-01-01 → 2026-09-01

Bookmarked Date:
2026-09-20 → 2026-09-27
```

hasil harus memenuhi kedua filter.

---

# 30. Filter UX

Default interaction:

```text
[ Filter ]
```

membuka popover pada desktop.

Mobile dapat menggunakan Sheet/Drawer.

Filter content:

```text
Tweet Date
From
To

Bookmarked Date
From
To

Quick Range

[ Reset ]
[ Apply ]
```

---

# 31. Quick Date Filters

Required presets:

```text
Today
Last 7 Days
Last 30 Days
This Year
```

Preset default diterapkan ke:

```text
Bookmarked Date
```

karena gallery secara utama merepresentasikan kapan bookmark dikumpulkan.

User tetap dapat mengubah kedua date ranges secara manual.

---

# 32. Date Semantics

CSV timestamps tetap UTC/RFC3339.

Frontend menampilkan tanggal dalam timezone browser/local machine.

Ketika user memilih date range lokal:

```text
2026-09-27
```

frontend mengubah start/end boundary menjadi RFC3339 UTC sebelum dikirim ke backend.

Backend tidak membuat asumsi timezone user.

Date ranges bersifat inclusive.

---

# 33. Sorting

Supported sort modes:

```text
Newest Bookmarked
Oldest Bookmarked
Newest Posted
Oldest Posted
```

API values:

```text
saved_desc
saved_asc
tweet_desc
tweet_asc
```

Default:

```text
saved_desc
```

---

# 34. Infinite Scroll

Tidak ada numbered pagination.

Tidak ada Load More button sebagai primary flow.

Gallery menggunakan:

```text
infinite scroll
```

Recommended page size:

```text
30 posts
```

Maximum API limit:

```text
100
```

Use:

```text
IntersectionObserver
```

untuk meminta next page saat user mendekati akhir gallery.

---

# 35. Loading UX

Initial collection loading:

```text
masonry skeleton cards
```

Infinite loading:

```text
small loader at bottom
```

Jangan blank page selama fetch.

---

# 36. Backend Gallery API

Add:

```text
GET /api/gallery/collections
```

dan:

```text
GET /api/gallery/collections/{filename}/posts
```

Backend existing `/v1/*` tetap tidak berubah.

---

# 37. GET `/api/gallery/collections`

Purpose:

mengambil semua collection.

Response example:

```json
{
  "collections": [
    {
      "filename": "linux.csv",
      "name": "Linux",
      "post_count": 83,
      "media_count": 126,
      "last_saved_at": "2026-09-27T10:20:30Z",
      "cover_media": [
        "https://pbs.twimg.com/media/a.jpg",
        "https://pbs.twimg.com/media/b.jpg",
        "https://pbs.twimg.com/media/c.jpg",
        "https://pbs.twimg.com/media/d.jpg"
      ]
    }
  ]
}
```

---

# 38. Collection Ordering

Homepage default ordering:

```text
last_saved_at DESC
```

Collection dengan aktivitas terbaru muncul pertama.

Collection kosong atau tanpa valid timestamp berada setelah collection yang mempunyai data.

---

# 39. Collection Summary Calculation

Untuk setiap valid CSV:

Backend menghitung:

```text
post_count
```

jumlah row bookmark.

```text
media_count
```

total semua item dari JSON `media`.

```text
last_saved_at
```

maximum `saved_at`.

```text
cover_media
```

empat media terbaru berdasarkan bookmark timestamp.

Backend membaca kondisi CSV terbaru ketika endpoint dipanggil.

Tidak menggunakan stale persistent cache sebagai source.

---

# 40. GET Collection Posts

Endpoint:

```text
GET /api/gallery/collections/{filename}/posts
```

Supported query parameters:

```text
cursor
limit

q

tweet_from
tweet_to

saved_from
saved_to

sort
```

Example:

```text
/api/gallery/collections/linux.csv/posts
  ?limit=30
  &sort=saved_desc
  &q=wayland
  &saved_from=2026-09-01T00:00:00Z
  &saved_to=2026-09-30T23:59:59Z
```

---

# 41. Collection Posts Response

Example:

```json
{
  "items": [
    {
      "tweet_id": "123456789",
      "url": "https://x.com/foo/status/123456789",
      "media": [
        "https://pbs.twimg.com/media/example.jpg"
      ],
      "author": "Foo Bar",
      "username": "@foo",
      "tweet_date": "2026-09-20T10:00:00Z",
      "saved_at": "2026-09-27T10:30:00Z",
      "text": "Example tweet"
    }
  ],
  "next_cursor": "opaque-cursor",
  "has_more": true
}
```

If end reached:

```json
{
  "items": [],
  "next_cursor": null,
  "has_more": false
}
```

---

# 42. Tweet ID

Gallery backend mendapatkan:

```text
tweet_id
```

dari canonical tweet URL.

CSV tidak perlu ditambah kolom tweet ID.

Parsing menggunakan mekanisme URL normalization/extraction yang sudah dimiliki backend bila memungkinkan.

---

# 43. Cursor Pagination

Cursor harus:

```text
opaque to frontend
```

Frontend tidak boleh bergantung pada isi internal cursor.

Cursor harus mencakup enough ordering information untuk melanjutkan berdasarkan:

```text
selected sort timestamp
+
tweet ID tie-breaker
```

Contoh internal conceptual value:

```text
saved_at + tweet_id
```

Tetapi encoding merupakan implementation detail.

Jangan menggunakan numeric page offsets sebagai public API pagination contract.

---

# 44. Stable Infinite Pagination

Jika bookmark baru ditambahkan ketika user sedang scroll:

page berikutnya tidak boleh menyebabkan obvious repeated rows.

Cursor harus berdasarkan sort key, bukan sekadar array index.

Slight dataset drift akibat file append dapat diterima untuk personal MVP, tetapi duplicate items dalam satu browsing session harus diminimalkan.

Frontend juga boleh dedupe berdasarkan:

```text
tweet_id
```

sebagai defensive measure.

---

# 45. Search Semantics

Backend search menggunakan normalized lowercase substring matching terhadap:

```text
author
username
text
```

No fuzzy search required.

No full-text index required.

No regex from client.

Query whitespace harus di-trim.

Empty search sama dengan no search.

---

# 46. Filter Semantics

Filter order:

```text
read CSV
↓
parse rows
↓
apply search
↓
apply tweet date
↓
apply saved date
↓
sort
↓
cursor paginate
```

Semua filters harus diaplikasikan sebelum pagination.

---

# 47. Latest Data Requirement

User tidak perlu restart backend setelah bookmark baru ditambahkan.

Each Gallery API request harus membaca current CSV state.

MVP tidak memerlukan websocket.

Frontend melakukan refetch ketika:

- collection route dibuka;
- user refresh;
- filter berubah;
- sorting berubah;
- search berubah;
- window kembali focus setelah berada di background.

Homepage juga refetch pada window focus.

---

# 48. No Persistent Gallery Cache

Gallery API tidak boleh mempunyai cache yang membuat file terbaru tidak terlihat sampai server restart.

Allowed:

```text
request-scoped parsing
```

Potential future optimization:

```text
mtime-aware cache
```

tetapi tidak diperlukan Phase 2.

---

# 49. CSV Reading

Gunakan Go:

```text
encoding/csv
```

Jangan split string berdasarkan comma secara manual.

Backend harus menangani:

```text
commas
quoted fields
multiline text
unicode
emoji
JSON media field
```

---

# 50. Media Parsing

Column:

```text
media
```

diparse sebagai JSON string array.

Invalid media JSON pada satu row tidak boleh membuat seluruh server crash.

Recommended behavior:

```text
media = []
```

untuk malformed media field, sambil log warning.

Post masih dapat ditampilkan sebagai text card.

---

# 51. Malformed Rows

Satu malformed row tidak boleh membuat semua collection unavailable jika recovery memungkinkan.

Recommended:

```text
skip invalid row
log warning
continue parsing
```

Fields required untuk gallery item:

```text
url
author
username
tweet_date
saved_at
```

`text` dan `media` boleh empty.

---

# 52. Collection Filename Security

Gallery endpoint menerima filename dari URL.

Backend tidak boleh membiarkan path traversal.

Reject:

```text
../
/
\
~
```

Collection harus:

```text
valid *.csv
```

dan resolve hanya di:

```text
~/.twitter-bookmarker/
```

Reuse existing filename validation/SafeJoin logic jika sesuai.

---

# 53. Files Included as Collections

Hanya:

```text
*.csv
```

yang diproses.

Do not expose:

```text
index.json
backup files
temporary files
hidden files
```

Backup seperti:

```text
linux.csv.bak
```

bukan collection.

---

# 54. API Errors

Unknown collection:

```text
404
```

Invalid query:

```text
400
```

Filesystem/internal issue:

```text
500
```

Response format:

```json
{
  "status": "error",
  "reason": "..."
}
```

Tidak expose absolute home path atau sensitive filesystem information ke browser.

---

# 55. Development Vite Proxy

`web/vite.config.ts` harus proxy:

```text
/api
```

ke:

```text
http://127.0.0.1:43121
```

Conceptual configuration:

```text
/api/* → backend
```

Frontend code selalu request relative:

```text
/api/gallery/...
```

Jangan hardcode `localhost:43121` di React API client.

---

# 56. Production Static Serving

Go backend harus serve:

```text
web/dist
```

untuk frontend routes.

API routing harus mempunyai precedence atas static serving.

Meaning:

```text
/api/*
/v1/*
/health
```

tidak boleh masuk SPA fallback.

---

# 57. SPA Fallback

Unknown frontend routes seperti:

```text
/collections/linux.csv
```

harus serve:

```text
index.html
```

agar React Router tetap bekerja setelah browser refresh.

Unknown:

```text
/api/*
```

tidak boleh serve `index.html`.

Unknown API harus menjadi proper API 404.

---

# 58. Production Build Flow

Conceptual build:

```text
cd web
pnpm build
```

produces:

```text
web/dist/
```

Kemudian backend serve directory tersebut.

Root project Makefile sebaiknya mempunyai commands seperti:

```text
make web
make backend
make build
make dev-web
make dev-backend
```

Exact naming dapat disesuaikan dengan existing Makefile style.

---

# 59. Homepage Empty State

Jika belum ada CSV:

```text
No collections yet
```

Secondary message:

```text
Saved tweets will appear here after you organize them with the extension.
```

No error illustration required.

---

# 60. Empty Collection State

Jika CSV valid tetapi tidak mempunyai posts:

```text
This collection is empty
```

Jika current filters menghasilkan zero result:

```text
No posts match your filters
```

dengan:

```text
Clear filters
```

action.

---

# 61. Error UX

Backend unavailable pada development:

```text
Could not connect to Twitter Bookmarker backend
```

Gallery API error:

```text
Could not load this collection
```

Provide:

```text
Retry
```

Tidak perlu OS notifications.

---

# 62. Image Load Failure

Jika `pbs.twimg.com` media sudah unavailable:

card tidak boleh collapse/broken layout.

Show neutral image placeholder.

Tweet metadata dan `Open on X` harus tetap tersedia.

---

# 63. Visual Direction

Default design direction untuk Figma:

```text
clean
minimal
media-first
Pinterest-inspired
shadcn-native
not an X clone
```

UI harus terasa seperti personal visual library, bukan Twitter timeline.

---

# 64. Theme

Design assumption untuk Phase 2:

```text
system-aware theme
```

Support:

```text
light
dark
system
```

Default:

```text
system
```

Exact palette akan diputuskan saat Figma.

---

# 65. Navigation

Phase 2 tidak membutuhkan persistent sidebar.

Primary navigation:

Homepage:

```text
Twitter Bookmarker
```

Collection:

```text
← Gallery
```

Ini menjaga UI media-first dan sederhana.

Jika jumlah collection tumbuh jauh di masa depan, sidebar dapat menjadi future enhancement.

---

# 66. Responsive Requirements

Primary target:

```text
desktop
```

Tetapi UI harus usable di:

```text
tablet
mobile
```

Expected masonry:

```text
mobile: 1 column
tablet: 2 columns
desktop: 3–5 columns
```

Filter popover berubah menjadi Sheet/Drawer pada viewport sempit.

---

# 67. Accessibility

Required:

- keyboard reachable controls;
- visible focus states;
- semantic buttons/links;
- image `alt` fallback berdasarkan author/tweet context;
- Dialog/lightbox focus trap;
- Escape closes dialog;
- arrow navigation;
- adequate contrast;
- clickable image bukan satu-satunya cara melihat tweet URL.

---

# 68. Performance

Personal usage dapat mempunyai banyak bookmark.

Frontend tidak boleh load seluruh collection ke browser sekaligus.

Use:

```text
server-side filtering
server-side sorting
cursor pagination
infinite scroll
image lazy loading
```

Backend boleh scan entire selected CSV per request pada MVP.

Ini acceptable karena:

```text
local machine
single user
CSV-sized personal dataset
```

Jangan menambahkan database hanya untuk optimization Phase 2.

---

# 69. Homepage Performance

`GET /api/gallery/collections` perlu scan semua CSV.

Ini acceptable pada MVP.

Jika jumlah file/data kemudian membuat homepage lambat, mtime-aware summary cache dapat menjadi optimization berikutnya.

Tidak masuk Phase 2.

---

# 70. Security

> **Amended (mobile ingest).** The bind is still loopback by default and
> `0.0.0.0` is still what nobody should type by accident. It is now *possible* to
> move the listener elsewhere, because a phone on the same network cannot reach
> `127.0.0.1`, and that is gated: a non-loopback bind is refused at startup unless
> `TWITTER_BOOKMARKER_TOKEN` is set, and every request from a peer that is not
> loopback must then send `Authorization: Bearer <token>`. Loopback peers are
> exempt, so nothing on this machine changes. See `README.md` →
> "Where the server listens".

Backend tetap:

```text
127.0.0.1 only
```

No:

```text
0.0.0.0
```

No authentication dibutuhkan karena application sengaja local-only.

Gallery API (`/api/gallery/*`) harus read-only dan GET-only. Curation berada di
`/v1/bookmarks` — resource bookmark, bukan resource gallery — supaya jaminan ini
dipertahankan, bukan dilubangi. `scripts/check-gallery-acceptance.sh` menguji ulang
jaminan tersebut *setelah* curation berjalan: POST/PUT/DELETE pada path gallery tetap
`405`.

Tidak ada arbitrary filesystem endpoint.

Media URLs dirender hanya dari stored dataset.

---

# 71. Backend Modules

Recommended separation:

```text
backend/internal/gallery/
├── reader.go
├── collection.go
├── query.go
├── cursor.go
└── types.go
```

dan HTTP:

```text
backend/internal/api/
```

tetap menjadi transport layer.

Agent tidak wajib mengikuti nama persis ini, tetapi gallery parsing/query logic jangan ditumpuk seluruhnya dalam HTTP handlers.

---

# 72. Web Structure

Suggested:

```text
web/
├── src/
│   ├── app/
│   ├── components/
│   │   ├── gallery/
│   │   └── ui/
│   ├── pages/
│   │   ├── gallery-page.tsx
│   │   └── collection-page.tsx
│   ├── hooks/
│   ├── lib/
│   │   └── api/
│   ├── types/
│   └── main.tsx
├── public/
├── components.json
├── vite.config.ts
├── package.json
└── dist/
```

Exact structure may vary.

---

# 73. Recommended Components

Product-level components likely include:

```text
CollectionCard
CollectionCover
GalleryMasonry
PostCard
PostMediaGrid
TextPostCard
GalleryToolbar
SearchInput
FilterPopover
SortSelect
DateRangeFilter
MediaLightbox
InfiniteLoader
GalleryEmptyState
GalleryErrorState
```

---

# 74. API Types — Collection

Frontend conceptual type:

```ts
interface GalleryCollection {
  filename: string
  name: string
  post_count: number
  media_count: number
  last_saved_at: string | null
  cover_media: string[]
}
```

---

# 75. API Types — Gallery Post

Conceptual:

```ts
interface GalleryPost {
  tweet_id: string
  url: string
  media: string[]
  author: string
  username: string
  tweet_date: string
  saved_at: string
  text: string
}
```

---

# 76. URL State

Search/filter/sort sebaiknya disimpan dalam URL query parameters.

Example:

```text
/collections/linux.csv
?q=wayland
&sort=saved_desc
&saved_from=...
```

Benefit:

- refresh mempertahankan state;
- back/forward browser bekerja;
- link bisa dibookmark.

Cursor tidak perlu disimpan permanen dalam URL.

---

# 77. Scroll Behavior

Saat search/filter/sort berubah:

```text
clear current pages
reset cursor
scroll near top
fetch first page
```

Saat kembali dari lightbox:

```text
preserve gallery scroll position
```

sebisa mungkin.

---

# 78. Data Refresh

Gallery tidak melakukan aggressive polling.

Refresh behavior:

```text
route load
window focus
manual browser refresh
```

cukup.

Optional small refresh button tidak diperlukan.

---

# 79. Existing Extension Impact

Extension Phase 1 tidak memerlukan perubahan untuk basic Phase 2 karena saat ini sudah menyimpan:

```text
media
```

bersama bookmark.

Phase 2 implementation tidak boleh mengganggu:

```text
bookmark save
duplicate detection
auto-unbookmark
category configuration
```

---

# 80. Backend Acceptance Criteria

Backend Phase 2 dianggap selesai ketika:

1. existing `/health` tetap bekerja;
2. existing `/v1/index` tetap bekerja;
3. existing `/v1/bookmarks` tetap bekerja;
4. `GET /api/gallery/collections` tersedia;
5. seluruh valid CSV muncul sebagai collection;
6. collection tanpa media tetap muncul;
7. post count benar;
8. media count benar;
9. last saved date benar;
10. empat cover media terbaru dikembalikan;
11. collection posts endpoint tersedia;
12. media JSON diparse;
13. text-only tweets dikembalikan;
14. search bekerja;
15. kedua date filters bekerja;
16. kedua date filters dapat dikombinasikan;
17. sorting bekerja;
18. cursor pagination bekerja;
19. limit divalidasi;
20. path traversal ditolak;
21. malformed media tidak crash server;
22. data baru terlihat tanpa restart;
23. Gallery API (`/api/gallery/*`) read-only — POST/PUT/DELETE ditolak `405`, dan
    tetap ditolak setelah curation berjalan;
23a. `DELETE /v1/bookmarks/{tweet_id}` memindahkan baris ke `deleted_bookmarks` dan
     menjawab `{status, tweet_id, recoverable}`; tweet yang tidak tersimpan `404`,
     id tidak valid `400`;
23b. `PUT /v1/bookmarks/{tweet_id}/collection` memindahkan baris ke slug yang **sudah
     ada** dan menjawab `{status, tweet_id, slug}`; slug tidak dikenal `404` dan tidak
     membuat folder baru;
23c. setiap read path (`/v1/index`, listing koleksi, `post_count`, `media_count`)
     langsung konsisten setelah delete/move, tanpa restart;
23d. resep restore terdokumentasi (`INSERT … SELECT` dari `deleted_bookmarks`)
     mengembalikan baris tersebut, dan baris trash tetap disimpan sebagai jejak audit;
24. backend production serve `web/dist`;
25. React SPA routes bekerja setelah direct browser refresh.

---

# 81. Web Acceptance Criteria

Web dianggap selesai ketika:

1. dibuat dengan Vite + React + TypeScript;
2. shadcn setup dilakukan menggunakan official CLI;
3. homepage menampilkan collection per CSV;
4. card mempunyai cover collage;
5. card menampilkan post/media count;
6. card menampilkan last bookmarked date;
7. no-media collection mempunyai placeholder;
8. click card membuka collection;
9. collection menggunakan Pinterest-style masonry;
10. multi-image tweet menampilkan seluruh media;
11. text-only tweet terlihat;
12. author terlihat;
13. username terlihat;
14. text terlihat;
15. tweet date terlihat;
16. saved date terlihat;
17. Open on X bekerja;
18. image lightbox bekerja;
19. lightbox keyboard navigation bekerja;
20. search bekerja;
21. search debounce bekerja;
22. tweet date filter bekerja;
23. bookmarked date filter bekerja;
24. filter dapat digabung;
25. quick filters tersedia;
26. empat sorting modes tersedia;
27. default sorting adalah newest bookmarked;
28. infinite scroll bekerja;
29. loading skeleton tersedia;
30. empty states tersedia;
31. errors mempunyai Retry;
32. broken remote images tidak merusak card;
33. responsive layout bekerja;
34. dark/light system theme bekerja;
35. production tidak membutuhkan Vite process.

---

# 82. Integration Acceptance Test

Minimum scenario:

```text
1. Backend berjalan.

2. ~/.twitter-bookmarker mempunyai:
   ai.csv
   linux.csv
   design.csv

3. User membuka:
   http://127.0.0.1:43121

4. Homepage memperlihatkan:
   AI
   Linux
   Design

5. User membuka Linux.

6. Posts muncul dalam masonry.

7. Tweet dengan 4 images menampilkan 4 images.

8. Tweet tanpa image tetap tampil sebagai text card.

9. Search "wayland" memfilter result.

10. User memilih:
    Bookmark Date → Last 7 Days.

11. Results berubah.

12. User menambahkan Tweet Date filter juga.

13. Result memenuhi kedua ranges.

14. User mengganti sort ke Newest Posted.

15. Infinite scroll mengambil page berikutnya.

16. User klik image.

17. Lightbox terbuka.

18. User menekan Right Arrow.

19. Media berikutnya tampil.

20. User klik Open on X.

21. Original tweet dibuka.

22. Extension menyimpan tweet baru ke CSV.

23. User kembali ke gallery/window focus.

24. Data terbaru muncul tanpa restart backend.
```

---

# 83. Development Workflow

Recommended:

Terminal 1:

```bash
make dev-backend
```

Terminal 2:

```bash
cd web
pnpm dev
```

Browser:

```text
http://localhost:5173
```

Vite proxies:

```text
/api/* → 127.0.0.1:43121
```

Existing extension tetap hit backend secara langsung melalui existing `/v1/*`.

---

# 84. Production Workflow

Build frontend:

```bash
cd web
pnpm build
```

Result:

```text
web/dist
```

Build/run backend.

Open:

```text
http://127.0.0.1:43121
```

Backend serves:

```text
web/dist
```

dan Gallery API.

Tidak menjalankan:

```text
vite
```

di production.

---

# 85. Implementation Order

## Phase 2.1 — Gallery Read Layer

Implement:

```text
CSV reader
collection discovery
collection summary
media parsing
post model
filter
search
sorting
cursor pagination
```

---

## Phase 2.2 — Gallery HTTP API

Implement:

```text
GET collections
GET collection posts
query validation
error handling
```

Preserve existing APIs.

---

## Phase 2.3 — Web Scaffold

Create:

```text
web/
```

menggunakan official shadcn Vite initialization.

Set up:

```text
React
TypeScript
routing
theme
Vite proxy
API client
```

---

## Phase 2.4 — Homepage

Implement:

```text
collection cards
cover collage
counts
last saved
loading
empty
error
```

---

## Phase 2.5 — Collection Gallery

Implement:

```text
masonry
media grids
text-only cards
metadata
Open on X
```

---

## Phase 2.6 — Discovery Tools

Implement:

```text
search
date filters
quick presets
sorting
URL query state
```

---

## Phase 2.7 — Infinite Scroll

Implement:

```text
cursor API consumption
IntersectionObserver
page dedupe
loading state
```

---

## Phase 2.8 — Lightbox

Implement:

```text
Dialog
large image
metadata
prev/next
keyboard navigation
```

---

## Phase 2.9 — Production Serving

Implement:

```text
serve web/dist
SPA fallback
API/static routing separation
Makefile integration
```

---

## Phase 2.10 — Hardening

Cover:

```text
broken media
malformed media JSON
malformed rows
large CSV
SPA refresh
backend errors
window refetch
mobile responsiveness
accessibility
```

---

# 86. Design Deliverables Before Implementation

Figma phase berikutnya harus menghasilkan minimal:

```text
Gallery Homepage — Desktop
Gallery Homepage — Empty
Collection Gallery — Desktop
Collection Gallery — Text-only mixed with images
Filter Popover
Media Lightbox
Loading state
Error state
Mobile Collection Gallery
Dark Mode
```

Komponen Figma sebaiknya mengikuti shadcn primitives agar implementation mapping langsung.

---

# 87. Definition of Done

Phase 2 selesai ketika Twitter Bookmarker berubah dari:

```text
extension
→ CSV
```

menjadi:

```text
extension
→ CSV
→ local visual gallery
```

dengan workflow:

```text
Organize tweet on X
        ↓
CSV saved
        ↓
Open Gallery
        ↓
Choose collection
        ↓
Browse Pinterest-style posts
        ↓
Search / Filter / Sort
        ↓
Open media or original tweet
```

Tanpa:

```text
database
cloud
auth
additional background service
```

Production hanya membutuhkan:

```text
twitter-bookmarker-server
```

dan built:

```text
web/dist
```

---

# 88. Product Invariants

Agent harus menjaga invariants berikut:

```text
tw-bookmarker.db (SQLite) remains the source of truth.

The gallery API is read-only (GET-only under /api/gallery/*).

Curation lives on /v1/bookmarks, never under /api/gallery/*.

Deleting a bookmark moves its row into deleted_bookmarks; bookmarks always equals
the live set, so no read path needs a deleted filter.

A soft-deleted row is never destroyed; it stays recoverable by the documented
INSERT … SELECT recipe.

Moving a bookmark never creates a folder; the target slug must already exist.

One collection = one slug.

Collection names derive from the folder names the extension owns.

Collections without media remain visible.

Text-only posts remain visible.

Gallery never requires the Chrome extension to be open.

Gallery reads current database state without backend restart.

A version-1 database is upgraded in place by the first writable open.

Existing extension API contracts cannot break.

Development uses Vite proxy.

Production uses Go to serve web/dist.

React code never hardcodes the backend port.

Media is loaded directly from the stored pbs.twimg.com URL.

Search/filter/sort happen before pagination.

Infinite pagination uses an opaque cursor, not public page numbers.

No database is introduced for Phase 2.
```
