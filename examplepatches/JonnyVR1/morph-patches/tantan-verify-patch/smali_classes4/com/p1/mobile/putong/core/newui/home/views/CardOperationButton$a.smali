.class public Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# direct methods
.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton$a;->b(Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;Landroid/view/View;)V

    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;Landroid/view/View;)V
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
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->u(Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->v(Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x2

    .line 20
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Lv/VIcon;

    .line 25
    .line 26
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->s(Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;Lv/VIcon;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
