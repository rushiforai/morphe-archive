.class public final Ll/ocp0;
.super Ll/d3q;
.source "SourceFile"

# interfaces
.implements Ll/d6m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Landroid/view/View;",
        ">;",
        "Ll/d6m;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0006\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u00012\u00020\u0003B\u0007\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J#\u0010\u000b\u001a\u00020\n2\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u00062\u0008\u0010\t\u001a\u0004\u0018\u00010\u0008H\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u000f\u0010\u000e\u001a\u00020\rH\u0016\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u0017\u0010\u0011\u001a\u00020\n2\u0006\u0010\u0010\u001a\u00020\u0002H\u0014\u00a2\u0006\u0004\u0008\u0011\u0010\u0012\u00a8\u0006\u0013"
    }
    d2 = {
        "Ll/ocp0;",
        "Ll/d3q;",
        "Landroid/view/View;",
        "Ll/d6m;",
        "<init>",
        "()V",
        "Landroidx/recyclerview/widget/RecyclerView$e0;",
        "viewHolder",
        "Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;",
        "layoutParams",
        "",
        "b",
        "(Landroidx/recyclerview/widget/RecyclerView$e0;Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;)V",
        "",
        "o",
        "()I",
        "itemView",
        "u",
        "(Landroid/view/View;)V",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public b(Landroidx/recyclerview/widget/RecyclerView$e0;Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    invoke-virtual {p2, p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->i(Z)V

    .line 5
    .line 6
    .line 7
    :cond_0
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->G0:I

    .line 2
    .line 3
    return p0
.end method

.method public u(Landroid/view/View;)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    sget p0, Ll/bnl0;->e:I

    .line 8
    .line 9
    filled-new-array {p1}, [Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {p0, v0}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    const/high16 p0, 0x42200000    # 40.0f

    .line 17
    .line 18
    invoke-static {p0}, Ll/bnl0;->w(F)I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    invoke-static {p1, p0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
