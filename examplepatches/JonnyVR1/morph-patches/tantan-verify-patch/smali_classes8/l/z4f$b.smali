.class public final Ll/z4f$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/z4f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public final a:I

.field public final b:[Ll/z4f$c;

.field public c:J


# direct methods
.method public constructor <init>(Ljava/util/concurrent/ThreadFactory;I)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p2, p0, Ll/z4f$b;->a:I

    .line 5
    .line 6
    new-array v0, p2, [Ll/z4f$c;

    .line 7
    .line 8
    iput-object v0, p0, Ll/z4f$b;->b:[Ll/z4f$c;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    :goto_0
    if-ge v0, p2, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Ll/z4f$b;->b:[Ll/z4f$c;

    .line 14
    .line 15
    new-instance v2, Ll/z4f$c;

    .line 16
    .line 17
    invoke-direct {v2, p1}, Ll/z4f$c;-><init>(Ljava/util/concurrent/ThreadFactory;)V

    .line 18
    .line 19
    .line 20
    aput-object v2, v1, v0

    .line 21
    .line 22
    add-int/lit8 v0, v0, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method


# virtual methods
.method public a()Ll/z4f$c;
    .locals 6

    .line 1
    iget v0, p0, Ll/z4f$b;->a:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object p0, Ll/z4f;->e:Ll/z4f$c;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object v1, p0, Ll/z4f$b;->b:[Ll/z4f$c;

    .line 9
    .line 10
    iget-wide v2, p0, Ll/z4f$b;->c:J

    .line 11
    .line 12
    const-wide/16 v4, 0x1

    .line 13
    .line 14
    add-long/2addr v4, v2

    .line 15
    iput-wide v4, p0, Ll/z4f$b;->c:J

    .line 16
    .line 17
    int-to-long v4, v0

    .line 18
    rem-long/2addr v2, v4

    .line 19
    long-to-int p0, v2

    .line 20
    aget-object p0, v1, p0

    .line 21
    .line 22
    return-object p0
.end method

.method public b()V
    .locals 3

    .line 1
    iget-object p0, p0, Ll/z4f$b;->b:[Ll/z4f$c;

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x0

    .line 5
    :goto_0
    if-ge v1, v0, :cond_0

    .line 6
    .line 7
    aget-object v2, p0, v1

    .line 8
    .line 9
    invoke-virtual {v2}, Ll/lj40;->unsubscribe()V

    .line 10
    .line 11
    .line 12
    add-int/lit8 v1, v1, 0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    return-void
.end method
