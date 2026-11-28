.class Lcom/google/common/base/Splitter$4;
.super Lcom/google/common/base/Splitter$SplittingIterator;
.source "Splitter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/base/Splitter;->fixedLength(I)Lcom/google/common/base/Splitter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$length:I


# direct methods
.method constructor <init>(Lcom/google/common/base/Splitter;Ljava/lang/CharSequence;I)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x1010
        }
        names = {
            "splitter",
            "toSplit",
            "val$length"
        }
    .end annotation

    .line 275
    iput p3, p0, Lcom/google/common/base/Splitter$4;->val$length:I

    invoke-direct {p0, p1, p2}, Lcom/google/common/base/Splitter$SplittingIterator;-><init>(Lcom/google/common/base/Splitter;Ljava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method separatorEnd(I)I
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "separatorPosition"
        }
    .end annotation

    return p1
.end method

.method separatorStart(I)I
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "start"
        }
    .end annotation

    .line 278
    iget v0, p0, Lcom/google/common/base/Splitter$4;->val$length:I

    add-int/2addr p1, v0

    .line 279
    iget-object p0, p0, Lcom/google/common/base/Splitter$4;->toSplit:Ljava/lang/CharSequence;

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result p0

    if-ge p1, p0, :cond_0

    return p1

    :cond_0
    const/4 p0, -0x1

    return p0
.end method
