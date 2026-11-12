.class public final Lzvg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;
.implements Las6;


# instance fields
.field public final a:Ltcc;

.field public final b:Lgmk;

.field public final c:Lpjg;

.field public d:Z


# direct methods
.method public constructor <init>(Ltcc;Lgmk;Lpjg;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzvg;->a:Ltcc;

    iput-object p2, p0, Lzvg;->b:Lgmk;

    iput-object p3, p0, Lzvg;->c:Lpjg;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    iget-boolean v0, p0, Lzvg;->d:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x0

    iput-boolean v0, p0, Lzvg;->d:Z

    iget-object v0, p0, Lzvg;->b:Lgmk;

    iget-object v0, v0, Lgmk;->a:Lkze;

    invoke-virtual {v0, p0}, Lekc;->p(Lf7f;)V

    iget-object v0, p0, Lzvg;->a:Ltcc;

    invoke-virtual {v0, p0}, Ltcc;->b(Lmdc;)V

    return-void
.end method

.method public final d0(Ljava/lang/Object;)V
    .registers 3

    check-cast p1, Luvg;

    sget-object v0, Luvg;->g:Luvg;

    if-eq p1, v0, :cond_d

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    const/4 v0, 0x2

    if-eq p1, v0, :cond_e

    :cond_d
    return-void

    :cond_e
    invoke-virtual {p0}, Lzvg;->a()V

    iget-object p0, p0, Lzvg;->c:Lpjg;

    invoke-virtual {p0}, Lpjg;->run()V

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 2

    invoke-virtual {p0}, Lzvg;->a()V

    return-void
.end method
