.class public final Lhqc;
.super Ltc2;
.source "SourceFile"


# static fields
.field public static final b:Lhqc;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lhqc;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ltc2;-><init>(Z)V

    sput-object v0, Lhqc;->b:Lhqc;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of p0, p1, Lhqc;

    if-nez p0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    return v0
.end method

.method public final hashCode()I
    .registers 1

    const p0, -0x595539b9

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
