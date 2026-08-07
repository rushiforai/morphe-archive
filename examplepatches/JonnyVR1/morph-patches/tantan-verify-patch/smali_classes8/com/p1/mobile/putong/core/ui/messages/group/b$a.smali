.class public Lcom/p1/mobile/putong/core/ui/messages/group/b$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/messages/group/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# direct methods
.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/ui/messages/group/b;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/group/b$a;->c(Lcom/p1/mobile/putong/core/ui/messages/group/b;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public static b(Lcom/p1/mobile/putong/core/ui/messages/group/b;Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lv/VRecyclerView;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/group/b;->c(Lcom/p1/mobile/putong/core/ui/messages/group/b;Lv/VRecyclerView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static c(Lcom/p1/mobile/putong/core/ui/messages/group/b;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/qec0;->x0:I

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
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/group/b$a;->b(Lcom/p1/mobile/putong/core/ui/messages/group/b;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
