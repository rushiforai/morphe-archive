.class public final Linn;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lpde;

.field public final b:Lpde;

.field public final c:Lykn;

.field public final d:Lj4c;

.field public final e:Lpde;


# direct methods
.method public constructor <init>(Lndc;Lpde;Lpde;Lykn;Lj4c;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Linn;->a:Lpde;

    iput-object p3, p0, Linn;->b:Lpde;

    iput-object p4, p0, Linn;->c:Lykn;

    iput-object p5, p0, Linn;->d:Lj4c;

    new-instance p4, Lpde;

    invoke-virtual {p0}, Linn;->a()Landroid/util/Size;

    move-result-object p5

    invoke-direct {p4, p5}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p4, p0, Linn;->e:Lpde;

    new-instance p4, Lhnn;

    const/4 p5, 0x0

    invoke-direct {p4, p0, p5}, Lhnn;-><init>(Linn;B)V

    new-instance p5, Lt7d;

    const/16 v0, 0x1d

    invoke-direct {p5, p4, v0}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p2, p1, p5}, Lekc;->j(Lndc;Lf7f;)V

    new-instance p2, Lhnn;

    const/4 p4, 0x1

    invoke-direct {p2, p0, p4}, Lhnn;-><init>(Linn;B)V

    new-instance p0, Lt7d;

    invoke-direct {p0, p2, v0}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p3, p1, p0}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final a()Landroid/util/Size;
    .registers 9

    iget-object v0, p0, Linn;->a:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/Size;

    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v1

    invoke-virtual {v0}, Landroid/util/Size;->getHeight()I

    move-result v0

    iget-object v2, p0, Linn;->b:Lpde;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljzk;

    iget v3, v3, Ljzk;->a:I

    iget-object v4, p0, Linn;->c:Lykn;

    iget-object v5, v4, Lykn;->a:Ldu3;

    invoke-virtual {v5}, Ldu3;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lbvl;

    invoke-interface {v5}, Lbvl;->getState()Lpde;

    move-result-object v5

    invoke-virtual {v5}, Lekc;->g()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lavl;

    iget-byte v6, v5, Lavl;->e:B

    const/4 v7, 0x2

    if-eq v6, v7, :cond_35

    const/4 v3, 0x0

    goto :goto_38

    :cond_35
    iget v5, v5, Lavl;->c:I

    add-int/2addr v3, v5

    :goto_38
    sub-int/2addr v0, v3

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljzk;

    iget v2, v2, Ljzk;->b:I

    iget-object p0, p0, Linn;->d:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lt8l;

    iget-object p0, p0, Lt8l;->c:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lq8l;

    iget-object p0, p0, Lq8l;->a:Lp8l;

    invoke-virtual {v4, v2, p0}, Lykn;->a(ILp8l;)I

    move-result p0

    sub-int/2addr v0, p0

    new-instance p0, Landroid/util/Size;

    invoke-direct {p0, v1, v0}, Landroid/util/Size;-><init>(II)V

    return-object p0
.end method
