.class public final Lukj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:J

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;

.field public f:Ljava/lang/Object;

.field public final g:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ld2c;Ln27;Lmh9;Likl;Ljava/lang/Object;)V
    .registers 6

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    iput-object p1, p0, Lukj;->b:Ljava/lang/Object;

    .line 66
    iput-object p2, p0, Lukj;->c:Ljava/lang/Object;

    .line 67
    iput-object p3, p0, Lukj;->d:Ljava/lang/Object;

    .line 68
    iput-object p4, p0, Lukj;->e:Ljava/lang/Object;

    .line 69
    iput-object p5, p0, Lukj;->f:Ljava/lang/Object;

    .line 70
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 71
    invoke-static {p1}, Lhyg;->k(Ljava/lang/Object;)Lt0g;

    move-result-object p1

    .line 72
    iput-object p1, p0, Lukj;->g:Ljava/lang/Object;

    const-wide/16 p1, 0x0

    .line 73
    iput-wide p1, p0, Lukj;->a:J

    return-void
.end method

.method public constructor <init>(Lhq8;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Lhq8;->e()J

    move-result-wide v0

    iput-wide v0, p0, Lukj;->a:J

    invoke-virtual {p1}, Lhq8;->c()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lukj;->b:Ljava/lang/Object;

    invoke-virtual {p1}, Lhq8;->h()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lukj;->c:Ljava/lang/Object;

    sget-object v0, Lp6l;->a:Lp6l;

    invoke-virtual {p1, v0}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lukj;->d:Ljava/lang/Object;

    sget-object v0, Lp6l;->b:Lp6l;

    invoke-virtual {p1, v0}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lukj;->e:Ljava/lang/Object;

    invoke-virtual {p1}, Lhq8;->g()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lukj;->f:Ljava/lang/Object;

    instance-of v0, p1, Ltq8;

    if-eqz v0, :cond_36

    check-cast p1, Ltq8;

    invoke-virtual {p1}, Ltq8;->z()Ljava/util/Date;

    move-result-object p1

    goto :goto_3d

    :cond_36
    new-instance p1, Ljava/util/Date;

    const-wide/16 v0, 0x0

    invoke-direct {p1, v0, v1}, Ljava/util/Date;-><init>(J)V

    :goto_3d
    iput-object p1, p0, Lukj;->g:Ljava/lang/Object;

    return-void
.end method

.method public static a(Lukj;Ld2c;Ln27;Likl;I)V
    .registers 8

    and-int/lit8 v0, p4, 0x1

    if-eqz v0, :cond_8

    iget-object p1, p0, Lukj;->b:Ljava/lang/Object;

    check-cast p1, Ld2c;

    :cond_8
    and-int/lit8 v0, p4, 0x2

    if-eqz v0, :cond_10

    iget-object p2, p0, Lukj;->c:Ljava/lang/Object;

    check-cast p2, Ln27;

    :cond_10
    iget-object v0, p0, Lukj;->d:Ljava/lang/Object;

    check-cast v0, Lmh9;

    and-int/lit8 p4, p4, 0x8

    if-eqz p4, :cond_1c

    iget-object p3, p0, Lukj;->e:Ljava/lang/Object;

    check-cast p3, Likl;

    :cond_1c
    iget-object p4, p0, Lukj;->f:Ljava/lang/Object;

    iget-object v1, p0, Lukj;->b:Ljava/lang/Object;

    check-cast v1, Ld2c;

    iget-object v2, p0, Lukj;->g:Ljava/lang/Object;

    check-cast v2, Lt0g;

    if-ne p1, v1, :cond_56

    iget-object v1, p0, Lukj;->c:Ljava/lang/Object;

    check-cast v1, Ln27;

    invoke-static {p2, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_56

    iget-object v1, p0, Lukj;->d:Ljava/lang/Object;

    check-cast v1, Lmh9;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_56

    iget-object v1, p0, Lukj;->e:Ljava/lang/Object;

    check-cast v1, Likl;

    invoke-virtual {p3, v1}, Likl;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_56

    iget-object p1, p0, Lukj;->f:Ljava/lang/Object;

    invoke-static {p4, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_55

    iput-object p4, p0, Lukj;->f:Ljava/lang/Object;

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2, p0}, Lt0g;->setValue(Ljava/lang/Object;)V

    :cond_55
    return-void

    :cond_56
    iput-object p1, p0, Lukj;->b:Ljava/lang/Object;

    iput-object p2, p0, Lukj;->c:Ljava/lang/Object;

    iput-object v0, p0, Lukj;->d:Ljava/lang/Object;

    iput-object p3, p0, Lukj;->e:Ljava/lang/Object;

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2, p0}, Lt0g;->setValue(Ljava/lang/Object;)V

    return-void
.end method
