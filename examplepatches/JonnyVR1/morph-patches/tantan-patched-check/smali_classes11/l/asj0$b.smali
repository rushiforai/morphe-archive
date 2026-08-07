.class public Ll/asj0$b;
.super Ll/gt0$j;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/asj0;->c0(Ll/vql;Lv/VDraweeView;Z)Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lv/VDraweeView;

.field public final synthetic c:Landroid/view/animation/ScaleAnimation;

.field public final synthetic d:Landroid/view/animation/ScaleAnimation;

.field public final synthetic e:Ll/vql;


# direct methods
.method public constructor <init>(ZLv/VDraweeView;Landroid/view/animation/ScaleAnimation;Landroid/view/animation/ScaleAnimation;Ll/vql;)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/asj0$b;->a:Z

    .line 2
    .line 3
    iput-object p2, p0, Ll/asj0$b;->b:Lv/VDraweeView;

    .line 4
    .line 5
    iput-object p3, p0, Ll/asj0$b;->c:Landroid/view/animation/ScaleAnimation;

    .line 6
    .line 7
    iput-object p4, p0, Ll/asj0$b;->d:Landroid/view/animation/ScaleAnimation;

    .line 8
    .line 9
    iput-object p5, p0, Ll/asj0$b;->e:Ll/vql;

    .line 10
    .line 11
    invoke-direct {p0}, Ll/gt0$j;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/asj0$b;->c:Landroid/view/animation/ScaleAnimation;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/animation/Animation;->cancel()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/asj0$b;->d:Landroid/view/animation/ScaleAnimation;

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/animation/Animation;->cancel()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/asj0$b;->e:Ll/vql;

    .line 12
    .line 13
    invoke-interface {p0}, Ll/vql;->c()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Ll/asj0$b;->a:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Ll/asj0$b;->b:Lv/VDraweeView;

    .line 6
    .line 7
    iget-object p0, p0, Ll/asj0$b;->c:Landroid/view/animation/ScaleAnimation;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Ll/asj0$b;->a:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Ll/asj0$b;->b:Lv/VDraweeView;

    .line 6
    .line 7
    iget-object p0, p0, Ll/asj0$b;->c:Landroid/view/animation/ScaleAnimation;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method
