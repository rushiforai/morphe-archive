.class public Lcom/p1/mobile/putong/core/ui/messages/view/GroupBannedView$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/messages/view/GroupBannedView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# direct methods
.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/ui/messages/view/GroupBannedView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/GroupBannedView$b;->b(Lcom/p1/mobile/putong/core/ui/messages/view/GroupBannedView;Landroid/view/View;)V

    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/core/ui/messages/view/GroupBannedView;Landroid/view/View;)V
    .locals 1

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
    move-result-object v0

    .line 8
    check-cast v0, Lv/VImage;

    .line 9
    .line 10
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/GroupBannedView;->a(Lcom/p1/mobile/putong/core/ui/messages/view/GroupBannedView;Lv/VImage;)V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Landroid/widget/TextView;

    .line 19
    .line 20
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/GroupBannedView;->b(Lcom/p1/mobile/putong/core/ui/messages/view/GroupBannedView;Landroid/widget/TextView;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
