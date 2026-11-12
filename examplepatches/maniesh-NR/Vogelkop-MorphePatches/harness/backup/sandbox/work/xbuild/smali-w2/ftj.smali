.class public final Lftj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lbej;
.implements Llo7;
.implements Lcum;
.implements Lf06;
.implements Ldnp;
.implements Lgtf;
.implements Lhqp;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lftj;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Lorb;
    .registers 1

    new-instance p0, Lorb;

    invoke-direct {p0}, Lorb;-><init>()V

    return-object p0
.end method

.method public final b(Lxkk;)Lf99;
    .registers 3

    sget-object p0, Lzdj;->a:Lzdj;

    new-instance p1, Lxd6;

    const/4 v0, 0x7

    invoke-direct {p1, p0, v0}, Lxd6;-><init>(Ljava/lang/Object;B)V

    return-object p1
.end method

.method public final c(Landroid/content/Context;Ljava/io/File;IILnt5;)Ljava/lang/Object;
    .registers 16

    instance-of v0, p5, Lpip;

    if-eqz v0, :cond_13

    move-object v0, p5

    check-cast v0, Lpip;

    iget v1, v0, Lpip;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lpip;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lpip;

    invoke-direct {v0, p0, p5}, Lpip;-><init>(Lftj;Lnt5;)V

    :goto_18
    iget-object p0, v0, Lpip;->t:Ljava/lang/Object;

    sget-object p5, Lpx5;->a:Lpx5;

    iget v1, v0, Lpip;->v:I

    const/4 v2, 0x1

    if-eqz v1, :cond_2e

    if-ne v1, v2, :cond_27

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    return-object p0

    :cond_27
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_2e
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p0, Lbb7;->a:Lcv6;

    sget-object p0, Lmr6;->b:Lmr6;

    new-instance v3, Lxwa;

    const/4 v8, 0x0

    const/4 v9, 0x2

    move-object v7, p1

    move-object v4, p2

    move v5, p3

    move v6, p4

    invoke-direct/range {v3 .. v9}, Lxwa;-><init>(Ljava/lang/Object;IILjava/lang/Object;Lmt5;B)V

    iput v2, v0, Lpip;->v:I

    invoke-static {p0, v3, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, p5, :cond_49

    return-object p5

    :cond_49
    return-object p0
.end method

.method public final d(Landroid/os/IBinder;)Ljava/lang/Object;
    .registers 4

    sget p0, Lb3p;->j:I

    if-nez p1, :cond_6

    const/4 p0, 0x0

    return-object p0

    :cond_6
    const-string p0, "com.google.android.play.core.integrity.protocol.IExpressIntegrityService"

    invoke-interface {p1, p0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    instance-of v1, v0, Ld6p;

    if-eqz v1, :cond_13

    check-cast v0, Ld6p;

    return-object v0

    :cond_13
    new-instance v0, Lt1p;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p0, v1}, Lojo;-><init>(Landroid/os/IBinder;Ljava/lang/String;B)V

    return-object v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 5

    iget-byte v0, p0, Lftj;->a:B

    sparse-switch v0, :sswitch_data_34

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :sswitch_a
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    const/16 v0, 0x10

    invoke-static {v0}, Lkotlin/text/CharsKt;->checkRadix(I)I

    move-result v0

    invoke-static {p0, v0}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object p0

    const-class v0, Ljava/lang/String;

    invoke-static {v0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v0

    invoke-virtual {v0}, Ls15;->c()Ljava/lang/String;

    move-result-object v0

    const-string v1, "<"

    const-string v2, ">"

    const-string v3, "CreationExtras.Key@"

    invoke-static {v3, p0, v1, v0, v2}, Lsko;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :sswitch_2d
    const-string p0, "ReusedSlotId"

    return-object p0

    :sswitch_30
    const-string p0, "SharingStarted.Eagerly"

    return-object p0

    nop

    :sswitch_data_34
    .sparse-switch
        0x1 -> :sswitch_30
        0x2 -> :sswitch_2d
        0x8 -> :sswitch_a
    .end sparse-switch
.end method

.method public final x(Landroid/content/Context;)Lno7;
    .registers 2

    new-instance p0, Lhom;

    invoke-direct {p0, p1}, Lhom;-><init>(Landroid/content/Context;)V

    return-object p0
.end method

.method public final zza(Landroid/os/IBinder;)Ljava/lang/Object;
    .registers 4

    sget p0, Lssp;->a:I

    if-nez p1, :cond_6

    const/4 p0, 0x0

    return-object p0

    :cond_6
    const-string p0, "com.google.android.play.core.hsdp.protocol.IHsdpService"

    invoke-interface {p1, p0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    instance-of v1, v0, Lwsp;

    if-eqz v1, :cond_13

    check-cast v0, Lwsp;

    return-object v0

    :cond_13
    new-instance v0, Lisp;

    invoke-direct {v0, p1, p0}, Lcom/google/android/gms/internal/playcore_hsdp/zza;-><init>(Landroid/os/IBinder;Ljava/lang/String;)V

    return-object v0
.end method
