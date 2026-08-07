.class public Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPrivateCustomExtraItem$a;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPrivateCustomExtraItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/core/data/IdealTypes;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/IdealTypes;",
            ">;"
        }
    .end annotation
.end field

.field public d:Landroid/content/Context;

.field public final synthetic e:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPrivateCustomExtraItem;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPrivateCustomExtraItem;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPrivateCustomExtraItem$a;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPrivateCustomExtraItem;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPrivateCustomExtraItem$a;->d:Landroid/content/Context;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPrivateCustomExtraItem$a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPrivateCustomExtraItem$a;->I(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic F(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPrivateCustomExtraItem$a;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPrivateCustomExtraItem$a;->J(Ljava/util/List;)V

    return-void
.end method

.method private synthetic I(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPrivateCustomExtraItem$a;->e:Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPrivateCustomExtraItem;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPrivateCustomExtraItem;->p0(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPrivateCustomExtraItem;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/IdealTypes;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPrivateCustomExtraItem$a;->G(Landroid/view/View;Lcom/p1/mobile/putong/core/data/IdealTypes;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPrivateCustomExtraItem$a;->c:Ljava/util/List;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPrivateCustomExtraItem$a;->d:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget p2, Ll/kec0;->a9:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public G(Landroid/view/View;Lcom/p1/mobile/putong/core/data/IdealTypes;II)V
    .locals 0

    .line 1
    move-object p3, p1

    .line 2
    check-cast p3, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeDescListCustomModelItem;

    .line 3
    .line 4
    invoke-virtual {p3, p2}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeDescListCustomModelItem;->i0(Lcom/p1/mobile/putong/core/data/IdealTypes;)V

    .line 5
    .line 6
    .line 7
    new-instance p2, Ll/l490;

    .line 8
    .line 9
    invoke-direct {p2, p0}, Ll/l490;-><init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPrivateCustomExtraItem$a;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public H(I)Lcom/p1/mobile/putong/core/data/IdealTypes;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPrivateCustomExtraItem$a;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/IdealTypes;

    .line 8
    .line 9
    return-object p0
.end method

.method public final J(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/IdealTypes;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPrivateCustomExtraItem$a;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListPrivateCustomExtraItem$a;->H(I)Lcom/p1/mobile/putong/core/data/IdealTypes;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    int-to-long p0, p1

    return-wide p0
.end method
