.class public final Lbk3;
.super Lpx8;
.source "SourceFile"


# instance fields
.field public final f:Ltx8;


# direct methods
.method public constructor <init>(Lmsh;Ltx8;Lox8;)V
    .registers 11

    iget-object v0, p2, Ltx8;->b:Ljava/lang/String;

    if-nez v0, :cond_6

    const-string v0, ""

    :cond_6
    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    new-instance v4, Lsxh;

    const v1, 0x7f1408ad

    invoke-direct {v4, v1, v0}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    instance-of v0, p1, Lure;

    if-eqz v0, :cond_1b

    const v0, 0x7f14035d

    :goto_19
    move v5, v0

    goto :goto_1f

    :cond_1b
    const v0, 0x7f140359

    goto :goto_19

    :goto_1f
    const v3, 0x7f0808e8

    move-object v1, p0

    move-object v2, p1

    move-object v6, p3

    invoke-direct/range {v1 .. v6}, Lpx8;-><init>(Lmsh;ILpxh;ILox8;)V

    iput-object p2, v1, Lbk3;->f:Ltx8;

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;Lmsh;)Ljava/util/List;
    .registers 3

    iget-object p0, p0, Lbk3;->f:Ltx8;

    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public final c(Landroid/view/View;)V
    .registers 2

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    iget-object p1, p0, Lbk3;->f:Ltx8;

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    iget-object p0, p0, Lpx8;->e:Lox8;

    invoke-interface {p0, p1}, Lox8;->f(Ljava/util/List;)V

    return-void
.end method
