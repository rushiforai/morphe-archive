.class public Ll/ztc0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


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
    iput-object p1, p0, Ll/ztc0$b;->a:Ll/ztc0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ztc0$b;->a:Ll/ztc0;

    .line 2
    .line 3
    iget-object p1, p1, Ll/ztc0;->a:Landroid/widget/RelativeLayout;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/ztc0$b;->a:Ll/ztc0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ztc0;->u()Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget p1, Ll/g9c0;->K:I

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->setStatusBarColorResId(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
