.class public final Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;
.super Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecycleView;
.source "SourceFile"

# interfaces
.implements Ll/o290;
.implements Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListItem$a$a;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000~\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0011\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0006\u0018\u00002\u00020\u00012\u00020\u00022\u00020\u0003B\u001d\u0008\u0007\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\n\u0008\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u000f\u0010\u000b\u001a\u00020\nH\u0002\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u001f\u0010\u0011\u001a\u00020\n2\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000fH\u0016\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u000f\u0010\u0013\u001a\u00020\nH\u0016\u00a2\u0006\u0004\u0008\u0013\u0010\u000cJ!\u0010\u0018\u001a\u00020\n2\u0006\u0010\u0015\u001a\u00020\u00142\u0008\u0010\u0017\u001a\u0004\u0018\u00010\u0016H\u0016\u00a2\u0006\u0004\u0008\u0018\u0010\u0019J\u000f\u0010\u001a\u001a\u00020\nH\u0014\u00a2\u0006\u0004\u0008\u001a\u0010\u000cJ\u000f\u0010\u001b\u001a\u00020\nH\u0016\u00a2\u0006\u0004\u0008\u001b\u0010\u000cJ\u000f\u0010\u001c\u001a\u00020\nH\u0016\u00a2\u0006\u0004\u0008\u001c\u0010\u000cJ\u0017\u0010\u001d\u001a\u00020\n2\u0006\u0010\u0010\u001a\u00020\u000fH\u0002\u00a2\u0006\u0004\u0008\u001d\u0010\u001eJ\u0017\u0010\u001f\u001a\u00020\n2\u0006\u0010\u0010\u001a\u00020\u000fH\u0002\u00a2\u0006\u0004\u0008\u001f\u0010\u001eJ!\u0010#\u001a\u0004\u0018\u00010!2\u000e\u0010\"\u001a\n\u0012\u0004\u0012\u00020!\u0018\u00010 H\u0002\u00a2\u0006\u0004\u0008#\u0010$R\u0016\u0010\u0010\u001a\u00020\u000f8\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u0008%\u0010&R\u0016\u0010)\u001a\u00020\r8\u0002@\u0002X\u0082.\u00a2\u0006\u0006\n\u0004\u0008\'\u0010(R\u0016\u0010-\u001a\u00020*8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008+\u0010,R\u0018\u00101\u001a\u0004\u0018\u00010.8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008/\u00100R$\u00107\u001a\u0012\u0012\u0004\u0012\u00020302j\u0008\u0012\u0004\u0012\u000203`48\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u00085\u00106R\u001c\u0010;\u001a\u0008\u0012\u0004\u0012\u00020\u0016088\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u00089\u0010:R\"\u0010>\u001a\u00020<8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0011\u0010=\u001a\u0004\u0008>\u0010?\"\u0004\u0008@\u0010A\u00a8\u0006B"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;",
        "Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecycleView;",
        "Ll/o290;",
        "Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListItem$a$a;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "",
        "W",
        "()V",
        "Ll/ub3;",
        "pageAdapter",
        "Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;",
        "frag",
        "k",
        "(Ll/ub3;Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;)V",
        "U",
        "Landroid/view/View;",
        "view",
        "Lcom/p1/mobile/putong/core/data/Privilege;",
        "privilege",
        "a",
        "(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Privilege;)V",
        "onDetachedFromWindow",
        "q",
        "c",
        "S",
        "(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;)V",
        "T",
        "",
        "Lcom/p1/mobile/putong/core/data/Merchandise;",
        "merchandises",
        "R",
        "(Ljava/util/List;)Lcom/p1/mobile/putong/core/data/Merchandise;",
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
        "",
        "j",
        "[Lcom/p1/mobile/putong/core/data/Privilege;",
        "privileges",
        "",
        "Z",
        "isShowing",
        "()Z",
        "setShowing",
        "(Z)V",
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

.field public j:[Lcom/p1/mobile/putong/core/data/Privilege;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public k:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 39
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-direct {p0, p1, v0, v1, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

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
    sget-object p1, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_FEMALE_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 10
    .line 11
    new-instance p1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->i:Ljava/util/ArrayList;

    .line 17
    .line 18
    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->pick_tantan_credits_users:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 19
    .line 20
    sget-object p2, Lcom/p1/mobile/putong/core/data/Privilege;->unlock_learn_about_him_module:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 21
    .line 22
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->privacy_membership:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 23
    .line 24
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->ads_not_disturb:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 25
    .line 26
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->block_harassing_words:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 27
    .line 28
    filled-new-array {p1, p2, v0, v1, v2}, [Lcom/p1/mobile/putong/core/data/Privilege;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->j:[Lcom/p1/mobile/putong/core/data/Privilege;

    .line 33
    .line 34
    const/4 p1, 0x2

    .line 35
    invoke-virtual {p0, p1}, Landroid/view/View;->setOverScrollMode(I)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 40
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static E(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-string v0, "lowPriceCustomerFemaleVIP"

    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/v5b0;->l(Lcom/p1/mobile/putong/core/data/Merchandise;Ljava/lang/String;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
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

.method public static G(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;Lcom/p1/mobile/putong/data/PayMethod;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->V4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static H(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;)V
    .locals 2

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

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

.method public static I(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Ll/joa;->C3()Z

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
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->V(Ll/h390;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static K(Ljava/util/List;)Ljava/lang/Boolean;
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

.method public static L(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "frag"

    .line 6
    .line 7
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    :cond_0
    sget-object p3, Ll/cok0;->a:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0, p2, p1, p3}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->O4(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static M(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->noneRenewable()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->weekly()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static N(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;Ll/pf60;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

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
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

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
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->W()V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->i:Ljava/util/ArrayList;

    .line 25
    .line 26
    new-instance v3, Ll/ff90;

    .line 27
    .line 28
    invoke-direct {v3}, Ll/ff90;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {v0, v3}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iget-object v3, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 36
    .line 37
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 38
    .line 39
    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    if-eqz v3, :cond_1

    .line 44
    .line 45
    if-ltz v0, :cond_6

    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->i:Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->h:Ll/u290;

    .line 53
    .line 54
    if-eqz p0, :cond_6

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRemoved(I)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_1
    if-gez v0, :cond_6

    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 63
    .line 64
    if-nez v0, :cond_2

    .line 65
    .line 66
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    move-object v0, v1

    .line 70
    :cond_2
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 71
    .line 72
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->Q4(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ll/ndb0;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    if-eqz v0, :cond_4

    .line 77
    .line 78
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 79
    .line 80
    if-nez v3, :cond_3

    .line 81
    .line 82
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    move-object v3, v1

    .line 86
    :cond_3
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->R4()Ll/lib0;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->P(Ll/lib0;)V

    .line 91
    .line 92
    .line 93
    :cond_4
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 94
    .line 95
    check-cast p1, Ljava/util/List;

    .line 96
    .line 97
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->R(Ljava/util/List;)Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    new-instance v3, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;

    .line 102
    .line 103
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 104
    .line 105
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 106
    .line 107
    if-nez v5, :cond_5

    .line 108
    .line 109
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_5
    move-object v1, v5

    .line 114
    :goto_0
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->R4()Ll/lib0;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-direct {v3, v4, p1, v1, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListShowcaseItem$a;-><init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Merchandise;Ll/lib0;Ll/ndb0;)V

    .line 119
    .line 120
    .line 121
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->i:Ljava/util/ArrayList;

    .line 122
    .line 123
    const/4 v0, 0x0

    .line 124
    invoke-virtual {p1, v0, v3}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 125
    .line 126
    .line 127
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->h:Ll/u290;

    .line 128
    .line 129
    if-eqz p0, :cond_6

    .line 130
    .line 131
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemInserted(I)V

    .line 132
    .line 133
    .line 134
    :cond_6
    return-void
.end method

.method public static O(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Ljava/lang/Boolean;
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

.method public static P(Lkotlin/jvm/functions/Function5;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;
    .locals 0

    .line 1
    invoke-interface/range {p0 .. p5}, Lkotlin/jvm/functions/Function5;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/pf60;

    .line 6
    .line 7
    return-object p0
.end method

.method public static Q(ZLjava/util/List;Ll/pf60;Lcom/p1/mobile/putong/core/api/CoreAutoPay$AutoPayStatus;Ljava/util/ArrayList;)Ll/pf60;
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
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static final V(Ll/h390;)Ljava/lang/Boolean;
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

.method private final W()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->i:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->i:Ljava/util/ArrayList;

    .line 7
    .line 8
    new-instance v1, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;

    .line 9
    .line 10
    const-string v2, "\u5979\u00b7\u7279\u6743"

    .line 11
    .line 12
    const-string v3, ""

    .line 13
    .line 14
    const/4 v4, 0x0

    .line 15
    invoke-direct {v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListTitle$a$a;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->j:[Lcom/p1/mobile/putong/core/data/Privilege;

    .line 22
    .line 23
    array-length v1, v0

    .line 24
    const/4 v2, 0x0

    .line 25
    :goto_0
    if-ge v2, v1, :cond_0

    .line 26
    .line 27
    aget-object v3, v0, v2

    .line 28
    .line 29
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 30
    .line 31
    invoke-static {v3, v5}, Ll/m190;->a(Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/data/PurchaseType;)Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListItem$a;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-virtual {v3, p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListItem$a;->g(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListItem$a$a;)V

    .line 36
    .line 37
    .line 38
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->i:Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    add-int/lit8 v2, v2, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->h:Ll/u290;

    .line 47
    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->i:Ljava/util/ArrayList;

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ll/u290;->J(Ljava/util/ArrayList;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 56
    .line 57
    if-nez p0, :cond_2

    .line 58
    .line 59
    const-string p0, "frag"

    .line 60
    .line 61
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_2
    move-object v4, p0

    .line 66
    :goto_1
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->W4()V

    .line 67
    .line 68
    .line 69
    return-void
.end method


# virtual methods
.method public final R(Ljava/util/List;)Lcom/p1/mobile/putong/core/data/Merchandise;
    .locals 1
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
    check-cast p1, Ljava/util/Collection;

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    if-eqz p1, :cond_3

    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-static {}, Ll/s7a;->i()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    invoke-static {}, Ll/s7a;->j()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    new-instance p0, Ll/ue90;

    .line 26
    .line 27
    invoke-direct {p0}, Ll/ue90;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {p1, p0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    check-cast p0, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 35
    .line 36
    :cond_1
    return-object p0

    .line 37
    :cond_2
    new-instance p0, Ll/ve90;

    .line 38
    .line 39
    invoke-direct {p0}, Ll/ve90;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {p1, p0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    check-cast p0, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 47
    .line 48
    :cond_3
    :goto_0
    return-object p0
.end method

.method public final S(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;->P4(Lcom/p1/mobile/putong/core/data/PurchaseType;)Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

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
    new-instance v1, Ll/te90;

    .line 19
    .line 20
    invoke-direct {v1, p1, p0}, Ll/te90;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegePaymentView;->setOnNoPrivilegeClick(Ll/x20;)V

    .line 24
    .line 25
    .line 26
    new-instance p0, Ll/xe90;

    .line 27
    .line 28
    invoke-direct {p0, p1}, Ll/xe90;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;)V

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

.method public final T(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;)V
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
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 17
    .line 18
    invoke-direct {v0, p1, v1, p0, v2}, Ll/u290;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;Ll/t5m;Ll/o290;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->h:Ll/u290;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 24
    .line 25
    .line 26
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->W()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public U()V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->f:Ll/ub3;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const-string v0, "pagerAdapter"

    .line 7
    .line 8
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    move-object v0, v1

    .line 12
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 13
    .line 14
    if-nez v2, :cond_1

    .line 15
    .line 16
    const-string v2, "frag"

    .line 17
    .line 18
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    move-object v1, v2

    .line 23
    :goto_0
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 26
    .line 27
    const-string v3, "femaleVip"

    .line 28
    .line 29
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    invoke-virtual {v2, v4}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    new-instance v4, Ll/ye90;

    .line 38
    .line 39
    invoke-direct {v4}, Ll/ye90;-><init>()V

    .line 40
    .line 41
    .line 42
    new-instance v5, Ll/ze90;

    .line 43
    .line 44
    invoke-direct {v5, v4}, Ll/ze90;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v2, v5}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {v2}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 56
    .line 57
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 58
    .line 59
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/api/CoreProduct;->y5(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    new-instance v3, Ll/af90;

    .line 68
    .line 69
    invoke-direct {v3}, Ll/af90;-><init>()V

    .line 70
    .line 71
    .line 72
    new-instance v5, Ll/bf90;

    .line 73
    .line 74
    invoke-direct {v5, v3}, Ll/bf90;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v2, v5}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    invoke-virtual {v2}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object v5

    .line 85
    invoke-static {}, Ll/xzc0;->r()Ll/xzc0;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-virtual {v2}, Ll/xzc0;->P()Lrx/c;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-virtual {v2}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 94
    .line 95
    .line 96
    move-result-object v6

    .line 97
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 98
    .line 99
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 100
    .line 101
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->m3()Lrx/c;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    invoke-virtual {v2}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 106
    .line 107
    .line 108
    move-result-object v7

    .line 109
    sget-object v2, Ll/uqb0;->T:Lcom/p1/mobile/putong/api/api/PaymentApi;

    .line 110
    .line 111
    invoke-virtual {v2}, Lcom/p1/mobile/putong/api/api/PaymentApi;->S()Lrx/c;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    invoke-virtual {v2}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 116
    .line 117
    .line 118
    move-result-object v8

    .line 119
    new-instance v2, Ll/cf90;

    .line 120
    .line 121
    invoke-direct {v2}, Ll/cf90;-><init>()V

    .line 122
    .line 123
    .line 124
    new-instance v9, Ll/df90;

    .line 125
    .line 126
    invoke-direct {v9, v2}, Ll/df90;-><init>(Lkotlin/jvm/functions/Function5;)V

    .line 127
    .line 128
    .line 129
    invoke-static/range {v4 .. v9}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/ucj;)Lrx/c;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    invoke-virtual {v0, v1, v2}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    new-instance v1, Ll/ef90;

    .line 138
    .line 139
    invoke-direct {v1, p0}, Ll/ef90;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;)V

    .line 140
    .line 141
    .line 142
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 147
    .line 148
    .line 149
    return-void
.end method

.method public a(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 2
    .param p1    # Landroid/view/View;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/data/Privilege;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    const-string v0, "frag"

    .line 11
    .line 12
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    :cond_0
    invoke-direct {p1, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;-><init>(Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 20
    .line 21
    new-instance v1, Ll/we90;

    .line 22
    .line 23
    invoke-direct {v1, p0, p2}, Ll/we90;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->p(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a$f;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->o(Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->k:Z

    .line 3
    .line 4
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
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->f:Ll/ub3;

    .line 10
    .line 11
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->S(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->T(Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->U()V

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

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
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/VipFrag;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->g:Lcom/p1/mobile/putong/core/data/PurchaseType;

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
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->k:Z

    .line 3
    .line 4
    return-void
.end method

.method public final setShowing(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/PrivilegeRecyclerFemaleVIPView;->k:Z

    .line 2
    .line 3
    return-void
.end method
