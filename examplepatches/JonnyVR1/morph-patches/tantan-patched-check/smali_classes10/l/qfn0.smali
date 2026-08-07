.class public Ll/qfn0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/sfn0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    const/16 v1, 0xa

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Ll/qfn0;->a:Ljava/util/List;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/sfn0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/sfn0;->p()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic b(Ll/sfn0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/sfn0;->t()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static c()V
    .locals 1

    .line 1
    invoke-static {}, Ll/qfn0;->f()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/qfn0;->a:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static d()Ll/sfn0;
    .locals 4

    .line 1
    sget-object v0, Ll/qfn0;->a:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/pfn0;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/pfn0;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Ll/sfn0;

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    const/16 v3, 0xa

    .line 22
    .line 23
    if-ge v1, v3, :cond_0

    .line 24
    .line 25
    new-instance v1, Ll/sfn0;

    .line 26
    .line 27
    invoke-direct {v1}, Ll/sfn0;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1, v2}, Ll/sfn0;->u(Z)V

    .line 31
    .line 32
    .line 33
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    return-object v1

    .line 37
    :cond_0
    const/4 v0, 0x0

    .line 38
    return-object v0

    .line 39
    :cond_1
    invoke-virtual {v1, v2}, Ll/sfn0;->u(Z)V

    .line 40
    .line 41
    .line 42
    return-object v1
.end method

.method public static e(Ll/sfn0;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/sfn0;->u(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static f()V
    .locals 2

    .line 1
    sget-object v0, Ll/qfn0;->a:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/ofn0;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/ofn0;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
