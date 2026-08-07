.class public Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# direct methods
.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView$a;->b(Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;Landroid/view/View;)V

    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;Landroid/view/View;)V
    .locals 3

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
    check-cast v1, Lv/VLinear;

    .line 9
    .line 10
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;->b(Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;Lv/VLinear;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Landroid/view/ViewGroup;

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Lv/VCheckBox;

    .line 24
    .line 25
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;->e(Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;Lv/VCheckBox;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Landroid/view/ViewGroup;

    .line 33
    .line 34
    const/4 v2, 0x1

    .line 35
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Lv/VDraweeView;

    .line 40
    .line 41
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;->c(Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;Lv/VDraweeView;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Landroid/view/ViewGroup;

    .line 49
    .line 50
    const/4 v1, 0x2

    .line 51
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Lv/VText;

    .line 56
    .line 57
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;->d(Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;Lv/VText;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    check-cast p1, Lv/VText;

    .line 65
    .line 66
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;->f(Lcom/p1/mobile/putong/core/ui/messages/group/GroupRemoveMemberItemView;Lv/VText;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method
