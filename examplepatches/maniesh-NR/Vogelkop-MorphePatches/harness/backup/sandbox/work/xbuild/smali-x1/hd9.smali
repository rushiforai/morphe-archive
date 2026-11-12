.class public final Lhd9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lam9;


# instance fields
.field public final synthetic a:Ljd9;


# direct methods
.method public constructor <init>(Ljd9;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lhd9;->a:Ljd9;

    return-void
.end method


# virtual methods
.method public final onBackStackChanged()V
    .registers 4

    iget-object p0, p0, Lhd9;->a:Ljd9;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragmentManager()Landroidx/fragment/app/w;

    move-result-object v0

    iget-object v0, v0, Landroidx/fragment/app/w;->c:Landroidx/fragment/app/a0;

    invoke-virtual {v0}, Landroidx/fragment/app/a0;->f()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    const/4 v2, 0x1

    if-nez v1, :cond_1a

    invoke-static {v2, v0}, Lam2;->l(ILjava/util/List;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_1a

    const/4 v2, 0x0

    :cond_1a
    iput-boolean v2, p0, Ljd9;->n:Z

    invoke-virtual {p0}, Ljd9;->z0()V

    return-void
.end method
