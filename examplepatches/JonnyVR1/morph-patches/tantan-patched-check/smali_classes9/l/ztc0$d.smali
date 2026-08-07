.class public Ll/ztc0$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ztc0;->T(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/RedPacket;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ztc0;


# direct methods
.method public constructor <init>(Ll/ztc0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ztc0$d;->a:Ll/ztc0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ztc0$d;->a:Ll/ztc0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/ztc0;->q(Ll/ztc0;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/ztc0$d;->a:Ll/ztc0;

    .line 7
    .line 8
    iget-object p1, p1, Ll/ztc0;->r:Lv/VText;

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-virtual {p1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/ztc0$d;->a:Ll/ztc0;

    .line 15
    .line 16
    iget-object p0, p0, Ll/ztc0;->q:Lv/VImage;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/view/View;->setClickable(Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ztc0$d;->a:Ll/ztc0;

    .line 2
    .line 3
    iget-object p1, p1, Ll/ztc0;->h:Landroid/widget/RelativeLayout;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/ztc0$d;->a:Ll/ztc0;

    .line 10
    .line 11
    iget-object p0, p0, Ll/ztc0;->g:Landroid/widget/RelativeLayout;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
