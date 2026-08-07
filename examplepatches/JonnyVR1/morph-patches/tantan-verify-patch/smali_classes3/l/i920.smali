.class public Ll/i920;
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

.method public static a(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/MyTabUserHeaderView;Landroid/view/View;)V
    .locals 1

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/MyTabUserHeaderView;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/MyTabUserHeaderView;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/MyTabUserHeaderView;

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
    check-cast v0, Landroid/widget/FrameLayout;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/MyTabUserHeaderView;->b:Landroid/widget/FrameLayout;

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;

    .line 23
    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/MyTabUserHeaderView;->c:Lcom/p1/mobile/putong/core/ui/banner/view/PrivilegeEntranceView;

    .line 25
    .line 26
    return-void
.end method
