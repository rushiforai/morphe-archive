.class public final Llk6;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Llk6;

.field public static final b:Lpj;

.field public static final c:Ljava/util/Map;


# direct methods
.method static constructor <clinit>()V
    .registers 71

    new-instance v0, Llk6;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Llk6;->a:Llk6;

    new-instance v0, Lpj;

    const/4 v1, 0x0

    new-array v2, v1, [I

    const/16 v3, 0xa

    const/4 v4, 0x4

    invoke-direct {v0, v4, v2, v3}, Lpj;-><init>(I[IB)V

    sput-object v0, Llk6;->b:Lpj;

    new-instance v2, Lpj;

    new-array v3, v1, [I

    const/4 v4, 0x0

    const/4 v5, 0x6

    invoke-direct {v2, v5, v3, v4}, Lpj;-><init>(I[IB)V

    new-instance v6, Lkotlin/Pair;

    const-string v3, "ui/adblock"

    invoke-direct {v6, v3, v2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v2, Lpj;

    new-array v3, v1, [I

    const/4 v4, 0x1

    const/16 v5, 0x20

    invoke-direct {v2, v5, v3, v4}, Lpj;-><init>(I[IB)V

    new-instance v7, Lkotlin/Pair;

    const-string v3, "ui/app_icon"

    invoke-direct {v7, v3, v2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v2, Lpj;

    new-array v3, v1, [I

    const/4 v4, 0x2

    const/4 v5, 0x7

    invoke-direct {v2, v5, v3, v4}, Lpj;-><init>(I[IB)V

    new-instance v8, Lkotlin/Pair;

    const-string v3, "ui/appearance_settings"

    invoke-direct {v8, v3, v2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v2, Lny0;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lny0;-><init>(B)V

    new-instance v9, Lkotlin/Pair;

    const-string v3, "ui/ai_search"

    invoke-direct {v9, v3, v2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v2, Lny0;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Lny0;-><init>(B)V

    new-instance v10, Lkotlin/Pair;

    const-string v3, "ui/aria"

    invoke-direct {v10, v3, v2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v2, Lpj;

    new-array v3, v1, [I

    const/4 v4, 0x5

    const/16 v5, 0xd

    invoke-direct {v2, v5, v3, v4}, Lpj;-><init>(I[IB)V

    new-instance v11, Lkotlin/Pair;

    const-string v3, "ui/autofill"

    invoke-direct {v11, v3, v2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v2, Lpj;

    new-array v3, v1, [I

    const/4 v4, 0x3

    const/16 v5, 0xf

    invoke-direct {v2, v5, v3, v4}, Lpj;-><init>(I[IB)V

    new-instance v12, Lkotlin/Pair;

    const-string v3, "ui/autofill/address/add"

    invoke-direct {v12, v3, v2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v2, Lpj;

    new-array v3, v1, [I

    const/4 v4, 0x4

    const/16 v5, 0xe

    invoke-direct {v2, v5, v3, v4}, Lpj;-><init>(I[IB)V

    new-instance v13, Lkotlin/Pair;

    const-string v3, "ui/autofill/card/add"

    invoke-direct {v13, v3, v2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v2, Lb13;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Lb13;-><init>(Z)V

    new-instance v14, Lkotlin/Pair;

    const-string v4, "ui/backup_wallet"

    invoke-direct {v14, v4, v2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v2, Lpj;

    new-array v4, v1, [I

    const/4 v5, 0x6

    invoke-direct {v2, v3, v4, v5}, Lpj;-><init>(I[IB)V

    new-instance v15, Lkotlin/Pair;

    const-string v4, "ui/bookmarks"

    invoke-direct {v15, v4, v2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v2, Lpj;

    new-array v4, v1, [I

    const/16 v5, 0x8

    move/from16 v16, v3

    const/16 v3, 0x26

    invoke-direct {v2, v3, v4, v5}, Lpj;-><init>(I[IB)V

    new-instance v3, Lkotlin/Pair;

    const-string v4, "ui/browser_settings"

    invoke-direct {v3, v4, v2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v2, Lav;

    const/4 v4, 0x1

    invoke-direct {v2, v4}, Lav;-><init>(B)V

    new-instance v4, Lkotlin/Pair;

    const-string v5, "ui/bundle"

    invoke-direct {v4, v5, v2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v2, Lb13;

    invoke-direct {v2, v1}, Lb13;-><init>(Z)V

    new-instance v5, Lkotlin/Pair;

    const-string v1, "ui/crypto_wallet"

    invoke-direct {v5, v1, v2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v1, Lpj;

    move-object/from16 v18, v3

    const/4 v2, 0x0

    new-array v3, v2, [I

    const/16 v2, 0x9

    move-object/from16 v19, v4

    const/4 v4, 0x3

    invoke-direct {v1, v4, v3, v2}, Lpj;-><init>(I[IB)V

    new-instance v2, Lkotlin/Pair;

    const-string v3, "ui/datasavings"

    invoke-direct {v2, v3, v1}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v1, Lcm6;

    const-string v3, "ACTION_MAKE_DEFAULT_BROWSER_SHEET"

    invoke-direct {v1, v3}, Lcm6;-><init>(Ljava/lang/String;)V

    new-instance v3, Lkotlin/Pair;

    const-string v4, "ui/default_browser"

    invoke-direct {v3, v4, v1}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v1, Lkotlin/Pair;

    const-string v4, "ui/default_browser_view"

    invoke-direct {v1, v4, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lpj;

    move-object/from16 v21, v1

    const/4 v4, 0x0

    new-array v1, v4, [I

    const/16 v4, 0xb

    move-object/from16 v22, v2

    const/16 v2, 0x1f

    invoke-direct {v0, v2, v1, v4}, Lpj;-><init>(I[IB)V

    new-instance v1, Lkotlin/Pair;

    const-string v2, "ui/downloads"

    invoke-direct {v1, v2, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lpj;

    const/4 v2, 0x0

    new-array v4, v2, [I

    const/4 v2, 0x7

    move-object/from16 v23, v1

    const/16 v1, 0x1a

    invoke-direct {v0, v1, v4, v2}, Lpj;-><init>(I[IB)V

    new-instance v1, Lkotlin/Pair;

    const-string v2, "ui/edit_toolbar"

    invoke-direct {v1, v2, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lny0;

    const/4 v2, 0x2

    invoke-direct {v0, v2}, Lny0;-><init>(B)V

    new-instance v2, Lkotlin/Pair;

    const-string v4, "ui/esim"

    invoke-direct {v2, v4, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Le88;

    const/4 v4, 0x2

    invoke-direct {v0, v4}, Lny0;-><init>(B)V

    new-instance v4, Lkotlin/Pair;

    move-object/from16 v24, v1

    const-string v1, "ui/esim/checkout/success"

    invoke-direct {v4, v1, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lpj;

    move-object/from16 v25, v2

    const/4 v1, 0x0

    new-array v2, v1, [I

    const/16 v1, 0x13

    move-object/from16 v26, v3

    const/16 v3, 0x18

    invoke-direct {v0, v3, v2, v1}, Lpj;-><init>(I[IB)V

    new-instance v1, Lkotlin/Pair;

    const-string v2, "ui/flow"

    invoke-direct {v1, v2, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lxr;

    const/4 v2, 0x3

    invoke-direct {v0, v2}, Lxr;-><init>(B)V

    new-instance v2, Lkotlin/Pair;

    const-string v3, "ui/giveaway"

    invoke-direct {v2, v3, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lpj;

    move-object/from16 v27, v1

    const/4 v3, 0x0

    new-array v1, v3, [I

    const/16 v3, 0xd

    move-object/from16 v28, v2

    const/4 v2, 0x2

    invoke-direct {v0, v2, v1, v3}, Lpj;-><init>(I[IB)V

    new-instance v1, Lkotlin/Pair;

    const-string v3, "ui/history"

    invoke-direct {v1, v3, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lpj;

    const/4 v3, 0x0

    new-array v2, v3, [I

    const/16 v3, 0xe

    move-object/from16 v30, v1

    const/16 v1, 0x1c

    invoke-direct {v0, v1, v2, v3}, Lpj;-><init>(I[IB)V

    new-instance v1, Lkotlin/Pair;

    const-string v2, "ui/import_bookmarks"

    invoke-direct {v1, v2, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lpj;

    const/4 v2, 0x0

    new-array v3, v2, [I

    const/16 v2, 0xf

    move-object/from16 v31, v1

    const/16 v1, 0x22

    invoke-direct {v0, v1, v3, v2}, Lpj;-><init>(I[IB)V

    new-instance v1, Lkotlin/Pair;

    const-string v2, "ui/import_chrome_data"

    invoke-direct {v1, v2, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lpj;

    const/4 v2, 0x0

    new-array v3, v2, [I

    const/16 v2, 0x10

    move-object/from16 v32, v1

    const/16 v1, 0x1e

    invoke-direct {v0, v1, v3, v2}, Lpj;-><init>(I[IB)V

    new-instance v1, Lkotlin/Pair;

    const-string v2, "ui/import_passwords"

    invoke-direct {v1, v2, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lav;

    const/4 v2, 0x3

    invoke-direct {v0, v2}, Lav;-><init>(B)V

    new-instance v2, Lkotlin/Pair;

    const-string v3, "ui/jump"

    invoke-direct {v2, v3, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lpj;

    move-object/from16 v33, v1

    const/4 v3, 0x0

    new-array v1, v3, [I

    const/16 v3, 0x11

    move-object/from16 v34, v2

    const/16 v2, 0x14

    invoke-direct {v0, v2, v1, v3}, Lpj;-><init>(I[IB)V

    new-instance v1, Lkotlin/Pair;

    const-string v2, "ui/language_settings"

    invoke-direct {v1, v2, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lqqc;

    const/4 v2, 0x0

    invoke-direct {v0, v2}, Lqqc;-><init>(B)V

    new-instance v2, Lkotlin/Pair;

    const-string v3, "ui/live_scores"

    invoke-direct {v2, v3, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lrqc;

    const/4 v3, 0x3

    invoke-direct {v0, v3}, Lqqc;-><init>(B)V

    new-instance v3, Lkotlin/Pair;

    move-object/from16 v35, v1

    const-string v1, "ui/live_scores/follow_match"

    invoke-direct {v3, v1, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lqqc;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lqqc;-><init>(B)V

    new-instance v1, Lkotlin/Pair;

    move-object/from16 v36, v2

    const-string v2, "ui/live_scores/match"

    invoke-direct {v1, v2, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lqqc;

    const/4 v2, 0x1

    invoke-direct {v0, v2}, Lqqc;-><init>(B)V

    new-instance v2, Lkotlin/Pair;

    move-object/from16 v37, v1

    const-string v1, "ui/live_scores/competition"

    invoke-direct {v2, v1, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lqqc;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lqqc;-><init>(B)V

    new-instance v1, Lkotlin/Pair;

    move-object/from16 v38, v2

    const-string v2, "ui/live_scores/team"

    invoke-direct {v1, v2, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lpj;

    move-object/from16 v39, v1

    const/4 v2, 0x0

    new-array v1, v2, [I

    const/16 v2, 0x12

    move-object/from16 v40, v3

    const/16 v3, 0x11

    invoke-direct {v0, v3, v1, v2}, Lpj;-><init>(I[IB)V

    new-instance v1, Lkotlin/Pair;

    const-string v2, "ui/manage_subscription"

    invoke-direct {v1, v2, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lpj;

    const/4 v2, 0x0

    new-array v3, v2, [I

    const/16 v2, 0x14

    move-object/from16 v41, v1

    const/16 v1, 0xb

    invoke-direct {v0, v1, v3, v2}, Lpj;-><init>(I[IB)V

    new-instance v1, Lkotlin/Pair;

    const-string v2, "ui/news_settings"

    invoke-direct {v1, v2, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lpj;

    const/4 v2, 0x0

    new-array v3, v2, [I

    const/16 v2, 0x15

    move-object/from16 v42, v1

    const/4 v1, 0x5

    invoke-direct {v0, v1, v3, v2}, Lpj;-><init>(I[IB)V

    new-instance v1, Lkotlin/Pair;

    const-string v2, "ui/nightmode"

    invoke-direct {v1, v2, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lpj;

    const/4 v2, 0x0

    new-array v3, v2, [I

    const/16 v2, 0x16

    move-object/from16 v43, v1

    const/16 v1, 0x17

    invoke-direct {v0, v1, v3, v2}, Lpj;-><init>(I[IB)V

    new-instance v1, Lkotlin/Pair;

    const-string v2, "ui/offline_pages"

    invoke-direct {v1, v2, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lav;

    const/4 v2, 0x5

    invoke-direct {v0, v2}, Lav;-><init>(B)V

    new-instance v2, Lkotlin/Pair;

    const-string v3, "ui/omnibar"

    invoke-direct {v2, v3, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lpj;

    move-object/from16 v44, v1

    const/4 v3, 0x0

    new-array v1, v3, [I

    const/16 v3, 0x17

    move-object/from16 v45, v2

    const/16 v2, 0x19

    invoke-direct {v0, v2, v1, v3}, Lpj;-><init>(I[IB)V

    new-instance v1, Lkotlin/Pair;

    const-string v2, "ui/passwords"

    invoke-direct {v1, v2, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lpj;

    const/4 v2, 0x0

    new-array v3, v2, [I

    const/16 v2, 0x18

    move-object/from16 v46, v1

    const/16 v1, 0x29

    invoke-direct {v0, v1, v3, v2}, Lpj;-><init>(I[IB)V

    new-instance v1, Lkotlin/Pair;

    const-string v2, "ui/privacy"

    invoke-direct {v1, v2, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lpj;

    const/4 v2, 0x0

    new-array v3, v2, [I

    const/16 v2, 0x1a

    move-object/from16 v47, v1

    const/16 v1, 0x24

    invoke-direct {v0, v1, v3, v2}, Lpj;-><init>(I[IB)V

    new-instance v1, Lkotlin/Pair;

    const-string v2, "ui/rewards"

    invoke-direct {v1, v2, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lpj;

    const/4 v2, 0x0

    new-array v3, v2, [I

    const/16 v2, 0x1d

    move-object/from16 v48, v1

    const/16 v1, 0x15

    invoke-direct {v0, v1, v3, v2}, Lpj;-><init>(I[IB)V

    new-instance v2, Lkotlin/Pair;

    const-string v3, "ui/search_settings"

    invoke-direct {v2, v3, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lpj;

    filled-new-array/range {v16 .. v16}, [I

    move-result-object v3

    move-object/from16 v49, v2

    const/16 v2, 0x1c

    invoke-direct {v0, v1, v3, v2}, Lpj;-><init>(I[IB)V

    new-instance v1, Lkotlin/Pair;

    const-string v2, "ui/search_settings/default"

    invoke-direct {v1, v2, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Ly7k;

    const/4 v2, 0x0

    new-array v3, v2, [I

    const/4 v2, 0x0

    move-object/from16 v50, v1

    const/16 v1, 0x27

    invoke-direct {v0, v1, v3, v2}, Ly7k;-><init>(I[IB)V

    new-instance v1, Lkotlin/Pair;

    const-string v2, "ui/start_page_settings"

    invoke-direct {v1, v2, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Ly7k;

    const/4 v2, 0x0

    new-array v3, v2, [I

    const/4 v2, 0x1

    move-object/from16 v51, v1

    const/16 v1, 0x1d

    invoke-direct {v0, v1, v3, v2}, Ly7k;-><init>(I[IB)V

    new-instance v1, Lkotlin/Pair;

    const-string v2, "ui/synced_speeddials"

    invoke-direct {v1, v2, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Ly7k;

    const/4 v2, 0x0

    new-array v3, v2, [I

    const/4 v2, 0x2

    move-object/from16 v52, v1

    const/16 v1, 0x23

    invoke-direct {v0, v1, v3, v2}, Ly7k;-><init>(I[IB)V

    new-instance v1, Lkotlin/Pair;

    const-string v2, "ui/tabs"

    invoke-direct {v1, v2, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Ly7k;

    const/4 v2, 0x0

    new-array v3, v2, [I

    const/4 v2, 0x3

    move-object/from16 v53, v1

    const/16 v1, 0x8

    invoke-direct {v0, v1, v3, v2}, Ly7k;-><init>(I[IB)V

    new-instance v1, Lkotlin/Pair;

    const-string v2, "ui/text_options"

    invoke-direct {v1, v2, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Ly7k;

    const/4 v2, 0x0

    new-array v3, v2, [I

    const/4 v2, 0x4

    move-object/from16 v54, v1

    const/16 v1, 0x12

    invoke-direct {v0, v1, v3, v2}, Ly7k;-><init>(I[IB)V

    new-instance v1, Lkotlin/Pair;

    const-string v2, "ui/tracker_blocker"

    invoke-direct {v1, v2, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lxr;

    const/4 v2, 0x4

    invoke-direct {v0, v2}, Lxr;-><init>(B)V

    new-instance v2, Lkotlin/Pair;

    const-string v3, "ui/upgrade"

    invoke-direct {v2, v3, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Ly7k;

    move-object/from16 v55, v1

    const/4 v3, 0x0

    new-array v1, v3, [I

    const/4 v3, 0x5

    move-object/from16 v56, v2

    const/16 v2, 0xa

    invoke-direct {v0, v2, v1, v3}, Ly7k;-><init>(I[IB)V

    new-instance v1, Lkotlin/Pair;

    const-string v2, "ui/vpn_settings"

    invoke-direct {v1, v2, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Ly7k;

    const/4 v2, 0x0

    new-array v3, v2, [I

    const/4 v2, 0x6

    move-object/from16 v57, v1

    const/16 v1, 0x13

    invoke-direct {v0, v1, v3, v2}, Ly7k;-><init>(I[IB)V

    new-instance v1, Lkotlin/Pair;

    const-string v2, "ui/wallpaper/gallery"

    invoke-direct {v1, v2, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lav;

    const/4 v2, 0x0

    invoke-direct {v0, v2}, Lav;-><init>(B)V

    new-instance v2, Lkotlin/Pair;

    const-string v3, "ui/sd_plus"

    invoke-direct {v2, v3, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lpj;

    move-object/from16 v58, v1

    const/4 v3, 0x0

    new-array v1, v3, [I

    const/16 v3, 0x19

    move-object/from16 v59, v2

    const/16 v2, 0x21

    invoke-direct {v0, v2, v1, v3}, Lpj;-><init>(I[IB)V

    new-instance v1, Lkotlin/Pair;

    const-string v2, "ui/private_tabs"

    invoke-direct {v1, v2, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Ly7k;

    const/4 v2, 0x0

    new-array v3, v2, [I

    const/4 v2, 0x7

    move-object/from16 v60, v1

    const/16 v1, 0x25

    invoke-direct {v0, v1, v3, v2}, Ly7k;-><init>(I[IB)V

    new-instance v1, Lkotlin/Pair;

    const-string v2, "ui/weather"

    invoke-direct {v1, v2, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lpj;

    const/4 v2, 0x0

    new-array v3, v2, [I

    const/16 v2, 0xc

    move-object/from16 v61, v1

    const/16 v1, 0x2a

    invoke-direct {v0, v1, v3, v2}, Lpj;-><init>(I[IB)V

    new-instance v1, Lkotlin/Pair;

    const-string v2, "ui/gp_update"

    invoke-direct {v1, v2, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lav;

    const/4 v2, 0x4

    invoke-direct {v0, v2}, Lav;-><init>(B)V

    new-instance v2, Lkotlin/Pair;

    const-string v3, "news/newsfeed"

    invoke-direct {v2, v3, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lav;

    const/4 v3, 0x2

    invoke-direct {v0, v3}, Lav;-><init>(B)V

    new-instance v3, Lkotlin/Pair;

    move-object/from16 v62, v1

    const-string v1, "data_plan/free_data"

    invoke-direct {v3, v1, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lxr;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lxr;-><init>(B)V

    new-instance v1, Lkotlin/Pair;

    move-object/from16 v63, v2

    const-string v2, "system/add_ai_widget"

    invoke-direct {v1, v2, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lxr;

    const/4 v2, 0x1

    invoke-direct {v0, v2}, Lxr;-><init>(B)V

    new-instance v2, Lkotlin/Pair;

    move-object/from16 v64, v1

    const-string v1, "system/add_search_widget"

    invoke-direct {v2, v1, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lxr;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lxr;-><init>(B)V

    new-instance v1, Lkotlin/Pair;

    move-object/from16 v65, v2

    const-string v2, "system/add_vpn_pro_widget"

    invoke-direct {v1, v2, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lcm6;

    const-string v2, "ACTION_MAKE_DEFAULT_BROWSER_SYSTEM"

    invoke-direct {v0, v2}, Lcm6;-><init>(Ljava/lang/String;)V

    new-instance v2, Lkotlin/Pair;

    move-object/from16 v66, v1

    const-string v1, "system/default_browser"

    invoke-direct {v2, v1, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lz08;

    const/4 v1, 0x1

    move-object/from16 v67, v2

    move/from16 v2, v16

    invoke-direct {v0, v1, v2}, Lz08;-><init>(BI)V

    new-instance v1, Lkotlin/Pair;

    const-string v2, "action/enable_live_score"

    invoke-direct {v1, v2, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lz08;

    const/4 v2, 0x0

    move-object/from16 v16, v1

    const/4 v1, 0x2

    invoke-direct {v0, v2, v1}, Lz08;-><init>(BI)V

    new-instance v1, Lkotlin/Pair;

    const-string v2, "action/enable_bottom_omnibar"

    invoke-direct {v1, v2, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lz08;

    const/4 v2, 0x2

    move-object/from16 v68, v1

    const/4 v1, 0x3

    invoke-direct {v0, v2, v1}, Lz08;-><init>(BI)V

    new-instance v1, Lkotlin/Pair;

    const-string v2, "action/enable_news"

    invoke-direct {v1, v2, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lpj;

    const/4 v2, 0x0

    new-array v2, v2, [I

    move-object/from16 v69, v1

    const/16 v1, 0x1b

    move-object/from16 v17, v3

    const/16 v3, 0x16

    invoke-direct {v0, v3, v2, v1}, Lpj;-><init>(I[IB)V

    new-instance v1, Lkotlin/Pair;

    const-string v2, "sdx"

    invoke-direct {v1, v2, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    move-object/from16 v70, v1

    move-object/from16 v20, v26

    move-object/from16 v26, v27

    move-object/from16 v27, v28

    move-object/from16 v28, v30

    move-object/from16 v29, v31

    move-object/from16 v30, v32

    move-object/from16 v31, v33

    move-object/from16 v32, v34

    move-object/from16 v33, v35

    move-object/from16 v34, v36

    move-object/from16 v36, v37

    move-object/from16 v37, v38

    move-object/from16 v38, v39

    move-object/from16 v35, v40

    move-object/from16 v39, v41

    move-object/from16 v40, v42

    move-object/from16 v41, v43

    move-object/from16 v42, v44

    move-object/from16 v43, v45

    move-object/from16 v44, v46

    move-object/from16 v45, v47

    move-object/from16 v46, v48

    move-object/from16 v47, v49

    move-object/from16 v48, v50

    move-object/from16 v49, v51

    move-object/from16 v50, v52

    move-object/from16 v51, v53

    move-object/from16 v52, v54

    move-object/from16 v53, v55

    move-object/from16 v54, v56

    move-object/from16 v55, v57

    move-object/from16 v56, v58

    move-object/from16 v57, v59

    move-object/from16 v58, v60

    move-object/from16 v59, v61

    move-object/from16 v60, v62

    move-object/from16 v61, v63

    move-object/from16 v63, v64

    move-object/from16 v64, v65

    move-object/from16 v65, v66

    move-object/from16 v66, v67

    move-object/from16 v67, v16

    move-object/from16 v62, v17

    move-object/from16 v16, v18

    move-object/from16 v17, v19

    move-object/from16 v19, v22

    move-object/from16 v22, v23

    move-object/from16 v23, v24

    move-object/from16 v24, v25

    move-object/from16 v25, v4

    move-object/from16 v18, v5

    filled-new-array/range {v6 .. v70}, [Lkotlin/Pair;

    move-result-object v0

    invoke-static {v0}, Lrbd;->c([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Llk6;->c:Ljava/util/Map;

    return-void
.end method

.method public static final a(Landroid/net/Uri;Llqm;ILandroid/content/Context;)Z
    .registers 5

    sget-object v0, Lik6;->a:Lik6;

    invoke-static {p2, v0, p1, p3, p0}, Llk6;->f(ILik6;Llqm;Landroid/content/Context;Landroid/net/Uri;)Z

    move-result p0

    return p0
.end method

.method public static b(Landroid/net/Uri;)Landroid/net/Uri;
    .registers 2

    :try_start_0
    const-string v0, "dl"

    invoke-virtual {p0, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_25

    invoke-static {p0}, Lmdb;->h(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    sget-object v0, Lwqm;->a:[Ljava/lang/String;
    :try_end_e
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_e} :catch_25

    :try_start_e
    new-instance v0, Ljava/net/URI;

    invoke-direct {v0, p0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_13
    .catch Ljava/net/URISyntaxException; {:try_start_e .. :try_end_13} :catch_15
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_e .. :try_end_13} :catch_25

    const/4 v0, 0x1

    goto :goto_16

    :catch_15
    const/4 v0, 0x0

    :goto_16
    if-eqz v0, :cond_25

    :try_start_18
    const-string v0, "ofa:"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_25

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0
    :try_end_24
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_18 .. :try_end_24} :catch_25

    return-object p0

    :catch_25
    :cond_25
    const/4 p0, 0x0

    return-object p0
.end method

.method public static c(I)Lib0;
    .registers 2

    if-eqz p0, :cond_1a

    const/4 v0, 0x1

    if-eq p0, v0, :cond_17

    const/4 v0, 0x2

    if-eq p0, v0, :cond_14

    const/4 v0, 0x3

    if-eq p0, v0, :cond_11

    const/4 v0, 0x4

    if-ne p0, v0, :cond_17

    sget-object p0, Lib0;->h:Lib0;

    return-object p0

    :cond_11
    sget-object p0, Lib0;->g:Lib0;

    return-object p0

    :cond_14
    sget-object p0, Lib0;->f:Lib0;

    return-object p0

    :cond_17
    sget-object p0, Lib0;->e:Lib0;

    return-object p0

    :cond_1a
    sget-object p0, Lib0;->b:Lib0;

    return-object p0
.end method

.method public static f(ILik6;Llqm;Landroid/content/Context;Landroid/net/Uri;)Z
    .registers 11

    invoke-virtual {p4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lwqm;->v(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_f

    invoke-static {p0, p1, p2, p3, p4}, Llk6;->g(ILik6;Llqm;Landroid/content/Context;Landroid/net/Uri;)Z

    move-result p0

    return p0

    :cond_f
    invoke-virtual {p4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "market://"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_3a

    sget-object p2, Lik6;->b:Lik6;

    if-eq p1, p2, :cond_eb

    invoke-static {p3, p4}, Luup;->z(Landroid/content/Context;Landroid/net/Uri;)Z

    move-result p1

    sget-object p2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    check-cast p2, Lcom/opera/android/OperaApplication;

    invoke-virtual {p2}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p2

    iget-object p2, p2, Ld6j;->c:Lx5f;

    invoke-virtual {p4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3, p0, p1}, Llk6;->h(Lx5f;Ljava/lang/String;IZ)V

    return p1

    :cond_3a
    invoke-virtual {p4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lwqm;->u(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x0

    if-eqz v0, :cond_67

    invoke-static {p4}, Llk6;->b(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v0

    if-nez v0, :cond_61

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p1

    iget-object p1, p1, Ld6j;->c:Lx5f;

    invoke-virtual {p4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2, p0, v2}, Llk6;->h(Lx5f;Ljava/lang/String;IZ)V

    return v2

    :cond_61
    const/4 p0, 0x2

    invoke-static {p0, p1, p2, p3, v0}, Llk6;->g(ILik6;Llqm;Landroid/content/Context;Landroid/net/Uri;)Z

    move-result p0

    return p0

    :cond_67
    invoke-virtual {p4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lbwg;->H(Ljava/lang/String;)Lgpm;

    move-result-object v0

    if-nez v0, :cond_73

    move v0, v2

    goto :goto_7d

    :cond_73
    iget-object v0, v0, Lgpm;->i:Lvgm;

    iget-object v0, v0, Lvgm;->a:Ljava/lang/String;

    const-string v3, "momi"

    invoke-virtual {v0, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    :goto_7d
    const/4 v3, 0x0

    if-eqz v0, :cond_102

    invoke-virtual {p4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lbwg;->H(Ljava/lang/String;)Lgpm;

    move-result-object p2

    if-eqz p2, :cond_8e

    invoke-static {p2}, Lqs7;->A(Lgpm;)Lek6;

    move-result-object v3

    :cond_8e
    if-eqz v3, :cond_ec

    sget-object p2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    check-cast p2, Lcom/opera/android/OperaApplication;

    iget-object p2, p2, Lcom/opera/android/OperaApplication;->D:Lj4c;

    invoke-virtual {p2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lk3i;

    invoke-virtual {p2}, Lk3i;->b()Z

    move-result p2

    if-eqz p2, :cond_ec

    sget-object p2, Lik6;->a:Lik6;

    if-ne p1, p2, :cond_eb

    invoke-virtual {p3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p1

    iget-object p1, p1, Ld6j;->c:Lx5f;

    invoke-virtual {p4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2, p0, v1}, Llk6;->h(Lx5f;Ljava/lang/String;IZ)V

    invoke-virtual {p4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    const-string p2, "deep_link"

    invoke-virtual {p1, p2, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p3}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object p0

    const-string p2, "android.intent.action.MAIN"

    invoke-virtual {p0, p2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string p2, "android.intent.category.LAUNCHER"

    invoke-virtual {p0, p2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, p1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    const-string p1, "DESTINATION_VIEW_ID"

    const/16 p2, 0x29

    invoke-virtual {p0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p1, "ACTION_DESTINATION_VIEW"

    invoke-virtual {p0, p1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p3, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_eb
    return v1

    :cond_ec
    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p1

    iget-object p1, p1, Ld6j;->c:Lx5f;

    invoke-virtual {p4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2, p0, v2}, Llk6;->h(Lx5f;Ljava/lang/String;IZ)V

    return v2

    :cond_102
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->c:Lx5f;

    sget-object v4, Lik6;->b:Lik6;

    if-ne p1, v4, :cond_166

    invoke-virtual {p4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    :try_start_118
    new-instance p2, Ljava/net/URI;

    invoke-direct {p2, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_11d
    .catch Ljava/net/URISyntaxException; {:try_start_118 .. :try_end_11d} :catch_11e

    return v1

    :catch_11e
    if-nez p0, :cond_15e

    invoke-virtual {p4}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p4}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p2

    const-string p3, "_"

    const-string v4, "[{}]"

    if-eqz p2, :cond_138

    new-instance v5, Lkotlin/text/Regex;

    invoke-direct {v5, v4}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p2, p3}, Lkotlin/text/Regex;->replace(Ljava/lang/CharSequence;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    goto :goto_139

    :cond_138
    move-object p2, v3

    :goto_139
    invoke-virtual {p1, p2}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p4}, Landroid/net/Uri;->getQuery()Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_14c

    new-instance v3, Lkotlin/text/Regex;

    invoke-direct {v3, v4}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p2, p3}, Lkotlin/text/Regex;->replace(Ljava/lang/CharSequence;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :cond_14c
    invoke-virtual {p1, v3}, Landroid/net/Uri$Builder;->query(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    :try_start_158
    new-instance p2, Ljava/net/URI;

    invoke-direct {p2, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_15d
    .catch Ljava/net/URISyntaxException; {:try_start_158 .. :try_end_15d} :catch_15e

    return v1

    :catch_15e
    :cond_15e
    invoke-virtual {p4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1, p0, v2}, Llk6;->h(Lx5f;Ljava/lang/String;IZ)V

    return v2

    :cond_166
    if-nez p0, :cond_193

    invoke-virtual {p3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    new-instance p1, Lc37;

    new-instance v0, Lt1;

    const/16 v2, 0xc

    invoke-direct {v0, p0, v2}, Lt1;-><init>(Landroid/content/Context;B)V

    new-instance p0, Lrqd;

    const/16 v2, 0x1a

    invoke-direct {p0, v2}, Lrqd;-><init>(B)V

    invoke-direct {p1, v0, p0}, Lc37;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Lc37;->A(Ljava/lang/String;)Lz0c;

    move-result-object p0

    if-eqz p0, :cond_193

    new-instance p1, Lhu5;

    const/4 p4, 0x3

    invoke-direct {p1, p3, p2, p4}, Lhu5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Lz0c;->h(Lcom/opera/api/Callback;)V

    return v1

    :cond_193
    invoke-virtual {p4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Lxgf;

    invoke-direct {p1, p0}, Lxgf;-><init>(Ljava/lang/String;)V

    iput-object p2, p1, Lxgf;->m:Llqm;

    iput-boolean v1, p1, Lxgf;->n:Z

    invoke-static {p3, p1}, Lzi4;->u(Landroid/content/Context;Lic4;)V

    return v1
.end method

.method public static g(ILik6;Llqm;Landroid/content/Context;Landroid/net/Uri;)Z
    .registers 24

    move-object/from16 v0, p1

    const-string v8, "target"

    const-string v9, "source"

    const-string v10, "campaign"

    :try_start_8
    invoke-static/range {p4 .. p4}, Li8f;->a(Landroid/net/Uri;)Li8f;

    move-result-object v1

    iget-object v5, v1, Li8f;->b:Ll1b;

    sget-object v2, Llk6;->c:Ljava/util/Map;

    iget-object v1, v1, Li8f;->a:Ljava/lang/String;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lh8f;
    :try_end_18
    .catch Lgva; {:try_start_8 .. :try_end_18} :catch_78

    if-eqz v1, :cond_70

    :try_start_1a
    sget-object v11, Lik6;->b:Lik6;

    if-ne v0, v11, :cond_21

    sget-object v2, Lg8f;->b:Lg8f;

    goto :goto_23

    :cond_21
    sget-object v2, Lg8f;->a:Lg8f;
    :try_end_23
    .catch Leva; {:try_start_1a .. :try_end_23} :catch_68
    .catch Lfva; {:try_start_1a .. :try_end_23} :catch_60
    .catch Lgva; {:try_start_1a .. :try_end_23} :catch_78

    :goto_23
    move/from16 v4, p0

    move-object/from16 v3, p3

    move-object/from16 v6, p4

    move-object v7, v2

    move-object/from16 v2, p2

    :try_start_2c
    invoke-interface/range {v1 .. v7}, Lh8f;->a(Llqm;Landroid/content/Context;ILjava/util/Map;Landroid/net/Uri;Lg8f;)V
    :try_end_2f
    .catch Leva; {:try_start_2c .. :try_end_2f} :catch_5e
    .catch Lfva; {:try_start_2c .. :try_end_2f} :catch_5c
    .catch Lgva; {:try_start_2c .. :try_end_2f} :catch_5a

    move-object v5, v6

    const/16 v18, 0x1

    if-eq v0, v11, :cond_59

    :try_start_34
    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual/range {p3 .. p3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v1

    iget-object v12, v1, Ld6j;->c:Lx5f;

    invoke-virtual {v5}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static/range {p0 .. p0}, Llk6;->c(I)Lib0;

    move-result-object v14

    invoke-static {v5, v10}, Lwqm;->m(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-static {v5, v9}, Lwqm;->m(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    invoke-static {v5, v8}, Lwqm;->m(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v12 .. v18}, Lx5f;->K(Ljava/lang/String;Lib0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    :cond_59
    return v18

    :catch_5a
    move-object v5, v6

    goto :goto_7a

    :catch_5c
    move-object v5, v6

    goto :goto_62

    :catch_5e
    move-object v5, v6

    goto :goto_6a

    :catch_60
    move-object/from16 v5, p4

    :goto_62
    new-instance v1, Lgva;

    invoke-direct {v1}, Ljava/lang/Exception;-><init>()V

    throw v1

    :catch_68
    move-object/from16 v5, p4

    :goto_6a
    new-instance v1, Lgva;

    invoke-direct {v1}, Ljava/lang/Exception;-><init>()V

    throw v1

    :cond_70
    move-object/from16 v5, p4

    new-instance v1, Lgva;

    invoke-direct {v1}, Ljava/lang/Exception;-><init>()V

    throw v1
    :try_end_78
    .catch Lgva; {:try_start_34 .. :try_end_78} :catch_7a

    :catch_78
    move-object/from16 v5, p4

    :catch_7a
    :goto_7a
    sget-object v1, Lik6;->a:Lik6;

    if-ne v0, v1, :cond_8d

    sget-object v4, Ln08;->a:Ln08;

    sget-object v6, Lg8f;->a:Lg8f;

    sget-object v0, Llk6;->b:Lpj;

    move/from16 v3, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-virtual/range {v0 .. v6}, Lq37;->a(Llqm;Landroid/content/Context;ILjava/util/Map;Landroid/net/Uri;Lg8f;)V

    :cond_8d
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual/range {p3 .. p3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v1, v0, Ld6j;->c:Lx5f;

    invoke-virtual {v5}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static/range {p0 .. p0}, Llk6;->c(I)Lib0;

    move-result-object v3

    invoke-static {v5, v10}, Lwqm;->m(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v9}, Lwqm;->m(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v8}, Lwqm;->m(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    move-object v5, v0

    invoke-virtual/range {v1 .. v7}, Lx5f;->K(Ljava/lang/String;Lib0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    return v7
.end method

.method public static h(Lx5f;Ljava/lang/String;IZ)V
    .registers 11

    invoke-static {p2}, Llk6;->c(I)Lib0;

    move-result-object v2

    iget-boolean p2, p0, Lx5f;->h:Z

    if-nez p2, :cond_9

    return-void

    :cond_9
    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move v6, p3

    invoke-virtual/range {v0 .. v6}, Lx5f;->K(Ljava/lang/String;Lib0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method


# virtual methods
.method public final d(Landroid/net/Uri;Landroid/content/Context;Lnt5;)Ljava/lang/Enum;
    .registers 5

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lwqm;->v(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_f

    invoke-virtual {p0, p1, p2, p3}, Llk6;->e(Landroid/net/Uri;Landroid/content/Context;Lnt5;)Ljava/lang/Enum;

    move-result-object p0

    return-object p0

    :cond_f
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lwqm;->u(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_27

    invoke-static {p1}, Llk6;->b(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p1

    if-nez p1, :cond_22

    sget-object p0, Ljk6;->d:Ljk6;

    return-object p0

    :cond_22
    invoke-virtual {p0, p1, p2, p3}, Llk6;->e(Landroid/net/Uri;Landroid/content/Context;Lnt5;)Ljava/lang/Enum;

    move-result-object p0

    return-object p0

    :cond_27
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lbwg;->H(Ljava/lang/String;)Lgpm;

    move-result-object p0

    if-nez p0, :cond_33

    const/4 p0, 0x0

    goto :goto_3d

    :cond_33
    iget-object p0, p0, Lgpm;->i:Lvgm;

    iget-object p0, p0, Lvgm;->a:Ljava/lang/String;

    const-string p3, "momi"

    invoke-virtual {p0, p3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    :goto_3d
    if-eqz p0, :cond_70

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lbwg;->H(Ljava/lang/String;)Lgpm;

    move-result-object p0

    if-nez p0, :cond_4b

    const/4 p0, 0x0

    goto :goto_4f

    :cond_4b
    invoke-static {p0}, Lqs7;->A(Lgpm;)Lek6;

    move-result-object p0

    :goto_4f
    if-nez p0, :cond_54

    sget-object p0, Ljk6;->d:Ljk6;

    return-object p0

    :cond_54
    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    iget-object p0, p0, Lcom/opera/android/OperaApplication;->D:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lk3i;

    invoke-virtual {p0}, Lk3i;->b()Z

    move-result p0

    if-eqz p0, :cond_6d

    sget-object p0, Ljk6;->a:Ljk6;

    return-object p0

    :cond_6d
    sget-object p0, Ljk6;->b:Ljk6;

    return-object p0

    :cond_70
    sget-object p0, Ljk6;->a:Ljk6;

    return-object p0
.end method

.method public final e(Landroid/net/Uri;Landroid/content/Context;Lnt5;)Ljava/lang/Enum;
    .registers 10

    instance-of v0, p3, Lkk6;

    if-eqz v0, :cond_13

    move-object v0, p3

    check-cast v0, Lkk6;

    iget v1, v0, Lkk6;->y:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lkk6;->y:I

    goto :goto_18

    :cond_13
    new-instance v0, Lkk6;

    invoke-direct {v0, p0, p3}, Lkk6;-><init>(Llk6;Lnt5;)V

    :goto_18
    iget-object p0, v0, Lkk6;->w:Ljava/lang/Object;

    sget-object p3, Lpx5;->a:Lpx5;

    iget v1, v0, Lkk6;->y:I

    const/4 v2, 0x2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v1, :cond_3e

    if-eq v1, v3, :cond_31

    if-ne v1, v2, :cond_2b

    :try_start_27
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_2a
    .catch Lgva; {:try_start_27 .. :try_end_2a} :catch_91

    goto :goto_83

    :cond_2b
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v4

    :cond_31
    iget-object p1, v0, Lkk6;->v:Lh8f;

    iget-object p2, v0, Lkk6;->u:Li8f;

    iget-object v1, v0, Lkk6;->t:Landroid/content/Context;

    :try_start_37
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_3a
    .catch Lgva; {:try_start_37 .. :try_end_3a} :catch_91

    move-object v5, v1

    move-object v1, p2

    move-object p2, v5

    goto :goto_67

    :cond_3e
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    :try_start_41
    invoke-static {p1}, Li8f;->a(Landroid/net/Uri;)Li8f;

    move-result-object p0

    sget-object p1, Llk6;->c:Ljava/util/Map;

    iget-object v1, p0, Li8f;->a:Ljava/lang/String;

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lh8f;

    if-nez p1, :cond_54

    sget-object p0, Ljk6;->d:Ljk6;

    return-object p0

    :cond_54
    iget-object v1, p0, Li8f;->b:Ll1b;

    iput-object p2, v0, Lkk6;->t:Landroid/content/Context;

    iput-object p0, v0, Lkk6;->u:Li8f;

    iput-object p1, v0, Lkk6;->v:Lh8f;

    iput v3, v0, Lkk6;->y:I

    invoke-interface {p1, p2, v1, v0}, Lh8f;->b(Landroid/content/Context;Ll1b;Lmt5;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, p3, :cond_82

    move-object v5, v1

    move-object v1, p0

    move-object p0, v5

    :goto_67
    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-nez p0, :cond_72

    sget-object p0, Ljk6;->b:Ljk6;

    return-object p0

    :cond_72
    iget-object p0, v1, Li8f;->b:Ll1b;

    iput-object v4, v0, Lkk6;->t:Landroid/content/Context;

    iput-object v4, v0, Lkk6;->u:Li8f;

    iput-object v4, v0, Lkk6;->v:Lh8f;

    iput v2, v0, Lkk6;->y:I

    invoke-interface {p1, p2, v0}, Lh8f;->c(Landroid/content/Context;Lkk6;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p3, :cond_83

    :cond_82
    return-object p3

    :cond_83
    :goto_83
    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_8e

    sget-object p0, Ljk6;->c:Ljk6;

    return-object p0

    :cond_8e
    sget-object p0, Ljk6;->a:Ljk6;
    :try_end_90
    .catch Lgva; {:try_start_41 .. :try_end_90} :catch_91

    return-object p0

    :catch_91
    sget-object p0, Ljk6;->d:Ljk6;

    return-object p0
.end method
