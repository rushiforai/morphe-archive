.class public final Lnvg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final a:Landroidx/fragment/app/r;

.field public final b:Lki;

.field public final c:Lp8f;

.field public final d:Lgmk;

.field public final e:Lnw3;

.field public final f:Lvvg;

.field public final g:Lyvg;

.field public h:B


# direct methods
.method public constructor <init>(Landroidx/fragment/app/r;Lki;Lp8f;Lvvg;Lyvg;Lgmk;Lnw3;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-byte v0, p0, Lnvg;->h:B

    iput-object p1, p0, Lnvg;->a:Landroidx/fragment/app/r;

    iput-object p2, p0, Lnvg;->b:Lki;

    iput-object p3, p0, Lnvg;->c:Lp8f;

    iput-object p6, p0, Lnvg;->d:Lgmk;

    iput-object p7, p0, Lnvg;->e:Lnw3;

    iput-object p4, p0, Lnvg;->f:Lvvg;

    iput-object p5, p0, Lnvg;->g:Lyvg;

    return-void
.end method


# virtual methods
.method public final a(I)V
    .registers 4

    iget-object v0, p0, Lnvg;->c:Lp8f;

    invoke-virtual {v0}, Lp8f;->v()Z

    move-result v1

    if-eqz v1, :cond_12

    iget-object v1, p0, Lnvg;->d:Lgmk;

    iget-object v1, v1, Lgmk;->a:Lkze;

    invoke-virtual {v1, p0}, Lekc;->p(Lf7f;)V

    invoke-virtual {v0, p1}, Lp8f;->C(I)V

    :cond_12
    iget-object v0, p0, Lnvg;->g:Lyvg;

    if-eqz p1, :cond_20

    const/4 v1, 0x3

    if-ne p1, v1, :cond_2a

    invoke-virtual {v0}, Lyvg;->a()V

    invoke-virtual {v0}, Lyvg;->c()V

    goto :goto_2a

    :cond_20
    invoke-virtual {v0}, Lyvg;->a()V

    const/4 p1, 0x1

    invoke-virtual {v0, p1}, Lyvg;->b(I)V

    invoke-virtual {v0}, Lyvg;->c()V

    :cond_2a
    :goto_2a
    iget-object p0, p0, Lnvg;->b:Lki;

    invoke-virtual {p0}, Lki;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgjm;

    new-instance p1, Lavg;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, p1}, Lgjm;->b(Ln37;)Z

    return-void
.end method

.method public final b(Luvg;)V
    .registers 3

    sget-object v0, Luvg;->d:Luvg;

    if-ne p1, v0, :cond_2a

    iget-byte p1, p0, Lnvg;->h:B

    if-nez p1, :cond_2a

    iget-object p1, p0, Lnvg;->c:Lp8f;

    invoke-virtual {p1}, Lp8f;->v()Z

    move-result p1

    if-eqz p1, :cond_2a

    iget-object p1, p0, Lnvg;->e:Lnw3;

    invoke-virtual {p1}, Lnw3;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_2a

    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Lnvg;->a(I)V

    iget-object p0, p0, Lnvg;->g:Lyvg;

    invoke-virtual {p0}, Lyvg;->a()V

    invoke-virtual {p0}, Lyvg;->d()V

    :cond_2a
    return-void
.end method

.method public final d0(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Luvg;

    invoke-virtual {p0, p1}, Lnvg;->b(Luvg;)V

    return-void
.end method
