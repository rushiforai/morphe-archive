.class public final enum Lsq2;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final d:Lrbe;

.field public static final synthetic e:[Lsq2;

.field public static final synthetic f:Lh58;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/util/Set;

.field public final c:Z


# direct methods
.method static constructor <clinit>()V
    .registers 70

    new-instance v0, Lsq2;

    const-string v1, "7bed004028bae3cb5805d10d1bf5ec0731e37a9410ec1ac959da50fa2fcad4c4"

    invoke-static {v1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v4

    const/4 v5, 0x1

    const-string v1, "ADBLOCK"

    const/4 v2, 0x0

    const-string v3, "org.adblockplus.browser"

    invoke-direct/range {v0 .. v5}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v1, Lsq2;

    const-string v2, "8bf5e94e770c6abe3fc91379c0d8cc3e604bc79cbc9f97ca8a0a1ee76615fdc9"

    invoke-static {v2}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v5

    const/4 v6, 0x1

    const-string v2, "AI_BROWSER"

    const/4 v3, 0x1

    const-string v4, "com.best.quick.browser"

    invoke-direct/range {v1 .. v6}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v2, Lsq2;

    const-string v3, "123688a47f71839165ff6044cd3be2168d1fa4cd283c8037612c0b0a20467701"

    invoke-static {v3}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v6

    const/4 v7, 0x1

    const-string v3, "ALOHA"

    const/4 v4, 0x2

    const-string v5, "com.aloha.browser"

    invoke-direct/range {v2 .. v7}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v3, Lsq2;

    const-string v4, "224026b8f2ceb72195466fbab56c789ddc3566318f184170b050a4387ae47a87"

    invoke-static {v4}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v7

    const/4 v8, 0x1

    const-string v4, "APUS"

    const/4 v5, 0x3

    const-string v6, "com.apusapps.browser"

    invoke-direct/range {v3 .. v8}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v4, Lsq2;

    const-string v5, "ba0887a3b42cd6cb5a807b6ba927528486e3ea73c7502d5699bf8227911021b5"

    invoke-static {v5}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v8

    const/4 v9, 0x1

    const-string v5, "ARC"

    const/4 v6, 0x4

    const-string v7, "company.thebrowser.arc"

    invoke-direct/range {v4 .. v9}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v5, Lsq2;

    const-string v6, "beaccd0e280ef40255d9391dcde6a6004928828fbb153910d3fa507d3e5b8c78"

    invoke-static {v6}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v9

    const/4 v10, 0x1

    const-string v6, "AVAST"

    const/4 v7, 0x5

    const-string v8, "com.avast.android.secure.browser"

    invoke-direct/range {v5 .. v10}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v6, Lsq2;

    const-string v7, "7f517f286ab030fcff2150b09f6266c90dfa0fa95e99ffe376b957594e3c0c94"

    invoke-static {v7}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v10

    const/4 v11, 0x1

    const-string v7, "AVG"

    const/4 v8, 0x6

    const-string v9, "com.avg.android.secure.browser"

    invoke-direct/range {v6 .. v11}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v7, Lsq2;

    const-string v13, "9c2db70513515fdbfbbc585b3edf3d7123d4dc67c94ffd306361c1d79bbf18ac"

    invoke-static {v13}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v11

    const/4 v12, 0x0

    const-string v8, "BRAVE"

    const/4 v9, 0x7

    const-string v10, "com.brave.browser"

    invoke-direct/range {v7 .. v12}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v9, Lsq2;

    invoke-static {v13}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v18

    const/16 v19, 0x0

    const-string v15, "BRAVE_BETA"

    const/16 v16, 0x8

    const-string v17, "com.brave.browser_beta"

    move-object v14, v9

    invoke-direct/range {v14 .. v19}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v10, Lsq2;

    const-string v8, "0000000000000000000000000000000000000000000000000000000000000000"

    invoke-static {v8}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v14

    const/4 v15, 0x1

    const-string v11, "BRAVE_NIGHTLY"

    const/16 v12, 0x9

    const-string v13, "com.brave.browser_nightly"

    invoke-direct/range {v10 .. v15}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v11, Lsq2;

    const-string v8, "f0fd6c5b410f25cb25c3b53346c8972fae30f8ee7411df910480ad6b2d60db83"

    invoke-static {v8}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v15

    const/16 v16, 0x0

    const-string v12, "CHROME"

    const/16 v13, 0xa

    const-string v14, "com.android.chrome"

    invoke-direct/range {v11 .. v16}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v12, Lsq2;

    const-string v8, "da633d34b69e63ae2103b49d53ce052fc5f7f3c53aab94fdc2a208bdfd14249c"

    const-string v13, "3d7a1223019aa39d9ea0e3436ab7c0896bfb4fb679f4de5fe7c23f326c8f994a"

    filled-new-array {v8, v13}, [Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v16

    const/16 v17, 0x0

    move-object v8, v13

    const-string v13, "CHROME_BETA"

    const/16 v14, 0xb

    const-string v15, "com.chrome.beta"

    invoke-direct/range {v12 .. v17}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v13, Lsq2;

    const-string v14, "2019dfa1fb23efbf70c5bcd1443c5beab04f3f2ff4366e9ac1e3457639a24cfc"

    filled-new-array {v14, v8}, [Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v17

    const/16 v18, 0x0

    const-string v14, "CHROME_CANARY"

    const/16 v15, 0xc

    const-string v16, "com.chrome.canary"

    invoke-direct/range {v13 .. v18}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v14, Lsq2;

    const-string v15, "9044ee5fee4bbc5e21dd44665431c4eb1f1f71a32716a0bc927bcbb39233cabf"

    filled-new-array {v15, v8}, [Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v18

    const-string v15, "CHROME_DEV"

    const/16 v16, 0xd

    const-string v17, "com.chrome.dev"

    invoke-direct/range {v14 .. v19}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v15, Lsq2;

    const-string v8, "f4fefeab2f921f96e7403a6a9fcb742f0deeedc8b37ccd6030488eb8b31a9aee"

    invoke-static {v8}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v19

    const/16 v20, 0x1

    const-string v16, "DOLPHIN"

    const/16 v17, 0xe

    const-string v18, "mobi.mgeek.TunnyBrowser"

    invoke-direct/range {v15 .. v20}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v16, Lsq2;

    const-string v8, "bb7bb31c573c46a1da7fc5c528a6acf432108456feec50810c7f33694eb3d2d4"

    invoke-static {v8}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v20

    const/16 v21, 0x1

    const-string v17, "DUCK_DUCK_GO"

    const/16 v18, 0xf

    const-string v19, "com.duckduckgo.mobile.android"

    invoke-direct/range {v16 .. v21}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v17, Lsq2;

    const-string v8, "90642f82f69c98a8916df03cf00483fab1c0f48fe913664bc30c005aeab19410"

    invoke-static {v8}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v21

    const/16 v22, 0x1

    const-string v18, "EASY_WEB"

    const/16 v19, 0x10

    const-string v20, "org.easyweb.browser"

    invoke-direct/range {v17 .. v22}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v18, Lsq2;

    const-string v8, "f522d5df0ab592168bdee6151413fd98022722f7f2f85efe72b81e28ddec765c"

    invoke-static {v8}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v22

    const/16 v23, 0x1

    const-string v19, "ECOSIA"

    const/16 v20, 0x11

    const-string v21, "com.ecosia.android"

    invoke-direct/range {v18 .. v23}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v19, Lsq2;

    const-string v8, "01e1999710a82c2749b4d50c445dc85d670b6136089d0a766a73827c82a1eac9"

    invoke-static {v8}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v23

    const/16 v24, 0x1

    const-string v20, "EDGE"

    const/16 v21, 0x12

    const-string v22, "com.microsoft.emmx"

    invoke-direct/range {v19 .. v24}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v20, Lsq2;

    const-string v8, "fa965fa9741406db3b0cb7641b54b0147e38872d23aae8adea02682d0ea006ae"

    invoke-static {v8}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v24

    const/16 v25, 0x1

    const-string v21, "EXPLORE_FAST"

    const/16 v22, 0x13

    const-string v23, "fast.explorer.web.browser"

    invoke-direct/range {v20 .. v25}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v21, Lsq2;

    const-string v8, "fe08ca3f9b0eb8be6b9eb7568dd51ad9e4e0be68568e58e442afd472c94ffbc9"

    invoke-static {v8}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v25

    const/16 v26, 0x1

    const-string v22, "EXPLORE_WEB"

    const/16 v23, 0x14

    const-string v24, "com.explore.web.browser"

    invoke-direct/range {v21 .. v26}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v22, Lsq2;

    const-string v23, "06665358efd8ba05be236a47a12cb0958d7d75dd939d77c2b31f5398537ebdc5"

    invoke-static/range {v23 .. v23}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v26

    const/16 v27, 0x1

    const-string v23, "FENNEC_FDROID"

    const/16 v24, 0x15

    const-string v25, "org.mozilla.fennec_fdroid"

    invoke-direct/range {v22 .. v27}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v23, Lsq2;

    const-string v24, "cd36dfc9d12e199c94c24829f4c143610562b86bc7eb875cd8e3c1f8f79ab4ca"

    invoke-static/range {v24 .. v24}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v27

    const/16 v28, 0x1

    const-string v24, "FD"

    const/16 v25, 0x16

    const-string v26, "com.fulldive.mobile"

    invoke-direct/range {v23 .. v28}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v24, Lsq2;

    const-string v30, "a78b62a5165b4494b2fead9e76a280d22d937fee6251aece599446b2ea319b04"

    invoke-static/range {v30 .. v30}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v28

    const/16 v29, 0x1

    const-string v25, "FIREFOX"

    const/16 v26, 0x17

    const-string v27, "org.mozilla.firefox"

    invoke-direct/range {v24 .. v29}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v25, Lsq2;

    invoke-static/range {v30 .. v30}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v35

    const/16 v36, 0x1

    const-string v32, "FIREFOX_BETA"

    const/16 v33, 0x18

    const-string v34, "org.mozilla.firefox_beta"

    move-object/from16 v31, v25

    invoke-direct/range {v31 .. v36}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v26, Lsq2;

    const-string v27, "6203a473be36d64ee37f87fa500edbc79eab930610ab9b9fa4ca7d5c1f1b4ffc"

    invoke-static/range {v27 .. v27}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v30

    const/16 v31, 0x1

    const-string v27, "FIREFOX_FOCUS"

    const/16 v28, 0x19

    const-string v29, "org.mozilla.focus"

    invoke-direct/range {v26 .. v31}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v27, Lsq2;

    const-string v28, "6588e5d63a5e4a0af032f578b3a0550b68fb73030f2c78f8e4be8016ceac76a1"

    invoke-static/range {v28 .. v28}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v31

    const/16 v32, 0x1

    const-string v28, "FLY"

    const/16 v29, 0x1a

    const-string v30, "com.fly.web.smart.browser"

    invoke-direct/range {v27 .. v32}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v28, Lsq2;

    const-string v29, "604740c6d038fcbe6b1a22088aedfb6f922fb4f67cd252afd017bbe9b36f5d35"

    invoke-static/range {v29 .. v29}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v32

    const/16 v33, 0x1

    const-string v29, "FREE_ADBLOCKER"

    const/16 v30, 0x1b

    const-string v31, "com.hsv.freeadblockerbrowser"

    invoke-direct/range {v28 .. v33}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v29, Lsq2;

    const-string v30, "c01e1bbd4a65bd8bfc7ab4efe80c04dc57d33f849f012a9e91de1bff138ad2e2"

    invoke-static/range {v30 .. v30}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v33

    const/16 v34, 0x1

    const-string v30, "GHOSTERY"

    const/16 v31, 0x1c

    const-string v32, "com.ghostery.android.ghostery"

    invoke-direct/range {v29 .. v34}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v30, Lsq2;

    move-object/from16 v36, v0

    const-string v0, "a8fea4cafb9332da26b8e6810817c1da90a5030e35a60a79e06c9097aac6a442"

    move-object/from16 v37, v1

    const-string v1, "aff8a749cf0e7d754465d0fbfa7b8d0c645e225c10c6e232ada0d9748836b8e5"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v34

    const/16 v35, 0x1

    const-string v31, "HEY_TAP"

    const/16 v32, 0x1d

    const-string v33, "com.heytap.browser"

    invoke-direct/range {v30 .. v35}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v38, Lsq2;

    const-string v0, "d0ca4fe9dede0999df21cd1eba16503c198d912cdc0a42b5aa4bd96a8f8edc32"

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v42

    const/16 v43, 0x1

    const-string v39, "HOLA"

    const/16 v40, 0x1e

    const-string v41, "com.talpa.hibrowser"

    invoke-direct/range {v38 .. v43}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v32, Lsq2;

    const-string v0, "f73fb5cf39492616b839f68b13c65ee9c03d22a6f1a16f31e17d7d8030135c7a"

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v43

    const/16 v44, 0x1

    const-string v40, "INCOGNITO"

    const/16 v41, 0x1f

    const-string v42, "com.androidbull.incognito.browser"

    move-object/from16 v39, v32

    invoke-direct/range {v39 .. v44}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v33, Lsq2;

    const-string v0, "c069ea966332e91e0a0c3cc577e6f509fe3d9ddaf7015ad0c5c5ef8fda3f8628"

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v43

    const-string v40, "KIWI"

    const/16 v41, 0x20

    const-string v42, "com.kiwibrowser.browser"

    move-object/from16 v39, v33

    invoke-direct/range {v39 .. v44}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v34, Lsq2;

    const-string v0, "c9009d01ebf9f5d0302bc71b2fe9aa9a47a432bba17308a3111b75d7b2149025"

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v43

    const-string v40, "MI_BROWSER"

    const/16 v41, 0x21

    const-string v42, "com.mi.globalbrowser"

    move-object/from16 v39, v34

    invoke-direct/range {v39 .. v44}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v35, Lsq2;

    const-string v0, "9152236ba5221b3ada048752bcc23c976a75b656077377e45286e4bc8d0b497f"

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v43

    const-string v40, "MINT"

    const/16 v41, 0x22

    const-string v42, "com.mi.globalbrowser.mini"

    move-object/from16 v39, v35

    invoke-direct/range {v39 .. v44}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v39, Lsq2;

    invoke-static {v8}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v43

    const-string v40, "NET_FAST"

    const/16 v41, 0x23

    const-string v42, "net.fast.web.browser"

    invoke-direct/range {v39 .. v44}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v40, Lsq2;

    const-string v0, "01178cf123cd7ca6da4bc86f14809c0e7b570ff6235ecb7683fecc443d2ba638"

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v44

    const/16 v45, 0x1

    const-string v41, "OH"

    const/16 v42, 0x24

    const-string v43, "com.oh.bro"

    invoke-direct/range {v40 .. v45}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v41, Lsq2;

    const-string v0, "aad8e204d24d177934c9cd0c63cc6aa38efbf42c4a6957097e2210f57faa67aa"

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v45

    const/16 v46, 0x1

    const-string v42, "OPERA_GX"

    const/16 v43, 0x25

    const-string v44, "com.opera.gx"

    invoke-direct/range {v41 .. v46}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v42, Lsq2;

    const-string v0, "57acbc525f1b2ebd19196cd6f014397cc910fd18841e0ae850febc3e1e593ff2"

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v46

    const/16 v47, 0x1

    const-string v43, "OPERA_MINI"

    const/16 v44, 0x26

    const-string v45, "com.opera.mini.native"

    invoke-direct/range {v42 .. v47}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v43, Lsq2;

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v47

    const/16 v48, 0x1

    const-string v44, "OPERA_MINI_BETA"

    const/16 v45, 0x27

    const-string v46, "com.opera.mini.native.beta"

    invoke-direct/range {v43 .. v48}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v44, Lsq2;

    const-string v0, "215afb8bb7ea39012bc89edc4ebcff720452b4d80741b83e97030cc2df2f3fe0"

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v48

    const/16 v49, 0x1

    const-string v45, "ORBITUM"

    const/16 v46, 0x28

    const-string v47, "com.orbitum.browser"

    invoke-direct/range {v44 .. v49}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v45, Lsq2;

    const-string v0, "3b8c625f582a8cb70d85714746190852e162c28f26826e30afe0caf950db7d7f"

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v49

    const/16 v50, 0x1

    const-string v46, "PHOENIX"

    const/16 v47, 0x29

    const-string v48, "com.transsion.phoenix"

    invoke-direct/range {v45 .. v50}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v46, Lsq2;

    const-string v0, "9a2378cc2ca57ddf8ca47359425985aab467b579b78113953782e4a47c437c59"

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v50

    const/16 v51, 0x1

    const-string v47, "PUFFIN_FREE"

    const/16 v48, 0x2a

    const-string v49, "com.cloudmosa.puffinFree"

    invoke-direct/range {v46 .. v51}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v47, Lsq2;

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v51

    const/16 v52, 0x1

    const-string v48, "PUFFIN_INCOGNITO"

    const/16 v49, 0x2b

    const-string v50, "com.cloudmosa.puffinIncognito"

    invoke-direct/range {v47 .. v52}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v48, Lsq2;

    const-string v0, "3fd33491c46700aa456a83f806ef4ed5f8a8163145db49e1fd1230d2d40067ad"

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v52

    const/16 v53, 0x1

    const-string v49, "PURE"

    const/16 v50, 0x2c

    const-string v51, "pure.lite.browser"

    invoke-direct/range {v48 .. v53}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v49, Lsq2;

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v53

    const/16 v54, 0x1

    const-string v50, "PURE_PLUS"

    const/16 v51, 0x2d

    const-string v52, "pure.lite.browser.plus"

    invoke-direct/range {v49 .. v54}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v50, Lsq2;

    const-string v0, "53d2a5e09c307ccf956c84de513b6a9db81cb43254e4947a4d56db5863e225ea"

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v54

    const/16 v55, 0x1

    const-string v51, "REACTIVE"

    const/16 v52, 0x2e

    const-string v53, "reactivephone.msearch"

    invoke-direct/range {v50 .. v55}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v51, Lsq2;

    const-string v0, "a1b55ce0b41d5773ccc29d34b8547acb5c9ade47f9d1d05867ab7740c011ce36"

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v55

    const/16 v56, 0x1

    const-string v52, "RITS"

    const/16 v53, 0x2f

    const-string v54, "acr.browser.raisebrowserfull"

    invoke-direct/range {v51 .. v56}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v52, Lsq2;

    const-string v0, "34df0e7a9f1cf1892e45c056b4973cd81ccf148a4050d11aea4ac5a65f900a42"

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v56

    const/16 v57, 0x1

    const-string v53, "SAMSUNG"

    const/16 v54, 0x30

    const-string v55, "com.sec.android.app.sbrowser"

    invoke-direct/range {v52 .. v57}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v53, Lsq2;

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v57

    const/16 v58, 0x1

    const-string v54, "SAMSUNG_BETA"

    const/16 v55, 0x31

    const-string v56, "com.sec.android.app.sbrowser.beta"

    invoke-direct/range {v53 .. v58}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v54, Lsq2;

    const-string v0, "16757636b5ef87879fdb6da98e1e9409348d848f7a67766a7a38379d768fe982"

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v58

    const/16 v59, 0x1

    const-string v55, "SOUL"

    const/16 v56, 0x32

    const-string v57, "com.mycompany.app.soulbrowser"

    invoke-direct/range {v54 .. v59}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v55, Lsq2;

    const-string v0, "37566bb86693e58a640200ee18f69b49bccf43b7882885903756bfbec8bb9fd9"

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v59

    const/16 v60, 0x1

    const-string v56, "SUPER_FAST_LABS"

    const/16 v57, 0x33

    const-string v58, "iron.web.jalepano.browser"

    invoke-direct/range {v55 .. v60}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v56, Lsq2;

    const-string v0, "20061f045e737c67375c17794cfedb436a03cec6bacb7cb9f96642205ca2cec8"

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v60

    const/16 v61, 0x1

    const-string v57, "TOR"

    const/16 v58, 0x34

    const-string v59, "org.torproject.torbrowser"

    invoke-direct/range {v56 .. v61}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v57, Lsq2;

    const-string v0, "bbe2ff269828a0d922498ee87f65afe769c27d62f489d5c19b9cc6c444c80811"

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v61

    const/16 v62, 0x1

    const-string v58, "UC"

    const/16 v59, 0x35

    const-string v60, "com.UCMobile.intl"

    invoke-direct/range {v57 .. v62}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v58, Lsq2;

    const-string v0, "0fa4e77a1e38457d57031d0c80efabeb6fdc732f0d7a055b1d816ea846548378"

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v62

    const/16 v63, 0x1

    const-string v59, "UME"

    const/16 v60, 0x36

    const-string v61, "com.ume.browser.cust"

    invoke-direct/range {v58 .. v63}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v59, Lsq2;

    const-string v0, "9b9ef7f9a0955ba2aa33b7132a78d12abb7ae8fddf423a3d8de83dbee75b4a05"

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v63

    const/16 v64, 0x1

    const-string v60, "UPX"

    const/16 v61, 0x37

    const-string v62, "net.upx.proxy.browser"

    invoke-direct/range {v59 .. v64}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v60, Lsq2;

    const-string v0, "3df7f89d3b8d1315f05710c914fccbcf3a4e24980afddccb8dcebde90836a390"

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v64

    const/16 v65, 0x1

    const-string v61, "VIA"

    const/16 v62, 0x38

    const-string v63, "mark.via.gp"

    invoke-direct/range {v60 .. v65}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v61, Lsq2;

    const-string v0, "e8a78544655ba8c09817f732768f5689b1662ec4b2bc5a0bc0ec138d33ca3d1e"

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v65

    const/16 v66, 0x1

    const-string v62, "VIVALDI"

    const/16 v63, 0x39

    const-string v64, "com.vivaldi.browser"

    invoke-direct/range {v61 .. v66}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v62, Lsq2;

    const-string v0, "bcc35d4d3606f154f0402ab7634e8490c0b244c2675c3c6238986987024f0c02"

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v66

    const/16 v67, 0x1

    const-string v63, "VIVO"

    const/16 v64, 0x3a

    const-string v65, "com.vivo.browser"

    invoke-direct/range {v62 .. v67}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v63, Lsq2;

    const-string v0, "0b8b8523bb4aeffa346e4bdd4fbf7d193450569aa14aaad4adfd94a3f7b227bb"

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v67

    const/16 v68, 0x1

    const-string v64, "WHALE"

    const/16 v65, 0x3b

    const-string v66, "com.naver.whale"

    invoke-direct/range {v63 .. v68}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    new-instance v64, Lsq2;

    const-string v0, "aca405ded8b25cb2e8c6da69425d2b4307d087c1276fc06ad5942731ccc51dba"

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v68

    const/16 v69, 0x1

    const-string v65, "YANDEX"

    const/16 v66, 0x3c

    const-string v67, "com.yandex.browser"

    invoke-direct/range {v64 .. v69}, Lsq2;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V

    move-object v8, v7

    move-object/from16 v1, v36

    move-object/from16 v31, v38

    move-object/from16 v36, v39

    move-object/from16 v38, v41

    move-object/from16 v39, v42

    move-object/from16 v41, v44

    move-object/from16 v42, v45

    move-object/from16 v44, v47

    move-object/from16 v45, v48

    move-object/from16 v47, v50

    move-object/from16 v48, v51

    move-object/from16 v50, v53

    move-object/from16 v51, v54

    move-object/from16 v53, v56

    move-object/from16 v54, v57

    move-object/from16 v56, v59

    move-object/from16 v57, v60

    move-object/from16 v59, v62

    move-object/from16 v60, v63

    move-object v7, v6

    move-object v6, v5

    move-object v5, v4

    move-object v4, v3

    move-object v3, v2

    move-object/from16 v2, v37

    move-object/from16 v37, v40

    move-object/from16 v40, v43

    move-object/from16 v43, v46

    move-object/from16 v46, v49

    move-object/from16 v49, v52

    move-object/from16 v52, v55

    move-object/from16 v55, v58

    move-object/from16 v58, v61

    move-object/from16 v61, v64

    filled-new-array/range {v1 .. v61}, [Lsq2;

    move-result-object v0

    sput-object v0, Lsq2;->e:[Lsq2;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Lsq2;->f:Lh58;

    new-instance v0, Lrbe;

    const/16 v1, 0x17

    invoke-direct {v0, v1}, Lrbe;-><init>(B)V

    sput-object v0, Lsq2;->d:Lrbe;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/util/Set;Z)V
    .registers 6

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lsq2;->a:Ljava/lang/String;

    iput-object p4, p0, Lsq2;->b:Ljava/util/Set;

    iput-boolean p5, p0, Lsq2;->c:Z

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lsq2;
    .registers 2

    const-class v0, Lsq2;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lsq2;

    return-object p0
.end method

.method public static values()[Lsq2;
    .registers 1

    sget-object v0, Lsq2;->e:[Lsq2;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lsq2;

    return-object v0
.end method
