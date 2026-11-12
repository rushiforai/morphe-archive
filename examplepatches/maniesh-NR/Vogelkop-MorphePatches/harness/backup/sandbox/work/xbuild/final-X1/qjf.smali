.class public final Lqjf;
.super Llz3;
.source "SourceFile"


# instance fields
.field public final f:Ltjf;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;Ltjf;)V
    .registers 12

    iget-object v1, p2, Ltjf;->a:Landroid/view/View;

    invoke-virtual {p2}, Ltjf;->b()I

    move-result v3

    invoke-virtual {p2}, Ltjf;->g()Z

    move-result v5

    invoke-virtual {p2}, Ltjf;->e()Lk11;

    move-result-object v6

    new-instance v0, Ll11;

    const/4 v2, 0x1

    const/4 v4, 0x0

    invoke-direct/range {v0 .. v6}, Ll11;-><init>(Landroid/view/View;IIIZLk11;)V

    iget-object v1, p2, Ltjf;->c:Lx1p;

    invoke-virtual {v1}, Lx1p;->u()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_21

    const v1, 0x7f1505e3

    goto :goto_24

    :cond_21
    const v1, 0x7f1505e2

    :goto_24
    invoke-virtual {p2}, Ltjf;->h()J

    move-result-wide v3

    new-instance v5, Lkqd;

    const/16 v2, 0x12

    invoke-direct {v5, p2, v2}, Lkqd;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2}, Ltjf;->d()Z

    move-result v7

    instance-of v8, p2, Lkr2;

    move-object v2, p1

    move-object v6, v0

    move-object v0, p0

    invoke-direct/range {v0 .. v8}, Llz3;-><init>(ILandroid/view/ViewGroup;JLjz3;Lhxj;ZZ)V

    iput-object p2, p0, Lqjf;->f:Ltjf;

    new-instance v1, Lpjf;

    invoke-direct {v1, p0}, Lpjf;-><init>(Lqjf;)V

    invoke-virtual {p0, v1}, Llz3;->a(Lkz3;)V

    return-void
.end method


# virtual methods
.method public final e(Z)Z
    .registers 3

    if-eqz p1, :cond_c

    iget-object v0, p0, Lqjf;->f:Ltjf;

    invoke-virtual {v0}, Ltjf;->f()Z

    move-result v0

    if-eqz v0, :cond_c

    const/4 p0, 0x0

    return p0

    :cond_c
    invoke-super {p0, p1}, Llz3;->e(Z)Z

    move-result p0

    return p0
.end method
