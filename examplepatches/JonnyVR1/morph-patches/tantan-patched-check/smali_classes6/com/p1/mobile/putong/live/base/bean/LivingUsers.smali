.class public Lcom/p1/mobile/putong/live/base/bean/LivingUsers;
.super Ljava/util/ArrayList;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/ArrayList<",
        "Ll/nsv<",
        "TT;>;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/nsv<",
            "TT;>;>;)V"
        }
    .end annotation

    .line 5
    invoke-direct {p0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-void
.end method

.method public static synthetic a(Ll/nsv;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic c(Ll/qcj;Ljava/lang/Object;)Ll/nsv;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-object p1

    .line 8
    :cond_0
    invoke-interface {p0, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ll/nsv;

    .line 13
    .line 14
    return-object p0
.end method

.method public static convert(Ljava/util/List;Ll/qcj;)Lcom/p1/mobile/putong/live/base/bean/LivingUsers;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<F:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "TF;>;",
            "Ll/qcj<",
            "Ll/nsv<",
            "TF;>;",
            "Ll/nsv<",
            "TF;>;>;)",
            "Lcom/p1/mobile/putong/live/base/bean/LivingUsers<",
            "TF;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/osv;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/osv;-><init>(Ll/qcj;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance p1, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 11
    .line 12
    new-instance v0, Ll/psv;

    .line 13
    .line 14
    invoke-direct {v0}, Ll/psv;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-static {p0, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;-><init>(Ljava/util/List;)V

    .line 22
    .line 23
    .line 24
    return-object p1
.end method

.method public static create(Ljava/util/List;)Lcom/p1/mobile/putong/live/base/bean/LivingUsers;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<F:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "Ll/nsv<",
            "TF;>;>;)",
            "Lcom/p1/mobile/putong/live/base/bean/LivingUsers<",
            "TF;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;-><init>(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
