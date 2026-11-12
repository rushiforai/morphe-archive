.class public final Lxbn;
.super Ls75;
.source "SourceFile"


# static fields
.field public static final d:Lxbn;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lxbn;

    new-instance v1, Lk2d;

    const/4 v2, 0x0

    invoke-direct {v1, v2, v2, v2}, Lk2d;-><init>(III)V

    const v2, 0x7f140128

    invoke-direct {v0, v1, v2}, Ls75;-><init>(Lk2d;I)V

    sput-object v0, Lxbn;->d:Lxbn;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of p0, p1, Lxbn;

    if-nez p0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    return v0
.end method

.method public final hashCode()I
    .registers 1

    const p0, -0x5a23171f

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
