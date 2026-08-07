.class public Ll/ef80;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;

.field public b:Z

.field public c:F

.field public d:I

.field public e:I

.field public f:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

.field public g:Z

.field public h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/ef80;->b:Z

    .line 6
    .line 7
    const/4 v0, -0x1

    .line 8
    iput v0, p0, Ll/ef80;->d:I

    .line 9
    .line 10
    iput v0, p0, Ll/ef80;->e:I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget p0, p0, Ll/ef80;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ef80;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/ef80;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public d()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ef80;->h:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ef80;->f:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()F
    .locals 0

    .line 1
    iget p0, p0, Ll/ef80;->c:F

    .line 2
    .line 3
    return p0
.end method

.method public g()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ef80;->g:Z

    .line 2
    .line 3
    return p0
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ef80;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public i()V
    .locals 2

    .line 1
    const-string v0, "0"

    .line 2
    .line 3
    iput-object v0, p0, Ll/ef80;->a:Ljava/lang/String;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Ll/ef80;->b:Z

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    iput v1, p0, Ll/ef80;->c:F

    .line 10
    .line 11
    const/4 v1, -0x1

    .line 12
    iput v1, p0, Ll/ef80;->d:I

    .line 13
    .line 14
    iput v1, p0, Ll/ef80;->e:I

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    iput-object v1, p0, Ll/ef80;->f:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 18
    .line 19
    iput-boolean v0, p0, Ll/ef80;->g:Z

    .line 20
    .line 21
    return-void
.end method

.method public j(II)V
    .locals 0

    .line 1
    iput p1, p0, Ll/ef80;->d:I

    .line 2
    .line 3
    iput p2, p0, Ll/ef80;->e:I

    .line 4
    .line 5
    return-void
.end method

.method public k(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ef80;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public l(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/ef80;->g:Z

    .line 2
    .line 3
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ef80;->f:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 2
    .line 3
    return-void
.end method

.method public n(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/ef80;->b:Z

    .line 2
    .line 3
    return-void
.end method

.method public o(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ef80;->h:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public p(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/ef80;->c:F

    .line 2
    .line 3
    return-void
.end method
