.class public Ll/m5q;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;Landroid/view/View;)V
    .locals 2

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;

    .line 5
    .line 6
    check-cast p1, Landroid/view/ViewGroup;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 14
    .line 15
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;->b:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;->c:Lcom/p1/mobile/putong/core/ui/messages/ItemText;

    .line 24
    .line 25
    const/4 v0, 0x2

    .line 26
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Lv/VLinear;

    .line 31
    .line 32
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemFeedbackReason;->d:Lv/VLinear;

    .line 33
    .line 34
    return-void
.end method
