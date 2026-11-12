.class public final Lbsn;
.super Ljoh;
.source "SourceFile"


# static fields
.field public static final a:Lbsn;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lbsn;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lbsn;->a:Lbsn;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of p0, p1, Lbsn;

    if-nez p0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    return v0
.end method

.method public final hashCode()I
    .registers 1

    const p0, 0x4fcc51eb    # 6.8558413E9f

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
