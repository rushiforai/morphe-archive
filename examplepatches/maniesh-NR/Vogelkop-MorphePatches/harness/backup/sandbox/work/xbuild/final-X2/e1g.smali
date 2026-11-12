.class public abstract Le1g;
.super Lf1g;
.source "SourceFile"

# interfaces
.implements Lt6j;


# instance fields
.field public final c:Lhx5;

.field public d:Z


# direct methods
.method public constructor <init>(I)V
    .registers 5

    invoke-direct {p0, p1}, Lv6j;-><init>(I)V

    new-instance p1, Lhx5;

    iget-object v0, p0, Lv6j;->b:Lhx5;

    new-instance v1, Lo5f;

    const/16 v2, 0x15

    invoke-direct {v1, p0, v2}, Lo5f;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p1, v0, v1}, Lhx5;-><init>(Lekc;Lkotlin/jvm/functions/Function1;)V

    iput-object p1, p0, Le1g;->c:Lhx5;

    const/4 p1, 0x1

    iput-boolean p1, p0, Le1g;->d:Z

    return-void
.end method


# virtual methods
.method public b(Lhx4;)Lix4;
    .registers 2

    iget-boolean p0, p0, Le1g;->d:Z

    if-nez p0, :cond_e

    iget-object p0, p1, Lhx4;->c:Ljava/util/LinkedHashSet;

    invoke-interface {p0}, Ljava/util/Set;->clear()V

    invoke-virtual {p1}, Lhx4;->a()Lix4;

    move-result-object p0

    return-object p0

    :cond_e
    invoke-virtual {p1}, Lhx4;->a()Lix4;

    move-result-object p0

    return-object p0
.end method

.method public final c()Lhx5;
    .registers 1

    iget-object p0, p0, Le1g;->c:Lhx5;

    return-object p0
.end method

.method public final e()V
    .registers 3

    invoke-super {p0}, Lv6j;->e()V

    iget-char v0, p0, Lv6j;->a:C

    invoke-virtual {p0, v0}, Le1g;->g(I)Lr6j;

    move-result-object v0

    iget-boolean v1, v0, Lr6j;->h:Z

    iput-boolean v1, p0, Le1g;->d:Z

    iget-object p0, p0, Lv6j;->b:Lhx5;

    invoke-virtual {p0, v0}, Lekc;->n(Ljava/lang/Object;)V

    return-void
.end method

.method public g(I)Lr6j;
    .registers 13

    new-instance v0, Lr6j;

    new-instance v2, Lx6j;

    new-instance p0, Lve5;

    const/4 v1, 0x3

    invoke-direct {p0, v1}, Lve5;-><init>(B)V

    const-class v1, Ld8j;

    invoke-direct {v2, v1, p0}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    new-instance v9, Ly2;

    const/4 p0, 0x0

    invoke-direct {v9, p0}, Ly2;-><init>(B)V

    sget-object v10, Ll08;->a:Ll08;

    new-instance v4, Lp6j;

    const p0, 0x7f140f46

    invoke-direct {v4, p0}, Lp6j;-><init>(I)V

    const/4 v7, 0x1

    sget-object v3, Lz2;->a:Lz2;

    const v5, 0x7f080576

    const/4 v6, 0x1

    const/4 v8, 0x1

    move v1, p1

    invoke-direct/range {v0 .. v10}, Lr6j;-><init>(ILx6j;Lq6j;Lq6j;IZZZLkotlin/jvm/functions/Function1;Ljava/util/List;)V

    return-object v0
.end method
