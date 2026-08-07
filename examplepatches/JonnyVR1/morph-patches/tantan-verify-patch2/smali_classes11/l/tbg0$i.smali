.class public Ll/tbg0$i;
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
    iput-object p1, p0, Ll/tbg0$i;->a:Ll/tbg0;

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
    iget-object p1, p0, Ll/tbg0$i;->a:Ll/tbg0;

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
    iget-object p0, p0, Ll/tbg0$i;->a:Ll/tbg0;

    .line 10
    .line 11
    invoke-static {p0}, Ll/tbg0;->w(Ll/tbg0;)Landroid/view/ViewGroup;

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
    .locals 0

    .line 1
    iget-object p1, p0, Ll/tbg0$i;->a:Ll/tbg0;

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
    iget-object p0, p0, Ll/tbg0$i;->a:Ll/tbg0;

    .line 10
    .line 11
    invoke-static {p0}, Ll/tbg0;->x(Ll/tbg0;)Landroid/view/ViewGroup;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method
