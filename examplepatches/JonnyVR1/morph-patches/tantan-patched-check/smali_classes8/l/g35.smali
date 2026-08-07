.class public final synthetic Ll/g35;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/ContinuousChatTip;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;Lcom/p1/mobile/putong/core/data/ContinuousChatTip;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g35;->a:Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;

    iput-object p2, p0, Ll/g35;->b:Lcom/p1/mobile/putong/core/data/ContinuousChatTip;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g35;->a:Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;

    iget-object p0, p0, Ll/g35;->b:Lcom/p1/mobile/putong/core/data/ContinuousChatTip;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;->a(Lcom/p1/mobile/putong/core/ui/messages/ChatTipsItem;Lcom/p1/mobile/putong/core/data/ContinuousChatTip;Landroid/view/View;)V

    return-void
.end method
