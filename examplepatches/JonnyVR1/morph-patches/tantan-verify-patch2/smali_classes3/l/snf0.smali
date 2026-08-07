.class public Ll/snf0;
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

.method public static a(Ll/rnf0;Landroid/view/View;)V
    .locals 1

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundConstraintLayout;

    .line 3
    .line 4
    iput-object v0, p0, Ll/rnf0;->b:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundConstraintLayout;

    .line 5
    .line 6
    check-cast p1, Landroid/view/ViewGroup;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundView;

    .line 14
    .line 15
    iput-object v0, p0, Ll/rnf0;->c:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundView;

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lv/VDraweeView;

    .line 23
    .line 24
    iput-object v0, p0, Ll/rnf0;->d:Lv/VDraweeView;

    .line 25
    .line 26
    const/4 v0, 0x2

    .line 27
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Lv/VPullUpRecyclerView;

    .line 32
    .line 33
    iput-object v0, p0, Ll/rnf0;->e:Lv/VPullUpRecyclerView;

    .line 34
    .line 35
    const/4 v0, 0x3

    .line 36
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iput-object v0, p0, Ll/rnf0;->f:Landroid/view/View;

    .line 41
    .line 42
    const/4 v0, 0x4

    .line 43
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iput-object v0, p0, Ll/rnf0;->g:Landroid/view/View;

    .line 48
    .line 49
    const/4 v0, 0x5

    .line 50
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    check-cast p1, Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundButton;

    .line 55
    .line 56
    iput-object p1, p0, Ll/rnf0;->h:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundButton;

    .line 57
    .line 58
    return-void
.end method

.method public static b(Ll/rnf0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/kec0;->L4:I

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
    invoke-static {p0, p1}, Ll/snf0;->a(Ll/rnf0;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
