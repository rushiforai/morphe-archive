.class public Ll/vmt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/tmt;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/qmt;

.field public final b:Landroid/widget/LinearLayout;

.field public final c:Lv/VRecyclerView;

.field public d:Ll/tmt;


# direct methods
.method public constructor <init>(Landroid/widget/LinearLayout;Lv/VRecyclerView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/vmt;->b:Landroid/widget/LinearLayout;

    .line 5
    .line 6
    iput-object p2, p0, Ll/vmt;->c:Lv/VRecyclerView;

    .line 7
    .line 8
    new-instance p0, Ll/guf0;

    .line 9
    .line 10
    sget p1, Ll/qa00;->h:I

    .line 11
    .line 12
    invoke-direct {p0, p1, p1}, Ll/guf0;-><init>(II)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p2, p0}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public a(Ll/tmt;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vmt;->d:Ll/tmt;

    .line 2
    .line 3
    return-void
.end method

.method public b(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/mr2;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/vmt;->b:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/vmt;->a:Ll/qmt;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/qmt;

    .line 12
    .line 13
    iget-object v1, p0, Ll/vmt;->d:Ll/tmt;

    .line 14
    .line 15
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    new-instance v2, Ll/umt;

    .line 19
    .line 20
    invoke-direct {v2, v1}, Ll/umt;-><init>(Ll/tmt;)V

    .line 21
    .line 22
    .line 23
    invoke-direct {v0, p1, v2}, Ll/qmt;-><init>(Ljava/util/List;Ll/y20;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/vmt;->a:Ll/qmt;

    .line 27
    .line 28
    iget-object p0, p0, Ll/vmt;->c:Lv/VRecyclerView;

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    invoke-virtual {v0, p1}, Ll/qmt;->I(Ljava/util/List;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/tmt;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/vmt;->a(Ll/tmt;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method
