.class public final Ll/h1w;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public a:I

.field public b:[J


# direct methods
.method public constructor <init>()V
    .locals 1

    const/16 v0, 0x20

    .line 9
    invoke-direct {p0, v0}, Ll/h1w;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-array p1, p1, [J

    .line 5
    .line 6
    iput-object p1, p0, Ll/h1w;->b:[J

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(J)V
    .locals 3

    .line 1
    iget v0, p0, Ll/h1w;->a:I

    .line 2
    .line 3
    iget-object v1, p0, Ll/h1w;->b:[J

    .line 4
    .line 5
    array-length v2, v1

    .line 6
    if-ne v0, v2, :cond_0

    .line 7
    .line 8
    mul-int/lit8 v0, v0, 0x2

    .line 9
    .line 10
    invoke-static {v1, v0}, Ljava/util/Arrays;->copyOf([JI)[J

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Ll/h1w;->b:[J

    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Ll/h1w;->b:[J

    .line 17
    .line 18
    iget v1, p0, Ll/h1w;->a:I

    .line 19
    .line 20
    add-int/lit8 v2, v1, 0x1

    .line 21
    .line 22
    iput v2, p0, Ll/h1w;->a:I

    .line 23
    .line 24
    aput-wide p1, v0, v1

    .line 25
    .line 26
    return-void
.end method

.method public b(I)J
    .locals 2

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    iget v0, p0, Ll/h1w;->a:I

    .line 4
    .line 5
    if-ge p1, v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/h1w;->b:[J

    .line 8
    .line 9
    aget-wide v0, p0, p1

    .line 10
    .line 11
    return-wide v0

    .line 12
    :cond_0
    const-string v0, ", size is "

    .line 13
    .line 14
    iget p0, p0, Ll/h1w;->a:I

    .line 15
    .line 16
    const-string v1, "Invalid index "

    .line 17
    .line 18
    invoke-static {v1, p1, v0, p0}, Ll/nvc0;->a(Ljava/lang/String;ILjava/lang/Object;I)V

    .line 19
    .line 20
    .line 21
    const-wide/16 p0, 0x0

    .line 22
    .line 23
    return-wide p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/h1w;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public d()[J
    .locals 1

    .line 1
    iget-object v0, p0, Ll/h1w;->b:[J

    .line 2
    .line 3
    iget p0, p0, Ll/h1w;->a:I

    .line 4
    .line 5
    invoke-static {v0, p0}, Ljava/util/Arrays;->copyOf([JI)[J

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
