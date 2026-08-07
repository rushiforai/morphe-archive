.class final Lcom/ss/android/ttvecamera/f$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ttvecamera/f;->m([ILjava/util/List;)[I
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


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a([I[I)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    aget p2, p2, p0

    .line 3
    .line 4
    aget p0, p1, p0

    .line 5
    .line 6
    sub-int/2addr p2, p0

    .line 7
    return p2
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
    invoke-virtual {p0, p1, p2}, Lcom/ss/android/ttvecamera/f$c;->a([I[I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
