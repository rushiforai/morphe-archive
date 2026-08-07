.class public final synthetic Ll/sj30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/Recommended;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Recommended;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sj30;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    iput-object p2, p0, Ll/sj30;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/sj30;->c:Lcom/p1/mobile/putong/core/data/Recommended;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sj30;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    iget-object v1, p0, Ll/sj30;->b:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/sj30;->c:Lcom/p1/mobile/putong/core/data/Recommended;

    invoke-static {v0, v1, p0, p1}, Ll/vj30;->f(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Recommended;Landroid/view/View;)V

    return-void
.end method
