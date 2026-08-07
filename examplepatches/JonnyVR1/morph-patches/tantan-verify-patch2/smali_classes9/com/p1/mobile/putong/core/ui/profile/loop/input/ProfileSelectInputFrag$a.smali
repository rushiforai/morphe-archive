.class public Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# direct methods
.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$a;->c(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public static b(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;Landroid/view/View;)V
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
    check-cast v0, Lv/navigationbar/VNavigationBar;

    .line 9
    .line 10
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;->P4(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;Lv/navigationbar/VNavigationBar;)V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lv/VList;

    .line 19
    .line 20
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;->Q4(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;Lv/VList;)V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x2

    .line 24
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;

    .line 29
    .line 30
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;->O4(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopActionLayout;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public static c(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/sec0;->E:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag$a;->b(Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileSelectInputFrag;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
