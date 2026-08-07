.class public final synthetic Ll/ek6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;

.field public final synthetic c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ek6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;

    iput-object p2, p0, Ll/ek6;->b:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;

    iput-object p3, p0, Ll/ek6;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ek6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;

    iget-object v1, p0, Ll/ek6;->b:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;

    iget-object p0, p0, Ll/ek6;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->N(Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Landroid/view/View;)V

    return-void
.end method
