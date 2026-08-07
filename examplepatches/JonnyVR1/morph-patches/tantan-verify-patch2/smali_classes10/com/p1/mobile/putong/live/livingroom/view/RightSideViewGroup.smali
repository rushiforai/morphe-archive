.class public Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;
.super Lv/VFrame;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;,
        Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;
    }
.end annotation


# instance fields
.field public a:Ll/ykl0;

.field public b:Landroid/view/View;

.field public c:Landroid/view/View;

.field public d:I

.field public e:F

.field public f:F

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ll/l4g0;

.field public final i:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;

.field public j:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 19
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 18
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;

    .line 5
    .line 6
    invoke-direct {p1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->i:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->j:Z

    .line 13
    .line 14
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->init()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->getContentViewState()Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->O(I)V

    return-void
.end method

.method public static bridge synthetic E(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;F)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->P(F)V

    return-void
.end method

.method public static bridge synthetic F(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;F)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->R(F)V

    return-void
.end method

.method private getContentViewState()Z
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;

    .line 18
    .line 19
    invoke-interface {v0}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;->a()Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    invoke-interface {v0}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;->a()Ljava/lang/Boolean;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_1
    const/4 p0, 0x0

    .line 38
    return p0
.end method

.method private init()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/ykl0;->p(Landroid/view/ViewGroup;Ll/ykl0$c;)Ll/ykl0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->a:Ll/ykl0;

    .line 11
    .line 12
    new-instance v0, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->g:Ljava/util/List;

    .line 18
    .line 19
    new-instance v0, Ll/l4g0;

    .line 20
    .line 21
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$b;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;)V

    .line 24
    .line 25
    .line 26
    invoke-direct {v0, v1}, Ll/l4g0;-><init>(Ll/e6m;)V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->h:Ll/l4g0;

    .line 30
    .line 31
    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->b:Landroid/view/View;

    return-object p0
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->c:Landroid/view/View;

    return-object p0
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->d:I

    return p0
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;)Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->i:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;

    return-object p0
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->K()Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;F)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->M(F)V

    return-void
.end method


# virtual methods
.method public G(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final K()Z
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;

    .line 18
    .line 19
    invoke-interface {v0}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;->b()Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    invoke-interface {v0}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;->b()Ljava/lang/Boolean;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    const/4 p0, 0x1

    .line 36
    return p0

    .line 37
    :cond_1
    const/4 p0, 0x0

    .line 38
    return p0
.end method

.method public L(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->i:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;->c(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->i:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;->h(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->i:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;

    .line 17
    .line 18
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;->e(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;Z)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->c:Landroid/view/View;

    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/view/View;->getTranslationX()F

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    const/4 v0, 0x0

    .line 28
    invoke-virtual {p0, p1, v0, v0}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->N(FFF)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->Q(Z)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->h:Ll/l4g0;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/l4g0;->k()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final M(F)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->i:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;->c(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->c:Landroid/view/View;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v1}, Landroid/view/View;->getTranslationX()F

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    cmpl-float v1, v1, v2

    .line 21
    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0, v0, v2, p1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->N(FFF)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void

    .line 28
    :cond_1
    invoke-virtual {v1}, Landroid/view/View;->getTranslationX()F

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    invoke-virtual {p0, v0, v2, p1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->N(FFF)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->i:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;

    .line 36
    .line 37
    const/4 v0, 0x0

    .line 38
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;->h(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;Z)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->i:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;

    .line 42
    .line 43
    const/4 v1, 0x1

    .line 44
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;->e(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;Z)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->Q(Z)V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->h:Ll/l4g0;

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/l4g0;->k()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final N(FFF)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpl-float v0, p3, v0

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const/16 p3, 0x12c

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    sub-float v0, p2, p1

    .line 10
    .line 11
    div-float/2addr v0, p3

    .line 12
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 13
    .line 14
    .line 15
    move-result p3

    .line 16
    float-to-int p3, p3

    .line 17
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->c:Landroid/view/View;

    .line 18
    .line 19
    const/4 v0, 0x2

    .line 20
    new-array v0, v0, [F

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    aput p1, v0, v1

    .line 24
    .line 25
    const/4 p1, 0x1

    .line 26
    aput p2, v0, p1

    .line 27
    .line 28
    const-string p1, "translationX"

    .line 29
    .line 30
    invoke-static {p0, p1, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    int-to-long p1, p3

    .line 35
    invoke-virtual {p0, p1, p2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final O(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;

    .line 18
    .line 19
    invoke-interface {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;->e(I)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method

.method public final P(F)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;

    .line 18
    .line 19
    invoke-interface {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;->c(F)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method

.method public final Q(Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;

    .line 18
    .line 19
    invoke-interface {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;->d(Z)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method

.method public final R(F)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->c:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getTranslationX()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->d:I

    .line 8
    .line 9
    mul-int/lit8 v1, v1, -0x1

    .line 10
    .line 11
    int-to-float v1, v1

    .line 12
    invoke-virtual {p0, v0, v1, p1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->N(FFF)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->i:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;->h(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;Z)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->i:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;

    .line 22
    .line 23
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;->g(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;Z)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->Q(Z)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->h:Ll/l4g0;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public S(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$c;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public T(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->i:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;->b(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->i:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;->c(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->d:I

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->i:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;->h(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;Z)V

    .line 26
    .line 27
    .line 28
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->d:I

    .line 29
    .line 30
    neg-int v0, v0

    .line 31
    int-to-float v0, v0

    .line 32
    const/4 v2, 0x0

    .line 33
    invoke-virtual {p0, v2, v0, v2}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->N(FFF)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->i:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;

    .line 37
    .line 38
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;->g(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;Z)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->Q(Z)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->h:Ll/l4g0;

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 47
    .line 48
    .line 49
    :cond_1
    :goto_0
    return-void
.end method

.method public computeScroll()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->computeScroll()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->a:Ll/ykl0;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Ll/ykl0;->n(Z)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->i:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;->c(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_7

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    if-eqz v0, :cond_6

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    if-eq v0, v1, :cond_1

    .line 18
    .line 19
    const/4 v1, 0x3

    .line 20
    if-eq v0, v1, :cond_0

    .line 21
    .line 22
    goto/16 :goto_2

    .line 23
    .line 24
    :cond_0
    iput-boolean v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->j:Z

    .line 25
    .line 26
    goto/16 :goto_2

    .line 27
    .line 28
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    const-string v4, "samsung"

    .line 37
    .line 38
    sget-object v5, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    if-eqz v4, :cond_4

    .line 45
    .line 46
    sget-object v4, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v5

    .line 52
    const-string v6, "G9200"

    .line 53
    .line 54
    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v6

    .line 58
    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result v5

    .line 62
    if-nez v5, :cond_2

    .line 63
    .line 64
    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    const-string v6, "g7810"

    .line 69
    .line 70
    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v6

    .line 74
    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result v5

    .line 78
    if-nez v5, :cond_2

    .line 79
    .line 80
    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    const-string v5, "s918u1"

    .line 85
    .line 86
    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v5

    .line 90
    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 91
    .line 92
    .line 93
    move-result v4

    .line 94
    if-eqz v4, :cond_4

    .line 95
    .line 96
    :cond_2
    iget v4, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->e:F

    .line 97
    .line 98
    sub-float v4, v0, v4

    .line 99
    .line 100
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    .line 101
    .line 102
    .line 103
    move-result v4

    .line 104
    const/high16 v5, 0x40e00000    # 7.0f

    .line 105
    .line 106
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 107
    .line 108
    .line 109
    move-result v5

    .line 110
    int-to-float v5, v5

    .line 111
    cmpg-float v4, v4, v5

    .line 112
    .line 113
    if-gez v4, :cond_3

    .line 114
    .line 115
    iget v4, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->f:F

    .line 116
    .line 117
    sub-float/2addr v3, v4

    .line 118
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 119
    .line 120
    .line 121
    move-result v3

    .line 122
    const/high16 v4, 0x40a00000    # 5.0f

    .line 123
    .line 124
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 125
    .line 126
    .line 127
    move-result v4

    .line 128
    int-to-float v4, v4

    .line 129
    cmpg-float v3, v3, v4

    .line 130
    .line 131
    if-gez v3, :cond_3

    .line 132
    .line 133
    :goto_0
    move v3, v1

    .line 134
    goto :goto_1

    .line 135
    :cond_3
    move v3, v2

    .line 136
    goto :goto_1

    .line 137
    :cond_4
    iget v4, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->e:F

    .line 138
    .line 139
    cmpl-float v4, v0, v4

    .line 140
    .line 141
    if-nez v4, :cond_3

    .line 142
    .line 143
    iget v4, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->f:F

    .line 144
    .line 145
    cmpl-float v3, v3, v4

    .line 146
    .line 147
    if-nez v3, :cond_3

    .line 148
    .line 149
    goto :goto_0

    .line 150
    :goto_1
    iget-boolean v4, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->j:Z

    .line 151
    .line 152
    if-eqz v4, :cond_5

    .line 153
    .line 154
    if-eqz v3, :cond_5

    .line 155
    .line 156
    invoke-static {}, Ll/bnl0;->y0()I

    .line 157
    .line 158
    .line 159
    move-result v3

    .line 160
    iget v4, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->d:I

    .line 161
    .line 162
    sub-int/2addr v3, v4

    .line 163
    int-to-float v3, v3

    .line 164
    cmpg-float v0, v0, v3

    .line 165
    .line 166
    if-gez v0, :cond_5

    .line 167
    .line 168
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->L(Z)V

    .line 169
    .line 170
    .line 171
    :cond_5
    iput-boolean v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->j:Z

    .line 172
    .line 173
    goto :goto_2

    .line 174
    :cond_6
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->j:Z

    .line 175
    .line 176
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 177
    .line 178
    .line 179
    move-result v0

    .line 180
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->e:F

    .line 181
    .line 182
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->f:F

    .line 187
    .line 188
    :cond_7
    :goto_2
    invoke-super {p0, p1}, Lv/VFrame;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 189
    .line 190
    .line 191
    move-result p0

    .line 192
    return p0
.end method

.method public getViewStates()Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->i:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;

    .line 2
    .line 3
    return-object p0
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->g:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->b:Landroid/view/View;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->c:Landroid/view/View;

    .line 17
    .line 18
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 8

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-eqz v0, :cond_7

    .line 8
    .line 9
    const/4 v3, 0x2

    .line 10
    if-eq v0, v3, :cond_0

    .line 11
    .line 12
    goto/16 :goto_4

    .line 13
    .line 14
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    iget v4, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->e:F

    .line 23
    .line 24
    sub-float v4, v0, v4

    .line 25
    .line 26
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    iget v5, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->f:F

    .line 31
    .line 32
    sub-float v5, v3, v5

    .line 33
    .line 34
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    .line 35
    .line 36
    .line 37
    move-result v5

    .line 38
    cmpl-float v4, v4, v5

    .line 39
    .line 40
    if-lez v4, :cond_1

    .line 41
    .line 42
    move v4, v2

    .line 43
    goto :goto_0

    .line 44
    :cond_1
    move v4, v1

    .line 45
    :goto_0
    const-string v5, "samsung"

    .line 46
    .line 47
    sget-object v6, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 50
    .line 51
    .line 52
    move-result v5

    .line 53
    if-eqz v5, :cond_4

    .line 54
    .line 55
    sget-object v5, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v6

    .line 61
    const-string v7, "G9200"

    .line 62
    .line 63
    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v7

    .line 67
    invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 68
    .line 69
    .line 70
    move-result v6

    .line 71
    if-nez v6, :cond_2

    .line 72
    .line 73
    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v6

    .line 77
    const-string v7, "g7810"

    .line 78
    .line 79
    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v7

    .line 83
    invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 84
    .line 85
    .line 86
    move-result v6

    .line 87
    if-nez v6, :cond_2

    .line 88
    .line 89
    invoke-virtual {v5}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v5

    .line 93
    const-string v6, "s918u1"

    .line 94
    .line 95
    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v6

    .line 99
    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 100
    .line 101
    .line 102
    move-result v5

    .line 103
    if-eqz v5, :cond_4

    .line 104
    .line 105
    :cond_2
    if-eqz v4, :cond_3

    .line 106
    .line 107
    iget v4, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->e:F

    .line 108
    .line 109
    sub-float/2addr v0, v4

    .line 110
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    const/high16 v4, 0x40e00000    # 7.0f

    .line 115
    .line 116
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 117
    .line 118
    .line 119
    move-result v4

    .line 120
    int-to-float v4, v4

    .line 121
    cmpl-float v0, v0, v4

    .line 122
    .line 123
    if-ltz v0, :cond_3

    .line 124
    .line 125
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->f:F

    .line 126
    .line 127
    sub-float v0, v3, v0

    .line 128
    .line 129
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    const/high16 v4, 0x40a00000    # 5.0f

    .line 134
    .line 135
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 136
    .line 137
    .line 138
    move-result v4

    .line 139
    int-to-float v4, v4

    .line 140
    cmpl-float v0, v0, v4

    .line 141
    .line 142
    if-ltz v0, :cond_3

    .line 143
    .line 144
    move v4, v2

    .line 145
    goto :goto_1

    .line 146
    :cond_3
    move v4, v1

    .line 147
    :cond_4
    :goto_1
    if-eqz v4, :cond_5

    .line 148
    .line 149
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->f:F

    .line 150
    .line 151
    sub-float/2addr v3, v0

    .line 152
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    sget v3, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->t:I

    .line 157
    .line 158
    int-to-float v3, v3

    .line 159
    cmpg-float v0, v0, v3

    .line 160
    .line 161
    if-gez v0, :cond_5

    .line 162
    .line 163
    move v0, v2

    .line 164
    goto :goto_2

    .line 165
    :cond_5
    move v0, v1

    .line 166
    :goto_2
    if-eqz v0, :cond_6

    .line 167
    .line 168
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->a:Ll/ykl0;

    .line 169
    .line 170
    invoke-virtual {v0}, Ll/ykl0;->w()Landroid/view/View;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    if-nez v0, :cond_6

    .line 175
    .line 176
    move v0, v2

    .line 177
    goto :goto_3

    .line 178
    :cond_6
    move v0, v1

    .line 179
    :goto_3
    if-eqz v0, :cond_b

    .line 180
    .line 181
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    invoke-interface {v0, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 186
    .line 187
    .line 188
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->a:Ll/ykl0;

    .line 189
    .line 190
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->b:Landroid/view/View;

    .line 191
    .line 192
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 193
    .line 194
    .line 195
    move-result v1

    .line 196
    invoke-virtual {v0, v2, v1}, Ll/ykl0;->c(Landroid/view/View;I)V

    .line 197
    .line 198
    .line 199
    goto :goto_4

    .line 200
    :cond_7
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 201
    .line 202
    .line 203
    move-result v0

    .line 204
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->e:F

    .line 205
    .line 206
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 207
    .line 208
    .line 209
    move-result v0

    .line 210
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->f:F

    .line 211
    .line 212
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->K()Z

    .line 213
    .line 214
    .line 215
    move-result v0

    .line 216
    if-eqz v0, :cond_a

    .line 217
    .line 218
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->i:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;

    .line 223
    .line 224
    invoke-static {v3}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;->c(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;)Z

    .line 225
    .line 226
    .line 227
    move-result v3

    .line 228
    if-nez v3, :cond_8

    .line 229
    .line 230
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->getContentViewState()Z

    .line 231
    .line 232
    .line 233
    move-result v3

    .line 234
    if-nez v3, :cond_9

    .line 235
    .line 236
    :cond_8
    move v1, v2

    .line 237
    :cond_9
    invoke-interface {v0, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 238
    .line 239
    .line 240
    goto :goto_4

    .line 241
    :cond_a
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 242
    .line 243
    .line 244
    move-result-object v0

    .line 245
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->i:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;

    .line 246
    .line 247
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;->c(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;)Z

    .line 248
    .line 249
    .line 250
    move-result v1

    .line 251
    invoke-interface {v0, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 252
    .line 253
    .line 254
    :cond_b
    :goto_4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->a:Ll/ykl0;

    .line 255
    .line 256
    invoke-virtual {p0, p1}, Ll/ykl0;->P(Landroid/view/MotionEvent;)Z

    .line 257
    .line 258
    .line 259
    move-result p0

    .line 260
    return p0
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->b:Landroid/view/View;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->c:Landroid/view/View;

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->d:I

    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->c:Landroid/view/View;

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->c:Landroid/view/View;

    .line 25
    .line 26
    invoke-virtual {p3}, Landroid/view/View;->getMeasuredWidth()I

    .line 27
    .line 28
    .line 29
    move-result p3

    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 31
    .line 32
    .line 33
    move-result p4

    .line 34
    add-int/2addr p3, p4

    .line 35
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->c:Landroid/view/View;

    .line 36
    .line 37
    invoke-virtual {p4}, Landroid/view/View;->getMeasuredHeight()I

    .line 38
    .line 39
    .line 40
    move-result p4

    .line 41
    const/4 p5, 0x0

    .line 42
    invoke-virtual {p1, p2, p5, p3, p4}, Landroid/view/View;->layout(IIII)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->b:Landroid/view/View;

    .line 46
    .line 47
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->b:Landroid/view/View;

    .line 52
    .line 53
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    invoke-virtual {p1, p5, p5, p2, p0}, Landroid/view/View;->layout(IIII)V

    .line 58
    .line 59
    .line 60
    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->a:Ll/ykl0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ykl0;->G(Landroid/view/MotionEvent;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0
.end method

.method public setEnable(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup;->i:Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;->f(Lcom/p1/mobile/putong/live/livingroom/view/RightSideViewGroup$d;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
