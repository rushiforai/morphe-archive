.class public final Ln10;
.super Lp10;
.source "SourceFile"


# static fields
.field public static final d:Ln10;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Ln10;

    const v1, 0x7f140718

    const/4 v2, 0x0

    const v3, 0x7f08051a

    invoke-direct {v0, v3, v1, v2}, Lp10;-><init>(IIB)V

    sput-object v0, Ln10;->d:Ln10;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of p0, p1, Ln10;

    if-nez p0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    return v0
.end method

.method public final hashCode()I
    .registers 1

    const p0, 0x2f18aeb6

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
