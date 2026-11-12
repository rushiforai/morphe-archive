.class public final Lcom/leanplum/messagetemplates/UtilsKt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/leanplum/messagetemplates/UtilsKt$WhenMappings;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000>\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\"\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u001a\u001b\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00030\u00022\u0006\u0010\u0001\u001a\u00020\u0000\u00a2\u0006\u0004\u0008\u0004\u0010\u0005\u001a!\u0010\u0008\u001a\u0004\u0018\u00010\u00072\u0006\u0010\u0001\u001a\u00020\u00002\u0006\u0010\u0006\u001a\u00020\u0003H\u0000\u00a2\u0006\u0004\u0008\u0008\u0010\t\u001a1\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u000b\u001a\u00020\n2\u0018\u0010\u000f\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\n\u0012\u0004\u0012\u00020\u000e0\r0\u000cH\u0000\u00a2\u0006\u0004\u0008\u0011\u0010\u0012\u001aC\u0010\u0015\u001a\u00020\u00102\u0006\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u0001\u001a\u00020\u00002\u0006\u0010\u0006\u001a\u00020\u00032\u001a\u0010\u000f\u001a\u0016\u0012\u0012\u0012\u0010\u0012\u0006\u0012\u0004\u0018\u00010\u0003\u0012\u0004\u0012\u00020\u000e0\r0\u000cH\u0000\u00a2\u0006\u0004\u0008\u0015\u0010\u0016\u001a6\u0010\u0017\u001a\u0010\u0012\u0006\u0012\u0004\u0018\u00010\u0003\u0012\u0004\u0012\u00020\u000e0\r2\u0006\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u0001\u001a\u00020\u00002\u0006\u0010\u0006\u001a\u00020\u0003H\u0082@\u00a2\u0006\u0004\u0008\u0017\u0010\u0018\u001a!\u0010\u0019\u001a\u0004\u0018\u00010\u00032\u0006\u0010\u0001\u001a\u00020\u00002\u0006\u0010\u0006\u001a\u00020\u0003H\u0000\u00a2\u0006\u0004\u0008\u0019\u0010\u001a\u00a8\u0006\u001b"
    }
    d2 = {
        "Lcom/leanplum/ActionContext;",
        "actionContext",
        "",
        "",
        "getCategories",
        "(Lcom/leanplum/ActionContext;)Ljava/util/Set;",
        "name",
        "Landroid/net/Uri;",
        "getFileUri",
        "(Lcom/leanplum/ActionContext;Ljava/lang/String;)Landroid/net/Uri;",
        "Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;",
        "model",
        "Lcom/opera/api/Callback;",
        "Ltw7;",
        "Lcom/leanplum/messagetemplates/DiscardInfo;",
        "callback",
        "",
        "performStringSubstitution",
        "(Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;Lcom/opera/api/Callback;)V",
        "Landroid/content/Context;",
        "context",
        "validateActionUrl",
        "(Landroid/content/Context;Lcom/leanplum/ActionContext;Ljava/lang/String;Lcom/opera/api/Callback;)V",
        "validateActionUrlInternal",
        "(Landroid/content/Context;Lcom/leanplum/ActionContext;Ljava/lang/String;Lmt5;)Ljava/lang/Object;",
        "getActionUrl",
        "(Lcom/leanplum/ActionContext;Ljava/lang/String;)Ljava/lang/String;",
        "app"
    }
    k = 0x2
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static synthetic a(Lcom/opera/api/Callback;Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;Lex1;)V
    .registers 3

    invoke-static {p0, p1, p2}, Lcom/leanplum/messagetemplates/UtilsKt;->performStringSubstitution$lambda$0(Lcom/opera/api/Callback;Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;Lex1;)V

    return-void
.end method

.method public static final synthetic access$validateActionUrlInternal(Landroid/content/Context;Lcom/leanplum/ActionContext;Ljava/lang/String;Lmt5;)Ljava/lang/Object;
    .registers 4

    invoke-static {p0, p1, p2, p3}, Lcom/leanplum/messagetemplates/UtilsKt;->validateActionUrlInternal(Landroid/content/Context;Lcom/leanplum/ActionContext;Ljava/lang/String;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static final getActionUrl(Lcom/leanplum/ActionContext;Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0    # Lcom/leanplum/ActionContext;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-virtual {p0, p1}, Lcom/leanplum/ActionContext;->objectNamed(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    instance-of p1, p0, Ljava/util/Map;

    const/4 v0, 0x0

    if-nez p1, :cond_a

    return-object v0

    :cond_a
    check-cast p0, Ljava/util/Map;

    const-string p1, "URL"

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    instance-of p1, p0, Ljava/lang/String;

    if-eqz p1, :cond_19

    check-cast p0, Ljava/lang/String;

    return-object p0

    :cond_19
    return-object v0
.end method

.method public static final getCategories(Lcom/leanplum/ActionContext;)Ljava/util/Set;
    .registers 3
    .param p0    # Lcom/leanplum/ActionContext;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/leanplum/ActionContext;",
            ")",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    invoke-static {}, Lcom/leanplum/Leanplum;->messageMetadata()Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p0}, Lcom/leanplum/internal/BaseActionContext;->getMessageId()Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    instance-of v0, p0, Ljava/util/Map;

    const/4 v1, 0x0

    if-eqz v0, :cond_14

    check-cast p0, Ljava/util/Map;

    goto :goto_15

    :cond_14
    move-object p0, v1

    :goto_15
    if-nez p0, :cond_1a

    sget-object p0, Lv08;->a:Lv08;

    return-object p0

    :cond_1a
    const-string v0, "inappCategories"

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    instance-of v0, p0, Ljava/lang/String;

    if-eqz v0, :cond_27

    move-object v1, p0

    check-cast v1, Ljava/lang/String;

    :cond_27
    if-eqz v1, :cond_47

    const-string p0, ","

    filled-new-array {p0}, [Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lkotlin/text/StringsKt;->Z(Ljava/lang/String;[Ljava/lang/String;)Lm2m;

    move-result-object p0

    sget-object v0, Lcom/leanplum/messagetemplates/UtilsKt$getCategories$1;->INSTANCE:Lcom/leanplum/messagetemplates/UtilsKt$getCategories$1;

    new-instance v1, Lm2m;

    invoke-direct {v1, p0, v0}, Lm2m;-><init>(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)V

    sget-object p0, Lcom/leanplum/messagetemplates/UtilsKt$getCategories$2;->INSTANCE:Lcom/leanplum/messagetemplates/UtilsKt$getCategories$2;

    invoke-static {v1, p0}, Ly1j;->c(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)Lv39;

    move-result-object p0

    invoke-static {p0}, Ly1j;->h(Lkotlin/sequences/Sequence;)Ljava/util/Set;

    move-result-object p0

    if-eqz p0, :cond_47

    return-object p0

    :cond_47
    sget-object p0, Lv08;->a:Lv08;

    return-object p0
.end method

.method public static final getFileUri(Lcom/leanplum/ActionContext;Ljava/lang/String;)Landroid/net/Uri;
    .registers 3
    .param p0    # Lcom/leanplum/ActionContext;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-virtual {p0, p1}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x0

    if-eqz p0, :cond_22

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-eqz v0, :cond_22

    invoke-static {p0}, Lcom/leanplum/ActionContext;->filePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/leanplum/internal/FileManager;->fileExistsAtPath(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_18

    return-object p1

    :cond_18
    new-instance p1, Ljava/io/File;

    invoke-direct {p1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p0

    return-object p0

    :cond_22
    return-object p1
.end method

.method public static final performStringSubstitution(Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;Lcom/opera/api/Callback;)V
    .registers 9
    .param p0    # Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Lcom/opera/api/Callback;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;",
            "Lcom/opera/api/Callback;",
            ")V"
        }
    .end annotation

    sget-object v1, Leg0;->d:Leg0;

    :try_start_2
    iget-object v0, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->title:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {v2, v0}, Lrii;->l(ILjava/lang/CharSequence;)Lo1;

    move-result-object v3

    const/4 v4, 0x1

    if-nez v3, :cond_e

    move v0, v2

    goto :goto_1b

    :cond_e
    :goto_e
    if-eqz v3, :cond_1a

    iget v5, v3, Lo1;->c:I

    iget v3, v3, Lo1;->d:I

    add-int/2addr v5, v3

    invoke-static {v5, v0}, Lrii;->l(ILjava/lang/CharSequence;)Lo1;

    move-result-object v3

    goto :goto_e

    :cond_1a
    move v0, v4

    :goto_1b
    if-nez v0, :cond_3d

    iget-object v0, p0, Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;->message:Ljava/lang/String;

    invoke-static {v2, v0}, Lrii;->l(ILjava/lang/CharSequence;)Lo1;

    move-result-object v3

    if-eqz v3, :cond_32

    :goto_25
    if-eqz v3, :cond_31

    iget v2, v3, Lo1;->c:I

    iget v3, v3, Lo1;->d:I

    add-int/2addr v2, v3

    invoke-static {v2, v0}, Lrii;->l(ILjava/lang/CharSequence;)Lo1;

    move-result-object v3
    :try_end_30
    .catch Leel; {:try_start_2 .. :try_end_30} :catch_94

    goto :goto_25

    :cond_31
    move v2, v4

    :cond_32
    if-nez v2, :cond_3d

    new-instance v0, Lsw7;

    invoke-direct {v0, p0}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-interface {p1, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_3d
    invoke-static {}, Lcom/leanplum/LeanplumActivityHelper;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    instance-of v2, v0, Lcom/opera/android/BrowserActivity;

    if-nez v2, :cond_55

    new-instance p0, Lcom/leanplum/messagetemplates/DiscardInfo;

    const-string v0, "Invalid activity"

    invoke-direct {p0, v0, v1}, Lcom/leanplum/messagetemplates/DiscardInfo;-><init>(Ljava/lang/String;Leg0;)V

    new-instance v0, Lrw7;

    invoke-direct {v0, p0}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-interface {p1, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_55
    check-cast v0, Lcom/opera/android/BrowserActivity;

    iget-object v0, v0, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object v0, v0, Ltw3;->a:Lhx3;

    invoke-virtual {v0}, Lhx3;->y()Lcom/opera/android/Lazy;

    move-result-object v0

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfmk;

    new-instance v1, Liyk;

    const/4 v2, 0x6

    invoke-direct {v1, p1, p0, v2}, Liyk;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    sget-object p0, Lvml;->d:Lumi;

    new-instance p1, Lhz;

    invoke-direct {p1}, Lhz;-><init>()V

    iput-object v1, p1, Lhz;->b:Ljava/lang/Object;

    new-instance v1, Lqlk;

    invoke-direct {v1, p1, v4}, Lqlk;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p0, v1}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    new-instance v1, Loml;

    invoke-direct {v1, p0}, Loml;-><init>(Lnml;)V

    const/4 v2, 0x0

    const/4 v6, 0x0

    const-wide/16 v3, 0x5

    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v1 .. v6}, Loml;->b(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljri;)V

    iget-object p0, v0, Lfmk;->d:Ljava/util/HashSet;

    invoke-virtual {p0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Lfmk;->b()V

    return-void

    :catch_94
    move-exception v0

    move-object p0, v0

    new-instance v0, Lcom/leanplum/messagetemplates/DiscardInfo;

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0, v1}, Lcom/leanplum/messagetemplates/DiscardInfo;-><init>(Ljava/lang/String;Leg0;)V

    new-instance p0, Lrw7;

    invoke-direct {p0, v0}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-interface {p1, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method private static final performStringSubstitution$lambda$0(Lcom/opera/api/Callback;Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;Lex1;)V
    .registers 4

    new-instance v0, Lcom/leanplum/messagetemplates/UtilsKt$performStringSubstitution$1$1;

    invoke-direct {v0, p0, p1}, Lcom/leanplum/messagetemplates/UtilsKt$performStringSubstitution$1$1;-><init>(Lcom/opera/api/Callback;Lcom/leanplum/messagetemplates/OperaSheetRequest$Model;)V

    iget-object p0, p2, Lk8;->a:Ljava/lang/Object;

    iget-object p1, p2, Lk8;->b:Ljava/lang/Object;

    check-cast p1, Lix1;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_1b

    const/4 p2, 0x1

    if-eq p1, p2, :cond_15

    return-void

    :cond_15
    check-cast p0, Lfx1;

    invoke-interface {v0, p0}, Lgx1;->handleArgumentLookupResult(Lfx1;)V

    return-void

    :cond_1b
    check-cast p0, Lhx1;

    invoke-interface {v0, p0}, Lgx1;->handleArgumentLookupResult(Lhx1;)V

    return-void
.end method

.method public static final validateActionUrl(Landroid/content/Context;Lcom/leanplum/ActionContext;Ljava/lang/String;Lcom/opera/api/Callback;)V
    .registers 11
    .param p0    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Lcom/leanplum/ActionContext;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lcom/opera/api/Callback;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/leanplum/ActionContext;",
            "Ljava/lang/String;",
            "Lcom/opera/api/Callback;",
            ")V"
        }
    .end annotation

    invoke-static {}, Lcom/leanplum/LeanplumActivityHelper;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    instance-of v1, v0, Lcom/opera/android/BrowserActivity;

    if-nez v1, :cond_1a

    new-instance p0, Lcom/leanplum/messagetemplates/DiscardInfo;

    const-string p1, "Invalid activity"

    sget-object p2, Leg0;->f:Leg0;

    invoke-direct {p0, p1, p2}, Lcom/leanplum/messagetemplates/DiscardInfo;-><init>(Ljava/lang/String;Leg0;)V

    new-instance p1, Lrw7;

    invoke-direct {p1, p0}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-interface {p3, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_1a
    check-cast v0, Lndc;

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v0

    invoke-static {v0}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object v0

    new-instance v1, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrl$1;

    const/4 v6, 0x0

    move-object v3, p0

    move-object v4, p1

    move-object v5, p2

    move-object v2, p3

    invoke-direct/range {v1 .. v6}, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrl$1;-><init>(Lcom/opera/api/Callback;Landroid/content/Context;Lcom/leanplum/ActionContext;Ljava/lang/String;Lmt5;)V

    const/4 p0, 0x3

    const/4 p1, 0x0

    invoke-static {v0, p1, p1, v1, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void
.end method

.method private static final validateActionUrlInternal(Landroid/content/Context;Lcom/leanplum/ActionContext;Ljava/lang/String;Lmt5;)Ljava/lang/Object;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/leanplum/ActionContext;",
            "Ljava/lang/String;",
            "Lmt5<",
            "-",
            "Ltw7;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    instance-of v0, p3, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrlInternal$1;

    if-eqz v0, :cond_13

    move-object v0, p3

    check-cast v0, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrlInternal$1;

    iget v1, v0, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrlInternal$1;->label:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrlInternal$1;->label:I

    goto :goto_18

    :cond_13
    new-instance v0, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrlInternal$1;

    invoke-direct {v0, p3}, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrlInternal$1;-><init>(Lmt5;)V

    :goto_18
    iget-object p3, v0, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrlInternal$1;->result:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrlInternal$1;->label:I

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_3e

    if-ne v2, v3, :cond_38

    iget-object p0, v0, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrlInternal$1;->L$3:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    iget-object p1, v0, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrlInternal$1;->L$2:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    iget-object p1, v0, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrlInternal$1;->L$1:Ljava/lang/Object;

    check-cast p1, Lcom/leanplum/ActionContext;

    iget-object p1, v0, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrlInternal$1;->L$0:Ljava/lang/Object;

    check-cast p1, Landroid/content/Context;

    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_6b

    :cond_38
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v4

    :cond_3e
    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    invoke-static {p1, p2}, Lcom/leanplum/messagetemplates/UtilsKt;->getActionUrl(Lcom/leanplum/ActionContext;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_4d

    new-instance p0, Lsw7;

    invoke-direct {p0, v4}, Lsw7;-><init>(Ljava/lang/Object;)V

    return-object p0

    :cond_4d
    invoke-static {p1}, Lwqm;->s(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_9a

    sget-object p2, Llk6;->a:Llk6;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p3

    iput-object v4, v0, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrlInternal$1;->L$0:Ljava/lang/Object;

    iput-object v4, v0, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrlInternal$1;->L$1:Ljava/lang/Object;

    iput-object v4, v0, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrlInternal$1;->L$2:Ljava/lang/Object;

    iput-object p1, v0, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrlInternal$1;->L$3:Ljava/lang/Object;

    iput v3, v0, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrlInternal$1;->label:I

    invoke-virtual {p2, p3, p0, v0}, Llk6;->d(Landroid/net/Uri;Landroid/content/Context;Lnt5;)Ljava/lang/Enum;

    move-result-object p3

    if-ne p3, v1, :cond_6a

    return-object v1

    :cond_6a
    move-object p0, p1

    :goto_6b
    check-cast p3, Ljk6;

    invoke-virtual {p3}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_99

    if-eq p1, v3, :cond_8c

    const/4 p2, 0x2

    if-eq p1, p2, :cond_7f

    const/4 p2, 0x3

    if-eq p1, p2, :cond_8c

    invoke-static {}, Lh9o;->p()V

    return-object v4

    :cond_7f
    new-instance p1, Lcom/leanplum/messagetemplates/DiscardInfo;

    sget-object p2, Leg0;->c:Leg0;

    invoke-direct {p1, p0, p2}, Lcom/leanplum/messagetemplates/DiscardInfo;-><init>(Ljava/lang/String;Leg0;)V

    new-instance p0, Lrw7;

    invoke-direct {p0, p1}, Lrw7;-><init>(Ljava/lang/Object;)V

    return-object p0

    :cond_8c
    new-instance p1, Lcom/leanplum/messagetemplates/DiscardInfo;

    sget-object p2, Leg0;->b:Leg0;

    invoke-direct {p1, p0, p2}, Lcom/leanplum/messagetemplates/DiscardInfo;-><init>(Ljava/lang/String;Leg0;)V

    new-instance p0, Lrw7;

    invoke-direct {p0, p1}, Lrw7;-><init>(Ljava/lang/Object;)V

    return-object p0

    :cond_99
    move-object p1, p0

    :cond_9a
    new-instance p0, Lsw7;

    invoke-direct {p0, p1}, Lsw7;-><init>(Ljava/lang/Object;)V

    return-object p0
.end method
