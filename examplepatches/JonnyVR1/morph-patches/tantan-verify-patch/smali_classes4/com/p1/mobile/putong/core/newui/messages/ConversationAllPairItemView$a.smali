.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# direct methods
.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$a;->b(Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;Landroid/view/View;)V

    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;Landroid/view/View;)V
    .locals 4

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->F(Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;)V

    .line 5
    .line 6
    .line 7
    check-cast p1, Landroid/view/ViewGroup;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Landroid/view/ViewGroup;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lv/VDraweeView;

    .line 21
    .line 22
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->C(Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;Lv/VDraweeView;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Landroid/view/ViewGroup;

    .line 30
    .line 31
    const/4 v2, 0x1

    .line 32
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 37
    .line 38
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->E(Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Landroid/view/ViewGroup;

    .line 46
    .line 47
    const/4 v3, 0x2

    .line 48
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    check-cast v1, Lv/VImage;

    .line 53
    .line 54
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->B(Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;Lv/VImage;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Landroid/view/ViewGroup;

    .line 62
    .line 63
    const/4 v1, 0x3

    .line 64
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Lv/VImage;

    .line 69
    .line 70
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->z(Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;Lv/VImage;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    check-cast p1, Lv/VText;

    .line 78
    .line 79
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->G(Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;Lv/VText;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method
