.class public final Ll4n;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:Ll4n;


# instance fields
.field public final a:J

.field public final b:J


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Ll4n;

    const-wide/16 v1, -0x1

    invoke-direct {v0, v1, v2, v1, v2}, Ll4n;-><init>(JJ)V

    sput-object v0, Ll4n;->c:Ll4n;

    return-void
.end method

.method public constructor <init>(JJ)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Ll4n;->a:J

    iput-wide p3, p0, Ll4n;->b:J

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 8

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    const/4 v1, 0x0

    if-nez p1, :cond_8

    return v1

    :cond_8
    const-class v2, Ll4n;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_11

    return v1

    :cond_11
    check-cast p1, Ll4n;

    iget-wide v2, p0, Ll4n;->a:J

    iget-wide v4, p1, Ll4n;->a:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_1c

    return v1

    :cond_1c
    iget-wide v2, p0, Ll4n;->b:J

    iget-wide p0, p1, Ll4n;->b:J

    cmp-long p0, v2, p0

    if-eqz p0, :cond_25

    return v1

    :cond_25
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget-wide v0, p0, Ll4n;->a:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iget-wide v1, p0, Ll4n;->b:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    filled-new-array {v0, p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method
