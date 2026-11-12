.class public final Ljwa;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J

.field public final b:Lpde;

.field public c:Ljava/util/List;

.field public d:I

.field public final e:Lld9;


# direct methods
.method public constructor <init>(Lkze;J)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p2, p0, Ljwa;->a:J

    new-instance p2, Lpde;

    const/4 p3, 0x0

    invoke-direct {p2, p3}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Ljwa;->b:Lpde;

    sget-object p2, Ll08;->a:Ll08;

    iput-object p2, p0, Ljwa;->c:Ljava/util/List;

    new-instance p2, Lld9;

    const/16 p3, 0x17

    invoke-direct {p2, p0, p3}, Lld9;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Ljwa;->e:Lld9;

    new-instance p2, Lnna;

    const/4 p3, 0x5

    invoke-direct {p2, p0, p3}, Lnna;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Liwa;

    const/4 p3, 0x0

    invoke-direct {p0, p2, p3}, Liwa;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p0}, Lekc;->k(Lf7f;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    iget-object v0, p0, Ljwa;->c:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x0

    goto :goto_19

    :cond_a
    iget-object v0, p0, Ljwa;->c:Ljava/util/List;

    iget v1, p0, Ljwa;->d:I

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    rem-int/2addr v1, v2

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lhwa;

    :goto_19
    iget-object p0, p0, Ljwa;->b:Lpde;

    invoke-static {p0, v0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void
.end method

.method public final b()V
    .registers 4

    iget-object v0, p0, Ljwa;->e:Lld9;

    invoke-static {v0}, Lvml;->a(Ljava/lang/Runnable;)V

    iget-object v1, p0, Ljwa;->c:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_17

    iget-wide v1, p0, Ljwa;->a:J

    invoke-static {v1, v2}, Lpn7;->f(J)J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Lvml;->d(Ljava/lang/Runnable;J)V

    :cond_17
    return-void
.end method
