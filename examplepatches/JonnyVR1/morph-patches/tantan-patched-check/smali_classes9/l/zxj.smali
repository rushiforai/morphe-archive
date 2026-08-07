.class public Ll/zxj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/hzj;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ljava/lang/String;

.field public d:I

.field public e:Z

.field public f:Ll/xxj$a;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ll/zxj;->a:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Ljava/util/List;Ljava/lang/String;IZ)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/hzj;",
            ">;",
            "Ljava/lang/String;",
            "IZ)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/zxj;->a:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Ll/zxj;->b:Ljava/util/List;

    .line 12
    .line 13
    iput-object p2, p0, Ll/zxj;->c:Ljava/lang/String;

    .line 14
    .line 15
    iput p3, p0, Ll/zxj;->d:I

    .line 16
    .line 17
    iput-boolean p4, p0, Ll/zxj;->e:Z

    .line 18
    .line 19
    return-void
.end method

.method public static synthetic a(ILl/hzj;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget p1, p1, Ll/hzj;->b:I

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static c()Ll/zxj;
    .locals 1

    .line 1
    new-instance v0, Ll/zxj;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/zxj;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public b(I)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zxj;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    iget-object p0, p0, Ll/zxj;->b:Ljava/util/List;

    .line 12
    .line 13
    new-instance v0, Ll/yxj;

    .line 14
    .line 15
    invoke-direct {v0, p1}, Ll/yxj;-><init>(I)V

    .line 16
    .line 17
    .line 18
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Ll/hzj;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_1
    return v1
.end method

.method public d()I
    .locals 0

    .line 1
    iget p0, p0, Ll/zxj;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public e()Ll/xxj$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zxj;->f:Ll/xxj$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/hzj;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/zxj;->b:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/zxj;->a:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zxj;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public i(Ll/xxj$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zxj;->f:Ll/xxj$a;

    .line 2
    .line 3
    return-void
.end method

.method public j(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/zxj;->a:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method
