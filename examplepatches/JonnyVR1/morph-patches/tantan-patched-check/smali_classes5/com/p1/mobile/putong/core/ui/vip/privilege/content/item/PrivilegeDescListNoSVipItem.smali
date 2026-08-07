.class public Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;
    }
.end annotation


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/widget/FrameLayout;

.field public c:Landroid/widget/LinearLayout;

.field public d:Landroid/widget/FrameLayout;

.field public e:Lv/VButton;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;->b(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;)Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;->b(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;)Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a$a;->a(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic b(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTopChatItem;Ljava/util/List;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTopChatItem$a;Ll/jic0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-interface {p2, p3}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    invoke-virtual {p4}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/s390;->a(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final d(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListDiamondServiceItem$a;Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListDiamondServiceItem$a;",
            "Ll/jic0<",
            "Ll/h390;",
            ">;",
            "Lcom/p1/mobile/putong/app/PutongFrag;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget p3, Ll/kec0;->Z8:I

    .line 6
    .line 7
    const/4 p4, 0x0

    .line 8
    invoke-static {p0, p3, p4}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListDiamondServiceItem;

    .line 13
    .line 14
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListDiamondServiceItem;->w(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListDiamondServiceItem$a;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final e(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListDiamondSkinItem$a;Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListDiamondSkinItem$a;",
            "Ll/jic0<",
            "Ll/h390;",
            ">;",
            "Lcom/p1/mobile/putong/app/PutongFrag;",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget v0, Ll/kec0;->Y8:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {p0, v0, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListDiamondSkinItem;

    .line 13
    .line 14
    invoke-virtual {p0, p2, p3, p4, p5}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListDiamondSkinItem;->i(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListDiamondSkinItem$a;Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final f(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListVisitorItem$a;Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListVisitorItem$a;",
            "Ll/jic0<",
            "Ll/h390;",
            ">;",
            "Lcom/p1/mobile/putong/app/PutongFrag;",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget v0, Ll/kec0;->l9:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {p0, v0, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListVisitorItem;

    .line 13
    .line 14
    invoke-virtual {p0, p3, p4, p2, p5}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListVisitorItem;->r(Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListVisitorItem$a;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final g(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListItem$a;Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListItem$a;",
            "Ll/jic0<",
            "Ll/h390;",
            ">;",
            "Lcom/p1/mobile/putong/app/PutongFrag;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget v0, Ll/kec0;->b9:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {p0, v0, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListItem;

    .line 13
    .line 14
    invoke-virtual {p0, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListItem;->h(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListItem$a;Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final h(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPartnerDressUpItem$a;Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPartnerDressUpItem$a;",
            "Ll/jic0<",
            "Ll/h390;",
            ">;",
            "Lcom/p1/mobile/putong/app/PutongFrag;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget v0, Ll/kec0;->m9:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {p0, v0, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPartnerDressUpItem;

    .line 13
    .line 14
    invoke-virtual {p0, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPartnerDressUpItem;->p(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPartnerDressUpItem$a;Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final i(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$a;Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$a;",
            "Ll/jic0<",
            "Ll/h390;",
            ">;",
            "Lcom/p1/mobile/putong/app/PutongFrag;",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget v0, Ll/kec0;->c9:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {p0, v0, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem;

    .line 13
    .line 14
    invoke-virtual {p0, p3, p4, p2, p5}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem;->h(Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$a;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final j(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTopChatItem$a;Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTopChatItem$a;",
            "Ll/jic0<",
            "Ll/h390;",
            ">;",
            "Lcom/p1/mobile/putong/app/PutongFrag;",
            "Ljava/util/List<",
            "Ll/h390;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget v0, Ll/kec0;->k9:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {p0, v0, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    move-object v0, p0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTopChatItem;

    .line 14
    .line 15
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_O_PLATINUM:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 16
    .line 17
    new-instance v5, Ll/r390;

    .line 18
    .line 19
    move-object v1, p1

    .line 20
    move-object v4, p2

    .line 21
    move-object v3, p5

    .line 22
    move-object v2, v0

    .line 23
    move-object v0, v5

    .line 24
    move-object v5, p3

    .line 25
    invoke-direct/range {v0 .. v5}, Ll/r390;-><init>(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTopChatItem;Ljava/util/List;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTopChatItem$a;Ll/jic0;)V

    .line 26
    .line 27
    .line 28
    move-object v3, v4

    .line 29
    move-object v4, p0

    .line 30
    move-object p0, v1

    .line 31
    move-object v1, v5

    .line 32
    move-object v5, v0

    .line 33
    move-object v0, v2

    .line 34
    move-object v2, p4

    .line 35
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTopChatItem;->f(Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTopChatItem$a;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/x20;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final k(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListSeeItem$a;Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListSeeItem$a;",
            "Ll/jic0<",
            "Ll/h390;",
            ">;",
            "Lcom/p1/mobile/putong/app/PutongFrag;",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget v0, Ll/kec0;->g9:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {p0, v0, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListSeeItem;

    .line 13
    .line 14
    invoke-virtual {p0, p3, p4, p2, p5}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListSeeItem;->j(Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListSeeItem$a;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final l(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/a;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget v0, Ll/kec0;->i9:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {p0, v0, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListSvipContainerItem;

    .line 13
    .line 14
    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListSvipContainerItem;->f(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/a;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final m(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget v0, Ll/kec0;->j9:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {p0, v0, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle;

    .line 13
    .line 14
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle;->d(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public n(Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 7
    .param p3    # Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/jic0<",
            "Ll/h390;",
            ">;",
            "Lcom/p1/mobile/putong/app/PutongFrag;",
            "Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->c:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->b:Landroid/widget/FrameLayout;

    .line 7
    .line 8
    invoke-virtual {v1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->a:Landroid/view/View;

    .line 12
    .line 13
    invoke-static {p3}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;->c(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;)Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    invoke-static {p3}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;->d(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;)Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->b:Landroid/widget/FrameLayout;

    .line 27
    .line 28
    invoke-static {p3}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;->d(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;)Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->m(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    invoke-static {p3}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;->a(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;)Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 40
    .line 41
    .line 42
    move-result-object v6

    .line 43
    :cond_1
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_a

    .line 48
    .line 49
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    check-cast v1, Ll/h390;

    .line 54
    .line 55
    instance-of v2, v1, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListItem$a;

    .line 56
    .line 57
    if-eqz v2, :cond_2

    .line 58
    .line 59
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->c:Landroid/widget/LinearLayout;

    .line 60
    .line 61
    check-cast v1, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListItem$a;

    .line 62
    .line 63
    invoke-virtual {p0, v2, v1, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->g(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListItem$a;Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_2
    instance-of v2, v1, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListSeeItem$a;

    .line 68
    .line 69
    if-eqz v2, :cond_3

    .line 70
    .line 71
    move-object v2, v1

    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->c:Landroid/widget/LinearLayout;

    .line 73
    .line 74
    check-cast v2, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListSeeItem$a;

    .line 75
    .line 76
    move-object v0, p0

    .line 77
    move-object v3, p1

    .line 78
    move-object v4, p2

    .line 79
    move-object v5, p4

    .line 80
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->k(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListSeeItem$a;Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_3
    move-object v2, v1

    .line 85
    nop

    .line 86
    instance-of v1, v2, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/a;

    .line 87
    .line 88
    if-eqz v1, :cond_4

    .line 89
    .line 90
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->c:Landroid/widget/LinearLayout;

    .line 91
    .line 92
    check-cast v2, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/a;

    .line 93
    .line 94
    invoke-virtual {p0, v1, v2, p4}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->l(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/a;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 95
    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_4
    instance-of v1, v2, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListDiamondSkinItem$a;

    .line 99
    .line 100
    if-eqz v1, :cond_5

    .line 101
    .line 102
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->c:Landroid/widget/LinearLayout;

    .line 103
    .line 104
    check-cast v2, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListDiamondSkinItem$a;

    .line 105
    .line 106
    move-object v0, p0

    .line 107
    move-object v3, p1

    .line 108
    move-object v4, p2

    .line 109
    move-object v5, p4

    .line 110
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->e(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListDiamondSkinItem$a;Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 111
    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_5
    instance-of v1, v2, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListVisitorItem$a;

    .line 115
    .line 116
    if-eqz v1, :cond_6

    .line 117
    .line 118
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->c:Landroid/widget/LinearLayout;

    .line 119
    .line 120
    check-cast v2, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListVisitorItem$a;

    .line 121
    .line 122
    move-object v0, p0

    .line 123
    move-object v3, p1

    .line 124
    move-object v4, p2

    .line 125
    move-object v5, p4

    .line 126
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->f(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListVisitorItem$a;Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 127
    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_6
    instance-of v1, v2, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListDiamondServiceItem$a;

    .line 131
    .line 132
    if-eqz v1, :cond_7

    .line 133
    .line 134
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->c:Landroid/widget/LinearLayout;

    .line 135
    .line 136
    check-cast v2, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListDiamondServiceItem$a;

    .line 137
    .line 138
    invoke-virtual {p0, v1, v2, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->d(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListDiamondServiceItem$a;Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 139
    .line 140
    .line 141
    goto :goto_0

    .line 142
    :cond_7
    instance-of v1, v2, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTopChatItem$a;

    .line 143
    .line 144
    if-eqz v1, :cond_8

    .line 145
    .line 146
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->c:Landroid/widget/LinearLayout;

    .line 147
    .line 148
    check-cast v2, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTopChatItem$a;

    .line 149
    .line 150
    invoke-static {p3}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;->a(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;)Ljava/util/List;

    .line 151
    .line 152
    .line 153
    move-result-object v5

    .line 154
    move-object v0, p0

    .line 155
    move-object v3, p1

    .line 156
    move-object v4, p2

    .line 157
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->j(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTopChatItem$a;Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;Ljava/util/List;)V

    .line 158
    .line 159
    .line 160
    goto :goto_0

    .line 161
    :cond_8
    instance-of v1, v2, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPartnerDressUpItem$a;

    .line 162
    .line 163
    if-eqz v1, :cond_9

    .line 164
    .line 165
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->c:Landroid/widget/LinearLayout;

    .line 166
    .line 167
    check-cast v2, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPartnerDressUpItem$a;

    .line 168
    .line 169
    invoke-virtual {p0, v1, v2, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->h(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPartnerDressUpItem$a;Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 170
    .line 171
    .line 172
    goto/16 :goto_0

    .line 173
    .line 174
    :cond_9
    instance-of v1, v2, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$a;

    .line 175
    .line 176
    if-eqz v1, :cond_1

    .line 177
    .line 178
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->c:Landroid/widget/LinearLayout;

    .line 179
    .line 180
    check-cast v2, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$a;

    .line 181
    .line 182
    move-object v0, p0

    .line 183
    move-object v3, p1

    .line 184
    move-object v4, p2

    .line 185
    move-object v5, p4

    .line 186
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->i(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNearbyItem$a;Ll/jic0;Lcom/p1/mobile/putong/app/PutongFrag;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 187
    .line 188
    .line 189
    goto/16 :goto_0

    .line 190
    .line 191
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->e:Lv/VButton;

    .line 192
    .line 193
    invoke-static {p3}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;->e(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;)Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v2

    .line 197
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 198
    .line 199
    .line 200
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->e:Lv/VButton;

    .line 201
    .line 202
    new-instance v2, Ll/q390;

    .line 203
    .line 204
    invoke-direct {v2, p3}, Ll/q390;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;)V

    .line 205
    .line 206
    .line 207
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 208
    .line 209
    .line 210
    invoke-static {p4}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 211
    .line 212
    .line 213
    move-result v1

    .line 214
    const-string v2, "#ffdea2"

    .line 215
    .line 216
    if-eqz v1, :cond_b

    .line 217
    .line 218
    invoke-static {}, Ll/s7a;->o()Z

    .line 219
    .line 220
    .line 221
    move-result v1

    .line 222
    if-eqz v1, :cond_b

    .line 223
    .line 224
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->e:Lv/VButton;

    .line 225
    .line 226
    sget v3, Ll/dbc0;->Ak:I

    .line 227
    .line 228
    invoke-virtual {v1, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 229
    .line 230
    .line 231
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->e:Lv/VButton;

    .line 232
    .line 233
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 234
    .line 235
    .line 236
    move-result v2

    .line 237
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 238
    .line 239
    .line 240
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->d:Landroid/widget/FrameLayout;

    .line 241
    .line 242
    sget v1, Ll/dbc0;->Xi:I

    .line 243
    .line 244
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 245
    .line 246
    .line 247
    return-void

    .line 248
    :cond_b
    invoke-static {p4}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 249
    .line 250
    .line 251
    move-result v1

    .line 252
    if-eqz v1, :cond_c

    .line 253
    .line 254
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->e:Lv/VButton;

    .line 255
    .line 256
    sget v3, Ll/dbc0;->Ak:I

    .line 257
    .line 258
    invoke-virtual {v1, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 259
    .line 260
    .line 261
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->e:Lv/VButton;

    .line 262
    .line 263
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 264
    .line 265
    .line 266
    move-result v1

    .line 267
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 268
    .line 269
    .line 270
    return-void

    .line 271
    :cond_c
    invoke-static {p4}, Ll/wib0;->o(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 272
    .line 273
    .line 274
    move-result v1

    .line 275
    if-eqz v1, :cond_d

    .line 276
    .line 277
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->d:Landroid/widget/FrameLayout;

    .line 278
    .line 279
    sget v2, Ll/dbc0;->Gk:I

    .line 280
    .line 281
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 282
    .line 283
    .line 284
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->e:Lv/VButton;

    .line 285
    .line 286
    sget v2, Ll/dbc0;->Ck:I

    .line 287
    .line 288
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 289
    .line 290
    .line 291
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->e:Lv/VButton;

    .line 292
    .line 293
    const-string v1, "#FFFFFF"

    .line 294
    .line 295
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 296
    .line 297
    .line 298
    move-result v1

    .line 299
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 300
    .line 301
    .line 302
    return-void

    .line 303
    :cond_d
    invoke-static {p4}, Ll/wib0;->u(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 304
    .line 305
    .line 306
    move-result v1

    .line 307
    if-eqz v1, :cond_e

    .line 308
    .line 309
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->d:Landroid/widget/FrameLayout;

    .line 310
    .line 311
    sget v2, Ll/dbc0;->Fk:I

    .line 312
    .line 313
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 314
    .line 315
    .line 316
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->e:Lv/VButton;

    .line 317
    .line 318
    sget v2, Ll/dbc0;->Bk:I

    .line 319
    .line 320
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 321
    .line 322
    .line 323
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->e:Lv/VButton;

    .line 324
    .line 325
    const-string v1, "#FFD489"

    .line 326
    .line 327
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 328
    .line 329
    .line 330
    move-result v1

    .line 331
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 332
    .line 333
    .line 334
    :cond_e
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem;->e:Lv/VButton;

    .line 8
    .line 9
    sget v0, Ll/dbc0;->yr:I

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
