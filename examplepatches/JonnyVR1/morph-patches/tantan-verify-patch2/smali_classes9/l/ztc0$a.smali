.class public Ll/ztc0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ztc0;->S(Ljava/lang/String;ZLcom/p1/mobile/putong/core/data/RedPacket;Z)V
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
    iput-object p1, p0, Ll/ztc0$a;->a:Ll/ztc0;

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
    iget-object p1, p0, Ll/ztc0$a;->a:Ll/ztc0;

    .line 2
    .line 3
    iget-object p1, p1, Ll/ztc0;->h:Landroid/widget/RelativeLayout;

    .line 4
    .line 5
    const/16 v0, 0x8

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/ztc0$a;->a:Ll/ztc0;

    .line 11
    .line 12
    iget-object p1, p1, Ll/ztc0;->t:Landroid/widget/RelativeLayout;

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Ll/ztc0$a;->a:Ll/ztc0;

    .line 18
    .line 19
    iget-object p1, p1, Ll/ztc0;->d:Lv/VImage;

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/ztc0$a;->a:Ll/ztc0;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/ztc0;->u()Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    sget p1, Ll/g9c0;->K:I

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->setStatusBarColorResId(I)V

    .line 34
    .line 35
    .line 36
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
    iget-object p1, p0, Ll/ztc0$a;->a:Ll/ztc0;

    .line 2
    .line 3
    iget-object p1, p1, Ll/ztc0;->d:Lv/VImage;

    .line 4
    .line 5
    const/4 v0, 0x4

    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Ll/ztc0$a;->a:Ll/ztc0;

    .line 10
    .line 11
    iget-object p1, p1, Ll/ztc0;->t:Landroid/widget/RelativeLayout;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/ztc0$a;->a:Ll/ztc0;

    .line 17
    .line 18
    iget-object p0, p0, Ll/ztc0;->a:Landroid/widget/RelativeLayout;

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
