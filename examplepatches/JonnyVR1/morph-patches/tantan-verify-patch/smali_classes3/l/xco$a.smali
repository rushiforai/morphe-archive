.class public Ll/xco$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/hyl$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/xco;->a0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/xco;


# direct methods
.method public constructor <init>(Ll/xco;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xco$a;->a:Ll/xco;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public b(Z)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/xco$a;->a:Ll/xco;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    iput-boolean v0, p1, Ll/xco;->g:Z

    .line 5
    .line 6
    invoke-static {p1}, Ll/xco;->F0(Ll/xco;)Ll/iam;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Ll/rdo;

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/rdo;->k0()V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/xco$a;->a:Ll/xco;

    .line 16
    .line 17
    invoke-static {p1}, Ll/xco;->G0(Ll/xco;)Ll/iam;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Ll/rdo;

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/rdo;->N()V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ll/xco$a;->a:Ll/xco;

    .line 27
    .line 28
    invoke-static {p1}, Ll/xco;->H0(Ll/xco;)Ll/iam;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Ll/rdo;

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Ll/rdo;->o0(Z)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Ll/xco$a;->a:Ll/xco;

    .line 38
    .line 39
    invoke-static {p0}, Ll/xco;->I0(Ll/xco;)Ll/iam;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    check-cast p0, Ll/rdo;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/rdo;->s0()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public c(Ll/hyl$b;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xco$a;->a:Ll/xco;

    .line 2
    .line 3
    invoke-static {v0}, Ll/xco;->O0(Ll/xco;)Ll/iam;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/rdo;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ll/rdo;->W(Ll/hyl$b;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/xco$a;->a:Ll/xco;

    .line 16
    .line 17
    iget-object p1, p0, Ll/xco;->d:Ll/xww;

    .line 18
    .line 19
    invoke-static {p0, p1}, Ll/xco;->E0(Ll/xco;Ll/xww;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public d(DDFZ)V
    .locals 1

    .line 1
    iget-object p5, p0, Ll/xco$a;->a:Ll/xco;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p5, Ll/xco;->g:Z

    .line 5
    .line 6
    invoke-static {p5}, Ll/xco;->J0(Ll/xco;)Ll/iam;

    .line 7
    .line 8
    .line 9
    move-result-object p5

    .line 10
    check-cast p5, Ll/rdo;

    .line 11
    .line 12
    invoke-virtual {p5}, Ll/rdo;->M()V

    .line 13
    .line 14
    .line 15
    iget-object p5, p0, Ll/xco$a;->a:Ll/xco;

    .line 16
    .line 17
    invoke-static {p5}, Ll/xco;->L0(Ll/xco;)Ll/iam;

    .line 18
    .line 19
    .line 20
    move-result-object p5

    .line 21
    check-cast p5, Ll/rdo;

    .line 22
    .line 23
    invoke-virtual {p5, v0}, Ll/rdo;->o0(Z)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/xco$a;->a:Ll/xco;

    .line 27
    .line 28
    if-eqz p6, :cond_0

    .line 29
    .line 30
    invoke-static {p0}, Ll/xco;->D0(Ll/xco;)Lrx/subjects/a;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    new-instance p5, Lcom/google/android/gms/maps/model/LatLng;

    .line 35
    .line 36
    invoke-direct {p5, p1, p2, p3, p4}, Lcom/google/android/gms/maps/model/LatLng;-><init>(DD)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p5}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    invoke-static {p0}, Ll/xco;->N0(Ll/xco;)Ll/iam;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    check-cast p0, Ll/rdo;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/rdo;->s0()V

    .line 50
    .line 51
    .line 52
    return-void
.end method
