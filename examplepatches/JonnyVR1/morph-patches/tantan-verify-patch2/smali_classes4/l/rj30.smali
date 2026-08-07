.class public final synthetic Ll/rj30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

.field public final synthetic d:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rj30;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/rj30;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/rj30;->c:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    iput-object p4, p0, Ll/rj30;->d:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/rj30;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/rj30;->b:Lcom/p1/mobile/putong/data/User;

    iget-object v2, p0, Ll/rj30;->c:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    iget-object p0, p0, Ll/rj30;->d:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    invoke-static {v0, v1, v2, p0, p1}, Ll/vj30;->i(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Landroid/view/View;)V

    return-void
.end method
