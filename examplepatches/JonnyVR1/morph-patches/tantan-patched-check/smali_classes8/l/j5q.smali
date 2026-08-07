.class public final synthetic Ll/j5q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/MessageFeedbackAnswers;

.field public final synthetic c:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;Lcom/p1/mobile/putong/core/data/MessageFeedbackAnswers;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j5q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;

    iput-object p2, p0, Ll/j5q;->b:Lcom/p1/mobile/putong/core/data/MessageFeedbackAnswers;

    iput-object p3, p0, Ll/j5q;->c:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/j5q;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;

    iget-object v1, p0, Ll/j5q;->b:Lcom/p1/mobile/putong/core/data/MessageFeedbackAnswers;

    iget-object p0, p0, Ll/j5q;->c:Landroid/view/View;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;->b(Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;Lcom/p1/mobile/putong/core/data/MessageFeedbackAnswers;Landroid/view/View;)V

    return-void
.end method
