.class public final Liv8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmv8;


# static fields
.field public static final a:Liv8;

.field public static final b:Lkv8;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Liv8;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Liv8;->a:Liv8;

    sget-object v0, Lkv8;->c:Lkv8;

    sput-object v0, Liv8;->b:Lkv8;

    return-void
.end method


# virtual methods
.method public final b()Lkv8;
    .registers 1

    sget-object p0, Liv8;->b:Lkv8;

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of p0, p1, Liv8;

    if-nez p0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    return v0
.end method

.method public final hashCode()I
    .registers 1

    const p0, -0x79cd7ff4

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
