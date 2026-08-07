.class public Ll/vts;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Ll/lsw$b;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Lv/VRecyclerView;

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/lsw$b;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lv/VRecyclerView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/vts;->c:Lv/VRecyclerView;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Ll/lsw$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/vts;->E(Landroid/view/View;Ll/lsw$b;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vts;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object p0, p0, Ll/vts;->d:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/vts;->c:Lv/VRecyclerView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget p2, Ll/yec0;->Z1:I

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public E(Landroid/view/View;Ll/lsw$b;II)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeRightItem;

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeRightItem;->i0(Ll/lsw$b;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public F(I)Ll/lsw$b;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vts;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-object p0, p0, Ll/vts;->d:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ll/lsw$b;

    .line 18
    .line 19
    return-object p0
.end method

.method public G(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/lsw$b;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/vts;->d:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vts;->F(I)Ll/lsw$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
