.class public final synthetic Ll/buj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/huj;

.field public final synthetic b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;

.field public final synthetic c:Ll/jjs;

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(Ll/huj;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Ll/jjs;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/buj;->a:Ll/huj;

    iput-object p2, p0, Ll/buj;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;

    iput-object p3, p0, Ll/buj;->c:Ll/jjs;

    iput p4, p0, Ll/buj;->d:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/buj;->a:Ll/huj;

    iget-object v1, p0, Ll/buj;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;

    iget-object v2, p0, Ll/buj;->c:Ll/jjs;

    iget p0, p0, Ll/buj;->d:I

    invoke-static {v0, v1, v2, p0, p1}, Ll/huj;->b(Ll/huj;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;Ll/jjs;ILandroid/view/View;)V

    return-void
.end method
