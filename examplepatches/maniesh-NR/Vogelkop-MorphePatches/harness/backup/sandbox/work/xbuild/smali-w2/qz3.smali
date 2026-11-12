.class public final Lqz3;
.super Lx1p;
.source "SourceFile"


# instance fields
.field public final p:Luz3;

.field public final q:I

.field public final r:I

.field public final s:Z


# direct methods
.method public constructor <init>(Luz3;IIZ)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqz3;->p:Luz3;

    iput p2, p0, Lqz3;->q:I

    iput p3, p0, Lqz3;->r:I

    iput-boolean p4, p0, Lqz3;->s:Z

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method


# virtual methods
.method public final A(Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 4

    const/4 v0, 0x1

    iget v1, p0, Lqz3;->r:I

    if-ne v1, v0, :cond_7

    const/4 p0, 0x0

    return-object p0

    :cond_7
    iget p0, p0, Lqz3;->q:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {p0, v0}, [Ljava/lang/Object;

    move-result-object p0

    const v0, 0x7f140baf

    invoke-virtual {p1, v0, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final B(Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 2

    iget-object p0, p0, Lqz3;->p:Luz3;

    iget-object p0, p0, Luz3;->a:Lrxh;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p0, p1}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0
.end method

.method public final o()Z
    .registers 1

    iget-object p0, p0, Lqz3;->p:Luz3;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p0, 0x1

    return p0
.end method

.method public final u()Ljava/lang/Integer;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public final v(Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 3

    iget-object v0, p0, Lqz3;->p:Luz3;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v0, p0, Lqz3;->q:I

    iget p0, p0, Lqz3;->r:I

    if-ge v0, p0, :cond_f

    const p0, 0x7f140b36

    goto :goto_12

    :cond_f
    const p0, 0x7f14059a

    :goto_12
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final z(Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 3

    iget-boolean v0, p0, Lqz3;->s:Z

    iget-object p0, p0, Lqz3;->p:Luz3;

    if-eqz v0, :cond_11

    iget-object p0, p0, Luz3;->c:Lpxh;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p0, p1}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0

    :cond_11
    iget-object p0, p0, Luz3;->b:Lrxh;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p0, p1}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0
.end method
