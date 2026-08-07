.class public abstract Ll/lq2;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V::",
        "Ll/iam<",
        "TP;>;P:",
        "Ll/l6t<",
        "TV;>;>",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public a:Ll/dum;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/dum<",
            "+",
            "Ll/rwn0;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ll/l6t;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TP;"
        }
    .end annotation
.end field

.field public c:Ll/iam;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TV;"
        }
    .end annotation
.end field

.field public final d:Lcom/p1/mobile/putong/live/base/data/VirtualVoiceMotionType;

.field public e:Landroid/view/ViewGroup;

.field public f:Ll/l6t;

.field public g:Ll/lq2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/lq2<",
            "**>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/VirtualVoiceMotionType;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/rwn0;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/VirtualVoiceMotionType;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/lq2;->a:Ll/dum;

    .line 5
    .line 6
    iput-object p2, p0, Ll/lq2;->d:Lcom/p1/mobile/putong/live/base/data/VirtualVoiceMotionType;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;Ll/lq2;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Ll/lq2;->l(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/live/base/data/VirtualVoiceMotionType;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public c()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/lq2<",
            "**>;>;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public d(Ll/l6t;Landroid/view/ViewGroup;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/lq2;->f:Ll/l6t;

    .line 2
    .line 3
    iput-object p2, p0, Ll/lq2;->e:Landroid/view/ViewGroup;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/lq2;->e()Landroid/view/ViewGroup;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p2}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 13
    .line 14
    .line 15
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 16
    .line 17
    sget v1, Ll/bnl0;->e:I

    .line 18
    .line 19
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 20
    .line 21
    .line 22
    const v1, 0x800003

    .line 23
    .line 24
    .line 25
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 26
    .line 27
    invoke-virtual {p0, p2}, Ll/lq2;->r(Landroid/view/ViewGroup;)V

    .line 28
    .line 29
    .line 30
    const/4 p0, 0x1

    .line 31
    invoke-static {p2, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p2, p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x0

    .line 38
    invoke-virtual {p2, p0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public e()Landroid/view/ViewGroup;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/lq2;->a:Ll/dum;

    .line 2
    .line 3
    iget-object v0, v0, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/lq2;->g()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Landroid/view/ViewGroup;

    .line 19
    .line 20
    instance-of v1, v0, Ll/iam;

    .line 21
    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/lq2;->h()Ll/l6t;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iput-object v1, p0, Ll/lq2;->b:Ll/l6t;

    .line 29
    .line 30
    move-object v2, v0

    .line 31
    check-cast v2, Ll/iam;

    .line 32
    .line 33
    iput-object v2, p0, Ll/lq2;->c:Ll/iam;

    .line 34
    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Ll/l6t;->C(Ll/iam;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Ll/lq2;->k()Ll/qct;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iget-object v2, p0, Ll/lq2;->f:Ll/l6t;

    .line 45
    .line 46
    if-eqz v1, :cond_0

    .line 47
    .line 48
    invoke-virtual {v2, v1}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Ll/lq2;->b:Ll/l6t;

    .line 52
    .line 53
    invoke-virtual {v1, p0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 54
    .line 55
    .line 56
    return-object v0

    .line 57
    :cond_0
    iget-object p0, p0, Ll/lq2;->b:Ll/l6t;

    .line 58
    .line 59
    invoke-virtual {v2, p0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 60
    .line 61
    .line 62
    :cond_1
    return-object v0
.end method

.method public f()V
    .locals 0

    .line 1
    return-void
.end method

.method public abstract g()I
.end method

.method public abstract h()Ll/l6t;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TP;"
        }
    .end annotation
.end method

.method public i(Ljava/lang/String;)Ll/lq2;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ll/lq2<",
            "**>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/lq2;->c()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/kq2;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ll/kq2;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Ll/lq2;

    .line 15
    .line 16
    return-object p0
.end method

.method public j()Lcom/p1/mobile/putong/live/base/data/VirtualVoiceMotionType;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lq2;->d:Lcom/p1/mobile/putong/live/base/data/VirtualVoiceMotionType;

    .line 2
    .line 3
    return-object p0
.end method

.method public k()Ll/qct;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/qct<",
            "*>;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public l(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lq2;->d:Lcom/p1/mobile/putong/live/base/data/VirtualVoiceMotionType;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public m(Lcom/p1/mobile/putong/live/base/data/VirtualVoiceMotionType;)V
    .locals 2
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/lq2;->c()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v0, v1}, Ll/f2m0;->d(Ljava/util/List;Ljava/lang/String;)Ll/lq2;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/lq2;->g:Ll/lq2;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ll/lq2;->m(Lcom/p1/mobile/putong/live/base/data/VirtualVoiceMotionType;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public n()V
    .locals 2
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/lq2;->g:Ll/lq2;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/lq2;->n()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ll/lq2;->e:Landroid/view/ViewGroup;

    .line 9
    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Ll/lq2;->e:Landroid/view/ViewGroup;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Ll/lq2;->e:Landroid/view/ViewGroup;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    :cond_2
    iget-object v0, p0, Ll/lq2;->b:Ll/l6t;

    .line 30
    .line 31
    if-eqz v0, :cond_3

    .line 32
    .line 33
    iget-object v1, p0, Ll/lq2;->f:Ll/l6t;

    .line 34
    .line 35
    if-eqz v1, :cond_3

    .line 36
    .line 37
    invoke-virtual {v1, v0}, Ll/l6t;->C2(Ll/l6t;)V

    .line 38
    .line 39
    .line 40
    const/4 v0, 0x0

    .line 41
    iput-object v0, p0, Ll/lq2;->b:Ll/l6t;

    .line 42
    .line 43
    :cond_3
    return-void
.end method

.method public o()V
    .locals 0

    .line 1
    return-void
.end method

.method public p()V
    .locals 0

    .line 1
    return-void
.end method

.method public q(Ll/l6t;Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lq2;->g:Ll/lq2;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/lq2;->d(Ll/l6t;Landroid/view/ViewGroup;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public r(Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    return-void
.end method
