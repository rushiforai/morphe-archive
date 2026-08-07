.class public Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView$a;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView$a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView$a;->b(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final synthetic b(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView$a;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->e(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    xor-int/lit8 p1, p1, 0x1

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->l(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView$a;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->a:Lv/VFrame;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->c(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;)Landroid/view/ViewGroup$LayoutParams;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView$a;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;

    .line 13
    .line 14
    iget-object v1, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->e:Lv/VFrame;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->d(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;)Landroid/view/ViewGroup$LayoutParams;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView$a;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->e:Lv/VFrame;

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView$a;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->e:Lv/VFrame;

    .line 34
    .line 35
    new-instance v1, Ll/pxu;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/pxu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView$a;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView$a;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->a:Lv/VFrame;

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView$a;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->a:Lv/VFrame;

    .line 54
    .line 55
    const/4 v1, 0x0

    .line 56
    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView$a;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;

    .line 60
    .line 61
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->e(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->setSurfaceViewOrder(Z)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView$a;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;

    .line 69
    .line 70
    invoke-static {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->e(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;->f(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;Z)V

    .line 75
    .line 76
    .line 77
    return-void
.end method
