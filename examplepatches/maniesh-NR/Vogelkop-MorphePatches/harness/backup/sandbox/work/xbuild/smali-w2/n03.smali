.class public final Ln03;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lpde;

.field public final c:Ltsd;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lndc;Lkze;Likc;Lpde;)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ln03;->a:Landroid/content/Context;

    new-instance p1, Lpde;

    invoke-virtual {p3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqjn;

    new-instance v1, Lb03;

    iget-object v0, v0, Lqjn;->a:Lxkn;

    iget v2, v0, Lxkn;->d:I

    iget v3, v0, Lxkn;->e:I

    iget v0, v0, Lxkn;->f:I

    invoke-direct {v1, v2, v3, v0}, Lb03;-><init>(III)V

    invoke-direct {p1, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Ln03;->b:Lpde;

    sget-object p1, Lm03;->a:Lm03;

    invoke-static {p3, p4, p5, p1}, Lxf8;->y(Likc;Likc;Lpde;Lcr9;)Ltsd;

    move-result-object p1

    iput-object p1, p0, Ln03;->c:Ltsd;

    new-instance p3, Lt02;

    const/16 p4, 0x12

    invoke-direct {p3, p0, p4}, Lt02;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lpb;

    const/16 p4, 0x15

    invoke-direct {p0, p3, p4}, Lpb;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2, p0}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method
