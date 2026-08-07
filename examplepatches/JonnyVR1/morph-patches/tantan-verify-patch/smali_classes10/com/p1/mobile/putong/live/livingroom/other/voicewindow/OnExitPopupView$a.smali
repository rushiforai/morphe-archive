.class public Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView$a;
.super Ll/gt0$j;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->c()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView$a;->a:Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/gt0$j;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView$a;->a:Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    check-cast p1, Landroid/view/ViewGroup;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView$a;->a:Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;

    .line 16
    .line 17
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method
