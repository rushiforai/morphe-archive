.class public final Lvu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw5g;


# instance fields
.field public a:Lw3g;

.field public b:Lz3;

.field public final synthetic c:Lxu;


# direct methods
.method public constructor <init>(Lxu;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvu;->c:Lxu;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 8

    iget-object v0, p0, Lvu;->a:Lw3g;

    if-eqz v0, :cond_51

    iget-object v1, p0, Lvu;->c:Lxu;

    iget-object v1, v1, Lxu;->b:Lx5g;

    iget-object v1, v1, Lx5g;->e:La4g;

    const/4 v2, 0x0

    if-eqz v1, :cond_14

    iget-object v1, v1, La4g;->a:Ljava/util/List;

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    goto :goto_15

    :cond_14
    move-object v1, v2

    :goto_15
    if-nez v1, :cond_19

    sget-object v1, Ll08;->a:Ll08;

    :cond_19
    check-cast v1, Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_41

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v4, v3

    check-cast v4, Lw3g;

    iget-object v5, v4, Lw3g;->g:Ljava/lang/String;

    iget-object v6, v0, Lw3g;->g:Ljava/lang/String;

    invoke-static {v5, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1f

    iget-object v4, v4, Lw3g;->f:Ljava/lang/String;

    iget-object v5, v0, Lw3g;->f:Ljava/lang/String;

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1f

    goto :goto_42

    :cond_41
    move-object v3, v2

    :goto_42
    check-cast v3, Lw3g;

    if-eqz v3, :cond_51

    iget-object v0, p0, Lvu;->b:Lz3;

    if-eqz v0, :cond_4d

    invoke-virtual {v0, v3}, Lz3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4d
    iput-object v2, p0, Lvu;->a:Lw3g;

    iput-object v2, p0, Lvu;->b:Lz3;

    :cond_51
    return-void
.end method
