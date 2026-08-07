.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# direct methods
.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem$a;->b(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;Landroid/view/View;)V

    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;Landroid/view/View;)V
    .locals 4

    .line 1
    check-cast p1, Landroid/view/ViewGroup;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    check-cast v1, Landroid/view/ViewGroup;

    .line 9
    .line 10
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Lv/VDraweeView;

    .line 15
    .line 16
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;->B(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;Lv/VDraweeView;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Landroid/view/ViewGroup;

    .line 24
    .line 25
    const/4 v2, 0x1

    .line 26
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lv/VText_AutoFit;

    .line 31
    .line 32
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;->w(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;Lv/VText_AutoFit;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Landroid/view/ViewGroup;

    .line 40
    .line 41
    const/4 v3, 0x2

    .line 42
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Lv/VText;

    .line 47
    .line 48
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;->z(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;Lv/VText;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    check-cast p1, Landroid/view/ViewGroup;

    .line 56
    .line 57
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    check-cast p1, Lv/VText;

    .line 62
    .line 63
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;->C(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;Lv/VText;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method
