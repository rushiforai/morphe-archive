.class public final Laqk;
.super Lgqk;
.source "SourceFile"


# instance fields
.field public final c:Lrxh;

.field public final d:Lrxh;


# direct methods
.method public constructor <init>(Lxpk;Lrxh;Lrxh;)V
    .registers 5

    const/16 v0, 0x14

    invoke-direct {p0, v0, p1}, Lgqk;-><init>(ILxpk;)V

    iput-object p2, p0, Laqk;->c:Lrxh;

    iput-object p3, p0, Laqk;->d:Lrxh;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    if-eqz p1, :cond_13

    const-class p0, Laqk;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_13

    return v0

    :cond_13
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method
