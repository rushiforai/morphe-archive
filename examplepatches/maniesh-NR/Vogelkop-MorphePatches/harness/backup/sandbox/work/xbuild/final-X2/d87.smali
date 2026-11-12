.class final Ld87;
.super Lh8e;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lh8e;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u0082\u0008\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001\u00a8\u0006\u0003"
    }
    d2 = {
        "Ld87;",
        "Lh8e;",
        "Le87;",
        "catalog"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final b:Lhkf;


# direct methods
.method public constructor <init>(Lhkf;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld87;->b:Lhkf;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    if-eq p0, p1, :cond_10

    instance-of v0, p1, Ld87;

    if-eqz v0, :cond_e

    check-cast p1, Ld87;

    iget-object p0, p0, Ld87;->b:Lhkf;

    iget-object p1, p1, Ld87;->b:Lhkf;

    if-eq p0, p1, :cond_10

    :cond_e
    const/4 p0, 0x0

    return p0

    :cond_10
    const/4 p0, 0x1

    return p0
.end method

.method public final f()Lb8e;
    .registers 2

    new-instance v0, Le87;

    iget-object p0, p0, Ld87;->b:Lhkf;

    invoke-direct {v0, p0}, Le87;-><init>(Lhkf;)V

    return-object v0
.end method

.method public final bridge synthetic h(Lb8e;)V
    .registers 2

    check-cast p1, Le87;

    return-void
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, Ld87;->b:Lhkf;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
