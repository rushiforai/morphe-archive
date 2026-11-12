.class Le0h;
.super Lagc;
.source "SourceFile"


# instance fields
.field public final synthetic e:Lf0h;


# direct methods
.method public constructor <init>(Lf0h;Landroid/content/Context;)V
    .registers 3

    iput-object p1, p0, Le0h;->e:Lf0h;

    invoke-direct {p0, p2}, Lagc;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 9

    iget-object p0, p0, Le0h;->e:Lf0h;

    iget-object p1, p0, Lf0h;->d:Lx5f;

    sget-object v0, Len0;->i:Len0;

    invoke-virtual {p1, v0}, Lx5f;->n0(Len0;)V

    new-instance v1, Lozg;

    iget-object v2, p0, Lf0h;->a:Lumi;

    iget-object v3, p0, Lf0h;->b:Lp0h;

    iget-object v4, p0, Lf0h;->c:Lwzg;

    iget-object v5, p0, Lf0h;->d:Lx5f;

    iget-boolean v6, p0, Lf0h;->e:Z

    invoke-direct/range {v1 .. v6}, Lozg;-><init>(Lumi;Lp0h;Lwzg;Lx5f;Z)V

    invoke-virtual {p0, v1}, Lj83;->g0(Lj83;)V

    return-void
.end method
