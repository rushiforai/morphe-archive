package com.dmoniak.patches.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_HUNGRY_SHARK_WORLD = Compatibility(
        packageName = "com.ubisoft.hungrysharkworld",
        name = "Hungry Shark World",
        description = "Hungry Shark World by Ubisoft Entertainment / FGOL",
        appIconColor = 0x0088CC,
        targets = listOf(AppTarget("8.1.6"))
    )

    val COMPATIBILITY_HUNGRY_SHARK_EVOLUTION = Compatibility(
        packageName = "com.fgol.HungrySharkEvolution",
        name = "Hungry Shark Evolution",
        description = "Hungry Shark Evolution by Ubisoft Entertainment / FGOL",
        appIconColor = 0x0077AA
    )

    val COMPATIBILITY_HUNGRY_SHARK_HEROES = Compatibility(
        packageName = "com.ubisoft.hungrysharkheroes",
        name = "Hungry Shark Heroes",
        description = "Hungry Shark Heroes by Ubisoft Entertainment / FGOL",
        appIconColor = 0x005588
    )

    val COMPATIBILITY_COINSNAP = Compatibility(
        packageName = "com.coinidentifyer.ai",
        name = "CoinSnap",
        description = "CoinSnap: Coin Identifier by Glority Global Group",
        appIconColor = 0xF5A623,
        targets = listOf(AppTarget("2.10.2", isExperimental = true))
    )

    val COMPATIBILITY_SHADOW_FIGHT_2 = Compatibility(
        packageName = "com.nekki.shadowfight",
        name = "Shadow Fight 2",
        description = "Shadow Fight 2 by NEKKI",
        appIconColor = 0xE65100
    )

    val COMPATIBILITY_SHADOW_FIGHT_2_SE = Compatibility(
        packageName = "com.nekki.shadowfight2.specialedition",
        name = "Shadow Fight 2 Special Edition",
        description = "Shadow Fight 2 Special Edition by NEKKI",
        appIconColor = 0xD84315
    )

    val COMPATIBILITY_SHADOW_FIGHT_3 = Compatibility(
        packageName = "com.nekki.shadowfight3",
        name = "Shadow Fight 3",
        description = "Shadow Fight 3 by NEKKI / Banzai Games",
        appIconColor = 0xC2185B
    )

    val COMPATIBILITY_SHADOW_FIGHT_SHADES = Compatibility(
        packageName = "com.nekki.shadowfight.shades",
        name = "Shades: Shadow Fight Roguelike",
        description = "Shades: Shadow Fight Roguelike by NEKKI",
        appIconColor = 0x7B1FA2
    )

    val COMPATIBILITY_SHADOW_FIGHT_4 = Compatibility(
        packageName = "com.nekki.shadowfightarena",
        name = "Shadow Fight 4: Arena",
        description = "Shadow Fight 4: Arena by NEKKI / Banzai Games",
        appIconColor = 0x1976D2
    )

    val COMPATIBILITY_BEACH_BUGGY_RACING = Compatibility(
        packageName = "com.vectorunit.cobalt.googleplay",
        name = "Beach Buggy Racing",
        description = "Beach Buggy Racing by Vector Unit",
        appIconColor = 0xFF5722
    )

    val COMPATIBILITY_ROBBERY_BOB = Compatibility(
        packageName = "com.chillingo.robberybobfree.android.row",
        name = "Robbery Bob",
        description = "Robbery Bob - Sneaky Sneak by Chillingo / Deca Games",
        appIconColor = 0x4CAF50
    )

    val COMPATIBILITY_VECTOR_2 = Compatibility(
        packageName = "com.nekki.vector2",
        name = "Vector 2",
        description = "Vector 2 by NEKKI",
        appIconColor = 0x00E5FF
    )

    val COMPATIBILITY_SPOTIFY = Compatibility(
        packageName = "com.spotify.music",
        name = "Spotify",
        description = "Spotify: Music and Podcasts by Spotify AB",
        appIconColor = 0x1DB954,
        targets = listOf(AppTarget("9.1.84.2231", isExperimental = true))
    )

    val COMPATIBILITY_DUOLINGO = Compatibility(
        packageName = "com.duolingo",
        name = "Duolingo",
        description = "Duolingo: Language Lessons by Duolingo",
        appIconColor = 0x58CC02
    )

    val COMPATIBILITY_WAZE = Compatibility(
        packageName = "com.waze",
        name = "Waze",
        description = "Waze Navigation & Live Traffic by Waze / Google",
        appIconColor = 0x33CCFF
    )

    val COMPATIBILITY_SOUNDCLOUD = Compatibility(
        packageName = "com.soundcloud.android",
        name = "SoundCloud",
        description = "SoundCloud: Play Music & Songs by SoundCloud Global Limited & Co KG",
        appIconColor = 0xFF5500
    )

    val COMPATIBILITY_PINTEREST = Compatibility(
        packageName = "com.pinterest",
        name = "Pinterest",
        description = "Pinterest: Discover and Save Creative Ideas by Pinterest",
        appIconColor = 0xE60023
    )

    val COMPATIBILITY_SHAZAM = Compatibility(
        packageName = "com.shazam.android",
        name = "Shazam",
        description = "Shazam: Identify & Discover Music by Apple Inc. / Shazam",
        appIconColor = 0x0088FF
    )

    val COMPATIBILITY_STRAVA = Compatibility(
        packageName = "com.strava",
        name = "Strava",
        description = "Strava: Run, Ride, Hike & Train by Strava Inc.",
        appIconColor = 0xFC4C02
    )

    val COMPATIBILITY_TRUECALLER = Compatibility(
        packageName = "com.truecaller",
        name = "Truecaller",
        description = "Truecaller: Caller ID & Block Spam by Truecaller",
        appIconColor = 0x0087FF
    )

    val COMPATIBILITY_MX_PLAYER = Compatibility(
        packageName = "com.mxtech.videoplayer.ad",
        name = "MX Player",
        description = "MX Player: Video Player & Streaming by MX Media / Time Internet",
        appIconColor = 0x0078FF
    )

    val COMPATIBILITY_HILL_CLIMB = Compatibility(
        packageName = "com.fingersoft.hillclimb",
        name = "Hill Climb Racing",
        description = "Hill Climb Racing by Fingersoft",
        appIconColor = 0xD32F2F
    )

    val COMPATIBILITY_JETPACK_JOYRIDE = Compatibility(
        packageName = "com.halfbrick.jetpackjoyride",
        name = "Jetpack Joyride",
        description = "Jetpack Joyride by Halfbrick Studios",
        appIconColor = 0xFF9800
    )

    val COMPATIBILITY_ALTOS_ADVENTURE = Compatibility(
        packageName = "com.noodlecake.altosadventure",
        name = "Alto's Adventure",
        description = "Alto's Adventure by Noodlecake / Team Alto",
        appIconColor = 0x2E7D32
    )

    val COMPATIBILITY_SPEEDTEST = Compatibility(
        packageName = "org.zwanoo.android.speedtest",
        name = "Speedtest",
        description = "Speedtest by Ookla by Ookla LLC",
        appIconColor = 0x141526
    )

    val COMPATIBILITY_PROTON_VPN = Compatibility(
        packageName = "ch.protonvpn.android",
        name = "Proton VPN",
        description = "Proton VPN: Fast & Secure by Proton AG",
        appIconColor = 0x6D4AFF
    )

    val COMPATIBILITY_TURBO_VPN = Compatibility(
        packageName = "free.vpn.unblock.proxy.turbovpn",
        name = "Turbo VPN",
        description = "Turbo VPN - Secure VPN Proxy by Innovative Connecting",
        appIconColor = 0xFF6D00
    )

    val COMPATIBILITY_WINDSCRIBE = Compatibility(
        packageName = "com.windscribe.vpn",
        name = "Windscribe",
        description = "Windscribe VPN by Windscribe Security",
        appIconColor = 0x152238
    )

    val COMPATIBILITY_PROTON_MAIL = Compatibility(
        packageName = "ch.protonmail.android",
        name = "Proton Mail",
        description = "Proton Mail: Encrypted Email by Proton AG",
        appIconColor = 0x6D4AFF
    )

    val COMPATIBILITY_PROTON_PASS = Compatibility(
        packageName = "proton.android.pass",
        name = "Proton Pass",
        description = "Proton Pass: Password Manager by Proton AG",
        appIconColor = 0x6D4AFF
    )

    val COMPATIBILITY_TUTA_MAIL = Compatibility(
        packageName = "de.tutao.tutanota",
        name = "Tuta Mail",
        description = "Tuta Mail: Secure & Private Email by Tutao GmbH",
        appIconColor = 0xC70000
    )

    val COMPATIBILITY_GOOGLE_PHONE = Compatibility(
        packageName = "com.google.android.dialer",
        name = "Phone by Google",
        description = "Phone by Google: Caller ID & Spam Protection by Google LLC",
        appIconColor = 0x1A73E8,
        targets = listOf(AppTarget("161.0.726587057", isExperimental = true))
    )

    val COMPATIBILITY_GOOGLE_MAPS = Compatibility(
        packageName = "com.google.android.apps.maps",
        name = "Google Maps",
        description = "Google Maps: Navigate & Explore by Google LLC",
        appIconColor = 0x34A853
    )

    val COMPATIBILITY_GOOGLE_PHOTOS = Compatibility(
        packageName = "com.google.android.apps.photos",
        name = "Google Photos",
        description = "Google Photos: Photo & Video Storage by Google LLC",
        appIconColor = 0xEA4335
    )

    val COMPATIBILITY_CHATGPT = Compatibility(
        packageName = "com.openai.chatgpt",
        name = "ChatGPT",
        description = "ChatGPT: The official AI assistant by OpenAI",
        appIconColor = 0x10A37F
    )

    val COMPATIBILITY_PERPLEXITY = Compatibility(
        packageName = "ai.perplexity.app.android",
        name = "Perplexity",
        description = "Perplexity: Where Knowledge Begins by Perplexity AI",
        appIconColor = 0x20B2AA
    )

    val COMPATIBILITY_GEMINI = Compatibility(
        packageName = "com.google.android.apps.bard",
        name = "Google Gemini",
        description = "Google Gemini: Your AI Assistant by Google LLC",
        appIconColor = 0x4285F4
    )

    val COMPATIBILITY_TELEGRAM = Compatibility(
        packageName = "org.telegram.messenger",
        name = "Telegram",
        description = "Telegram Messenger by Telegram FZ-LLC",
        appIconColor = 0x24A1DE
    )

    val COMPATIBILITY_SIGNAL = Compatibility(
        packageName = "org.thoughtcrime.securesms",
        name = "Signal",
        description = "Signal Private Messenger by Signal Foundation",
        appIconColor = 0x3A76F0
    )

    val COMPATIBILITY_SESSION = Compatibility(
        packageName = "network.loki.messenger",
        name = "Session",
        description = "Session: Private Messenger by Oxen Privacy Tech / The Session Foundation",
        appIconColor = 0x00E599
    )

    val COMPATIBILITY_SIMPLEX = Compatibility(
        packageName = "chat.simplex.app",
        name = "SimpleX Chat",
        description = "SimpleX Chat: Private Messenger with No User IDs by SimpleX Chat Ltd",
        appIconColor = 0x7E3FF2
    )

    val COMPATIBILITY_SNAPCHAT = Compatibility(
        packageName = "com.snapchat.android",
        name = "Snapchat",
        description = "Snapchat by Snap Inc",
        appIconColor = 0xFFFC00
    )

    val COMPATIBILITY_MEGA = Compatibility(
        packageName = "mega.privacy.android.app",
        name = "MEGA",
        description = "MEGA: Cloud Storage & Chat by Mega Ltd",
        appIconColor = 0xD9272E
    )

    val COMPATIBILITY_TERABOX = Compatibility(
        packageName = "com.dubox.drive",
        name = "TeraBox",
        description = "TeraBox: Cloud Storage Space by Flextech Inc.",
        appIconColor = 0x0084FF
    )

    val COMPATIBILITY_PROTON_DRIVE = Compatibility(
        packageName = "me.proton.android.drive",
        name = "Proton Drive",
        description = "Proton Drive: Cloud Storage by Proton AG",
        appIconColor = 0x6D4AFF
    )

    val COMPATIBILITY_NEXTCLOUD = Compatibility(
        packageName = "org.nextcloud.client",
        name = "Nextcloud",
        description = "Nextcloud: Open source file sync and share by Nextcloud",
        appIconColor = 0x0082C9
    )

    val COMPATIBILITY_CANVA = Compatibility(
        packageName = "com.canva.editor",
        name = "Canva",
        description = "Canva: Design, Photo & Video by Canva",
        appIconColor = 0x00C4CC
    )

    val COMPATIBILITY_GOOGLE_DRIVE = Compatibility(
        packageName = "com.google.android.apps.docs",
        name = "Google Drive",
        description = "Google Drive: Free Cloud Storage by Google LLC",
        appIconColor = 0x1FA463
    )

    val COMPATIBILITY_MOVIX = Compatibility(
        packageName = "com.movix.app",
        name = "Movix",
        description = "Movix: Movies & Series Streaming",
        appIconColor = 0xE50914,
        targets = listOf(AppTarget("1.4.8"))
    )

    val COMPATIBILITY_BRAVE = Compatibility(
        packageName = "com.brave.browser",
        name = "Brave Browser",
        description = "Brave Browser: Fast, AdBlocker & Private Web Browser by Brave Software",
        appIconColor = 0xFB542B
    )

    val COMPATIBILITY_FIREFOX = Compatibility(
        packageName = "org.mozilla.firefox",
        name = "Firefox",
        description = "Firefox: Fast, Private & Safe Web Browser by Mozilla",
        appIconColor = 0xFF7139
    )

    val COMPATIBILITY_TWITCH = Compatibility(
        packageName = "tv.twitch.android.app",
        name = "Twitch",
        description = "Twitch: Live Game Streaming & Esports by Twitch Interactive",
        appIconColor = 0x9146FF
    )

    val COMPATIBILITY_VLC = Compatibility(
        packageName = "org.videolan.vlc",
        name = "VLC",
        description = "VLC for Android: Fast, Open-Source Media Player by VideoLAN",
        appIconColor = 0xFF8800
    )

    val COMPATIBILITY_SUBWAY_SURFERS = Compatibility(
        packageName = "com.kiloo.subwaysurf",
        name = "Subway Surfers",
        description = "Subway Surfers by SYBO Games / Kiloo",
        appIconColor = 0x00D26A
    )

    val COMPATIBILITY_TEMPLE_RUN_2 = Compatibility(
        packageName = "com.imangi.templerun2",
        name = "Temple Run 2",
        description = "Temple Run 2 by Imangi Studios",
        appIconColor = 0x00A859
    )

    val COMPATIBILITY_PLANTS_VS_ZOMBIES = Compatibility(
        packageName = "com.ea.game.pvzfree_row",
        name = "Plants vs. Zombies",
        description = "Plants vs. Zombies FREE by Electronic Arts / PopCap",
        appIconColor = 0x8BC34A
    )

    val COMPATIBILITY_CUT_THE_ROPE = Compatibility(
        packageName = "com.zeptolab.ctr.ads",
        name = "Cut the Rope",
        description = "Cut the Rope by ZeptoLab",
        appIconColor = 0x7CB342
    )

    val COMPATIBILITY_FRUIT_NINJA = Compatibility(
        packageName = "com.halfbrick.fruitninja",
        name = "Fruit Ninja",
        description = "Fruit Ninja by Halfbrick Studios",
        appIconColor = 0xE53935
    )

    val COMPATIBILITY_CROSSY_ROAD = Compatibility(
        packageName = "com.yodo1.crossyroad",
        name = "Crossy Road",
        description = "Crossy Road by Hipster Whale",
        appIconColor = 0x3F51B5
    )

    val COMPATIBILITY_GEOMETRY_DASH = Compatibility(
        packageName = "com.robtopx.geometryjump",
        name = "Geometry Dash",
        description = "Geometry Dash by RobTop Games",
        appIconColor = 0xFFEB3B
    )

    val COMPATIBILITY_DOODLE_JUMP = Compatibility(
        packageName = "com.lima.doodlejump",
        name = "Doodle Jump",
        description = "Doodle Jump by Lima Sky LLC",
        appIconColor = 0xCDDC39
    )

    val COMPATIBILITY_ANGRY_BIRDS = Compatibility(
        packageName = "com.rovio.baba",
        name = "Angry Birds Classic",
        description = "Angry Birds Classic by Rovio Entertainment",
        appIconColor = 0xD32F2F
    )

    val COMPATIBILITY_DAN_THE_MAN = Compatibility(
        packageName = "com.halfbrick.dantheman",
        name = "Dan The Man",
        description = "Dan The Man: Action Platformer by Halfbrick Studios",
        appIconColor = 0xF57C00
    )

    val COMPATIBILITY_STELLARIUM = Compatibility(
        packageName = "com.noctuasoftware.stellarium_free",
        name = "Stellarium Mobile",
        description = "Stellarium Mobile: Star Map Planetarium by Noctua Software",
        appIconColor = 0x1A237E
    )

    val COMPATIBILITY_STELLARIUM_ALT = Compatibility(
        packageName = "com.noctuasoftware.stellarium",
        name = "Stellarium Mobile (Alt)",
        description = "Stellarium Mobile: Star Map by Noctua Software",
        appIconColor = 0x1A237E
    )

    val COMPATIBILITY_WORLD_MAP_QUIZ = Compatibility(
        packageName = "com.qbis.guessthecountry",
        name = "World Map Quiz",
        description = "World Map Quiz: Geography & Capitals by Qbis Studio",
        appIconColor = 0x2E7D32
    )

    val COMPATIBILITY_PHOTOMATH = Compatibility(
        packageName = "com.microblink.photomath",
        name = "Photomath",
        description = "Photomath: Camera Calculator & Math Solver by Google LLC",
        appIconColor = 0xD32F2F
    )

    val COMPATIBILITY_MEMRISE = Compatibility(
        packageName = "com.memrise.android.memrisecompanion",
        name = "Memrise",
        description = "Memrise: Language Learning & Native Speaker Practice by Memrise",
        appIconColor = 0xFFA000
    )

    val COMPATIBILITY_PEAK = Compatibility(
        packageName = "com.brainbow.peak.app",
        name = "Peak",
        description = "Peak: Brain Games & Cognitive Training by Brainbow",
        appIconColor = 0x00ACC1
    )

    val COMPATIBILITY_CAMSCANNER = Compatibility(
        packageName = "com.intsig.camscanner",
        name = "CamScanner",
        description = "CamScanner: PDF Scanner & Document OCR by INTSIG",
        appIconColor = 0x009688
    )

    val COMPATIBILITY_FLIGHTRADAR24 = Compatibility(
        packageName = "com.flightradar24free",
        name = "Flightradar24",
        description = "Flightradar24: Live Flight Tracker & Radar by Flightradar24 AB",
        appIconColor = 0xFBC02D
    )

    val COMPATIBILITY_PICTURETHIS = Compatibility(
        packageName = "cn.danatech.xingseus",
        name = "PictureThis",
        description = "PictureThis: Plant & Flower Identifier by Glority Global Group",
        appIconColor = 0x4CAF50
    )

    val COMPATIBILITY_ALLTRAILS = Compatibility(
        packageName = "com.alltrails.alltrails",
        name = "AllTrails",
        description = "AllTrails: Hike, Bike & Run Outdoor GPS Navigation by AllTrails",
        appIconColor = 0x388E3C
    )

    val COMPATIBILITY_WINDY = Compatibility(
        packageName = "com.windyty.android",
        name = "Windy.com",
        description = "Windy.com: Weather & Wind Radar Forecast by Windyty SE",
        appIconColor = 0x0288D1
    )

    val COMPATIBILITY_VPN_LAT = Compatibility(
        packageName = "com.vpn.lat",
        name = "VPN.lat",
        description = "VPN.lat: Unlimited Fast VPN Proxy",
        appIconColor = 0x2979FF
    )

    val COMPATIBILITY_HIDEME = Compatibility(
        packageName = "hideme.android.vpn",
        name = "hide.me VPN",
        description = "hide.me VPN: The Privacy Guard by eVenture Limited",
        appIconColor = 0x00A3E0,
        targets = listOf(AppTarget("6.1.2", isExperimental = true))
    )

    val COMPATIBILITY_CLAUDE = Compatibility(
        packageName = "com.anthropic.claude",
        name = "Claude",
        description = "Claude: AI Assistant by Anthropic",
        appIconColor = 0xD97706
    )

    val COMPATIBILITY_EURIA = Compatibility(
        packageName = "com.infomaniak.euria",
        name = "Euria",
        description = "Euria: Sovereign AI Assistant by Infomaniak",
        appIconColor = 0x4F46E5
    )

    val COMPATIBILITY_BITWARDEN = Compatibility(
        packageName = "com.x8bit.bitwarden",
        name = "Bitwarden",
        description = "Bitwarden: Password Manager & Authenticator by Bitwarden Inc.",
        appIconColor = 0x175DDC
    )

    val COMPATIBILITY_DEEPL = Compatibility(
        packageName = "com.deepl.mobile.android",
        name = "DeepL",
        description = "DeepL Translate: Accurate Multilingual Translator by DeepL SE",
        appIconColor = 0x0F2B46
    )

    val COMPATIBILITY_SILT = Compatibility(
        packageName = "com.snapbreak.silt",
        name = "Silt",
        description = "Silt: Oceanic Puzzle-Adventure by Snapbreak / Spiral Circus",
        appIconColor = 0x1A2B3C
    )

    val COMPATIBILITY_MOISES = Compatibility(
        packageName = "ai.moises",
        name = "Moises",
        description = "Moises: The Musician's App by Moises Systems Inc. (v2.7.2 recommandée - versions 2.73+ protégées par Google Play PairIP)",
        appIconColor = 0x6C5CE7,
        targets = listOf(AppTarget("2.7.2"))
    )

    // Aliases
    val COMPATIBILITY_ANGRY_BIRDS_CLASSIC = COMPATIBILITY_ANGRY_BIRDS
    val COMPATIBILITY_HIDE_ME = COMPATIBILITY_HIDEME
    val COMPATIBILITY_PICTURE_THIS = COMPATIBILITY_PICTURETHIS
}


