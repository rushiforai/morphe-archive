.class public final Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;
.super Lyf5;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Button;,
        Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0010\t\n\u0002\u0008\u0005\u0008\u0001\u0018\u00002\u00020\u0001:\u0002\u0017\u0018B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0019\u0010\u000b\u001a\u00020\n2\u0008\u0010\t\u001a\u0004\u0018\u00010\u0008H\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0017\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u000e\u001a\u00020\rH\u0017\u00a2\u0006\u0004\u0008\u0010\u0010\u0011R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0003\u0010\u0012R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0005\u0010\u0013R\u0014\u0010\u0015\u001a\u00020\u00148\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0015\u0010\u0016\u00a8\u0006\u0019"
    }
    d2 = {
        "Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;",
        "Lyf5;",
        "Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;",
        "model",
        "Lorm;",
        "usageReporter",
        "<init>",
        "(Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;Lorm;)V",
        "Lb2l;",
        "activeTab",
        "",
        "isAllowed",
        "(Lb2l;)Z",
        "Lwf5;",
        "scope",
        "",
        "content",
        "(Lwf5;Lih5;I)V",
        "Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;",
        "Lorm;",
        "",
        "numberOfButtons",
        "J",
        "Model",
        "Button",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final $stable:I


# instance fields
.field private final model:Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final numberOfButtons:J

.field private final usageReporter:Lorm;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget v0, Lyf5;->$stable:I

    sget v1, Lcom/leanplum/messagetemplates/ResourceWrapper;->$stable:I

    or-int/2addr v0, v1

    sput v0, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;->$stable:I

    return-void
.end method

.method public constructor <init>(Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;Lorm;)V
    .registers 4
    .param p1    # Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lorm;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-direct {p0}, Lyf5;-><init>()V

    iput-object p1, p0, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;->model:Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;

    iput-object p2, p0, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;->usageReporter:Lorm;

    invoke-virtual {p1}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;->getPrimaryButton()Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Button;

    move-result-object p2

    invoke-virtual {p1}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;->getSecondaryButton()Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Button;

    move-result-object v0

    invoke-virtual {p1}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;->getCloseButtonAction()Lkotlin/jvm/functions/Function0;

    move-result-object p1

    filled-new-array {p2, v0, p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Le82;->p([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    int-to-long p1, p1

    iput-wide p1, p0, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;->numberOfButtons:J

    return-void
.end method

.method public static synthetic a(Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;Lwf5;)Lkotlin/Unit;
    .registers 2

    invoke-static {p0, p1}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;->content$lambda$1$0(Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;Lwf5;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b(Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;Lwf5;ILih5;I)Lkotlin/Unit;
    .registers 5

    invoke-static {p0, p1, p2, p3, p4}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;->content$lambda$4(Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;Lwf5;ILih5;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method private static final content$lambda$0$0(Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;Lwf5;)Lkotlin/Unit;
    .registers 10

    iget-object v0, p0, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;->usageReporter:Lorm;

    iget-wide v4, p0, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;->numberOfButtons:J

    iget-object v1, p0, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;->model:Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;

    invoke-virtual {v1}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;->getResourceWrapper()Lcom/leanplum/messagetemplates/ResourceWrapper;

    move-result-object v1

    iget-object v6, v1, Lcom/leanplum/messagetemplates/ResourceWrapper;->status:Ldg0;

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;->model:Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;

    invoke-virtual {p0}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;->getId()Ljava/lang/String;

    move-result-object v7

    move-object v1, v0

    check-cast v1, Lx5f;

    sget-object v2, Lgg0;->j:Lgg0;

    sget-object v3, Lvb0;->d:Lvb0;

    invoke-virtual/range {v1 .. v7}, Lx5f;->Y(Lgg0;Lvb0;JLdg0;Ljava/lang/String;)V

    check-cast p1, Lxf5;

    iget-object p0, p1, Lxf5;->a:Lyf5;

    sget-object p1, Lhjm;->b:Lhjm;

    invoke-virtual {p0, p1}, Ld63;->finish(Lhjm;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method private static final content$lambda$1$0(Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;Lwf5;)Lkotlin/Unit;
    .registers 10

    iget-object v0, p0, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;->usageReporter:Lorm;

    iget-wide v4, p0, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;->numberOfButtons:J

    iget-object v1, p0, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;->model:Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;

    invoke-virtual {v1}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;->getResourceWrapper()Lcom/leanplum/messagetemplates/ResourceWrapper;

    move-result-object v1

    iget-object v6, v1, Lcom/leanplum/messagetemplates/ResourceWrapper;->status:Ldg0;

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;->model:Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;

    invoke-virtual {p0}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;->getId()Ljava/lang/String;

    move-result-object v7

    move-object v1, v0

    check-cast v1, Lx5f;

    sget-object v2, Lgg0;->j:Lgg0;

    sget-object v3, Lvb0;->b:Lvb0;

    invoke-virtual/range {v1 .. v7}, Lx5f;->Y(Lgg0;Lvb0;JLdg0;Ljava/lang/String;)V

    check-cast p1, Lxf5;

    invoke-virtual {p1}, Lxf5;->a()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method private static final content$lambda$2$0(Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;Lwf5;)Lkotlin/Unit;
    .registers 10

    iget-object v0, p0, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;->usageReporter:Lorm;

    iget-wide v4, p0, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;->numberOfButtons:J

    iget-object v1, p0, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;->model:Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;

    invoke-virtual {v1}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;->getResourceWrapper()Lcom/leanplum/messagetemplates/ResourceWrapper;

    move-result-object v1

    iget-object v6, v1, Lcom/leanplum/messagetemplates/ResourceWrapper;->status:Ldg0;

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;->model:Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;

    invoke-virtual {p0}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;->getId()Ljava/lang/String;

    move-result-object v7

    move-object v1, v0

    check-cast v1, Lx5f;

    sget-object v2, Lgg0;->j:Lgg0;

    sget-object v3, Lvb0;->c:Lvb0;

    invoke-virtual/range {v1 .. v7}, Lx5f;->Y(Lgg0;Lvb0;JLdg0;Ljava/lang/String;)V

    check-cast p1, Lxf5;

    invoke-virtual {p1}, Lxf5;->a()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method private static final content$lambda$3$0(Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;Lwf5;)Lkotlin/Unit;
    .registers 10

    iget-object v0, p0, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;->usageReporter:Lorm;

    iget-wide v4, p0, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;->numberOfButtons:J

    iget-object v1, p0, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;->model:Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;

    invoke-virtual {v1}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;->getResourceWrapper()Lcom/leanplum/messagetemplates/ResourceWrapper;

    move-result-object v1

    iget-object v6, v1, Lcom/leanplum/messagetemplates/ResourceWrapper;->status:Ldg0;

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;->model:Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;

    invoke-virtual {p0}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;->getId()Ljava/lang/String;

    move-result-object v7

    move-object v1, v0

    check-cast v1, Lx5f;

    sget-object v2, Lgg0;->j:Lgg0;

    sget-object v3, Lvb0;->c:Lvb0;

    invoke-virtual/range {v1 .. v7}, Lx5f;->Y(Lgg0;Lvb0;JLdg0;Ljava/lang/String;)V

    check-cast p1, Lxf5;

    invoke-virtual {p1}, Lxf5;->a()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method private static final content$lambda$4(Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;Lwf5;ILih5;I)Lkotlin/Unit;
    .registers 5

    or-int/lit8 p2, p2, 0x1

    invoke-static {p2}, Laoh;->m(I)I

    move-result p2

    invoke-virtual {p0, p1, p3, p2}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;->content(Lwf5;Lih5;I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public static synthetic d(Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;Lwf5;)Lkotlin/Unit;
    .registers 2

    invoke-static {p0, p1}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;->content$lambda$0$0(Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;Lwf5;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e(Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;Lwf5;)Lkotlin/Unit;
    .registers 2

    invoke-static {p0, p1}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;->content$lambda$2$0(Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;Lwf5;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f(Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;Lwf5;)Lkotlin/Unit;
    .registers 2

    invoke-static {p0, p1}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;->content$lambda$3$0(Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;Lwf5;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public content(Lwf5;Lih5;I)V
    .registers 21
    .param p1    # Lwf5;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p3

    move-object/from16 v8, p2

    check-cast v8, Lvt9;

    const v3, 0x344f0b70

    invoke-virtual {v8, v3}, Lvt9;->Y(I)Lvt9;

    and-int/lit8 v3, v2, 0x6

    const/4 v4, 0x2

    const/4 v5, 0x4

    if-nez v3, :cond_2a

    and-int/lit8 v3, v2, 0x8

    if-nez v3, :cond_1f

    invoke-virtual {v8, v1}, Lvt9;->f(Ljava/lang/Object;)Z

    move-result v3

    goto :goto_23

    :cond_1f
    invoke-virtual {v8, v1}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v3

    :goto_23
    if-eqz v3, :cond_27

    move v3, v5

    goto :goto_28

    :cond_27
    move v3, v4

    :goto_28
    or-int/2addr v3, v2

    goto :goto_2b

    :cond_2a
    move v3, v2

    :goto_2b
    and-int/lit8 v6, v2, 0x30

    const/16 v7, 0x20

    if-nez v6, :cond_45

    and-int/lit8 v6, v2, 0x40

    if-nez v6, :cond_3a

    invoke-virtual {v8, v0}, Lvt9;->f(Ljava/lang/Object;)Z

    move-result v6

    goto :goto_3e

    :cond_3a
    invoke-virtual {v8, v0}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v6

    :goto_3e
    if-eqz v6, :cond_42

    move v6, v7

    goto :goto_44

    :cond_42
    const/16 v6, 0x10

    :goto_44
    or-int/2addr v3, v6

    :cond_45
    and-int/lit8 v6, v3, 0x13

    const/16 v9, 0x12

    const/4 v10, 0x0

    const/4 v11, 0x1

    if-eq v6, v9, :cond_4f

    move v6, v11

    goto :goto_50

    :cond_4f
    move v6, v10

    :goto_50
    and-int/lit8 v9, v3, 0x1

    invoke-virtual {v8, v9, v6}, Lvt9;->N(IZ)Z

    move-result v6

    if-eqz v6, :cond_13b

    and-int/lit8 v6, v3, 0x70

    if-eq v6, v7, :cond_68

    and-int/lit8 v9, v3, 0x40

    if-eqz v9, :cond_66

    invoke-virtual {v8, v0}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_68

    :cond_66
    move v9, v10

    goto :goto_69

    :cond_68
    move v9, v11

    :goto_69
    and-int/lit8 v12, v3, 0xe

    if-eq v12, v5, :cond_79

    and-int/lit8 v13, v3, 0x8

    if-eqz v13, :cond_77

    invoke-virtual {v8, v1}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_79

    :cond_77
    move v13, v10

    goto :goto_7a

    :cond_79
    move v13, v11

    :goto_7a
    or-int/2addr v9, v13

    invoke-virtual {v8}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v13

    sget-object v14, Lhh5;->a:Lzpa;

    if-nez v9, :cond_85

    if-ne v13, v14, :cond_8d

    :cond_85
    new-instance v13, Lhof;

    invoke-direct {v13, v0, v1, v10}, Lhof;-><init>(Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;Lwf5;B)V

    invoke-virtual {v8, v13}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_8d
    check-cast v13, Lkotlin/jvm/functions/Function0;

    iget-object v9, v0, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;->model:Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;

    if-eq v6, v7, :cond_9f

    and-int/lit8 v15, v3, 0x40

    if-eqz v15, :cond_9d

    invoke-virtual {v8, v0}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_9f

    :cond_9d
    move v15, v10

    goto :goto_a0

    :cond_9f
    move v15, v11

    :goto_a0
    if-eq v12, v5, :cond_af

    and-int/lit8 v16, v3, 0x8

    if-eqz v16, :cond_ac

    invoke-virtual {v8, v1}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v16

    if-nez v16, :cond_af

    :cond_ac
    move/from16 v16, v10

    goto :goto_b1

    :cond_af
    move/from16 v16, v11

    :goto_b1
    or-int v15, v15, v16

    invoke-virtual {v8}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v10

    if-nez v15, :cond_bb

    if-ne v10, v14, :cond_c3

    :cond_bb
    new-instance v10, Lhof;

    invoke-direct {v10, v0, v1, v11}, Lhof;-><init>(Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;Lwf5;B)V

    invoke-virtual {v8, v10}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_c3
    check-cast v10, Lkotlin/jvm/functions/Function0;

    if-eq v6, v7, :cond_d3

    and-int/lit8 v15, v3, 0x40

    if-eqz v15, :cond_d1

    invoke-virtual {v8, v0}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_d3

    :cond_d1
    const/4 v15, 0x0

    goto :goto_d4

    :cond_d3
    move v15, v11

    :goto_d4
    if-eq v12, v5, :cond_e3

    and-int/lit8 v16, v3, 0x8

    if-eqz v16, :cond_e0

    invoke-virtual {v8, v1}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v16

    if-nez v16, :cond_e3

    :cond_e0
    const/16 v16, 0x0

    goto :goto_e5

    :cond_e3
    move/from16 v16, v11

    :goto_e5
    or-int v15, v15, v16

    invoke-virtual {v8}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v11

    if-nez v15, :cond_ef

    if-ne v11, v14, :cond_f7

    :cond_ef
    new-instance v11, Lhof;

    invoke-direct {v11, v0, v1, v4}, Lhof;-><init>(Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;Lwf5;B)V

    invoke-virtual {v8, v11}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_f7
    check-cast v11, Lkotlin/jvm/functions/Function0;

    if-eq v6, v7, :cond_107

    and-int/lit8 v4, v3, 0x40

    if-eqz v4, :cond_105

    invoke-virtual {v8, v0}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_107

    :cond_105
    const/4 v4, 0x0

    goto :goto_108

    :cond_107
    const/4 v4, 0x1

    :goto_108
    if-eq v12, v5, :cond_117

    and-int/lit8 v3, v3, 0x8

    if-eqz v3, :cond_114

    invoke-virtual {v8, v1}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_117

    :cond_114
    const/16 v16, 0x0

    goto :goto_119

    :cond_117
    const/16 v16, 0x1

    :goto_119
    or-int v4, v4, v16

    invoke-virtual {v8}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v3

    const/4 v5, 0x3

    if-nez v4, :cond_124

    if-ne v3, v14, :cond_12c

    :cond_124
    new-instance v3, Lhof;

    invoke-direct {v3, v0, v1, v5}, Lhof;-><init>(Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;Lwf5;B)V

    invoke-virtual {v8, v3}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_12c
    move-object v7, v3

    check-cast v7, Lkotlin/jvm/functions/Function0;

    sget v3, Lcom/leanplum/messagetemplates/ResourceWrapper;->$stable:I

    shl-int/2addr v3, v5

    move-object v4, v9

    move-object v5, v10

    move-object v6, v11

    move v9, v3

    move-object v3, v13

    # invokes: Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequestKt;->SubscriptionDialog(Lkotlin/jvm/functions/Function0;Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lih5;I)V
    invoke-static/range {v3 .. v9}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequestKt;->access$SubscriptionDialog(Lkotlin/jvm/functions/Function0;Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lih5;I)V

    goto :goto_13e

    :cond_13b
    invoke-virtual {v8}, Lvt9;->Q()V

    :goto_13e
    invoke-virtual {v8}, Lvt9;->r()Lznh;

    move-result-object v3

    if-eqz v3, :cond_14d

    new-instance v4, Luf1;

    const/16 v5, 0x9

    invoke-direct {v4, v0, v1, v2, v5}, Luf1;-><init>(Ljava/lang/Object;Ljava/lang/Object;IB)V

    iput-object v4, v3, Lznh;->d:Lkotlin/jvm/functions/Function2;

    :cond_14d
    return-void
.end method

.method public bridge synthetic getDefaultPriority()Lijm;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    sget-object p0, Lijm;->b:Lijm;

    return-object p0
.end method

.method public isAllowed(Lb2l;)Z
    .registers 2

    if-eqz p1, :cond_e

    check-cast p1, Ld7l;

    iget-object p0, p1, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->m()Z

    move-result p0

    if-eqz p0, :cond_e

    const/4 p0, 0x0

    return p0

    :cond_e
    const/4 p0, 0x1

    return p0
.end method
