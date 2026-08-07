.class public Ll/oli;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/kt2;",
            ">;"
        }
    .end annotation
.end field

.field private b:Ll/qqc0;

.field private c:Ll/rer;

.field private d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/immomo/moment/filtermanager/MMPresetFilter;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;Ll/rer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/immomo/moment/filtermanager/MMPresetFilter;",
            ">;",
            "Ll/rer;",
            ")V"
        }
    .end annotation

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p2, p0, Ll/oli;->c:Ll/rer;

    .line 41
    iput-object p1, p0, Ll/oli;->d:Ljava/util/List;

    .line 42
    new-instance p1, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object p1, p0, Ll/oli;->a:Ljava/util/List;

    .line 43
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    new-instance p1, Ll/qqc0;

    iget-object p2, p0, Ll/oli;->a:Ljava/util/List;

    invoke-direct {p1, p2}, Ll/qqc0;-><init>(Ljava/util/List;)V

    iput-object p1, p0, Ll/oli;->b:Ll/qqc0;

    return-void
.end method

.method public constructor <init>(Ll/rer;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/rer;",
            "Ljava/util/List<",
            "Lcom/immomo/moment/filtermanager/MMPresetFilter;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/oli;->c:Ll/rer;

    .line 5
    .line 6
    iput-object p2, p0, Ll/oli;->d:Ljava/util/List;

    .line 7
    .line 8
    new-instance p2, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 9
    .line 10
    invoke-direct {p2}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p2, p0, Ll/oli;->a:Ljava/util/List;

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    const/4 p2, 0x2

    .line 18
    invoke-virtual {p1, p2}, Ll/rer;->s0(I)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, p2}, Ll/rer;->r0(I)V

    .line 22
    .line 23
    .line 24
    iget-object p2, p0, Ll/oli;->a:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    :cond_0
    new-instance p1, Ll/qqc0;

    .line 30
    .line 31
    iget-object p2, p0, Ll/oli;->a:Ljava/util/List;

    .line 32
    .line 33
    invoke-direct {p1, p2}, Ll/qqc0;-><init>(Ljava/util/List;)V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Ll/oli;->b:Ll/qqc0;

    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    return-void
.end method

.method public b()Ll/kt2;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oli;->b:Ll/qqc0;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oli;->c:Ll/rer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/rer;->p0(F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public d(I)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-virtual {p0, p1, v0, v1}, Ll/oli;->e(IZF)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e(IZF)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    cmpl-float p2, p3, p2

    .line 3
    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    const/high16 p2, 0x3f800000    # 1.0f

    .line 7
    .line 8
    cmpl-float p2, p3, p2

    .line 9
    .line 10
    if-nez p2, :cond_2

    .line 11
    .line 12
    :cond_0
    iget-object p2, p0, Ll/oli;->c:Ll/rer;

    .line 13
    .line 14
    if-eqz p2, :cond_2

    .line 15
    .line 16
    iget-object p2, p0, Ll/oli;->d:Ljava/util/List;

    .line 17
    .line 18
    invoke-static {p1, p2}, Ll/ani;->a(ILjava/util/List;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iget-object p0, p0, Ll/oli;->c:Ll/rer;

    .line 23
    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ll/rer;->o0(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    invoke-virtual {p0}, Ll/rer;->e0()V

    .line 31
    .line 32
    .line 33
    :cond_2
    return-void
.end method

.method public f(Ljava/lang/String;F)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpl-float v0, p2, v0

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    const/high16 v0, 0x3f800000    # 1.0f

    .line 7
    .line 8
    cmpl-float p2, p2, v0

    .line 9
    .line 10
    if-nez p2, :cond_2

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ll/oli;->c:Ll/rer;

    .line 13
    .line 14
    if-eqz p0, :cond_2

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/rer;->o0(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    invoke-virtual {p0}, Ll/rer;->e0()V

    .line 23
    .line 24
    .line 25
    :cond_2
    return-void
.end method
