.class public abstract Lxxc;
.super Lja2;
.source "SourceFile"


# instance fields
.field public final b:Lrcd;

.field public final c:Lrcd;


# direct methods
.method public constructor <init>(Lrcd;Lrcd;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxxc;->b:Lrcd;

    iput-object p2, p0, Lxxc;->c:Lrcd;

    return-void
.end method


# virtual methods
.method public abstract e()Ljava/lang/String;
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eqz p1, :cond_c

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-eq v0, v1, :cond_e

    :cond_c
    const/4 p0, 0x0

    return p0

    :cond_e
    check-cast p1, Lxxc;

    invoke-virtual {p0}, Lxxc;->f()Lfdn;

    move-result-object p0

    invoke-virtual {p1}, Lxxc;->f()Lfdn;

    move-result-object p1

    invoke-virtual {p0, p1}, Lfdn;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public abstract f()Lfdn;
.end method

.method public final hashCode()I
    .registers 1

    invoke-virtual {p0}, Lxxc;->f()Lfdn;

    move-result-object p0

    invoke-virtual {p0}, Lfdn;->hashCode()I

    move-result p0

    return p0
.end method
