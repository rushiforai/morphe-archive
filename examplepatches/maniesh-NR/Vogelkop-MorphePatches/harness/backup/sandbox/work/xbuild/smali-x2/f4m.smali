.class public final synthetic Lf4m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:Lplk;

.field public final synthetic b:Lszb;

.field public final synthetic c:Z

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Lplk;Lszb;ZI)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lf4m;->a:Lplk;

    iput-object p2, p0, Lf4m;->b:Lszb;

    iput-boolean p3, p0, Lf4m;->c:Z

    iput-boolean p4, p0, Lf4m;->d:Z

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 8

    check-cast p1, Lg4m;

    iget-object v0, p0, Lf4m;->a:Lplk;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Ljava/util/ArrayList;

    iget-object p1, p1, Lg4m;->a:Ljava/util/List;

    invoke-direct {v1, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_15
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    iget-object v3, p0, Lf4m;->b:Lszb;

    if-eqz v2, :cond_35

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v4, v2

    check-cast v4, Lj0c;

    iget-object v4, v4, Lj0c;->a:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_15

    invoke-static {v2}, Lorf;->h(Ljava/lang/Object;)Lewg;

    move-result-object p1

    goto :goto_37

    :cond_35
    sget-object p1, Lh3;->a:Lh3;

    :goto_37
    invoke-virtual {p1}, Lorf;->j()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lj0c;

    iget-boolean v2, p0, Lf4m;->d:Z

    if-eqz p1, :cond_4e

    iget-boolean p0, p0, Lf4m;->c:Z

    if-eqz p0, :cond_4d

    iget p0, p1, Lj0c;->b:I

    if-eq p0, v2, :cond_4d

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_4e

    :cond_4d
    return-void

    :cond_4e
    :goto_4e
    new-instance p0, Lj0c;

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1, v2}, Lj0c;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p0, v0, Lplk;->b:Ljava/lang/Object;

    check-cast p0, Lxl;

    new-instance p1, Ld4m;

    const/4 v2, 0x3

    invoke-direct {p1, v0, v2}, Ld4m;-><init>(Lplk;B)V

    iget-object v0, p0, Lxl;->l:Ljava/lang/Object;

    check-cast v0, Lnrl;

    new-instance v2, Lh4m;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v1, p1, v3}, Lh4m;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v2}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    return-void
.end method
