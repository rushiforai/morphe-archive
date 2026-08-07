.class public final synthetic Ll/j66;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;ILcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j66;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;

    iput p2, p0, Ll/j66;->b:I

    iput-object p3, p0, Ll/j66;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/j66;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;

    iget v1, p0, Ll/j66;->b:I

    iget-object p0, p0, Ll/j66;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->u(Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;ILcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Landroid/view/View;)V

    return-void
.end method
