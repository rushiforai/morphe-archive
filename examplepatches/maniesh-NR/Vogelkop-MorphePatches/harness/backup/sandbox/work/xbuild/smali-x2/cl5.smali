.class public final Lcl5;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I


# direct methods
.method public synthetic constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcl5;->a:I

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    instance-of v0, p1, Lcl5;

    if-eqz v0, :cond_c

    check-cast p1, Lcl5;

    iget p1, p1, Lcl5;->a:I

    iget p0, p0, Lcl5;->a:I

    if-eq p0, p1, :cond_e

    :cond_c
    const/4 p0, 0x0

    return p0

    :cond_e
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 1

    iget p0, p0, Lcl5;->a:I

    invoke-static {p0}, Ljava/lang/Integer;->hashCode(I)I

    move-result p0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 2

    const/4 v0, 0x1

    iget p0, p0, Lcl5;->a:I

    if-ne p0, v0, :cond_8

    const-string p0, "SUPPORTED"

    return-object p0

    :cond_8
    const/4 v0, 0x2

    if-ne p0, v0, :cond_e

    const-string p0, "UNSUPPORTED"

    return-object p0

    :cond_e
    const-string p0, "UNKNOWN"

    return-object p0
.end method
