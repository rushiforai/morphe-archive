.class public abstract Lv6j;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:C

.field public final b:Lhx5;


# direct methods
.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-char p1, p0, Lv6j;->a:C

    new-instance p1, Lhx5;

    invoke-direct {p1, p0}, Lhx5;-><init>(Lv6j;)V

    iput-object p1, p0, Lv6j;->b:Lhx5;

    return-void
.end method


# virtual methods
.method public abstract c()Lhx5;
.end method

.method public abstract d()Ljava/util/List;
.end method

.method public e()V
    .registers 5

    invoke-virtual {p0}, Lv6j;->d()Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_29

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lex4;

    iget-object v2, v1, Lv6j;->b:Lhx5;

    iget-object v3, v1, Lex4;->d:Lekc;

    if-eqz v3, :cond_1f

    invoke-virtual {v2, v3}, Lh42;->t(Lekc;)V

    :cond_1f
    iget-object v3, p0, Lv6j;->b:Lhx5;

    iput-object v3, v1, Lex4;->d:Lekc;

    iget-object v1, v1, Lex4;->e:Lk9;

    invoke-virtual {v2, v3, v1}, Lh42;->s(Lekc;Lf7f;)V

    goto :goto_a

    :cond_29
    return-void
.end method

.method public f()V
    .registers 1

    return-void
.end method
