.class public Lcom/leanplum/messagetemplates/OperaSheet;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final DEFAULT_BROWSER_COMMAND:Ljava/lang/String; = "system/default_browser"

.field private static final DEFAULT_BROWSER_SHOW_IN_APP_QUERY:Ljava/lang/String; = "show_inapp"

.field private static final NAME:Ljava/lang/String; = "Sheet"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic a(Landroid/content/Context;Lcom/leanplum/ActionContext;Ljava/lang/String;Lorm;Lskm;Lcom/leanplum/messagetemplates/ResourceWrapper;)V
    .registers 6

    invoke-static/range {p0 .. p5}, Lcom/leanplum/messagetemplates/OperaSheet;->lambda$initializeSheetRequest$3(Landroid/content/Context;Lcom/leanplum/ActionContext;Ljava/lang/String;Lorm;Lskm;Lcom/leanplum/messagetemplates/ResourceWrapper;)V

    return-void
.end method

.method private static addSheetRequest(Lcej;)V
    .registers 3
    .param p0    # Lcej;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {}, Lcom/leanplum/LeanplumActivityHelper;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_19

    const-string v1, "com.opera.android.ui.SHEET_QUEUE_SERVICE"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnej;

    if-eqz v1, :cond_19

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_19

    invoke-virtual {v1, p0}, Lr22;->a(Ljjm;)V

    :cond_19
    return-void
.end method

.method public static synthetic b(Lcom/leanplum/ActionContext;)V
    .registers 1

    invoke-static {p0}, Lcom/leanplum/messagetemplates/OperaSheet;->lambda$createSheetModel$2(Lcom/leanplum/ActionContext;)V

    return-void
.end method

.method public static synthetic c(Lcom/leanplum/ActionContext;Landroid/content/Context;Ljava/lang/String;Lorm;Lskm;)V
    .registers 5

    invoke-static {p0, p1, p2, p3, p4}, Lcom/leanplum/messagetemplates/OperaSheet;->lambda$initializeSheetRequest$2(Lcom/leanplum/ActionContext;Landroid/content/Context;Ljava/lang/String;Lorm;Lskm;)V

    return-void
.end method

.method private static createSheetModel(Landroid/content/Context;Lcom/leanplum/ActionContext;Lcom/leanplum/messagetemplates/ResourceWrapper;Ljava/lang/String;)Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;
    .registers 20
    .param p0    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lcom/leanplum/ActionContext;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/leanplum/messagetemplates/ResourceWrapper;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    move-object/from16 v0, p1

    move-object/from16 v1, p3

    const-string v2, "Title"

    invoke-virtual {v0, v2}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v2, "Message"

    invoke-virtual {v0, v2}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v2, "Full Width Buttons"

    invoke-virtual {v0, v2}, Lcom/leanplum/ActionContext;->booleanNamed(Ljava/lang/String;)Z

    move-result v11

    const-string v2, "Show Close Button"

    invoke-virtual {v0, v2}, Lcom/leanplum/ActionContext;->booleanNamed(Ljava/lang/String;)Z

    move-result v2

    const-string v3, "Primary Text"

    invoke-virtual {v0, v3}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    const-string v5, "Has Secondary Button"

    invoke-virtual {v0, v5}, Lcom/leanplum/ActionContext;->booleanNamed(Ljava/lang/String;)Z

    move-result v5

    const/4 v8, 0x0

    const/4 v9, 0x1

    const-string v10, "Secondary Text"

    if-eqz v5, :cond_3e

    invoke-virtual {v0, v10}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_3e

    move v5, v9

    goto :goto_3f

    :cond_3e
    move v5, v8

    :goto_3f
    if-nez v4, :cond_76

    new-instance v4, Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;

    invoke-virtual {v0, v3}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    new-instance v13, Lvnf;

    invoke-direct {v13, v0, v8}, Lvnf;-><init>(Lcom/leanplum/ActionContext;B)V

    if-eqz v1, :cond_70

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    new-instance v14, Lc37;

    new-instance v15, Lt1;

    const/16 v12, 0xc

    invoke-direct {v15, v8, v12}, Lt1;-><init>(Landroid/content/Context;B)V

    new-instance v8, Lrqd;

    const/16 v12, 0x1a

    invoke-direct {v8, v12}, Lrqd;-><init>(B)V

    invoke-direct {v14, v15, v8}, Lc37;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v14, v1}, Lc37;->A(Ljava/lang/String;)Lz0c;

    move-result-object v8

    if-eqz v8, :cond_70

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    goto :goto_71

    :cond_70
    const/4 v1, 0x0

    :goto_71
    invoke-direct {v4, v3, v13, v1}, Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;-><init>(Ljava/lang/String;Ljava/lang/Runnable;Landroid/net/Uri;)V

    move-object v8, v4

    goto :goto_77

    :cond_76
    const/4 v8, 0x0

    :goto_77
    if-eqz v5, :cond_8a

    new-instance v1, Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;

    invoke-virtual {v0, v10}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lvnf;

    invoke-direct {v4, v0, v9}, Lvnf;-><init>(Lcom/leanplum/ActionContext;B)V

    const/4 v5, 0x0

    invoke-direct {v1, v3, v4, v5}, Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;-><init>(Ljava/lang/String;Ljava/lang/Runnable;Landroid/net/Uri;)V

    move-object v9, v1

    goto :goto_8c

    :cond_8a
    const/4 v5, 0x0

    move-object v9, v5

    :goto_8c
    if-eqz v2, :cond_95

    new-instance v12, Lvnf;

    const/4 v1, 0x2

    invoke-direct {v12, v0, v1}, Lvnf;-><init>(Lcom/leanplum/ActionContext;B)V

    goto :goto_96

    :cond_95
    move-object v12, v5

    :goto_96
    new-instance v3, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;

    sget-object v4, Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;->OPERA_SHEET:Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;

    invoke-virtual {v0}, Lcom/leanplum/internal/BaseActionContext;->getMessageId()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v10, p2

    invoke-direct/range {v3 .. v12}, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;-><init>(Lcom/leanplum/messagetemplates/OperaSheetRequest$SheetType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;Lcom/leanplum/messagetemplates/OperaSheetRequest$Button;Lcom/leanplum/messagetemplates/ResourceWrapper;ZLjava/lang/Runnable;)V

    return-object v3
.end method

.method public static synthetic d(Lorm;Lskm;Lcom/leanplum/ActionContext;Ltw7;)V
    .registers 4

    invoke-static {p0, p1, p2, p3}, Lcom/leanplum/messagetemplates/OperaSheet;->lambda$initializeSheetRequest$4(Lorm;Lskm;Lcom/leanplum/ActionContext;Ltw7;)V

    return-void
.end method

.method public static synthetic e(Lcom/leanplum/ActionContext;Landroid/content/Context;Lx5f;Lx5f;Ltw7;)V
    .registers 5

    invoke-static {p0, p1, p2, p3, p4}, Lcom/leanplum/messagetemplates/OperaSheet;->lambda$initializeSheetRequest$0(Lcom/leanplum/ActionContext;Landroid/content/Context;Lorm;Lskm;Ltw7;)V

    return-void
.end method

.method public static synthetic f(Lcom/leanplum/ActionContext;)V
    .registers 1

    invoke-static {p0}, Lcom/leanplum/messagetemplates/OperaSheet;->lambda$createSheetModel$1(Lcom/leanplum/ActionContext;)V

    return-void
.end method

.method public static synthetic g(Lcom/leanplum/ActionContext;)V
    .registers 1

    invoke-static {p0}, Lcom/leanplum/messagetemplates/OperaSheet;->lambda$createSheetModel$0(Lcom/leanplum/ActionContext;)V

    return-void
.end method

.method private static getResourceFromStream(Lcom/leanplum/ActionContext;Z)Lcom/leanplum/messagetemplates/ResourceWrapper;
    .registers 3
    .param p0    # Lcom/leanplum/ActionContext;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    if-eqz p1, :cond_5

    const-string v0, "Lottie Animation File"

    goto :goto_7

    :cond_5
    const-string v0, "Hero Image"

    :goto_7
    invoke-virtual {p0, v0}, Lcom/leanplum/ActionContext;->streamNamed(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p0

    invoke-static {p0, p1}, Lcom/leanplum/messagetemplates/ResourceWrapper;->getResourceFromInputStream(Ljava/io/InputStream;Z)Lcom/leanplum/messagetemplates/ResourceWrapper;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic h(Lcom/leanplum/ActionContext;Z)Lcom/leanplum/messagetemplates/ResourceWrapper;
    .registers 2

    invoke-static {p0, p1}, Lcom/leanplum/messagetemplates/OperaSheet;->getResourceFromStream(Lcom/leanplum/ActionContext;Z)Lcom/leanplum/messagetemplates/ResourceWrapper;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic i(Landroid/content/Context;Lcom/leanplum/ActionContext;)V
    .registers 2

    invoke-static {p0, p1}, Lcom/leanplum/messagetemplates/OperaSheet;->initializeSheetRequest(Landroid/content/Context;Lcom/leanplum/ActionContext;)V

    return-void
.end method

.method private static initializeSheetRequest(Landroid/content/Context;Lcom/leanplum/ActionContext;)V
    .registers 9
    .param p0    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lcom/leanplum/ActionContext;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v4, v0, Ld6j;->c:Lx5f;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v5, v0, Ld6j;->d:Lx5f;

    new-instance v1, Lxx1;

    const/4 v6, 0x6

    move-object v3, p0

    move-object v2, p1

    invoke-direct/range {v1 .. v6}, Lxx1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    const-string p0, "Primary Action"

    invoke-static {v3, v2, p0, v1}, Lcom/leanplum/messagetemplates/UtilsKt;->validateActionUrl(Landroid/content/Context;Lcom/leanplum/ActionContext;Ljava/lang/String;Lcom/opera/api/Callback;)V

    return-void
.end method

.method private static invokeDefaultBrowserDirectly(Lcom/leanplum/ActionContext;Lorm;Ljava/lang/Runnable;Ljava/lang/String;)V
    .registers 5
    .param p0    # Lcom/leanplum/ActionContext;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lorm;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Runnable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {}, Lcom/leanplum/LeanplumActivityHelper;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_b

    invoke-static {v0}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object v0

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    if-nez v0, :cond_1c

    invoke-virtual {p0}, Lcom/leanplum/internal/BaseActionContext;->getMessageId()Ljava/lang/String;

    move-result-object p0

    check-cast p1, Lx5f;

    const-string p2, "No BrowserActivity available"

    sget-object p3, Leg0;->f:Leg0;

    invoke-virtual {p1, p2, p3, p0}, Lx5f;->p0(Ljava/lang/String;Leg0;Ljava/lang/String;)V

    return-void

    :cond_1c
    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->y0()Lmm6;

    move-result-object p0

    invoke-virtual {p0, p3, p2}, Lmm6;->b(Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method private static synthetic lambda$createSheetModel$0(Lcom/leanplum/ActionContext;)V
    .registers 2

    const-string v0, "Primary Action"

    invoke-virtual {p0, v0}, Lcom/leanplum/ActionContext;->runTrackedActionNamed(Ljava/lang/String;)V

    return-void
.end method

.method private static synthetic lambda$createSheetModel$1(Lcom/leanplum/ActionContext;)V
    .registers 2

    const-string v0, "Secondary Action"

    invoke-virtual {p0, v0}, Lcom/leanplum/ActionContext;->runTrackedActionNamed(Ljava/lang/String;)V

    return-void
.end method

.method private static synthetic lambda$createSheetModel$2(Lcom/leanplum/ActionContext;)V
    .registers 5

    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    const-string v3, "CloseX"

    invoke-virtual {p0, v3, v0, v1, v2}, Lcom/leanplum/ActionContext;->track(Ljava/lang/String;DLjava/util/Map;)V

    return-void
.end method

.method private static lambda$initializeSheetRequest$0(Lcom/leanplum/ActionContext;Landroid/content/Context;Lorm;Lskm;Ltw7;)V
    .registers 6

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of v0, p4, Lrw7;

    if-eqz v0, :cond_11

    check-cast p4, Lrw7;

    iget-object p1, p4, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Lcom/leanplum/messagetemplates/DiscardInfo;

    invoke-static {p2, p0, p1}, Lcom/leanplum/messagetemplates/OperaSheet;->lambda$initializeSheetRequest$7(Lorm;Lcom/leanplum/ActionContext;Lcom/leanplum/messagetemplates/DiscardInfo;)Ljava/lang/Object;

    return-void

    :cond_11
    instance-of v0, p4, Lsw7;

    if-eqz v0, :cond_1f

    check-cast p4, Lsw7;

    iget-object p4, p4, Lsw7;->a:Ljava/lang/Object;

    check-cast p4, Ljava/lang/String;

    invoke-static {p0, p1, p2, p3, p4}, Lcom/leanplum/messagetemplates/OperaSheet;->lambda$initializeSheetRequest$1(Lcom/leanplum/ActionContext;Landroid/content/Context;Lorm;Lskm;Ljava/lang/String;)Ljava/lang/Object;

    return-void

    :cond_1f
    invoke-static {}, Lh9o;->p()V

    return-void
.end method

.method private static synthetic lambda$initializeSheetRequest$1(Lcom/leanplum/ActionContext;Landroid/content/Context;Lorm;Lskm;Ljava/lang/String;)Ljava/lang/Object;
    .registers 12

    new-instance v0, Li61;

    const/4 v6, 0x4

    move-object v1, p0

    move-object v2, p1

    move-object v4, p2

    move-object v5, p3

    move-object v3, p4

    invoke-direct/range {v0 .. v6}, Li61;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v2, v3}, Lcom/leanplum/messagetemplates/OperaSheet;->shouldBypassSheetForDefaultBrowser(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p0

    const/4 p1, 0x0

    if-eqz p0, :cond_16

    invoke-static {v1, v4, v0, v3}, Lcom/leanplum/messagetemplates/OperaSheet;->invokeDefaultBrowserDirectly(Lcom/leanplum/ActionContext;Lorm;Ljava/lang/Runnable;Ljava/lang/String;)V

    return-object p1

    :cond_16
    invoke-virtual {v0}, Li61;->run()V

    return-object p1
.end method

.method private static synthetic lambda$initializeSheetRequest$2(Lcom/leanplum/ActionContext;Landroid/content/Context;Ljava/lang/String;Lorm;Lskm;)V
    .registers 12

    new-instance v0, Lay1;

    const/4 v6, 0x2

    move-object v2, p0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v6}, Lay1;-><init>(Landroid/content/Context;Ljava/lang/Comparable;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v2, v0}, Lcom/leanplum/messagetemplates/OperaSheet;->loadResource(Lcom/leanplum/ActionContext;Lcom/opera/api/Callback;)V

    return-void
.end method

.method private static synthetic lambda$initializeSheetRequest$3(Landroid/content/Context;Lcom/leanplum/ActionContext;Ljava/lang/String;Lorm;Lskm;Lcom/leanplum/messagetemplates/ResourceWrapper;)V
    .registers 6

    invoke-static {p0, p1, p5, p2}, Lcom/leanplum/messagetemplates/OperaSheet;->createSheetModel(Landroid/content/Context;Lcom/leanplum/ActionContext;Lcom/leanplum/messagetemplates/ResourceWrapper;Ljava/lang/String;)Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;

    move-result-object p0

    new-instance p2, Lwnf;

    const/4 p5, 0x0

    invoke-direct {p2, p3, p4, p1, p5}, Lwnf;-><init>(Lorm;Lskm;Lcom/leanplum/ActionContext;B)V

    invoke-static {p0, p2}, Lcom/leanplum/messagetemplates/UtilsKt;->performStringSubstitution(Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;Lcom/opera/api/Callback;)V

    return-void
.end method

.method private static lambda$initializeSheetRequest$4(Lorm;Lskm;Lcom/leanplum/ActionContext;Ltw7;)V
    .registers 5

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of v0, p3, Lrw7;

    if-eqz v0, :cond_11

    check-cast p3, Lrw7;

    iget-object p1, p3, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Lcom/leanplum/messagetemplates/DiscardInfo;

    invoke-static {p0, p2, p1}, Lcom/leanplum/messagetemplates/OperaSheet;->lambda$initializeSheetRequest$6(Lorm;Lcom/leanplum/ActionContext;Lcom/leanplum/messagetemplates/DiscardInfo;)Ljava/lang/Object;

    return-void

    :cond_11
    instance-of p2, p3, Lsw7;

    if-eqz p2, :cond_1f

    check-cast p3, Lsw7;

    iget-object p2, p3, Lsw7;->a:Ljava/lang/Object;

    check-cast p2, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;

    invoke-static {p0, p1, p2}, Lcom/leanplum/messagetemplates/OperaSheet;->lambda$initializeSheetRequest$5(Lorm;Lskm;Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;)Ljava/lang/Object;

    return-void

    :cond_1f
    invoke-static {}, Lh9o;->p()V

    return-void
.end method

.method private static synthetic lambda$initializeSheetRequest$5(Lorm;Lskm;Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;)Ljava/lang/Object;
    .registers 4

    new-instance v0, Lcom/leanplum/messagetemplates/OperaSheetRequest;

    invoke-direct {v0, p2, p0, p1}, Lcom/leanplum/messagetemplates/OperaSheetRequest;-><init>(Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;Lorm;Lskm;)V

    invoke-static {v0}, Lcom/leanplum/messagetemplates/OperaSheet;->addSheetRequest(Lcej;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method private static synthetic lambda$initializeSheetRequest$6(Lorm;Lcom/leanplum/ActionContext;Lcom/leanplum/messagetemplates/DiscardInfo;)Ljava/lang/Object;
    .registers 4

    iget-object v0, p2, Lcom/leanplum/messagetemplates/DiscardInfo;->message:Ljava/lang/String;

    iget-object p2, p2, Lcom/leanplum/messagetemplates/DiscardInfo;->reason:Leg0;

    invoke-virtual {p1}, Lcom/leanplum/internal/BaseActionContext;->getMessageId()Ljava/lang/String;

    move-result-object p1

    check-cast p0, Lx5f;

    invoke-virtual {p0, v0, p2, p1}, Lx5f;->p0(Ljava/lang/String;Leg0;Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method private static synthetic lambda$initializeSheetRequest$7(Lorm;Lcom/leanplum/ActionContext;Lcom/leanplum/messagetemplates/DiscardInfo;)Ljava/lang/Object;
    .registers 4

    iget-object v0, p2, Lcom/leanplum/messagetemplates/DiscardInfo;->message:Ljava/lang/String;

    iget-object p2, p2, Lcom/leanplum/messagetemplates/DiscardInfo;->reason:Leg0;

    invoke-virtual {p1}, Lcom/leanplum/internal/BaseActionContext;->getMessageId()Ljava/lang/String;

    move-result-object p1

    check-cast p0, Lx5f;

    invoke-virtual {p0, v0, p2, p1}, Lx5f;->p0(Ljava/lang/String;Leg0;Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method private static loadResource(Lcom/leanplum/ActionContext;Lcom/opera/api/Callback;)V
    .registers 7
    .param p0    # Lcom/leanplum/ActionContext;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lcom/opera/api/Callback;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ThreadConstraint"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/leanplum/ActionContext;",
            "Lcom/opera/api/Callback;",
            ")V"
        }
    .end annotation

    const-string v0, "Lottie Animation File"

    invoke-virtual {p0, v0}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x0

    const-string v3, "None"

    if-nez v1, :cond_1b

    invoke-virtual {p0, v0}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1b

    const/4 v0, 0x1

    goto :goto_1c

    :cond_1b
    move v0, v2

    :goto_1c
    const-string v1, "Hero Image"

    invoke-virtual {p0, v1}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_32

    invoke-virtual {p0, v1}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_34

    :cond_32
    if-eqz v0, :cond_49

    :cond_34
    new-instance v1, Lcom/leanplum/messagetemplates/OperaSheet$1;

    invoke-direct {v1, p0, v0, p1}, Lcom/leanplum/messagetemplates/OperaSheet$1;-><init>(Lcom/leanplum/ActionContext;ZLcom/opera/api/Callback;)V

    new-array v2, v2, [Ljava/lang/Void;

    invoke-static {v1, v2}, Lhe2;->a(Landroid/os/AsyncTask;[Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_48

    invoke-static {p0, v0}, Lcom/leanplum/messagetemplates/OperaSheet;->getResourceFromStream(Lcom/leanplum/ActionContext;Z)Lcom/leanplum/messagetemplates/ResourceWrapper;

    move-result-object p0

    invoke-interface {p1, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :cond_48
    return-void

    :cond_49
    sget-object p0, Lcom/leanplum/messagetemplates/ResourceWrapper;->EMPTY:Lcom/leanplum/messagetemplates/ResourceWrapper;

    invoke-interface {p1, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public static register(Landroid/content/Context;)V
    .registers 4
    .param p0    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lcom/leanplum/ActionArgs;

    invoke-direct {v0}, Lcom/leanplum/ActionArgs;-><init>()V

    const-string v1, "Title"

    invoke-static {p0}, Lcom/leanplum/internal/Util;->getApplicationName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/leanplum/ActionArgs;->with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;

    move-result-object v0

    const-string v1, "Message"

    const-string v2, "Confirmation message goes here."

    invoke-virtual {v0, v1, v2}, Lcom/leanplum/ActionArgs;->with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;

    move-result-object v0

    const-string v1, "Primary Text"

    const-string v2, "OK"

    invoke-virtual {v0, v1, v2}, Lcom/leanplum/ActionArgs;->with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    const-string v2, "Has Secondary Button"

    invoke-virtual {v0, v2, v1}, Lcom/leanplum/ActionArgs;->with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;

    move-result-object v0

    const-string v2, "Full Width Buttons"

    invoke-virtual {v0, v2, v1}, Lcom/leanplum/ActionArgs;->with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;

    move-result-object v0

    const-string v2, "Show Close Button"

    invoke-virtual {v0, v2, v1}, Lcom/leanplum/ActionArgs;->with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;

    move-result-object v0

    const-string v1, "Secondary Text"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lcom/leanplum/ActionArgs;->with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;

    move-result-object v0

    const-string v1, "Hero Image"

    invoke-virtual {v0, v1, v2}, Lcom/leanplum/ActionArgs;->withFile(Ljava/lang/String;Ljava/lang/String;)Lcom/leanplum/ActionArgs;

    move-result-object v0

    const-string v1, "Lottie Animation File"

    invoke-virtual {v0, v1, v2}, Lcom/leanplum/ActionArgs;->withFile(Ljava/lang/String;Ljava/lang/String;)Lcom/leanplum/ActionArgs;

    move-result-object v0

    const-string v1, "Primary Action"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/leanplum/ActionArgs;->withAction(Ljava/lang/String;Ljava/lang/String;)Lcom/leanplum/ActionArgs;

    move-result-object v0

    const-string v1, "Secondary Action"

    invoke-virtual {v0, v1, v2}, Lcom/leanplum/ActionArgs;->withAction(Ljava/lang/String;Ljava/lang/String;)Lcom/leanplum/ActionArgs;

    move-result-object v0

    new-instance v1, Lcom/leanplum/messagetemplates/OperaSheet$2;

    invoke-direct {v1, p0}, Lcom/leanplum/messagetemplates/OperaSheet$2;-><init>(Landroid/content/Context;)V

    const-string p0, "Sheet"

    const/4 v2, 0x3

    invoke-static {p0, v2, v0, v1}, Lcom/leanplum/Leanplum;->defineAction(Ljava/lang/String;ILcom/leanplum/ActionArgs;Lcom/leanplum/callbacks/ActionCallback;)V

    return-void
.end method

.method private static shouldBypassSheetForDefaultBrowser(Landroid/content/Context;Ljava/lang/String;)Z
    .registers 5
    .param p0    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const-string v0, "show_inapp"

    if-eqz p1, :cond_3f

    :try_start_4
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-static {p1}, Li8f;->a(Landroid/net/Uri;)Li8f;

    move-result-object p1

    iget-object v1, p1, Li8f;->b:Ll1b;

    const-string v2, "system/default_browser"

    iget-object p1, p1, Li8f;->a:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3f

    invoke-virtual {v1, v0}, Ll1b;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2a

    invoke-virtual {v1, v0}, Ll1b;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result p1
    :try_end_28
    .catch Lgva; {:try_start_4 .. :try_end_28} :catch_3f

    if-nez p1, :cond_3f

    :cond_2a
    new-instance p1, Lyl6;

    sget-object v0, Lvml;->d:Lumi;

    invoke-direct {p1, p0, v0}, Lyl6;-><init>(Landroid/content/Context;Lumi;)V

    invoke-virtual {p1}, Lyl6;->c()Z

    move-result p0

    if-eqz p0, :cond_3f

    invoke-virtual {p1}, Lyl6;->f()Z

    move-result p0

    if-nez p0, :cond_3f

    const/4 p0, 0x1

    return p0

    :catch_3f
    :cond_3f
    const/4 p0, 0x0

    return p0
.end method
