.class public final Ls1i;
.super Lx1i;
.source "SourceFile"


# static fields
.field public static final b:Ls1i;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ls1i;

    const-string v1, "Internal error"

    invoke-direct {v0, v1}, Lx1i;-><init>(Ljava/lang/String;)V

    sput-object v0, Ls1i;->b:Ls1i;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of p0, p1, Ls1i;

    if-nez p0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    return v0
.end method

.method public final hashCode()I
    .registers 1

    const p0, 0x52aed624

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
