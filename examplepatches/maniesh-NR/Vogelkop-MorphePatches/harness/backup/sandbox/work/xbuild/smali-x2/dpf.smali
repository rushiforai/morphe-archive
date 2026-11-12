.class public final Ldpf;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lipf;


# direct methods
.method public constructor <init>(Lipf;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ldpf;->a:Lipf;

    return-void
.end method


# virtual methods
.method public final a(Lhpf;)V
    .registers 3

    iget-object p0, p0, Ldpf;->a:Lipf;

    if-eqz p0, :cond_2c

    instance-of v0, p0, Lepf;

    if-eqz v0, :cond_e

    check-cast p0, Lepf;

    invoke-interface {p1, p0}, Lhpf;->n(Lepf;)V

    return-void

    :cond_e
    instance-of v0, p0, Lgpf;

    if-eqz v0, :cond_18

    check-cast p0, Lgpf;

    invoke-interface {p1, p0}, Lhpf;->r(Lgpf;)V

    return-void

    :cond_18
    instance-of v0, p0, Lcpf;

    if-eqz v0, :cond_22

    check-cast p0, Lcpf;

    invoke-interface {p1, p0}, Lhpf;->h(Lcpf;)V

    return-void

    :cond_22
    instance-of v0, p0, Lfpf;

    if-eqz v0, :cond_2c

    check-cast p0, Lfpf;

    invoke-interface {p1, p0}, Lhpf;->I(Lfpf;)V

    return-void

    :cond_2c
    invoke-static {}, Lh9o;->p()V

    return-void
.end method
