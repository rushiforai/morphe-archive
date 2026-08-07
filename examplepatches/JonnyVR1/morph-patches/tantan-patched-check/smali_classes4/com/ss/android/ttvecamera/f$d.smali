.class final Lcom/ss/android/ttvecamera/f$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ttvecamera/f;->n([ILjava/util/List;)[I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "[I>;"
    }
.end annotation


# instance fields
.field final synthetic a:[I


# direct methods
.method public constructor <init>([I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/f$d;->a:[I

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private b([I)I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/f$d;->a:[I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aget v1, p0, v0

    .line 5
    .line 6
    aget v0, p1, v0

    .line 7
    .line 8
    if-le v1, v0, :cond_0

    .line 9
    .line 10
    sub-int/2addr v1, v0

    .line 11
    mul-int/lit8 v1, v1, 0x2

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sub-int/2addr v0, v1

    .line 15
    mul-int/lit8 v1, v0, 0x3

    .line 16
    .line 17
    :goto_0
    const/4 v0, 0x1

    .line 18
    aget p0, p0, v0

    .line 19
    .line 20
    aget p1, p1, v0

    .line 21
    .line 22
    if-le p0, p1, :cond_1

    .line 23
    .line 24
    sub-int/2addr p0, p1

    .line 25
    mul-int/lit8 p0, p0, 0x4

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    sub-int p0, p1, p0

    .line 29
    .line 30
    :goto_1
    add-int/2addr v1, p0

    .line 31
    return v1
.end method


# virtual methods
.method public a([I[I)I
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/android/ttvecamera/f$d;->b([I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-direct {p0, p2}, Lcom/ss/android/ttvecamera/f$d;->b([I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    sub-int/2addr p1, p0

    .line 10
    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, [I

    .line 2
    .line 3
    check-cast p2, [I

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/ss/android/ttvecamera/f$d;->a([I[I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
