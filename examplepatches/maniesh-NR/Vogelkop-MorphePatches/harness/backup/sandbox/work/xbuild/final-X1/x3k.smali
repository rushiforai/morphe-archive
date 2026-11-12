.class public final Lx3k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lz3k;


# static fields
.field public static final a:Lx3k;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lx3k;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lx3k;->a:Lx3k;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of p0, p1, Lx3k;

    if-nez p0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    return v0
.end method

.method public final hashCode()I
    .registers 1

    const p0, -0x676a29d3

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
