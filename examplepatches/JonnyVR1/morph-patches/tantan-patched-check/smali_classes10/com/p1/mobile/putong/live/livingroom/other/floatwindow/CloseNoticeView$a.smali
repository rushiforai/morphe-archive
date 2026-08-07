.class public Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/CloseNoticeView$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/CloseNoticeView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# direct methods
.method public static bridge synthetic a(Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/CloseNoticeView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/CloseNoticeView$a;->b(Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/CloseNoticeView;Landroid/view/View;)V

    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/CloseNoticeView;Landroid/view/View;)V
    .locals 1

    .line 1
    check-cast p1, Landroid/view/ViewGroup;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Lv/VText;

    .line 9
    .line 10
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/CloseNoticeView;->d(Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/CloseNoticeView;Lv/VText;)V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lv/VText;

    .line 19
    .line 20
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/CloseNoticeView;->c(Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/CloseNoticeView;Lv/VText;)V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x3

    .line 24
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lv/VButton;

    .line 29
    .line 30
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/CloseNoticeView;->b(Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/CloseNoticeView;Lv/VButton;)V

    .line 31
    .line 32
    .line 33
    const/4 v0, 0x4

    .line 34
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    check-cast p1, Lv/VButton;

    .line 39
    .line 40
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/CloseNoticeView;->a(Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/CloseNoticeView;Lv/VButton;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method
