.class public final Ll/z5w0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:[J


# direct methods
.method public constructor <init>()V
    .locals 1

    const/16 v0, 0x20

    .line 11
    invoke-direct {p0, v0}, Ll/z5w0;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 p1, 0x20

    .line 5
    .line 6
    new-array p1, p1, [J

    .line 7
    .line 8
    iput-object p1, p0, Ll/z5w0;->b:[J

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a()I
    .locals 0

    .line 1
    iget p0, p0, Ll/z5w0;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public final b(I)J
    .locals 2

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    iget v0, p0, Ll/z5w0;->a:I

    .line 4
    .line 5
    if-ge p1, v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/z5w0;->b:[J

    .line 8
    .line 9
    aget-wide v0, p0, p1

    .line 10
    .line 11
    return-wide v0

    .line 12
    :cond_0
    iget p0, p0, Ll/z5w0;->a:I

    .line 13
    .line 14
    const-string v0, "Invalid index "

    .line 15
    .line 16
    const-string v1, ", size is "

    .line 17
    .line 18
    invoke-static {v0, p1, v1, p0}, Ll/nvc0;->a(Ljava/lang/String;ILjava/lang/Object;I)V

    .line 19
    .line 20
    .line 21
    const-wide/16 p0, 0x0

    .line 22
    .line 23
    return-wide p0
.end method

.method public final c(J)V
    .locals 3

    .line 1
    iget v0, p0, Ll/z5w0;->a:I

    .line 2
    .line 3
    iget-object v1, p0, Ll/z5w0;->b:[J

    .line 4
    .line 5
    array-length v2, v1

    .line 6
    if-ne v0, v2, :cond_0

    .line 7
    .line 8
    add-int/2addr v0, v0

    .line 9
    invoke-static {v1, v0}, Ljava/util/Arrays;->copyOf([JI)[J

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/z5w0;->b:[J

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Ll/z5w0;->b:[J

    .line 16
    .line 17
    iget v1, p0, Ll/z5w0;->a:I

    .line 18
    .line 19
    add-int/lit8 v2, v1, 0x1

    .line 20
    .line 21
    iput v2, p0, Ll/z5w0;->a:I

    .line 22
    .line 23
    aput-wide p1, v0, v1

    .line 24
    .line 25
    return-void
.end method
