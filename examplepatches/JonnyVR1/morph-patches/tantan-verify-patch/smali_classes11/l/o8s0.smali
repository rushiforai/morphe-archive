.class public final Ll/o8s0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J

.field public final b:Ljava/lang/String;

.field public final c:I


# direct methods
.method public constructor <init>(JLjava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Ll/o8s0;->a:J

    .line 5
    .line 6
    iput-object p3, p0, Ll/o8s0;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput p4, p0, Ll/o8s0;->c:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    instance-of v1, p1, Ll/o8s0;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    check-cast p1, Ll/o8s0;

    .line 10
    .line 11
    iget-wide v1, p1, Ll/o8s0;->a:J

    .line 12
    .line 13
    iget-wide v3, p0, Ll/o8s0;->a:J

    .line 14
    .line 15
    cmp-long v1, v1, v3

    .line 16
    .line 17
    if-nez v1, :cond_1

    .line 18
    .line 19
    iget p1, p1, Ll/o8s0;->c:I

    .line 20
    .line 21
    iget p0, p0, Ll/o8s0;->c:I

    .line 22
    .line 23
    if-ne p1, p0, :cond_1

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_1
    :goto_0
    return v0
.end method

.method public final hashCode()I
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/o8s0;->a:J

    .line 2
    .line 3
    long-to-int p0, v0

    .line 4
    return p0
.end method
