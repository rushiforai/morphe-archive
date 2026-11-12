.class public abstract Lbap;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public b:Z

.field public final c:Z

.field public d:Z

.field public e:Z


# direct methods
.method public constructor <init>(IZZZZ)V
    .registers 8

    and-int/lit8 v0, p1, 0x1

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    move p2, v1

    :cond_6
    and-int/lit8 v0, p1, 0x2

    if-eqz v0, :cond_b

    move p3, v1

    :cond_b
    and-int/lit8 v0, p1, 0x4

    if-eqz v0, :cond_10

    move p4, v1

    :cond_10
    and-int/lit8 v0, p1, 0x8

    if-eqz v0, :cond_16

    move v0, v1

    goto :goto_17

    :cond_16
    const/4 v0, 0x1

    :goto_17
    and-int/lit8 p1, p1, 0x10

    if-eqz p1, :cond_1c

    move p5, v1

    :cond_1c
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p2, p0, Lbap;->a:Z

    iput-boolean p4, p0, Lbap;->b:Z

    iput-boolean v0, p0, Lbap;->c:Z

    iput-boolean p3, p0, Lbap;->d:Z

    iput-boolean p5, p0, Lbap;->e:Z

    return-void
.end method


# virtual methods
.method public a()Ln9p;
    .registers 2

    new-instance p0, Ln9p;

    const/4 v0, 0x0

    invoke-direct {p0, v0, v0, v0}, Ln9p;-><init>(ZZZ)V

    return-object p0
.end method

.method public b(Lk48;Lu6p;)Lbap;
    .registers 3

    return-object p0
.end method

.method public c(Lkotlin/jvm/functions/Function1;)Lbap;
    .registers 2

    new-instance p0, Lj9p;

    invoke-direct {p0}, Lj9p;-><init>()V

    return-object p0
.end method

.method public d()V
    .registers 1

    return-void
.end method

.method public e()V
    .registers 1

    return-void
.end method

.method public f()V
    .registers 1

    return-void
.end method

.method public g()Lbap;
    .registers 1

    return-object p0
.end method

.method public h()Lbap;
    .registers 1

    return-object p0
.end method

.method public i()Lbap;
    .registers 1

    return-object p0
.end method
