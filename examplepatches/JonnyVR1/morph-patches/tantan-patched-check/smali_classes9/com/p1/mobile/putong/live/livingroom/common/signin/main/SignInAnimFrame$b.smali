.class public Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->k(Ll/x20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ll/x20;

.field public final synthetic c:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;ILl/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame$b;->c:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame$b;->a:I

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame$b;->b:Ll/x20;

    .line 6
    .line 7
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame$b;->a:I

    .line 3
    .line 4
    if-ge v0, v1, :cond_1

    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame$b;->c:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->b:Landroid/widget/FrameLayout;

    .line 9
    .line 10
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimItem;

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationX(F)V

    .line 18
    .line 19
    .line 20
    iget v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame$b;->a:I

    .line 21
    .line 22
    add-int/lit8 v3, v3, -0x1

    .line 23
    .line 24
    if-eq v0, v3, :cond_0

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Landroid/view/View;->setAlpha(F)V

    .line 27
    .line 28
    .line 29
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame$b;->b:Ll/x20;

    .line 33
    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    invoke-interface {v0}, Ll/x20;->call()V

    .line 37
    .line 38
    .line 39
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame$b;->c:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;

    .line 40
    .line 41
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->f(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;)Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    return-void
.end method
