.class public final synthetic Ll/g3q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemBlindBoxGuideView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemBlindBoxGuideView;Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g3q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemBlindBoxGuideView;

    iput-object p2, p0, Ll/g3q;->b:Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g3q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemBlindBoxGuideView;

    iget-object p0, p0, Ll/g3q;->b:Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemBlindBoxGuideView;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemBlindBoxGuideView;Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;Landroid/view/View;)V

    return-void
.end method
