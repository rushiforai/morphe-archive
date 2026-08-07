.class public abstract Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/uf3;",
        ">",
        "Landroid/widget/RelativeLayout;"
    }
.end annotation


# static fields
.field public static final c:Landroid/view/animation/AnticipateOvershootInterpolator;


# instance fields
.field public a:Ll/uf3;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TD;"
        }
    .end annotation
.end field

.field public b:Ll/qm50;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Landroid/view/animation/AnticipateOvershootInterpolator;

    .line 2
    .line 3
    const v1, 0x3f2e147b    # 0.68f

    .line 4
    .line 5
    .line 6
    invoke-direct {v0, v1}, Landroid/view/animation/AnticipateOvershootInterpolator;-><init>(F)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->c:Landroid/view/animation/AnticipateOvershootInterpolator;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public a(F)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    cmpg-float v1, p1, v1

    .line 6
    .line 7
    if-gez v1, :cond_0

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 v1, 0x0

    .line 12
    :goto_0
    iput-boolean v1, v0, Ll/uf3;->c:Z

    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->c:Landroid/view/animation/AnticipateOvershootInterpolator;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Landroid/view/animation/AnticipateOvershootInterpolator;->getInterpolation(F)F

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->getAnimLayout()Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->getAnimLayout()Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    int-to-float v1, v1

    .line 33
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotX(F)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->getAnimLayout()Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const/4 v1, 0x0

    .line 41
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotY(F)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->getAnimLayout()Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0, p1}, Landroid/view/View;->setScaleX(F)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->getAnimLayout()Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0, p1}, Landroid/view/View;->setScaleY(F)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public b(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 2
    .line 3
    iget-boolean v0, v0, Ll/uf3;->b:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->getAnimLayout()Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Landroid/view/View;->getScaleY()F

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    const/high16 v0, 0x3f000000    # 0.5f

    .line 18
    .line 19
    cmpl-float p1, p1, v0

    .line 20
    .line 21
    if-ltz p1, :cond_0

    .line 22
    .line 23
    const/4 p1, 0x1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 p1, 0x0

    .line 26
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->c(Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public abstract c(Z)V
.end method

.method public d(Ll/uf3;Ll/qm50;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TD;",
            "Ll/qm50;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->b:Ll/qm50;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-boolean p1, p1, Ll/uf3;->d:Z

    .line 9
    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    const p1, 0x3e99999a    # 0.3f

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_1
    const/high16 p1, 0x3f800000    # 1.0f

    .line 17
    .line 18
    :goto_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 22
    .line 23
    iget-boolean p1, p1, Ll/uf3;->b:Z

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->b(Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public abstract e(F)V
.end method

.method public f()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    iput-boolean v1, v0, Ll/uf3;->d:Z

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->b:Ll/qm50;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->b:Ll/qm50;

    .line 15
    .line 16
    invoke-interface {p0}, Ll/qm50;->a()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public g(FZ)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v1, 0x0

    .line 7
    if-nez p2, :cond_1

    .line 8
    .line 9
    iput-boolean v1, v0, Ll/uf3;->c:Z

    .line 10
    .line 11
    :cond_1
    iget-boolean p2, v0, Ll/uf3;->c:Z

    .line 12
    .line 13
    if-nez p2, :cond_2

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->e(F)V

    .line 16
    .line 17
    .line 18
    :cond_2
    const/high16 p2, 0x3f000000    # 0.5f

    .line 19
    .line 20
    cmpl-float p1, p1, p2

    .line 21
    .line 22
    if-ltz p1, :cond_3

    .line 23
    .line 24
    const/4 p1, 0x1

    .line 25
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->b(Z)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_3
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->b(Z)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public abstract getAnimLayout()Landroid/view/View;
.end method

.method public getDataWrapper()Ll/uf3;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TD;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 2
    .line 3
    return-object p0
.end method

.method public setShowContent(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->a:Ll/uf3;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iput-boolean p1, v0, Ll/uf3;->b:Z

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->b:Ll/qm50;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/square/AbsBubbleItemView;->b:Ll/qm50;

    .line 18
    .line 19
    invoke-interface {p0}, Ll/qm50;->a()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method
