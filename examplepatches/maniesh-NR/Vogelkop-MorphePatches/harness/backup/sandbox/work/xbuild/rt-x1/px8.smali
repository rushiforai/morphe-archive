.class public abstract Lpx8;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Lpxh;

.field public final c:I

.field public final d:Lmsh;

.field public final e:Lox8;


# direct methods
.method public constructor <init>(Lmsh;ILpxh;ILox8;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Lpx8;->a:I

    iput-object p3, p0, Lpx8;->b:Lpxh;

    iput p4, p0, Lpx8;->c:I

    iput-object p1, p0, Lpx8;->d:Lmsh;

    iput-object p5, p0, Lpx8;->e:Lox8;

    return-void
.end method


# virtual methods
.method public abstract a(Landroid/content/Context;Lmsh;)Ljava/util/List;
.end method

.method public b()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public c(Landroid/view/View;)V
    .registers 14

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v1, p0, Lpx8;->d:Lmsh;

    invoke-virtual {p0, p1, v1}, Lpx8;->a(Landroid/content/Context;Lmsh;)Ljava/util/List;

    move-result-object p1

    new-instance v1, Lbm8;

    const/4 v2, 0x5

    iget-object v3, p0, Lpx8;->e:Lox8;

    invoke-direct {v1, v3, v2}, Lbm8;-><init>(Ljava/lang/Object;B)V

    if-eqz p1, :cond_59

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_59

    invoke-virtual {p0}, Lpx8;->b()I

    move-result p0

    new-instance v2, Lly4;

    const/4 v3, 0x4

    invoke-static {v3}, Lu7k;->f(I)Lu7k;

    move-result-object v4

    invoke-virtual {v4, p0}, Lu7k;->s(I)V

    iget-object p0, v4, Lu7k;->a:Ljava/lang/Object;

    check-cast p0, Litl;

    const/4 v4, 0x2

    iput v4, p0, Litl;->k:I

    const/4 v4, 0x1

    iput-boolean v4, p0, Litl;->d:Z

    invoke-direct {v2, p0}, Lltl;-><init>(Litl;)V

    iput-object p1, v2, Lly4;->r:Ljava/util/List;

    iput-object v1, v2, Lly4;->s:Lbm8;

    const/4 p0, 0x0

    new-array p0, p0, [Ln6h;

    new-instance v5, Lwzg;

    const-class p1, Lly4;

    invoke-direct {v5, v2, p1, v3}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v4, Lzhj;

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v11

    const/4 v6, 0x0

    const/4 v7, 0x2

    const/4 v8, -0x1

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-direct/range {v4 .. v11}, Lzhj;-><init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V

    invoke-virtual {v4, v0}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    :cond_59
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-interface {v3, p0}, Lox8;->f(Ljava/util/List;)V

    return-void
.end method
