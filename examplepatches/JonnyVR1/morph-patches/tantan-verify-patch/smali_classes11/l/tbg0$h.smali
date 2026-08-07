.class public Ll/tbg0$h;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/tbg0;-><init>(Lcom/google/android/exoplayer2/ui/StyledPlayerControlView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/tbg0;


# direct methods
.method public constructor <init>(Ll/tbg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tbg0$h;->a:Ll/tbg0;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/tbg0$h;->a:Ll/tbg0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/tbg0;->x(Ll/tbg0;)Landroid/view/ViewGroup;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/tbg0$h;->a:Ll/tbg0;

    .line 10
    .line 11
    invoke-static {p0}, Ll/tbg0;->x(Ll/tbg0;)Landroid/view/ViewGroup;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/4 p1, 0x4

    .line 16
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/tbg0$h;->a:Ll/tbg0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/tbg0;->w(Ll/tbg0;)Landroid/view/ViewGroup;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/tbg0$h;->a:Ll/tbg0;

    .line 10
    .line 11
    invoke-static {p1}, Ll/tbg0;->w(Ll/tbg0;)Landroid/view/ViewGroup;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/tbg0$h;->a:Ll/tbg0;

    .line 20
    .line 21
    invoke-static {p1}, Ll/tbg0;->w(Ll/tbg0;)Landroid/view/ViewGroup;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iget-object v1, p0, Ll/tbg0$h;->a:Ll/tbg0;

    .line 26
    .line 27
    invoke-static {v1}, Ll/tbg0;->w(Ll/tbg0;)Landroid/view/ViewGroup;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    int-to-float v1, v1

    .line 36
    invoke-virtual {p1, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Ll/tbg0$h;->a:Ll/tbg0;

    .line 40
    .line 41
    invoke-static {p1}, Ll/tbg0;->w(Ll/tbg0;)Landroid/view/ViewGroup;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iget-object p0, p0, Ll/tbg0$h;->a:Ll/tbg0;

    .line 46
    .line 47
    invoke-static {p0}, Ll/tbg0;->w(Ll/tbg0;)Landroid/view/ViewGroup;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    invoke-virtual {p1, p0, v0}, Landroid/view/View;->scrollTo(II)V

    .line 56
    .line 57
    .line 58
    :cond_0
    return-void
.end method
