.class final Lcom/ss/android/ttvecamera/f$f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/android/ttvecamera/f;->p(Ljava/util/List;Lcom/ss/android/ttvecamera/TEFrameSizei;Lcom/ss/android/ttvecamera/TEFrameSizei;)Lcom/ss/android/ttvecamera/TEFrameSizei;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/ss/android/ttvecamera/TEFrameSizei;",
        ">;"
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
.method public a(Lcom/ss/android/ttvecamera/TEFrameSizei;Lcom/ss/android/ttvecamera/TEFrameSizei;)I
    .locals 0

    .line 1
    iget p0, p2, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 2
    .line 3
    iget p2, p2, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 4
    .line 5
    mul-int/2addr p0, p2

    .line 6
    iget p2, p1, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 7
    .line 8
    iget p1, p1, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 9
    .line 10
    mul-int/2addr p2, p1

    .line 11
    sub-int/2addr p0, p2

    .line 12
    return p0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 2
    .line 3
    check-cast p2, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/ss/android/ttvecamera/f$f;->a(Lcom/ss/android/ttvecamera/TEFrameSizei;Lcom/ss/android/ttvecamera/TEFrameSizei;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
