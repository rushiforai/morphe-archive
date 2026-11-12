.class public final Lvkn;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lujn;

.field public final b:Landroidx/recyclerview/widget/RecyclerView;

.field public final c:Lq87;

.field public final d:Lzk7;

.field public final e:Lplk;

.field public final f:Lplk;


# direct methods
.method public constructor <init>(Lqln;Landroidx/recyclerview/widget/RecyclerView;Ln1;IILtjn;)V
    .registers 19

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lvkn;->b:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v0, Lujn;

    iget-object v1, p1, Lqln;->g:Lagm;

    const/4 v2, 0x0

    move-object/from16 v3, p6

    invoke-direct {v0, p3, v1, v2, v3}, Lujn;-><init>(Ln1;Lagm;Lcom/opera/android/settings/SettingsManager;Ltjn;)V

    iput-object v0, p0, Lvkn;->a:Lujn;

    new-instance v5, Landroidx/recyclerview/widget/GridLayoutManager;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    const/4 p3, 0x1

    const/4 v1, 0x0

    invoke-direct {v5, p3, v1}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(II)V

    new-instance v3, Lt79;

    const/4 v10, 0x1

    const/4 v11, 0x0

    const/4 v7, 0x0

    const/4 v9, 0x0

    move-object v4, p2

    move/from16 v8, p4

    move/from16 v6, p5

    invoke-direct/range {v3 .. v11}, Lt79;-><init>(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/GridLayoutManager;IIIIIB)V

    new-instance p3, Lk56;

    invoke-direct {p3}, Lk56;-><init>()V

    iput-boolean v1, p3, Lxkj;->g:Z

    invoke-virtual {p2, p3}, Landroidx/recyclerview/widget/RecyclerView;->B0(Landroidx/recyclerview/widget/e;)V

    invoke-virtual {p2, v5}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    new-instance p3, Li4a;

    invoke-direct {p3, v3}, Li4a;-><init>(Lk8;)V

    invoke-virtual {p2, p3}, Landroidx/recyclerview/widget/RecyclerView;->m(Liph;)V

    new-instance p3, Lzk7;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    new-instance v3, Lg00;

    const v5, 0x7f080a22

    const/4 v6, 0x2

    invoke-direct {v3, v2, v5, v6}, Lg00;-><init>(Ljava/lang/Object;IB)V

    new-instance v2, Lroj;

    const/16 v5, 0xd

    invoke-direct {v2, p0, p1, v5}, Lroj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {p3, v3, v2}, Lzk7;-><init>(Lyk7;Lxk7;)V

    iput-object p3, p0, Lvkn;->d:Lzk7;

    invoke-virtual {p2, p3}, Landroidx/recyclerview/widget/RecyclerView;->m(Liph;)V

    new-instance p3, Lplk;

    new-instance v2, Lr2n;

    const/16 v3, 0xa

    invoke-direct {v2, p2, v3}, Lr2n;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p3, p2, v0, v2}, Lplk;-><init>(Landroidx/recyclerview/widget/RecyclerView;Lujn;Lyk7;)V

    iput-object p3, p0, Lvkn;->e:Lplk;

    new-instance p3, Lplk;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    new-instance v3, Lg00;

    const v7, 0x7f080a21

    invoke-direct {v3, v2, v7, v6}, Lg00;-><init>(Ljava/lang/Object;IB)V

    invoke-direct {p3, p2, v0, v3}, Lplk;-><init>(Landroidx/recyclerview/widget/RecyclerView;Lujn;Lyk7;)V

    iput-object p3, p0, Lvkn;->f:Lplk;

    new-instance p3, Lq87;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    new-instance v3, Livg;

    invoke-direct {v3, v5, p0, p1, v1}, Livg;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    const p1, 0x7f080a23

    invoke-direct {p3, v2, p1, v3}, Lq87;-><init>(Landroid/content/Context;ILll7;)V

    iput-object p3, p0, Lvkn;->c:Lq87;

    invoke-virtual {p2, p3}, Landroidx/recyclerview/widget/RecyclerView;->m(Liph;)V

    invoke-virtual {p2, v0}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    return-void
.end method
