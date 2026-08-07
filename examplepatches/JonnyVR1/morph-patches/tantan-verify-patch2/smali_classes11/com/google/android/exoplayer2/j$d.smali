.class public final Lcom/google/android/exoplayer2/j$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/j;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lcom/google/android/exoplayer2/j$d;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/google/android/exoplayer2/u;

.field public b:I

.field public c:J

.field public d:Ljava/lang/Object;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/u;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/exoplayer2/j$d;->a:Lcom/google/android/exoplayer2/u;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/exoplayer2/j$d;)I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/j$d;->d:Ljava/lang/Object;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    move v3, v2

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move v3, v1

    .line 10
    :goto_0
    iget-object v4, p1, Lcom/google/android/exoplayer2/j$d;->d:Ljava/lang/Object;

    .line 11
    .line 12
    if-nez v4, :cond_1

    .line 13
    .line 14
    move v4, v2

    .line 15
    goto :goto_1

    .line 16
    :cond_1
    move v4, v1

    .line 17
    :goto_1
    if-eq v3, v4, :cond_3

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    const/4 p0, -0x1

    .line 22
    return p0

    .line 23
    :cond_2
    return v2

    .line 24
    :cond_3
    if-nez v0, :cond_4

    .line 25
    .line 26
    return v1

    .line 27
    :cond_4
    iget v0, p0, Lcom/google/android/exoplayer2/j$d;->b:I

    .line 28
    .line 29
    iget v1, p1, Lcom/google/android/exoplayer2/j$d;->b:I

    .line 30
    .line 31
    sub-int/2addr v0, v1

    .line 32
    if-eqz v0, :cond_5

    .line 33
    .line 34
    return v0

    .line 35
    :cond_5
    iget-wide v0, p0, Lcom/google/android/exoplayer2/j$d;->c:J

    .line 36
    .line 37
    iget-wide p0, p1, Lcom/google/android/exoplayer2/j$d;->c:J

    .line 38
    .line 39
    invoke-static {v0, v1, p0, p1}, Ll/bmk0;->o(JJ)I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    return p0
.end method

.method public b(IJLjava/lang/Object;)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/google/android/exoplayer2/j$d;->b:I

    .line 2
    .line 3
    iput-wide p2, p0, Lcom/google/android/exoplayer2/j$d;->c:J

    .line 4
    .line 5
    iput-object p4, p0, Lcom/google/android/exoplayer2/j$d;->d:Ljava/lang/Object;

    .line 6
    .line 7
    return-void
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/google/android/exoplayer2/j$d;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/j$d;->a(Lcom/google/android/exoplayer2/j$d;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
