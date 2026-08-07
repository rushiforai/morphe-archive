.class public Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/FrameLayout;",
        "Ll/iam<",
        "Ll/wvk0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPreviewView;

.field public b:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;

.field public c:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatInfoView;

.field public d:Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;

.field public e:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatMessageView;

.field public f:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;

.field public g:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;

.field public h:Landroid/view/View;

.field public i:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatWaitingOrderView;

.field public j:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;

.field public k:Lv/VImage;

.field public l:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;

.field public m:Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/dtu;->a(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Ll/wvk0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/wvk0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;->b(Ll/wvk0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
