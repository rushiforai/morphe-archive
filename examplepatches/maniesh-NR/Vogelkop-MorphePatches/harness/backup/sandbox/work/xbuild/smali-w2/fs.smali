.class public final Lfs;
.super Ljs;
.source "SourceFile"


# static fields
.field public static final c:Lfs;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lfs;

    sget-object v1, Lgt;->f:Lgt;

    sget-object v2, Lds;->g:Lds;

    invoke-direct {v0, v1, v2}, Ljs;-><init>(Lgt;Lds;)V

    sput-object v0, Lfs;->c:Lfs;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of p0, p1, Lfs;

    if-nez p0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    return v0
.end method

.method public final hashCode()I
    .registers 1

    const p0, 0x1bac110f

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
