.class public final Lege;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmb9;


# instance fields
.field public final a:Lzb9;

.field public b:Ljava/lang/String;

.field public c:Z

.field public d:Z

.field public e:J

.field public final synthetic f:Lfge;


# direct methods
.method public constructor <init>(Lfge;Ljava/lang/String;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lege;->f:Lfge;

    new-instance v0, Lzb9;

    const-wide/16 v1, 0x0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lhb9;-><init>(JJLjava/lang/String;)V

    const-string p2, ""

    iput-object p2, v0, Lzb9;->e:Ljava/lang/String;

    iput-object p2, v0, Lzb9;->f:Ljava/lang/String;

    iput-object v0, p0, Lege;->a:Lzb9;

    iget-object p2, p1, Lfge;->y:Lha2;

    iget-object v1, p2, Lha2;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {p2, v1, v0}, Lha2;->H(ILja2;)V

    iget-object p1, p1, Lfge;->x:Lrc9;

    iget-object p1, p1, Lrc9;->d:Lh7f;

    invoke-virtual {p1, p0}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    invoke-virtual {p0}, Lege;->b()V

    new-instance v0, Lrxh;

    const v1, 0x7f14077c

    invoke-direct {v0, v1}, Lrxh;-><init>(I)V

    iget-object p0, p0, Lege;->f:Lfge;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lglj;

    const/16 v2, 0x1388

    invoke-direct {v1, v0, v2}, Lglj;-><init>(Lpxh;I)V

    invoke-virtual {p0, v1}, Lfge;->I0(Lo93;)V

    return-void
.end method

.method public final b()V
    .registers 4

    iget-boolean v0, p0, Lege;->c:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lege;->c:Z

    iget-object v0, p0, Lege;->f:Lfge;

    iget-object v1, v0, Lfge;->y:Lha2;

    iget-object v2, p0, Lege;->a:Lzb9;

    invoke-virtual {v1, v2}, Lha2;->V(Lja2;)V

    iget-object v0, v0, Lfge;->x:Lrc9;

    iget-object v0, v0, Lrc9;->d:Lh7f;

    invoke-virtual {v0, p0}, Lh7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final f(II)V
    .registers 3

    return-void
.end method

.method public final h(II)V
    .registers 10

    iget-boolean v0, p0, Lege;->d:Z

    const/4 v1, 0x0

    iget-object v2, p0, Lege;->f:Lfge;

    if-eqz v0, :cond_24

    :goto_7
    if-ge v1, p2, :cond_61

    iget-object v0, v2, Lfge;->x:Lrc9;

    add-int v3, p1, v1

    iget-object v0, v0, Lrc9;->c:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lhb9;

    iget-wide v3, v0, Lhb9;->b:J

    iget-wide v5, p0, Lege;->e:J

    cmp-long v0, v3, v5

    if-nez v0, :cond_21

    invoke-virtual {p0}, Lege;->b()V

    return-void

    :cond_21
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_24
    iget-object v0, p0, Lege;->b:Ljava/lang/String;

    if-eqz v0, :cond_61

    const/4 v0, 0x0

    :goto_29
    if-ge v1, p2, :cond_61

    iget-object v3, v2, Lfge;->x:Lrc9;

    add-int v4, p1, v1

    iget-object v3, v3, Lrc9;->c:Ljava/util/ArrayList;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lhb9;

    instance-of v4, v3, Lib9;

    if-eqz v4, :cond_5e

    move-object v4, v3

    check-cast v4, Lib9;

    iget-object v4, v4, Lib9;->e:Ljava/lang/String;

    iget-object v5, p0, Lege;->b:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5e

    if-nez v0, :cond_52

    iget-object v0, v2, Lfge;->t:Lbf9;

    iget-object v0, v0, Lbf9;->a:Loji;

    invoke-virtual {v0}, Loji;->u()Ljava/lang/String;

    move-result-object v0

    :cond_52
    iget-object v3, v3, Lhb9;->d:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5e

    invoke-virtual {p0}, Lege;->b()V

    return-void

    :cond_5e
    add-int/lit8 v1, v1, 0x1

    goto :goto_29

    :cond_61
    return-void
.end method

.method public final m(I)V
    .registers 2

    return-void
.end method
