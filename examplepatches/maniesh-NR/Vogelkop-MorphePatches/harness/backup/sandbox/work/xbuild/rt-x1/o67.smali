.class public abstract Lo67;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lj5j;

.field public static final b:Ljava/util/List;


# direct methods
.method static constructor <clinit>()V
    .registers 41

    new-instance v0, Lj5j;

    sget-object v4, Lh5j;->b:Lg5j;

    sget-object v10, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    sget-object v1, Lp57;->b:Lp57;

    new-instance v2, Lah5;

    const/16 v3, 0x1c

    invoke-direct {v2, v3}, Lah5;-><init>(B)V

    new-instance v6, Lc67;

    invoke-direct {v6, v1, v2}, Lc67;-><init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;)V

    const-string v1, "Developer mode"

    const-string v2, "If enabled the app enables other developer settings"

    sget-object v9, Ll5j;->b:Ll5j;

    move-object v3, v4

    move-object v4, v9

    move-object v5, v10

    invoke-direct/range {v0 .. v6}, Lj5j;-><init>(Ljava/lang/String;Ljava/lang/String;Li5j;Ldyg;Ljava/lang/Object;Lc67;)V

    move-object v4, v3

    new-instance v5, Lj5j;

    sget-object v8, Lh5j;->a:Lf5j;

    sget-object v1, Lm67;->b:Lm67;

    new-instance v2, Ll57;

    const/4 v12, 0x0

    invoke-direct {v2, v12}, Ll57;-><init>(B)V

    new-instance v11, Lc67;

    invoke-direct {v11, v1, v2}, Lc67;-><init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;)V

    const-string v6, "Use staging Mobile Auth"

    const-string v7, "If enabled the app connects to the staging Mobile Auth server"

    invoke-direct/range {v5 .. v11}, Lj5j;-><init>(Ljava/lang/String;Ljava/lang/String;Li5j;Ldyg;Ljava/lang/Object;Lc67;)V

    move-object/from16 v18, v5

    move-object v14, v8

    new-instance v1, Lj5j;

    sget-object v2, Lb67;->b:Lb67;

    new-instance v3, Ll57;

    const/16 v5, 0x9

    invoke-direct {v3, v5}, Ll57;-><init>(B)V

    new-instance v7, Lc67;

    invoke-direct {v7, v2, v3}, Lc67;-><init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;)V

    const-string v2, "Use test net"

    const-string v3, "Specifies which blockchain the app connects to"

    move-object v5, v9

    move-object v6, v10

    invoke-direct/range {v1 .. v7}, Lj5j;-><init>(Ljava/lang/String;Ljava/lang/String;Li5j;Ldyg;Ljava/lang/Object;Lc67;)V

    move-object/from16 v19, v1

    new-instance v3, Lj5j;

    new-instance v8, Ln57;

    invoke-direct {v8, v12}, Ln57;-><init>(B)V

    sget-object v1, Ln67;->b:Ln67;

    new-instance v2, Ll57;

    const/16 v5, 0x13

    invoke-direct {v2, v5}, Ll57;-><init>(B)V

    new-instance v11, Lc67;

    invoke-direct {v11, v1, v2}, Lc67;-><init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;)V

    const-string v6, "Debuggable web views"

    const-string v7, "If enabled, WebViews are enabled for debugging"

    move-object v5, v3

    invoke-direct/range {v5 .. v11}, Lj5j;-><init>(Ljava/lang/String;Ljava/lang/String;Li5j;Ldyg;Ljava/lang/Object;Lc67;)V

    move-object/from16 v20, v5

    new-instance v5, Lj5j;

    new-instance v15, Ln5j;

    new-instance v1, Lm57;

    const/4 v2, 0x5

    invoke-direct {v1, v2}, Lm57;-><init>(B)V

    new-instance v3, Lu4h;

    const/16 v6, 0xf

    invoke-direct {v3, v6}, Lu4h;-><init>(B)V

    invoke-direct {v15, v1, v3}, Ln5j;-><init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    sget-object v1, Lo57;->b:Lo57;

    new-instance v3, Ll57;

    const/16 v7, 0x14

    invoke-direct {v3, v7}, Ll57;-><init>(B)V

    new-instance v7, Lc67;

    invoke-direct {v7, v1, v3}, Lc67;-><init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;)V

    move v1, v12

    const-string v12, "Country code"

    const-string v13, "2-letter country code used in various MiniPay APIs"

    const-string v16, ""

    move-object v11, v5

    move-object/from16 v17, v7

    invoke-direct/range {v11 .. v17}, Lj5j;-><init>(Ljava/lang/String;Ljava/lang/String;Li5j;Ldyg;Ljava/lang/Object;Lc67;)V

    move-object/from16 v21, v11

    move-object v8, v14

    new-instance v5, Lj5j;

    sget-object v3, Lg67;->b:Lg67;

    new-instance v7, Ll57;

    const/16 v11, 0x15

    invoke-direct {v7, v11}, Ll57;-><init>(B)V

    new-instance v11, Lc67;

    invoke-direct {v11, v3, v7}, Lc67;-><init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;)V

    const-string v6, "Simulate full cloud storage"

    const-string v7, "If enabled, cloud storage used for backups will be considered full"

    invoke-direct/range {v5 .. v11}, Lj5j;-><init>(Ljava/lang/String;Ljava/lang/String;Li5j;Ldyg;Ljava/lang/Object;Lc67;)V

    move-object/from16 v22, v5

    new-instance v5, Lj5j;

    sget-object v6, Lh67;->b:Lh67;

    new-instance v7, Ll57;

    const/16 v11, 0x16

    invoke-direct {v7, v11}, Ll57;-><init>(B)V

    new-instance v11, Lc67;

    invoke-direct {v11, v6, v7}, Lc67;-><init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;)V

    const-string v6, "Simulate save error from cloud storage"

    const-string v7, "If enabled, cloud storage returns an error upon save"

    invoke-direct/range {v5 .. v11}, Lj5j;-><init>(Ljava/lang/String;Ljava/lang/String;Li5j;Ldyg;Ljava/lang/Object;Lc67;)V

    move-object/from16 v23, v5

    new-instance v11, Lj5j;

    new-instance v15, Ln5j;

    sget-object v5, Lm5j;->b:Lm5j;

    new-instance v6, Lm57;

    invoke-direct {v6, v1}, Lm57;-><init>(B)V

    sget-object v1, La67;->a:La67;

    invoke-direct {v15, v5, v6, v1}, Ln5j;-><init>(Lm5j;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    const/16 v1, 0x3c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    new-instance v1, Lm57;

    const/4 v5, 0x3

    invoke-direct {v1, v5}, Lm57;-><init>(B)V

    new-instance v6, Ll57;

    const/16 v7, 0x17

    invoke-direct {v6, v7}, Ll57;-><init>(B)V

    new-instance v7, Lc67;

    invoke-direct {v7, v1, v6}, Lc67;-><init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;)V

    const-string v12, "Timeout in minutes to reset navigation"

    const-string v13, "After this period (in minutes) in background, the app should navigate back to the home screen"

    move-object/from16 v17, v7

    invoke-direct/range {v11 .. v17}, Lj5j;-><init>(Ljava/lang/String;Ljava/lang/String;Li5j;Ldyg;Ljava/lang/Object;Lc67;)V

    move-object/from16 v24, v11

    new-instance v1, Lj5j;

    new-instance v6, Lm57;

    const/4 v12, 0x6

    invoke-direct {v6, v12}, Lm57;-><init>(B)V

    new-instance v7, Ll57;

    const/16 v11, 0x18

    invoke-direct {v7, v11}, Ll57;-><init>(B)V

    new-instance v11, Lc67;

    invoke-direct {v11, v6, v7}, Lc67;-><init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;)V

    move v6, v2

    const-string v2, "Highlight provisional transactions"

    const-string v3, "Highlight transactions that are not received from the history api with \"provisional\"."

    move v15, v5

    move v13, v6

    move-object v5, v9

    move-object v6, v10

    move-object v7, v11

    invoke-direct/range {v1 .. v7}, Lj5j;-><init>(Ljava/lang/String;Ljava/lang/String;Li5j;Ldyg;Ljava/lang/Object;Lc67;)V

    move-object/from16 v25, v1

    new-instance v5, Lj5j;

    sget-object v1, Lu57;->b:Lu57;

    new-instance v2, Ll57;

    const/16 v3, 0x19

    invoke-direct {v2, v3}, Ll57;-><init>(B)V

    new-instance v11, Lc67;

    invoke-direct {v11, v1, v2}, Lc67;-><init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;)V

    const-string v6, "Enable Virtual Account"

    const-string v7, "Overrides Firebase feature flag, and enables user to create virtual account"

    invoke-direct/range {v5 .. v11}, Lj5j;-><init>(Ljava/lang/String;Ljava/lang/String;Li5j;Ldyg;Ljava/lang/Object;Lc67;)V

    move-object/from16 v26, v5

    new-instance v11, Lj5j;

    const-class v1, Lt97;

    invoke-static {v1}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v1

    move v2, v15

    new-instance v15, Lk5j;

    invoke-static {}, Lt97;->values()[Lt97;

    move-result-object v3

    invoke-static {v3}, Le82;->B([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v15, v1, v3}, Lk5j;-><init>(Ls15;Ljava/util/List;)V

    sget-object v1, Lt97;->a:Lr16;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v16, Lt97;->b:Lt97;

    new-instance v1, Lm57;

    const/4 v3, 0x7

    invoke-direct {v1, v3}, Lm57;-><init>(B)V

    new-instance v5, Ll57;

    const/16 v6, 0x1a

    invoke-direct {v5, v6}, Ll57;-><init>(B)V

    new-instance v6, Lc67;

    invoke-direct {v6, v1, v5}, Lc67;-><init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;)V

    move v1, v12

    const-string v12, "Discover environment"

    move v5, v13

    const-string v13, "Select which environment should be used as the data source for the Discover feature"

    move-object/from16 v17, v6

    move v6, v1

    move v1, v5

    move v5, v2

    move-object v14, v8

    invoke-direct/range {v11 .. v17}, Lj5j;-><init>(Ljava/lang/String;Ljava/lang/String;Li5j;Ldyg;Ljava/lang/Object;Lc67;)V

    move-object/from16 v27, v11

    new-instance v11, Lj5j;

    sget-object v16, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    sget-object v7, Ly57;->b:Ly57;

    new-instance v12, Ll57;

    const/16 v13, 0x1b

    invoke-direct {v12, v13}, Ll57;-><init>(B)V

    new-instance v13, Lc67;

    invoke-direct {v13, v7, v12}, Lc67;-><init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;)V

    const-string v12, "Filter discover data"

    move-object/from16 v17, v13

    const-string v13, "Whether we should filter featured cards and mini apps according to the user\'s country, platform, app type, and app version."

    move-object v15, v9

    invoke-direct/range {v11 .. v17}, Lj5j;-><init>(Ljava/lang/String;Ljava/lang/String;Li5j;Ldyg;Ljava/lang/Object;Lc67;)V

    move-object/from16 v28, v11

    move-object/from16 v29, v16

    new-instance v11, Lj5j;

    sget-object v7, Lf67;->b:Lf67;

    new-instance v12, Lah5;

    const/16 v13, 0x1d

    invoke-direct {v12, v13}, Lah5;-><init>(B)V

    move v15, v5

    move-object v5, v11

    new-instance v11, Lc67;

    invoke-direct {v11, v7, v12}, Lc67;-><init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;)V

    move v7, v6

    const-string v6, "Show provider label for Local Payments"

    move v12, v7

    const-string v7, "Whether the local payment should display a label with the provider name"

    invoke-direct/range {v5 .. v11}, Lj5j;-><init>(Ljava/lang/String;Ljava/lang/String;Li5j;Ldyg;Ljava/lang/Object;Lc67;)V

    move-object/from16 v30, v5

    new-instance v5, Lj5j;

    sget-object v6, Lv57;->b:Lv57;

    new-instance v7, Ll57;

    const/4 v14, 0x1

    invoke-direct {v7, v14}, Ll57;-><init>(B)V

    new-instance v11, Lc67;

    invoke-direct {v11, v6, v7}, Lc67;-><init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;)V

    const-string v6, "Enable digital cards"

    const-string v7, "Enables virtual cards powered by Gnosis"

    invoke-direct/range {v5 .. v11}, Lj5j;-><init>(Ljava/lang/String;Ljava/lang/String;Li5j;Ldyg;Ljava/lang/Object;Lc67;)V

    move-object/from16 v31, v5

    move v5, v1

    new-instance v1, Lj5j;

    sget-object v6, Lw57;->b:Lw57;

    new-instance v7, Ll57;

    const/4 v11, 0x2

    invoke-direct {v7, v11}, Ll57;-><init>(B)V

    new-instance v2, Lc67;

    invoke-direct {v2, v6, v7}, Lc67;-><init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;)V

    move-object v7, v2

    const-string v2, "Enable WalletConnect Pay"

    move v6, v3

    const-string v3, "Lets a scanned WalletConnect Pay link open the payment screen."

    move-object/from16 v16, v9

    move v9, v5

    move-object/from16 v5, v16

    move-object/from16 v16, v10

    move v10, v6

    move-object/from16 v6, v16

    const/16 v16, 0xf

    invoke-direct/range {v1 .. v7}, Lj5j;-><init>(Ljava/lang/String;Ljava/lang/String;Li5j;Ldyg;Ljava/lang/Object;Lc67;)V

    new-instance v2, Lj5j;

    sget-object v3, Ls57;->b:Ls57;

    new-instance v4, Ll57;

    invoke-direct {v4, v15}, Ll57;-><init>(B)V

    move v7, v11

    new-instance v11, Lc67;

    invoke-direct {v11, v3, v4}, Lc67;-><init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;)V

    move v3, v10

    move-object v10, v6

    const-string v6, "Use native Intercom messenger"

    move v4, v7

    const-string v7, "Opens support in the native Intercom SDK instead of the web messenger. Experimental, and the session is unverified until the backend serves identity verification tokens."

    move-object v15, v5

    move-object v5, v2

    move v2, v9

    move-object v9, v15

    move v15, v4

    move v4, v3

    move/from16 v3, v16

    invoke-direct/range {v5 .. v11}, Lj5j;-><init>(Ljava/lang/String;Ljava/lang/String;Li5j;Ldyg;Ljava/lang/Object;Lc67;)V

    move-object/from16 v32, v5

    new-instance v17, Lj5j;

    sget-object v5, Lk67;->b:Lk67;

    new-instance v6, Ll57;

    const/4 v7, 0x4

    invoke-direct {v6, v7}, Ll57;-><init>(B)V

    new-instance v11, Lc67;

    invoke-direct {v11, v5, v6}, Lc67;-><init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;)V

    const-string v6, "Use fake Gnosis API"

    const-string v7, "Test against mocked virtual cards API"

    move-object/from16 v5, v17

    invoke-direct/range {v5 .. v11}, Lj5j;-><init>(Ljava/lang/String;Ljava/lang/String;Li5j;Ldyg;Ljava/lang/Object;Lc67;)V

    move-object/from16 v33, v5

    new-instance v5, Lj5j;

    sget-object v6, Ll67;->b:Ll67;

    new-instance v7, Ll57;

    invoke-direct {v7, v2}, Ll57;-><init>(B)V

    new-instance v11, Lc67;

    invoke-direct {v11, v6, v7}, Lc67;-><init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;)V

    const-string v6, "Use Gnosis sandbox"

    const-string v7, "Connect to the Gnosis sandbox environment instead of production"

    invoke-direct/range {v5 .. v11}, Lj5j;-><init>(Ljava/lang/String;Ljava/lang/String;Li5j;Ldyg;Ljava/lang/Object;Lc67;)V

    move-object/from16 v2, v18

    move-object/from16 v18, v5

    new-instance v5, Lj5j;

    sget-object v6, Lx57;->b:Lx57;

    new-instance v7, Ll57;

    invoke-direct {v7, v12}, Ll57;-><init>(B)V

    new-instance v11, Lc67;

    invoke-direct {v11, v6, v7}, Lc67;-><init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;)V

    const-string v6, "Fail Gnosis API"

    const-string v7, "Fail all the requests to the Gnosis API"

    invoke-direct/range {v5 .. v11}, Lj5j;-><init>(Ljava/lang/String;Ljava/lang/String;Li5j;Ldyg;Ljava/lang/Object;Lc67;)V

    move-object/from16 v34, v2

    move-object/from16 v2, v19

    move-object/from16 v19, v5

    new-instance v5, Lj5j;

    sget-object v6, Li67;->b:Li67;

    new-instance v7, Ll57;

    invoke-direct {v7, v4}, Ll57;-><init>(B)V

    new-instance v11, Lc67;

    invoke-direct {v11, v6, v7}, Lc67;-><init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;)V

    const-string v6, "Skip virtual card account restoration during onboarding"

    const-string v7, "Skips virtual card account restoration during onboarding in order to show the \'Restore Card\' screen in the Cards tab."

    invoke-direct/range {v5 .. v11}, Lj5j;-><init>(Ljava/lang/String;Ljava/lang/String;Li5j;Ldyg;Ljava/lang/Object;Lc67;)V

    move-object/from16 v4, v20

    move-object/from16 v20, v5

    new-instance v11, Lj5j;

    move v7, v15

    new-instance v15, Lk5j;

    const-class v5, Lnan;

    invoke-static {v5}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v5

    sget-object v6, Lnan;->e:Lh58;

    invoke-direct {v15, v5, v6}, Lk5j;-><init>(Ls15;Ljava/util/List;)V

    sget-object v5, Lnan;->b:Lavj;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v16, Lnan;->c:Lnan;

    new-instance v5, Ltb6;

    invoke-direct {v5, v13}, Ltb6;-><init>(B)V

    new-instance v6, Ll57;

    const/16 v12, 0x8

    invoke-direct {v6, v12}, Ll57;-><init>(B)V

    new-instance v12, Lc67;

    invoke-direct {v12, v5, v6}, Lc67;-><init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;)V

    move-object/from16 v17, v12

    const-string v12, "Virtual card provider"

    const-string v13, "Set the current virtual card provider to be used in MiniPay"

    move v5, v14

    move-object v14, v8

    invoke-direct/range {v11 .. v17}, Lj5j;-><init>(Ljava/lang/String;Ljava/lang/String;Li5j;Ldyg;Ljava/lang/Object;Lc67;)V

    move-object/from16 v35, v21

    move-object/from16 v21, v11

    new-instance v11, Lj5j;

    new-instance v15, Ln5j;

    new-instance v6, Lm57;

    invoke-direct {v6, v5}, Lm57;-><init>(B)V

    new-instance v5, Lu4h;

    invoke-direct {v5, v3}, Lu4h;-><init>(B)V

    invoke-direct {v15, v6, v5}, Ln5j;-><init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    sget-object v5, Ld67;->b:Ld67;

    new-instance v6, Ll57;

    const/16 v12, 0xa

    invoke-direct {v6, v12}, Ll57;-><init>(B)V

    new-instance v12, Lc67;

    invoke-direct {v12, v5, v6}, Lc67;-><init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;)V

    move-object/from16 v17, v12

    const-string v12, "Rain API key"

    const-string v13, "API key sent to the Rain cards API. Not shipped with the app \u2014 paste your own, otherwise Rain requests are rejected."

    const-string v16, ""

    invoke-direct/range {v11 .. v17}, Lj5j;-><init>(Ljava/lang/String;Ljava/lang/String;Li5j;Ldyg;Ljava/lang/Object;Lc67;)V

    move-object/from16 v36, v22

    move-object/from16 v22, v11

    new-instance v5, Lj5j;

    sget-object v6, Lt57;->b:Lt57;

    new-instance v11, Ll57;

    const/16 v12, 0xb

    invoke-direct {v11, v12}, Ll57;-><init>(B)V

    new-instance v12, Lc67;

    invoke-direct {v12, v6, v11}, Lc67;-><init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;)V

    const-string v6, "Enable Sumsub KYC"

    move v15, v7

    const-string v7, "Enables entry point UI to go through Sumsub KYC, and authorize MiniPay to share data"

    move-object v11, v12

    invoke-direct/range {v5 .. v11}, Lj5j;-><init>(Ljava/lang/String;Ljava/lang/String;Li5j;Ldyg;Ljava/lang/Object;Lc67;)V

    move-object/from16 v37, v23

    move-object/from16 v23, v5

    new-instance v5, Lj5j;

    sget-object v6, Lz57;->b:Lz57;

    new-instance v7, Ll57;

    const/16 v11, 0xc

    invoke-direct {v7, v11}, Ll57;-><init>(B)V

    new-instance v11, Lc67;

    invoke-direct {v11, v6, v7}, Lc67;-><init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;)V

    const-string v6, "Force lock screen"

    const-string v7, "Force enable lock screen"

    invoke-direct/range {v5 .. v11}, Lj5j;-><init>(Ljava/lang/String;Ljava/lang/String;Li5j;Ldyg;Ljava/lang/Object;Lc67;)V

    move-object/from16 v38, v24

    move-object/from16 v24, v5

    new-instance v11, Lj5j;

    const-class v5, Lft8;

    invoke-static {v5}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v5

    new-instance v6, Lk5j;

    invoke-static {}, Lft8;->values()[Lft8;

    move-result-object v7

    invoke-static {v7}, Le82;->B([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    invoke-direct {v6, v5, v7}, Lk5j;-><init>(Ls15;Ljava/util/List;)V

    sget-object v5, Lft8;->a:Li06;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v16, Lft8;->b:Lft8;

    new-instance v5, Lm57;

    invoke-direct {v5, v15}, Lm57;-><init>(B)V

    new-instance v7, Ll57;

    const/16 v12, 0xd

    invoke-direct {v7, v12}, Ll57;-><init>(B)V

    new-instance v12, Lc67;

    invoke-direct {v12, v5, v7}, Lc67;-><init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;)V

    move-object/from16 v17, v12

    const-string v12, "Feature config API environment"

    const-string v13, "Select which environment (endpoint) should be used for the Feature config API"

    move-object v15, v6

    invoke-direct/range {v11 .. v17}, Lj5j;-><init>(Ljava/lang/String;Ljava/lang/String;Li5j;Ldyg;Ljava/lang/Object;Lc67;)V

    move-object/from16 v39, v26

    move-object/from16 v26, v11

    new-instance v5, Lj5j;

    sget-object v6, Lj67;->b:Lj67;

    new-instance v7, Ll57;

    const/16 v11, 0xe

    invoke-direct {v7, v11}, Ll57;-><init>(B)V

    new-instance v11, Lc67;

    invoke-direct {v11, v6, v7}, Lc67;-><init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;)V

    const-string v6, "Squid withdraws"

    const-string v7, "Withdraw to exchange with squid"

    invoke-direct/range {v5 .. v11}, Lj5j;-><init>(Ljava/lang/String;Ljava/lang/String;Li5j;Ldyg;Ljava/lang/Object;Lc67;)V

    move-object/from16 v40, v25

    move-object/from16 v25, v5

    new-instance v5, Lj5j;

    sget-object v6, Lr57;->b:Lr57;

    new-instance v7, Ll57;

    invoke-direct {v7, v3}, Ll57;-><init>(B)V

    new-instance v11, Lc67;

    invoke-direct {v11, v6, v7}, Lc67;-><init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;)V

    const-string v6, "Enable Daimo Apple Pay"

    const-string v7, "Overrides platform and country checks to enable Daimo Apple Pay in the deposit sheet"

    invoke-direct/range {v5 .. v11}, Lj5j;-><init>(Ljava/lang/String;Ljava/lang/String;Li5j;Ldyg;Ljava/lang/Object;Lc67;)V

    move-object/from16 v3, v27

    move-object/from16 v27, v5

    new-instance v11, Lj5j;

    sget-object v5, Lq57;->b:Lq57;

    new-instance v6, Ll57;

    const/16 v7, 0x10

    invoke-direct {v6, v7}, Ll57;-><init>(B)V

    new-instance v7, Lc67;

    invoke-direct {v7, v5, v6}, Lc67;-><init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;)V

    const-string v12, "Dynamic tipping"

    const-string v13, "Use dynamic tip calculation when estimating transaction fees"

    move-object/from16 v17, v7

    move-object v15, v9

    move-object/from16 v16, v29

    invoke-direct/range {v11 .. v17}, Lj5j;-><init>(Ljava/lang/String;Ljava/lang/String;Li5j;Ldyg;Ljava/lang/Object;Lc67;)V

    move-object/from16 v29, v28

    move-object/from16 v28, v11

    sput-object v28, Lo67;->a:Lj5j;

    new-instance v5, Lj5j;

    sget-object v6, Le67;->b:Le67;

    new-instance v7, Ll57;

    const/16 v11, 0x11

    invoke-direct {v7, v11}, Ll57;-><init>(B)V

    new-instance v11, Lc67;

    invoke-direct {v11, v6, v7}, Lc67;-><init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;)V

    const-string v6, "Report to Peek"

    const-string v7, "If enabled, internal stats reports are sent to Peek for inspection"

    invoke-direct/range {v5 .. v11}, Lj5j;-><init>(Ljava/lang/String;Ljava/lang/String;Li5j;Ldyg;Ljava/lang/Object;Lc67;)V

    new-instance v11, Lj5j;

    const-class v6, Lnrk;

    invoke-static {v6}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v6

    new-instance v15, Lk5j;

    invoke-static {}, Lnrk;->values()[Lnrk;

    move-result-object v7

    invoke-static {v7}, Le82;->B([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    invoke-direct {v15, v6, v7}, Lk5j;-><init>(Ls15;Ljava/util/List;)V

    sget-object v6, Lnrk;->a:Lcpj;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v16, Lnrk;->b:Lnrk;

    new-instance v6, Lm57;

    const/4 v7, 0x4

    invoke-direct {v6, v7}, Lm57;-><init>(B)V

    new-instance v7, Ll57;

    const/16 v9, 0x12

    invoke-direct {v7, v9}, Ll57;-><init>(B)V

    new-instance v9, Lc67;

    invoke-direct {v9, v6, v7}, Lc67;-><init>(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;)V

    const-string v12, "Sumsub environment"

    const-string v13, "Select which environment should be used for the Sumsub KYC flow"

    move-object/from16 v17, v9

    invoke-direct/range {v11 .. v17}, Lj5j;-><init>(Ljava/lang/String;Ljava/lang/String;Li5j;Ldyg;Ljava/lang/Object;Lc67;)V

    move-object/from16 v6, v30

    move-object/from16 v30, v11

    move-object v11, v6

    move-object v15, v1

    move-object v12, v3

    move-object v3, v4

    move-object/from16 v13, v29

    move-object/from16 v14, v31

    move-object/from16 v16, v32

    move-object/from16 v17, v33

    move-object/from16 v4, v34

    move-object/from16 v6, v36

    move-object/from16 v7, v37

    move-object/from16 v8, v38

    move-object/from16 v10, v39

    move-object/from16 v9, v40

    move-object v1, v0

    move-object/from16 v29, v5

    move-object/from16 v5, v35

    filled-new-array/range {v1 .. v30}, [Lj5j;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lo67;->b:Ljava/util/List;

    return-void
.end method
