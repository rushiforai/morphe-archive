.class public final synthetic Ll/aqc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;

.field public final synthetic c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/aqc0;->a:Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;

    iput-object p2, p0, Ll/aqc0;->b:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;

    iput-object p3, p0, Ll/aqc0;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/aqc0;->a:Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;

    iget-object v1, p0, Ll/aqc0;->b:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;

    iget-object p0, p0, Ll/aqc0;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->O(Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Landroid/view/View;)V

    return-void
.end method
