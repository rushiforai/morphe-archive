group = "app.morphe"

// Patches kept in the tree but excluded from the public bundle, so Morphe
// Manager never offers them to an unrooted user.
//
//   netflix  — mount-only, rooted devices only. A re-signed Netflix self-kills
//              via a native signature check, so it cannot be sideloaded; it
//              works only by bind-mounting the patched base.apk over a Play
//              install on a rooted device.
//   hallmark — unpatchable. The app ships Pairip's native anti-tamper VM and
//              crashes (SIGSEGV) on any re-signed or mounted build, so the
//              recovered patches do not produce a working app on any device.
//   moviebase/misc/LoadCommunityTabsPatch — dead. It unblocks the Activity and
//              Members tabs client-side, but the server rejects the requests
//              through Firebase App Check (Play Integrity), so the tabs still do
//              not load on a re-signed app. They work only on a rooted device
//              that mounts the patched base and runs Play Integrity Fix. The
//              rest of the Moviebase patches ship normally.
//
// The source stays for reference and future reworks; to build any of these,
// remove its entry here (or compile the package on its own).
sourceSets {
    named("main") {
        kotlin.exclude(
            "**/patches/netflix/**",
            "**/patches/hallmark/**",
            "**/patches/moviebase/misc/LoadCommunityTabsPatch.kt",
        )
    }
}

patches {
    about {
        name = "Mobile Morphe Patches"
        description = "Ad-blocking and anti-tracking patches for phone streaming apps"
        source = "https://github.com/semicoloncolonel/mobile-morphe-patches"
        author = "semicoloncolonel"
        contact = "https://github.com/semicoloncolonel"
        website = "https://github.com/semicoloncolonel/mobile-morphe-patches"
        license = "GPLv3"
    }
}

