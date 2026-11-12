.class public final Lpqj;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lpqj;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lpqj;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lpqj;->a:Lpqj;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of p0, p1, Lpqj;

    if-nez p0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    return v0
.end method

.method public final hashCode()I
    .registers 1

    const p0, 0x4fbbaf30    # 6.297641E9f

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, "Round"

    return-object p0
.end method
