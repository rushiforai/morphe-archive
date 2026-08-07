.class public Ll/asj0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/asj0;->c0(Ll/vql;Lv/VDraweeView;Z)Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/vql;

.field public final synthetic b:Z

.field public final synthetic c:Lv/VDraweeView;

.field public final synthetic d:Landroid/view/animation/ScaleAnimation;


# direct methods
.method public constructor <init>(Ll/vql;ZLv/VDraweeView;Landroid/view/animation/ScaleAnimation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/asj0$a;->a:Ll/vql;

    .line 2
    .line 3
    iput-boolean p2, p0, Ll/asj0$a;->b:Z

    .line 4
    .line 5
    iput-object p3, p0, Ll/asj0$a;->c:Lv/VDraweeView;

    .line 6
    .line 7
    iput-object p4, p0, Ll/asj0$a;->d:Landroid/view/animation/ScaleAnimation;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/asj0$a;->a:Ll/vql;

    .line 2
    .line 3
    invoke-interface {p1}, Ll/vql;->a()V

    .line 4
    .line 5
    .line 6
    iget-boolean p1, p0, Ll/asj0$a;->b:Z

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Ll/asj0$a;->c:Lv/VDraweeView;

    .line 11
    .line 12
    iget-object p0, p0, Ll/asj0$a;->d:Landroid/view/animation/ScaleAnimation;

    .line 13
    .line 14
    invoke-virtual {p1, p0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 0

    .line 1
    return-void
.end method
