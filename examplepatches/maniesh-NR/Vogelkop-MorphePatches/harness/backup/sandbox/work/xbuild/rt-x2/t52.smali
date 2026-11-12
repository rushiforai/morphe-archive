.class public final Lt52;
.super Lwyh;
.source "SourceFile"


# static fields
.field public static final k:Lt52;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lt52;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lt52;->k:Lt52;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of p0, p1, Lt52;

    if-nez p0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    return v0
.end method

.method public final hashCode()I
    .registers 1

    const p0, 0x4159dd77

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
