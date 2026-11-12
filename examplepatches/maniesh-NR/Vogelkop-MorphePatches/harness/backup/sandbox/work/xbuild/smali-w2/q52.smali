.class public final Lq52;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lxb;

.field public final b:Lk42;

.field public final c:Lkze;


# direct methods
.method public constructor <init>(Lndc;Lxb;Lk42;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lq52;->a:Lxb;

    iput-object p3, p0, Lq52;->b:Lk42;

    new-instance v0, Lkze;

    sget-object v1, Lk52;->a:Lk52;

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lq52;->c:Lkze;

    iget-object p2, p2, Lxb;->e:Ljze;

    new-instance v0, Lp52;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lp52;-><init>(Lq52;B)V

    new-instance v1, Lug;

    const/4 v2, 0x5

    invoke-direct {v1, v0, v2}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p2, p1, v1}, Lekc;->j(Lndc;Lf7f;)V

    iget-object p2, p3, Lk42;->d:Lh42;

    new-instance p3, Lp52;

    const/4 v0, 0x1

    invoke-direct {p3, p0, v0}, Lp52;-><init>(Lq52;B)V

    new-instance p0, Lug;

    invoke-direct {p0, p3, v2}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p2, p1, p0}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    iget-object v0, p0, Lq52;->a:Lxb;

    iget-object v0, v0, Lxb;->d:Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lipf;

    instance-of v1, v0, Lfpf;

    if-eqz v1, :cond_16

    new-instance v1, Ll52;

    check-cast v0, Lfpf;

    invoke-direct {v1, v0}, Ll52;-><init>(Lfpf;)V

    goto :goto_52

    :cond_16
    instance-of v1, v0, Lcpf;

    if-eqz v1, :cond_22

    new-instance v1, Lj52;

    check-cast v0, Lcpf;

    invoke-direct {v1, v0}, Lj52;-><init>(Lcpf;)V

    goto :goto_52

    :cond_22
    instance-of v1, v0, Lgpf;

    if-eqz v1, :cond_48

    iget-object v0, p0, Lq52;->b:Lk42;

    iget-object v0, v0, Lk42;->d:Lh42;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt0i;

    const/4 v1, 0x0

    if-eqz v0, :cond_3c

    iget-object v0, v0, Lt0i;->a:Ljava/lang/Object;

    instance-of v2, v0, Lq0i;

    if-nez v2, :cond_3a

    move-object v1, v0

    :cond_3a
    check-cast v1, Lehf;

    :cond_3c
    if-eqz v1, :cond_45

    new-instance v0, Ln52;

    invoke-direct {v0, v1}, Ln52;-><init>(Lehf;)V

    move-object v1, v0

    goto :goto_52

    :cond_45
    sget-object v1, Lm52;->a:Lm52;

    goto :goto_52

    :cond_48
    sget-object v1, Lepf;->a:Lepf;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_58

    sget-object v1, Lk52;->a:Lk52;

    :goto_52
    iget-object p0, p0, Lq52;->c:Lkze;

    invoke-static {p0, v1}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    return-void

    :cond_58
    invoke-static {}, Lh9o;->p()V

    return-void
.end method
