.class public final synthetic Ll/nj30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nj30;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    iput-object p2, p0, Ll/nj30;->b:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nj30;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    iget-object p0, p0, Ll/nj30;->b:Lcom/p1/mobile/android/app/Act;

    invoke-static {v0, p0, p1}, Ll/vj30;->p(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method
