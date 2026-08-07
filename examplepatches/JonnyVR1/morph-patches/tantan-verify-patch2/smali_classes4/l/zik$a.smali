.class public Ll/zik$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/zik;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# direct methods
.method public static bridge synthetic a(Ll/zik;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/zik$a;->c(Ll/zik;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public static b(Ll/zik;Landroid/view/View;)V
    .locals 1

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 3
    .line 4
    invoke-static {p0, v0}, Ll/zik;->a(Ll/zik;Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;)V

    .line 5
    .line 6
    .line 7
    sget v0, Ll/edc0;->I3:I

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Lv/VRecyclerView;

    .line 14
    .line 15
    invoke-static {p0, p1}, Ll/zik;->b(Ll/zik;Lv/VRecyclerView;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static c(Ll/zik;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/qec0;->s0:I

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
    invoke-static {p0, p1}, Ll/zik$a;->b(Ll/zik;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
