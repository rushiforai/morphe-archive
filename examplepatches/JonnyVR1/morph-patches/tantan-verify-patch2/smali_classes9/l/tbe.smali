.class public Ll/tbe;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Ll/qbe;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Landroid/content/Context;

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/qbe;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ll/qbe;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ll/qbe;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/tbe;->d:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Ll/tbe;->e:Ll/y20;

    .line 13
    .line 14
    iput-object v0, p0, Ll/tbe;->f:Ll/y20;

    .line 15
    .line 16
    iput-object p1, p0, Ll/tbe;->c:Landroid/content/Context;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic E(Ll/tbe;Ll/qbe;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tbe;->J(Ll/qbe;)V

    return-void
.end method

.method public static synthetic F(Ll/tbe;Ll/qbe;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tbe;->I(Ll/qbe;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Ll/qbe;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/tbe;->G(Landroid/view/View;Ll/qbe;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tbe;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/tbe;->c:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget p2, Ll/yec0;->A0:I

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

.method public G(Landroid/view/View;Ll/qbe;II)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;->f(Ll/qbe;)V

    .line 4
    .line 5
    .line 6
    new-instance p3, Ll/rbe;

    .line 7
    .line 8
    invoke-direct {p3, p0, p2}, Ll/rbe;-><init>(Ll/tbe;Ll/qbe;)V

    .line 9
    .line 10
    .line 11
    iput-object p3, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;->m:Ll/x20;

    .line 12
    .line 13
    new-instance p3, Ll/sbe;

    .line 14
    .line 15
    invoke-direct {p3, p0, p2}, Ll/sbe;-><init>(Ll/tbe;Ll/qbe;)V

    .line 16
    .line 17
    .line 18
    iput-object p3, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/drawgift/DrawRecycleItem;->l:Ll/x20;

    .line 19
    .line 20
    return-void
.end method

.method public H(I)Ll/qbe;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tbe;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/qbe;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic I(Ll/qbe;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tbe;->e:Ll/y20;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final synthetic J(Ll/qbe;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tbe;->f:Ll/y20;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public K(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/qbe;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/tbe;->d:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tbe;->H(I)Ll/qbe;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
