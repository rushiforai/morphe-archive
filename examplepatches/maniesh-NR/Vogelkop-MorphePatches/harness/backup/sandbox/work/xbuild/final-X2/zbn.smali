.class public final Lzbn;
.super Ls75;
.source "SourceFile"


# static fields
.field public static final d:Lzbn;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lzbn;

    new-instance v1, Lk2d;

    const/16 v2, 0x67

    const/4 v3, 0x0

    const/16 v4, 0x58

    invoke-direct {v1, v4, v2, v3}, Lk2d;-><init>(III)V

    const v2, 0x7f140128

    invoke-direct {v0, v1, v2}, Ls75;-><init>(Lk2d;I)V

    sput-object v0, Lzbn;->d:Lzbn;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of p0, p1, Lzbn;

    if-nez p0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    return v0
.end method

.method public final hashCode()I
    .registers 1

    const p0, -0x6fa2c1a3

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
