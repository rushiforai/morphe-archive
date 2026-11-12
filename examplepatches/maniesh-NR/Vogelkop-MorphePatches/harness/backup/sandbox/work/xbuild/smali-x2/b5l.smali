.class public final Lb5l;
.super Ly08;
.source "SourceFile"

# interfaces
.implements Lj6l;


# instance fields
.field public final a:Ls99;

.field public final b:Lk6l;

.field public final c:Lxbf;

.field public final d:Ls4k;

.field public final e:Ljava/util/LinkedHashSet;


# direct methods
.method public constructor <init>(Ls99;Lk6l;Lxbf;Ls4k;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lb5l;->a:Ls99;

    iput-object p2, p0, Lb5l;->b:Lk6l;

    iput-object p3, p0, Lb5l;->c:Lxbf;

    iput-object p4, p0, Lb5l;->d:Ls4k;

    new-instance p1, Ljava/util/LinkedHashSet;

    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p1, p0, Lb5l;->e:Ljava/util/LinkedHashSet;

    return-void
.end method


# virtual methods
.method public final H(Lb2l;Lb2l;I)V
    .registers 10

    invoke-static {p3}, Lvep;->A(I)I

    move-result p0

    const/4 p3, 0x1

    if-eqz p0, :cond_10

    if-eq p0, p3, :cond_f

    const/4 v0, 0x2

    if-eq p0, v0, :cond_10

    invoke-static {}, Lh9o;->p()V

    :cond_f
    return-void

    :cond_10
    if-eqz p1, :cond_2c

    check-cast p1, Ld7l;

    iget-object p0, p1, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    const/4 v4, 0x0

    const/16 v5, 0xd

    const/4 v3, 0x0

    invoke-static/range {v0 .. v5}, Lcom/opera/android/browser/TabInfo;->a(Lcom/opera/android/browser/TabInfo;JIII)Lcom/opera/android/browser/TabInfo;

    move-result-object p0

    invoke-virtual {p1, p0}, Ld7l;->s(Lcom/opera/android/browser/TabInfo;)Z

    :cond_2c
    move-object p0, p2

    check-cast p0, Ld7l;

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget p0, v0, Lcom/opera/android/browser/TabInfo;->c:I

    add-int/lit8 v3, p0, 0x1

    const/4 v4, 0x0

    const/16 v5, 0x9

    invoke-static/range {v0 .. v5}, Lcom/opera/android/browser/TabInfo;->a(Lcom/opera/android/browser/TabInfo;JIII)Lcom/opera/android/browser/TabInfo;

    move-result-object p0

    check-cast p2, Ld7l;

    invoke-virtual {p2, p0}, Ld7l;->s(Lcom/opera/android/browser/TabInfo;)Z

    return-void
.end method

.method public final L(Lb2l;Z)V
    .registers 3

    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object p1

    iget p1, p1, Lcom/opera/android/browser/TabInfo;->d:I

    invoke-virtual {p0, p1}, Lb5l;->X(I)V

    return-void
.end method

.method public final T(Lb2l;Lcom/opera/android/browser/TabInfo;)V
    .registers 4

    iget v0, p2, Lcom/opera/android/browser/TabInfo;->d:I

    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object p1

    iget p1, p1, Lcom/opera/android/browser/TabInfo;->d:I

    if-eq v0, p1, :cond_13

    iget p1, p2, Lcom/opera/android/browser/TabInfo;->d:I

    invoke-virtual {p0, p1}, Lb5l;->X(I)V

    :cond_13
    return-void
.end method

.method public final W(Lb2l;Ld7l;)V
    .registers 11

    iget-object v0, p2, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v0

    iget v0, v0, Lcom/opera/android/browser/TabInfo;->d:I

    if-nez v0, :cond_69

    move-object v0, p1

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v0

    iget v0, v0, Lcom/opera/android/browser/TabInfo;->d:I

    if-nez v0, :cond_44

    iget-object v0, p0, Lb5l;->a:Ls99;

    invoke-virtual {v0}, Ls99;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_44

    move-object v0, p1

    check-cast v0, Ld7l;

    iget-object v1, v0, Ld7l;->j:Le7l;

    invoke-interface {v1}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v2

    iget-object p0, p0, Lb5l;->c:Lxbf;

    iget-object p0, p0, Lxbf;->b:Ljava/lang/Object;

    check-cast p0, Lvzk;

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lvzk;->L(Z)I

    move-result v6

    const/4 v7, 0x7

    const-wide/16 v3, 0x0

    const/4 v5, 0x0

    invoke-static/range {v2 .. v7}, Lcom/opera/android/browser/TabInfo;->a(Lcom/opera/android/browser/TabInfo;JIII)Lcom/opera/android/browser/TabInfo;

    move-result-object p0

    invoke-virtual {v0, p0}, Ld7l;->s(Lcom/opera/android/browser/TabInfo;)Z

    :cond_44
    check-cast p1, Ld7l;

    iget-object p0, p1, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object p0

    iget p0, p0, Lcom/opera/android/browser/TabInfo;->d:I

    if-eqz p0, :cond_69

    iget-object p0, p2, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v0

    iget-object p0, p1, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object p0

    iget v4, p0, Lcom/opera/android/browser/TabInfo;->d:I

    const/4 v5, 0x7

    const-wide/16 v1, 0x0

    const/4 v3, 0x0

    invoke-static/range {v0 .. v5}, Lcom/opera/android/browser/TabInfo;->a(Lcom/opera/android/browser/TabInfo;JIII)Lcom/opera/android/browser/TabInfo;

    move-result-object p0

    invoke-virtual {p2, p0}, Ld7l;->s(Lcom/opera/android/browser/TabInfo;)Z

    :cond_69
    return-void
.end method

.method public final X(I)V
    .registers 5

    if-eqz p1, :cond_27

    iget-object v0, p0, Lb5l;->b:Lk6l;

    iget-object v1, v0, Lk6l;->d:Lghf;

    iget-object v1, v1, Lghf;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    sget-object v2, Lh6l;->b:Lh6l;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_27

    iget-object v1, p0, Lb5l;->e:Ljava/util/LinkedHashSet;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v1, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object p1, v0, Lk6l;->d:Lghf;

    iget-object p1, p1, Lghf;->b:Ljava/lang/Object;

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_28

    :cond_27
    return-void

    :cond_28
    new-instance p1, Lqlk;

    const/16 v0, 0x19

    invoke-direct {p1, p0, v0}, Lqlk;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final a(Lb2l;Ld7l;)V
    .registers 3

    invoke-virtual {p0, p1, p2}, Lb5l;->W(Lb2l;Ld7l;)V

    return-void
.end method

.method public final k()V
    .registers 3

    iget-object v0, p0, Lb5l;->b:Lk6l;

    iget-object v0, v0, Lk6l;->d:Lghf;

    iget-object v0, v0, Lghf;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_f

    return-void

    :cond_f
    new-instance v0, Lqlk;

    const/16 v1, 0x19

    invoke-direct {v0, p0, v1}, Lqlk;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void
.end method
