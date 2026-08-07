.class public Ll/tu90;
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

.method public static a(Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;Landroid/view/View;)V
    .locals 4

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
    move-result-object v1

    .line 8
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;->u:Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Lv/VLinear;

    .line 18
    .line 19
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;->v:Lv/VLinear;

    .line 20
    .line 21
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Landroid/view/ViewGroup;

    .line 26
    .line 27
    const/4 v3, 0x0

    .line 28
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileItemImageView;

    .line 33
    .line 34
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;->w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileItemImageView;

    .line 35
    .line 36
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    check-cast v2, Landroid/view/ViewGroup;

    .line 41
    .line 42
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileItemImageView;

    .line 47
    .line 48
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;->x:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileItemImageView;

    .line 49
    .line 50
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    check-cast p1, Landroid/view/ViewGroup;

    .line 55
    .line 56
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileItemImageView;

    .line 61
    .line 62
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;->y:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileItemImageView;

    .line 63
    .line 64
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/kec0;->P9:I

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
    invoke-static {p0, p1}, Ll/tu90;->a(Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileGameItemHolder;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
