.class public final synthetic Ll/vpu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftView;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vpu;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftView;

    iput-object p2, p0, Ll/vpu;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;

    iput p3, p0, Ll/vpu;->c:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vpu;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftView;

    iget-object v1, p0, Ll/vpu;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;

    iget p0, p0, Ll/vpu;->c:I

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftView;->h0(Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftView;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/multiple/LiveVChatMultipleGiftItemView;ILandroid/view/View;)V

    return-void
.end method
