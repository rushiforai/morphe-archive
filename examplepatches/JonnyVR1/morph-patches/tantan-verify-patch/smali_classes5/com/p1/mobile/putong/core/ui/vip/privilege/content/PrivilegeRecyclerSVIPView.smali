.class public final Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;
.super Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecycleView;
.source "SourceFile"

# interfaces
.implements Ll/o290;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u008c\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000e\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010!\n\u0002\u0008\u0004\u0018\u00002\u00020\u00012\u00020\u0002B\u001d\u0008\u0007\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\n\u0008\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u0017\u0010\u000c\u001a\u00020\u000b2\u0006\u0010\n\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u0017\u0010\u000e\u001a\u00020\u000b2\u0006\u0010\n\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008\u000e\u0010\rJ!\u0010\u0012\u001a\u0004\u0018\u00010\u00102\u000e\u0010\u0011\u001a\n\u0012\u0004\u0012\u00020\u0010\u0018\u00010\u000fH\u0002\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\u0017\u0010\u0016\u001a\u00020\u000b2\u0006\u0010\u0015\u001a\u00020\u0014H\u0002\u00a2\u0006\u0004\u0008\u0016\u0010\u0017J\u000f\u0010\u0019\u001a\u00020\u0018H\u0002\u00a2\u0006\u0004\u0008\u0019\u0010\u001aJ\u000f\u0010\u001c\u001a\u00020\u001bH\u0002\u00a2\u0006\u0004\u0008\u001c\u0010\u001dJ\u000f\u0010\u001e\u001a\u00020\u001bH\u0002\u00a2\u0006\u0004\u0008\u001e\u0010\u001dJ\u0019\u0010!\u001a\u00020\u000b2\u0008\u0010 \u001a\u0004\u0018\u00010\u001fH\u0002\u00a2\u0006\u0004\u0008!\u0010\"J\u000f\u0010#\u001a\u00020\u000bH\u0002\u00a2\u0006\u0004\u0008#\u0010$J\u001f\u0010\'\u001a\u00020\u000b2\u0006\u0010&\u001a\u00020%2\u0006\u0010\n\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\'\u0010(J\u000f\u0010)\u001a\u00020\u000bH\u0016\u00a2\u0006\u0004\u0008)\u0010$J\u000f\u0010*\u001a\u00020\u000bH\u0014\u00a2\u0006\u0004\u0008*\u0010$J\u0015\u0010-\u001a\u00020\u000b2\u0006\u0010,\u001a\u00020+\u00a2\u0006\u0004\u0008-\u0010.J\u000f\u0010/\u001a\u00020\u000bH\u0016\u00a2\u0006\u0004\u0008/\u0010$J\u000f\u00100\u001a\u00020\u000bH\u0016\u00a2\u0006\u0004\u00080\u0010$R\u0016\u0010\n\u001a\u00020\t8\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u00081\u00102R\u0016\u00105\u001a\u00020%8\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u00083\u00104R\u0016\u00109\u001a\u0002068\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u00087\u00108R\u0018\u0010=\u001a\u0004\u0018\u00010:8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008;\u0010<R$\u0010C\u001a\u0012\u0012\u0004\u0012\u00020?0>j\u0008\u0012\u0004\u0012\u00020?`@8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008A\u0010BR\u0018\u0010,\u001a\u0004\u0018\u00010+8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008D\u0010ER\u0016\u0010G\u001a\u00020\u00148\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\'\u0010FR\u001c\u0010K\u001a\u0008\u0012\u0004\u0012\u00020\u001f0H8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008I\u0010J\u00a8\u0006L"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;",
        "Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecycleView;",
        "Ll/o290;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;",
        "frag",
        "",
        "b0",
        "(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;)V",
        "c0",
        "",
        "Lcom/p1/mobile/putong/core/data/Merchandise;",
        "merchandises",
        "a0",
        "(Ljava/util/List;)Lcom/p1/mobile/putong/core/data/Merchandise;",
        "",
        "hasSVIP",
        "f0",
        "(Z)V",
        "Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListSeeItem$a;",
        "getSeeItem",
        "()Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListSeeItem$a;",
        "Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/a;",
        "getPrivacyItem",
        "()Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/a;",
        "getAdvancedFilterItem",
        "Lcom/p1/mobile/putong/core/data/Privilege;",
        "privilege",
        "g0",
        "(Lcom/p1/mobile/putong/core/data/Privilege;)V",
        "h0",
        "()V",
        "Ll/ub3;",
        "pageAdapter",
        "k",
        "(Ll/ub3;Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;)V",
        "d0",
        "onDetachedFromWindow",
        "",
        "selectCouponId",
        "setSelectCouponId",
        "(Ljava/lang/String;)V",
        "q",
        "c",
        "e",
        "Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;",
        "f",
        "Ll/ub3;",
        "pagerAdapter",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "g",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "purchaseType",
        "Ll/u290;",
        "h",
        "Ll/u290;",
        "recyclerAdapter",
        "Ljava/util/ArrayList;",
        "Ll/h390;",
        "Lkotlin/collections/ArrayList;",
        "i",
        "Ljava/util/ArrayList;",
        "contentItems",
        "j",
        "Ljava/lang/String;",
        "Z",
        "isShowing",
        "",
        "l",
        "Ljava/util/List;",
        "privileges",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public e:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

.field public f:Ll/ub3;

.field public g:Lcom/p1/mobile/putong/core/data/PurchaseType;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public h:Ll/u290;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public final i:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/h390;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public j:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public k:Z

.field public l:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 64
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-direct {p0, p1, v0, v1, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecycleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 5
    .line 6
    .line 7
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 10
    .line 11
    new-instance p1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->i:Ljava/util/ArrayList;

    .line 17
    .line 18
    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 19
    .line 20
    sget-object p2, Lcom/p1/mobile/putong/core/data/Privilege;->online_match_tickets:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 21
    .line 22
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->boost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 23
    .line 24
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_unlimited_likes:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 25
    .line 26
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 27
    .line 28
    filled-new-array {p1, p2, v0, v1, v2}, [Lcom/p1/mobile/putong/core/data/Privilege;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-static {p2}, Lkotlin/collections/CollectionsKt;->mutableListOf([Ljava/lang/Object;)Ljava/util/List;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->l:Ljava/util/List;

    .line 37
    .line 38
    const/4 p2, 0x2

    .line 39
    invoke-virtual {p0, p2}, Landroid/view/View;->setOverScrollMode(I)V

    .line 40
    .line 41
    .line 42
    invoke-static {}, Ll/s7a;->m()Z

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    if-eqz p2, :cond_0

    .line 47
    .line 48
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->l:Ljava/util/List;

    .line 49
    .line 50
    invoke-interface {p2, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->l:Ljava/util/List;

    .line 55
    .line 56
    add-int/lit8 p1, p1, 0x1

    .line 57
    .line 58
    sget-object p2, Lcom/p1/mobile/putong/core/data/Privilege;->hide_me_from_nearby:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 59
    .line 60
    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    :cond_0
    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 65
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static E(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/rj90;->b()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 5
    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    const-string p0, "frag"

    .line 9
    .line 10
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const/4 p1, 0x1

    .line 19
    invoke-static {p0, p1}, Ll/jz20;->c(Lcom/p1/mobile/android/app/Act;I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static F(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Boolean;

    .line 6
    .line 7
    return-object p0
.end method

.method public static G(Lkotlin/jvm/functions/Function5;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;
    .locals 0

    .line 1
    invoke-interface/range {p0 .. p5}, Lkotlin/jvm/functions/Function5;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lkotlin/Pair;

    .line 6
    .line 7
    return-object p0
.end method

.method public static H(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Ll/joa;->M3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static I(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Ll/joa;->M3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic J(Ll/h390;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->e0(Ll/h390;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static K(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;Lkotlin/Pair;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "frag"

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    move-object v0, v1

    .line 12
    :cond_0
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 13
    .line 14
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->P4(Lcom/p1/mobile/putong/core/data/PurchaseType;)Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->h()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Lkotlin/Pair;->getFirst()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->f0(Z)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->i:Ljava/util/ArrayList;

    .line 35
    .line 36
    new-instance v3, Ll/jh90;

    .line 37
    .line 38
    invoke-direct {v3}, Ll/jh90;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-static {v0, v3}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    invoke-virtual {p1}, Lkotlin/Pair;->getFirst()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    check-cast v3, Ljava/lang/Boolean;

    .line 50
    .line 51
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    if-eqz v3, :cond_1

    .line 56
    .line 57
    if-ltz v0, :cond_7

    .line 58
    .line 59
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->i:Ljava/util/ArrayList;

    .line 60
    .line 61
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->h:Ll/u290;

    .line 65
    .line 66
    if-eqz p0, :cond_7

    .line 67
    .line 68
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRemoved(I)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_1
    if-gez v0, :cond_7

    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 75
    .line 76
    if-nez v0, :cond_2

    .line 77
    .line 78
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    move-object v0, v1

    .line 82
    :cond_2
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 83
    .line 84
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->Q4(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ll/ndb0;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    if-eqz v0, :cond_4

    .line 89
    .line 90
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 91
    .line 92
    if-nez v3, :cond_3

    .line 93
    .line 94
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    move-object v3, v1

    .line 98
    :cond_3
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->R4()Ll/lib0;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->P(Ll/lib0;)V

    .line 103
    .line 104
    .line 105
    :cond_4
    invoke-virtual {p1}, Lkotlin/Pair;->getSecond()Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    check-cast p1, Ljava/util/List;

    .line 110
    .line 111
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->a0(Ljava/util/List;)Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    new-instance v3, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;

    .line 116
    .line 117
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 118
    .line 119
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 120
    .line 121
    if-nez v5, :cond_5

    .line 122
    .line 123
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_5
    move-object v1, v5

    .line 128
    :goto_0
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->R4()Ll/lib0;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    invoke-direct {v3, v4, p1, v1, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Merchandise;Ll/lib0;Ll/ndb0;)V

    .line 133
    .line 134
    .line 135
    if-eqz v0, :cond_6

    .line 136
    .line 137
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->j:Ljava/lang/String;

    .line 138
    .line 139
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->Q(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->i:Ljava/util/ArrayList;

    .line 143
    .line 144
    const/4 v0, 0x0

    .line 145
    invoke-virtual {p1, v0, v3}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 146
    .line 147
    .line 148
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->h:Ll/u290;

    .line 149
    .line 150
    if-eqz p0, :cond_7

    .line 151
    .line 152
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemInserted(I)V

    .line 153
    .line 154
    .line 155
    :cond_7
    return-void
.end method

.method public static L(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;Landroid/view/View;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->g0(Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static M(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->g0(Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static N(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Boolean;

    .line 6
    .line 7
    return-object p0
.end method

.method public static O(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->h0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static P(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 p1, 0x0

    .line 2
    const/4 v0, 0x1

    .line 3
    invoke-static {p1, v0, p1}, Ll/rbb0;->s(Lcom/p1/mobile/putong/data/Counter;ILjava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    new-instance v0, Landroid/content/Intent;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-class v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAct;

    .line 20
    .line 21
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public static Q(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 5
    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    const-string p0, "frag"

    .line 9
    .line 10
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    :cond_0
    sget-object p3, Ll/cok0;->a:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p0, p2, p1, p3}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->O4(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static R(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;Lcom/p1/mobile/putong/data/PayMethod;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->V4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static S(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Boolean;

    .line 6
    .line 7
    return-object p0
.end method

.method public static T(ZLjava/util/List;Ll/pf60;Lcom/p1/mobile/putong/core/api/CoreAutoPay$AutoPayStatus;Ljava/util/ArrayList;)Lkotlin/Pair;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    new-instance p2, Lkotlin/Pair;

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-direct {p2, p0, p1}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-object p2
.end method

.method public static U(Ljava/util/List;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    check-cast p0, Ljava/util/Collection;

    .line 2
    .line 3
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static V(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/rj90;->e()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 5
    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    const-string p0, "frag"

    .line 9
    .line 10
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const/4 p1, 0x2

    .line 19
    invoke-static {p0, p1}, Ll/jz20;->c(Lcom/p1/mobile/android/app/Act;I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static W(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;)V
    .locals 2

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const-string v1, ""

    .line 5
    .line 6
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->X4(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static X(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->k:Z

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static Y(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Boolean;

    .line 6
    .line 7
    return-object p0
.end method

.method public static Z(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    const-string p1, "frag"

    .line 7
    .line 8
    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    move-object p1, v0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 13
    .line 14
    sget-object v1, Ll/cok0;->a:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p1, p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->X4(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Ll/rj90;->g()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private final a0(Ljava/util/List;)Lcom/p1/mobile/putong/core/data/Merchandise;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;)",
            "Lcom/p1/mobile/putong/core/data/Merchandise;"
        }
    .end annotation

    .line 1
    move-object p0, p1

    .line 2
    check-cast p0, Ljava/util/Collection;

    .line 3
    .line 4
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 v0, 0x0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/4 p1, -0x1

    .line 20
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_6

    .line 25
    .line 26
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 31
    .line 32
    invoke-static {}, Ll/s7a;->f()Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-eqz v2, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-eqz v2, :cond_2

    .line 43
    .line 44
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthType()Z

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-eqz v2, :cond_2

    .line 49
    .line 50
    iget v2, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 51
    .line 52
    const/4 v3, 0x6

    .line 53
    if-ne v2, v3, :cond_2

    .line 54
    .line 55
    invoke-static {v1}, Ll/deh0;->f(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-eqz v2, :cond_2

    .line 60
    .line 61
    return-object v1

    .line 62
    :cond_2
    invoke-static {}, Ll/s7a;->v()Z

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    if-eqz v2, :cond_4

    .line 67
    .line 68
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    if-eqz v2, :cond_1

    .line 73
    .line 74
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthType()Z

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    if-eqz v2, :cond_1

    .line 79
    .line 80
    invoke-static {v1}, Ll/v5b0;->s(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    if-eqz v2, :cond_1

    .line 85
    .line 86
    if-eqz v0, :cond_3

    .line 87
    .line 88
    iget v2, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 89
    .line 90
    invoke-static {p1, v2}, Ljava/lang/Math;->max(II)I

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    if-eq p1, v2, :cond_1

    .line 95
    .line 96
    :cond_3
    iget p1, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 97
    .line 98
    :goto_1
    move-object v0, v1

    .line 99
    goto :goto_0

    .line 100
    :cond_4
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    if-eqz v2, :cond_1

    .line 105
    .line 106
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthType()Z

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    if-eqz v2, :cond_1

    .line 111
    .line 112
    invoke-static {v1}, Ll/v5b0;->w(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    if-eqz v2, :cond_1

    .line 117
    .line 118
    if-eqz v0, :cond_5

    .line 119
    .line 120
    iget v2, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 121
    .line 122
    invoke-static {p1, v2}, Ljava/lang/Math;->max(II)I

    .line 123
    .line 124
    .line 125
    move-result v2

    .line 126
    if-eq p1, v2, :cond_1

    .line 127
    .line 128
    :cond_5
    iget p1, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 129
    .line 130
    goto :goto_1

    .line 131
    :cond_6
    return-object v0
.end method

.method private final b0(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->P4(Lcom/p1/mobile/putong/core/data/PurchaseType;)Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 8
    .line 9
    sget-object v2, Ll/cok0;->a:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->Q4(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ll/ndb0;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->f(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Ll/ndb0;)V

    .line 16
    .line 17
    .line 18
    new-instance v1, Ll/gh90;

    .line 19
    .line 20
    invoke-direct {v1, p1, p0}, Ll/gh90;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setOnNoPrivilegeClick(Ll/x20;)V

    .line 24
    .line 25
    .line 26
    new-instance p0, Ll/hh90;

    .line 27
    .line 28
    invoke-direct {p0, p1}, Ll/hh90;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setOnPayTypeSelect(Ll/y20;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->d()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->e()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->h()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method private final c0(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;)V
    .locals 3

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Ll/u290;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 17
    .line 18
    invoke-direct {v0, p1, v1, p0, v2}, Ll/u290;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;Ll/t5m;Ll/o290;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->h:Ll/u290;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Ll/joa;->M3()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->f0(Z)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public static final e0(Ll/h390;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    instance-of p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;

    .line 5
    .line 6
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method private final f0(Z)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->i:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->i:Ljava/util/ArrayList;

    .line 7
    .line 8
    new-instance v1, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    sget v3, Lcom/p1/mobile/putong/core/R$string;->Hk:I

    .line 15
    .line 16
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    sget v4, Lcom/p1/mobile/putong/core/R$string;->Fk:I

    .line 25
    .line 26
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    new-instance v4, Ll/dh90;

    .line 31
    .line 32
    invoke-direct {v4, p0}, Ll/dh90;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;)V

    .line 33
    .line 34
    .line 35
    invoke-direct {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a$a;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->l:Ljava/util/List;

    .line 42
    .line 43
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_0

    .line 52
    .line 53
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Lcom/p1/mobile/putong/core/data/Privilege;

    .line 58
    .line 59
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 60
    .line 61
    invoke-static {v1, v2}, Ll/m190;->a(Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/data/PurchaseType;)Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListItem$a;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    new-instance v2, Ll/eh90;

    .line 66
    .line 67
    invoke-direct {v2, p0}, Ll/eh90;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListItem$a;->g(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListItem$a$a;)V

    .line 71
    .line 72
    .line 73
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->i:Ljava/util/ArrayList;

    .line 74
    .line 75
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_0
    const/4 v0, 0x0

    .line 80
    const-string v1, ""

    .line 81
    .line 82
    if-nez p1, :cond_1

    .line 83
    .line 84
    new-instance v6, Ljava/util/ArrayList;

    .line 85
    .line 86
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Gk:I

    .line 94
    .line 95
    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 100
    .line 101
    .line 102
    new-instance v3, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;

    .line 103
    .line 104
    invoke-direct {v3, p1, v1, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a$a;)V

    .line 105
    .line 106
    .line 107
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->getSeeItem()Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListSeeItem$a;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-interface {v6, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->getPrivacyItem()Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/a;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-interface {v6, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->getAdvancedFilterItem()Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/a;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-interface {v6, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->i:Ljava/util/ArrayList;

    .line 129
    .line 130
    new-instance v2, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;

    .line 131
    .line 132
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    sget v1, Lcom/p1/mobile/putong/core/R$string;->U1:I

    .line 137
    .line 138
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v4

    .line 142
    new-instance v7, Ll/fh90;

    .line 143
    .line 144
    invoke-direct {v7, p0}, Ll/fh90;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;)V

    .line 145
    .line 146
    .line 147
    const/4 v5, 0x0

    .line 148
    invoke-direct/range {v2 .. v7}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;Ljava/lang/String;ZLjava/util/List;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListNoSVipItem$a$a;)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    goto :goto_1

    .line 155
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Gk:I

    .line 160
    .line 161
    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 166
    .line 167
    .line 168
    new-instance v2, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;

    .line 169
    .line 170
    invoke-direct {v2, p1, v1, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a$a;)V

    .line 171
    .line 172
    .line 173
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->i:Ljava/util/ArrayList;

    .line 174
    .line 175
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->i:Ljava/util/ArrayList;

    .line 179
    .line 180
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->getSeeItem()Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListSeeItem$a;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 185
    .line 186
    .line 187
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->i:Ljava/util/ArrayList;

    .line 188
    .line 189
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->getPrivacyItem()Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/a;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->i:Ljava/util/ArrayList;

    .line 197
    .line 198
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->getAdvancedFilterItem()Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/a;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 203
    .line 204
    .line 205
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->h:Ll/u290;

    .line 206
    .line 207
    if-eqz p1, :cond_2

    .line 208
    .line 209
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->i:Ljava/util/ArrayList;

    .line 210
    .line 211
    invoke-virtual {p1, p0}, Ll/u290;->J(Ljava/util/ArrayList;)V

    .line 212
    .line 213
    .line 214
    :cond_2
    return-void
.end method

.method private final g0(Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    const-string v1, "frag"

    .line 8
    .line 9
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    :cond_0
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;-><init>(Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 17
    .line 18
    new-instance v2, Ll/kh90;

    .line 19
    .line 20
    invoke-direct {v2, p0, p1}, Ll/kh90;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->p(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a$f;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-eqz p0, :cond_1

    .line 31
    .line 32
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->o(Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method private final getAdvancedFilterItem()Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/a;
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->advanced_filter:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    invoke-static {v0}, Ll/j690;->l(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0}, Ll/a690;->q()Ljava/lang/CharSequence;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget v2, Ll/dbc0;->Lk:I

    .line 24
    .line 25
    new-instance v3, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/a;

    .line 26
    .line 27
    const-string v4, "advancing"

    .line 28
    .line 29
    invoke-direct {v3, v2, v1, v0, v4}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/a;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    new-instance v0, Ll/lh90;

    .line 33
    .line 34
    invoke-direct {v0, p0}, Ll/lh90;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v3, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/a;->f(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/a$a;)V

    .line 38
    .line 39
    .line 40
    return-object v3
.end method

.method private final getPrivacyItem()Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/a;
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->privacy_membership:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    invoke-static {v0}, Ll/j690;->l(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0}, Ll/a690;->q()Ljava/lang/CharSequence;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget v2, Ll/dbc0;->kl:I

    .line 24
    .line 25
    new-instance v3, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/a;

    .line 26
    .line 27
    const-string v4, "privacy"

    .line 28
    .line 29
    invoke-direct {v3, v2, v1, v0, v4}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/a;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    new-instance v0, Ll/xg90;

    .line 33
    .line 34
    invoke-direct {v0, p0}, Ll/xg90;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v3, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/a;->f(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/a$a;)V

    .line 38
    .line 39
    .line 40
    return-object v3
.end method

.method private final getSeeItem()Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListSeeItem$a;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListSeeItem$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListSeeItem$a;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/ih90;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/ih90;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListSeeItem$a;->b(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListSeeItem$a$a;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method


# virtual methods
.method public c()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->k:Z

    .line 3
    .line 4
    return-void
.end method

.method public d0()V
    .locals 13

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->f:Ll/ub3;

    .line 2
    .line 3
    const-string v1, "pagerAdapter"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    move-object v0, v2

    .line 12
    :cond_0
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 13
    .line 14
    const-string v4, "frag"

    .line 15
    .line 16
    if-nez v3, :cond_1

    .line 17
    .line 18
    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    move-object v3, v2

    .line 22
    :cond_1
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 25
    .line 26
    const-string v6, "svip"

    .line 27
    .line 28
    invoke-static {v6}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 29
    .line 30
    .line 31
    move-result-object v7

    .line 32
    invoke-virtual {v5, v7}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    invoke-virtual {v0, v3, v5}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v3, Ll/mh90;

    .line 41
    .line 42
    invoke-direct {v3}, Ll/mh90;-><init>()V

    .line 43
    .line 44
    .line 45
    new-instance v5, Ll/ph90;

    .line 46
    .line 47
    invoke-direct {v5, v3}, Ll/ph90;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v5}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    const/4 v3, 0x1

    .line 59
    invoke-virtual {v0, v3}, Lrx/c;->skip(I)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v3, Ll/qh90;

    .line 64
    .line 65
    invoke-direct {v3, p0}, Ll/qh90;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;)V

    .line 66
    .line 67
    .line 68
    new-instance v5, Ll/rh90;

    .line 69
    .line 70
    invoke-direct {v5, v3}, Ll/rh90;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, v5}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    new-instance v3, Ll/sh90;

    .line 78
    .line 79
    invoke-direct {v3, p0}, Ll/sh90;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;)V

    .line 80
    .line 81
    .line 82
    invoke-static {v3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    invoke-virtual {v0, v3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->f:Ll/ub3;

    .line 90
    .line 91
    if-nez v0, :cond_2

    .line 92
    .line 93
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    move-object v0, v2

    .line 97
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 98
    .line 99
    if-nez v1, :cond_3

    .line 100
    .line 101
    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_3
    move-object v2, v1

    .line 106
    :goto_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 107
    .line 108
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 109
    .line 110
    invoke-static {v6}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    invoke-virtual {v1, v3}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    new-instance v3, Ll/yg90;

    .line 119
    .line 120
    invoke-direct {v3}, Ll/yg90;-><init>()V

    .line 121
    .line 122
    .line 123
    new-instance v4, Ll/zg90;

    .line 124
    .line 125
    invoke-direct {v4, v3}, Ll/zg90;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v1, v4}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 133
    .line 134
    .line 135
    move-result-object v7

    .line 136
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 137
    .line 138
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 139
    .line 140
    invoke-static {v6}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 141
    .line 142
    .line 143
    move-result-object v3

    .line 144
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/core/api/CoreProduct;->y5(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lrx/c;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    new-instance v3, Ll/ah90;

    .line 149
    .line 150
    invoke-direct {v3}, Ll/ah90;-><init>()V

    .line 151
    .line 152
    .line 153
    new-instance v4, Ll/bh90;

    .line 154
    .line 155
    invoke-direct {v4, v3}, Ll/bh90;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v1, v4}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 163
    .line 164
    .line 165
    move-result-object v8

    .line 166
    invoke-static {}, Ll/xzc0;->r()Ll/xzc0;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    invoke-virtual {v1}, Ll/xzc0;->P()Lrx/c;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 175
    .line 176
    .line 177
    move-result-object v9

    .line 178
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 179
    .line 180
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 181
    .line 182
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->m3()Lrx/c;

    .line 183
    .line 184
    .line 185
    move-result-object v1

    .line 186
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 187
    .line 188
    .line 189
    move-result-object v10

    .line 190
    sget-object v1, Ll/uqb0;->T:Lcom/p1/mobile/putong/api/api/PaymentApi;

    .line 191
    .line 192
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/PaymentApi;->S()Lrx/c;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 197
    .line 198
    .line 199
    move-result-object v11

    .line 200
    new-instance v1, Ll/ch90;

    .line 201
    .line 202
    invoke-direct {v1}, Ll/ch90;-><init>()V

    .line 203
    .line 204
    .line 205
    new-instance v12, Ll/nh90;

    .line 206
    .line 207
    invoke-direct {v12, v1}, Ll/nh90;-><init>(Lkotlin/jvm/functions/Function5;)V

    .line 208
    .line 209
    .line 210
    invoke-static/range {v7 .. v12}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/ucj;)Lrx/c;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    invoke-virtual {v0, v2, v1}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    new-instance v1, Ll/oh90;

    .line 219
    .line 220
    invoke-direct {v1, p0}, Ll/oh90;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;)V

    .line 221
    .line 222
    .line 223
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 224
    .line 225
    .line 226
    move-result-object p0

    .line 227
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 228
    .line 229
    .line 230
    return-void
.end method

.method public final h0()V
    .locals 0

    .line 1
    invoke-static {}, Ll/joa;->M3()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/rj90;->h()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public k(Ll/ub3;Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;)V
    .locals 0
    .param p1    # Ll/ub3;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->f:Ll/ub3;

    .line 10
    .line 11
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->b0(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;)V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->c0(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->d0()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroidx/recyclerview/widget/RecyclerView;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    const-string v2, "frag"

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    move-object v0, v1

    .line 15
    :cond_0
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 16
    .line 17
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->P4(Lcom/p1/mobile/putong/core/data/PurchaseType;)Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->g()V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 25
    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    move-object v1, v0

    .line 33
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 34
    .line 35
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->Q4(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ll/ndb0;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    if-eqz p0, :cond_2

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->K()V

    .line 42
    .line 43
    .line 44
    :cond_2
    return-void
.end method

.method public q()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->h0()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->k:Z

    .line 6
    .line 7
    return-void
.end method

.method public final setSelectCouponId(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerSVIPView;->j:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method
