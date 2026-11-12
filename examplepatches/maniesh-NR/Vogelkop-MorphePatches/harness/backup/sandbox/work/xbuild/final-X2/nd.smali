.class public final Lnd;
.super Lfe;
.source "SourceFile"


# instance fields
.field public final a:Llxh;

.field public final b:Lrxh;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Llxh;

    const v1, 0x7f080522

    invoke-direct {v0, v1}, Llxh;-><init>(I)V

    iput-object v0, p0, Lnd;->a:Llxh;

    new-instance v0, Lrxh;

    const v1, 0x7f141292

    invoke-direct {v0, v1}, Lrxh;-><init>(I)V

    iput-object v0, p0, Lnd;->b:Lrxh;

    return-void
.end method


# virtual methods
.method public final a()Lb8h;
    .registers 1

    iget-object p0, p0, Lnd;->a:Llxh;

    return-object p0
.end method

.method public final b()Lpxh;
    .registers 1

    iget-object p0, p0, Lnd;->b:Lrxh;

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 2

    if-eq p0, p1, :cond_8

    instance-of p0, p1, Lnd;

    if-nez p0, :cond_8

    const/4 p0, 0x0

    return p0

    :cond_8
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 1

    sget-object p0, Lvr0;->k:Lvr0;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
