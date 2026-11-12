.class public final Lebh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Las6;
.implements Labh;
.implements Lhpf;


# instance fields
.field public final a:Lode;

.field public final b:Laf3;

.field public c:Llh4;

.field public d:Ljava/lang/Boolean;

.field public e:Z


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Laf3;Ljze;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lode;

    invoke-direct {v0}, Lekc;-><init>()V

    iput-object v0, p0, Lebh;->a:Lode;

    sget-object v0, Llh4;->c:Llh4;

    iput-object v0, p0, Lebh;->c:Llh4;

    iput-object p2, p0, Lebh;->b:Laf3;

    new-instance p2, Lt77;

    const/4 v0, 0x6

    invoke-direct {p2, p0, v0}, Lt77;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p3, p1, p2}, Lekc;->j(Lndc;Lf7f;)V

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->a(Lmdc;)V

    return-void
.end method


# virtual methods
.method public final D()V
    .registers 1

    return-void
.end method

.method public final I(Lfpf;)V
    .registers 2

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lebh;->b(Z)V

    return-void
.end method

.method public final a(Lbbh;)V
    .registers 4

    iget-object p1, p1, Lbbh;->a:Lcsh;

    iget-boolean v0, p0, Lebh;->e:Z

    iget-object v1, p0, Lebh;->a:Lode;

    if-nez v0, :cond_13

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lh1b;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    return-void

    :cond_13
    const/4 v0, 0x0

    iput-boolean v0, p0, Lebh;->e:Z

    invoke-virtual {v1, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final b(Z)V
    .registers 3

    iget-object v0, p0, Lebh;->d:Ljava/lang/Boolean;

    if-nez v0, :cond_b

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, p0, Lebh;->d:Ljava/lang/Boolean;

    return-void

    :cond_b
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eq p1, v0, :cond_1d

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, p0, Lebh;->d:Ljava/lang/Boolean;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lebh;->e:Z

    invoke-virtual {p0}, Lebh;->c()V

    :cond_1d
    return-void
.end method

.method public final c()V
    .registers 4

    iget-object v0, p0, Lebh;->c:Llh4;

    iget-object v0, v0, Llh4;->b:Lcom/opera/api/Callback;

    if-eqz v0, :cond_7

    return-void

    :cond_7
    new-instance v0, Llh4;

    new-instance v1, Lo8f;

    const/16 v2, 0x1b

    invoke-direct {v1, p0, v2}, Lo8f;-><init>(Ljava/lang/Object;B)V

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Llh4;-><init>(Lcom/opera/api/Callback;B)V

    iput-object v0, p0, Lebh;->c:Llh4;

    iget-object p0, p0, Lebh;->b:Laf3;

    invoke-virtual {p0, v0}, Laf3;->d(Lcom/opera/api/Callback;)V

    return-void
.end method

.method public final h(Lcpf;)V
    .registers 2

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lebh;->b(Z)V

    return-void
.end method

.method public final n(Lepf;)V
    .registers 2

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 2

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p0, p0, Lebh;->c:Llh4;

    const/4 p1, 0x0

    iput-object p1, p0, Llh4;->b:Lcom/opera/api/Callback;

    return-void
.end method

.method public final onResume(Lndc;)V
    .registers 2

    invoke-virtual {p0}, Lebh;->c()V

    return-void
.end method

.method public final r(Lgpf;)V
    .registers 2

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lebh;->b(Z)V

    return-void
.end method
