.class public final synthetic Ll/sf4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/tf4;

.field public final synthetic b:Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;


# direct methods
.method public synthetic constructor <init>(Ll/tf4;Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sf4;->a:Ll/tf4;

    iput-object p2, p0, Ll/sf4;->b:Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sf4;->a:Ll/tf4;

    iget-object p0, p0, Ll/sf4;->b:Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;

    invoke-static {v0, p0, p1}, Ll/tf4;->b(Ll/tf4;Lcom/p1/mobile/longlink/msg/liveroom/LiveChatAreaOperationMessage$JumpLink;Landroid/view/View;)V

    return-void
.end method
