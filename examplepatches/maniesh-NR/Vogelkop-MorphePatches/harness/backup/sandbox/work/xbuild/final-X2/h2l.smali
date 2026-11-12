.class public final Lh2l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lm2l;


# static fields
.field public static final a:Lh2l;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lh2l;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lh2l;->a:Lh2l;

    return-void
.end method


# virtual methods
.method public final b()La26;
    .registers 1

    sget-object p0, Lg4a;->o:Lg4a;

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of p0, p1, Lh2l;

    if-nez p0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    return v0
.end method

.method public final getId()J
    .registers 3

    const-wide v0, 0x800000001L

    return-wide v0
.end method

.method public final hashCode()I
    .registers 1

    const p0, -0x19456409

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
