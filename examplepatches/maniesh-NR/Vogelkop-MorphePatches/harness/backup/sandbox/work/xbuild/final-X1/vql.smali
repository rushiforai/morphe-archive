.class public final Lvql;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lpxh;

.field public final b:Z


# direct methods
.method public constructor <init>(Lpxh;Z)V
    .registers 3

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Lvql;->a:Lpxh;

    .line 18
    iput-boolean p2, p0, Lvql;->b:Z

    return-void
.end method

.method public constructor <init>(Lrxh;I)V
    .registers 3

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_b

    new-instance p1, Lqxh;

    const-string p2, ""

    invoke-direct {p1, p2}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    :cond_b
    const/4 p2, 0x0

    invoke-direct {p0, p1, p2}, Lvql;-><init>(Lpxh;Z)V

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1a

    instance-of v0, p1, Lvql;

    if-eqz v0, :cond_18

    check-cast p1, Lvql;

    iget-object v0, p0, Lvql;->a:Lpxh;

    iget-object v1, p1, Lvql;->a:Lpxh;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    iget-boolean p0, p0, Lvql;->b:Z

    iget-boolean p1, p1, Lvql;->b:Z

    if-eq p0, p1, :cond_1a

    :cond_18
    const/4 p0, 0x0

    return p0

    :cond_1a
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Lvql;->a:Lpxh;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean p0, p0, Lvql;->b:Z

    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
