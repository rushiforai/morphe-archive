.class public Ll/ljt$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ljt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:I

.field public i:Ljava/lang/String;

.field public j:Ljava/lang/String;

.field public k:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/ljt$a;->a:Ljava/lang/String;

    .line 7
    .line 8
    const-string v1, "NA"

    .line 9
    .line 10
    iput-object v1, p0, Ll/ljt$a;->b:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, p0, Ll/ljt$a;->c:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Ll/ljt$a;->d:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, p0, Ll/ljt$a;->e:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Ll/ljt$a;->f:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p0, Ll/ljt$a;->g:Ljava/lang/String;

    .line 21
    .line 22
    const/4 v2, -0x1

    .line 23
    iput v2, p0, Ll/ljt$a;->h:I

    .line 24
    .line 25
    iput-object v1, p0, Ll/ljt$a;->i:Ljava/lang/String;

    .line 26
    .line 27
    iput-object v0, p0, Ll/ljt$a;->j:Ljava/lang/String;

    .line 28
    .line 29
    iput-object v0, p0, Ll/ljt$a;->k:Ljava/lang/String;

    .line 30
    .line 31
    return-void
.end method

.method public synthetic constructor <init>(Ll/mjt;)V
    .locals 0

    .line 32
    invoke-direct {p0}, Ll/ljt$a;-><init>()V

    return-void
.end method

.method public static bridge synthetic a(Ll/ljt$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ljt$a;->a:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/ljt$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ljt$a;->b:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic c(Ll/ljt$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ljt$a;->c:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic d(Ll/ljt$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ljt$a;->e:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic e(Ll/ljt$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/ljt$a;->h:I

    return p0
.end method

.method public static bridge synthetic f(Ll/ljt$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ljt$a;->f:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic g(Ll/ljt$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ljt$a;->d:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic h(Ll/ljt$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ljt$a;->j:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic i(Ll/ljt$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ljt$a;->i:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic j(Ll/ljt$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ljt$a;->k:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic k(Ll/ljt$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ljt$a;->g:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public l()Ll/ljt;
    .locals 2

    .line 1
    new-instance v0, Ll/ljt;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/ljt;-><init>(Ll/ljt$a;Ll/mjt;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public m(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Ll/ljt$a;
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/ljt$a;->p(Ljava/lang/String;)Ll/ljt$a;

    .line 6
    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/ljt$a;->o(Ljava/lang/String;)Ll/ljt$a;

    .line 15
    .line 16
    .line 17
    :cond_0
    if-eqz p2, :cond_1

    .line 18
    .line 19
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/ljt$a;->t(Ljava/lang/String;)Ll/ljt$a;

    .line 22
    .line 23
    .line 24
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 25
    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Ll/ljt$a;->n(Ljava/lang/String;)Ll/ljt$a;

    .line 31
    .line 32
    .line 33
    :cond_1
    return-object p0
.end method

.method public n(Ljava/lang/String;)Ll/ljt$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ljt$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public o(Ljava/lang/String;)Ll/ljt$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ljt$a;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public p(Ljava/lang/String;)Ll/ljt$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ljt$a;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public q(Ljava/lang/String;)Ll/ljt$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ljt$a;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public r(I)Ll/ljt$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/ljt$a;->h:I

    .line 2
    .line 3
    return-object p0
.end method

.method public s(Ljava/lang/String;)Ll/ljt$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ljt$a;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public t(Ljava/lang/String;)Ll/ljt$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ljt$a;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public u(Ljava/lang/String;)Ll/ljt$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ljt$a;->j:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public v(Ljava/lang/String;)Ll/ljt$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ljt$a;->i:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public w(Ljava/lang/String;)Ll/ljt$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ljt$a;->k:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public x(J)Ll/ljt$a;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/ljt$a;->y(Ljava/lang/String;)Ll/ljt$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public y(Ljava/lang/String;)Ll/ljt$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ljt$a;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
