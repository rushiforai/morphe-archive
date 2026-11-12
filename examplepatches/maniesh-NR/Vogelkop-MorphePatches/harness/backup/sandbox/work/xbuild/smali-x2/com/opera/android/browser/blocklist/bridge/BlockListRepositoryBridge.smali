.class public final Lcom/opera/android/browser/blocklist/bridge/BlockListRepositoryBridge;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J

.field public final b:Ltcl;

.field public final c:Li7f;


# direct methods
.method public constructor <init>(Ltcl;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    iput-object v0, p0, Lcom/opera/android/browser/blocklist/bridge/BlockListRepositoryBridge;->c:Li7f;

    invoke-static {p0}, LJ/N;->MkLp5l$H(Ljava/lang/Object;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/opera/android/browser/blocklist/bridge/BlockListRepositoryBridge;->a:J

    iput-object p1, p0, Lcom/opera/android/browser/blocklist/bridge/BlockListRepositoryBridge;->b:Ltcl;

    return-void
.end method

.method public static a([Ljava/lang/String;[Z[J[Ljava/lang/String;)Ljava/util/ArrayList;
    .registers 15

    array-length v0, p0

    array-length v1, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    array-length v1, p2

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    array-length v1, p3

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v2, 0x0

    :goto_16
    if-ge v2, v0, :cond_41

    new-instance v3, Lyie;

    aget-object v4, p0, v2

    aget-boolean v5, p1, v2

    aget-wide v6, p2, v2

    aget-object v8, p3, v2

    const-wide/16 v9, -0x1

    cmp-long v9, v6, v9

    if-nez v9, :cond_2b

    sget-object v5, Lwie;->j:Lwie;

    goto :goto_38

    :cond_2b
    if-eqz v5, :cond_33

    new-instance v5, Lxie;

    invoke-direct {v5, v6, v7, v8}, Lxie;-><init>(JLjava/lang/String;)V

    goto :goto_38

    :cond_33
    new-instance v5, Lvie;

    invoke-direct {v5, v6, v7, v8}, Lvie;-><init>(JLjava/lang/String;)V

    :goto_38
    invoke-direct {v3, v4, v5}, Lyie;-><init>(Ljava/lang/String;Lqyn;)V

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_16

    :cond_41
    return-object v1
.end method


# virtual methods
.method public final notifyRuleState([Ljava/lang/String;[Z[J[Ljava/lang/String;[Ljava/lang/String;[Z[J[Ljava/lang/String;[Ljava/lang/String;[Z[J[Ljava/lang/String;[Ljava/lang/String;[Z[J[Ljava/lang/String;)V
    .registers 18
    .param p1    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # [Z
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # [J
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p6    # [Z
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p7    # [J
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p8    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p9    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p10    # [Z
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p11    # [J
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p12    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p13    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p14    # [Z
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p15    # [J
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p16    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lzie;

    invoke-static/range {p1 .. p4}, Lcom/opera/android/browser/blocklist/bridge/BlockListRepositoryBridge;->a([Ljava/lang/String;[Z[J[Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-static/range {p5 .. p8}, Lcom/opera/android/browser/blocklist/bridge/BlockListRepositoryBridge;->a([Ljava/lang/String;[Z[J[Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p2

    invoke-static/range {p9 .. p12}, Lcom/opera/android/browser/blocklist/bridge/BlockListRepositoryBridge;->a([Ljava/lang/String;[Z[J[Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p3

    invoke-static/range {p13 .. p16}, Lcom/opera/android/browser/blocklist/bridge/BlockListRepositoryBridge;->a([Ljava/lang/String;[Z[J[Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p4

    invoke-direct {v0, p1, p2, p3, p4}, Lzie;-><init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    new-instance p1, Lbi2;

    const/16 p2, 0xd

    invoke-direct {p1, p0, v0, p2}, Lbi2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p0, Lcom/opera/android/browser/blocklist/bridge/BlockListRepositoryBridge;->b:Ltcl;

    invoke-interface {p0, p1}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method
