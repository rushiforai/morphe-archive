.class Lcom/google/common/base/Splitter$2;
.super Lcom/google/common/base/Splitter$SplittingIterator;
.source "Splitter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/base/Splitter;->on(Ljava/lang/String;)Lcom/google/common/base/Splitter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$separator:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/common/base/Splitter;Ljava/lang/CharSequence;Ljava/lang/String;)V
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
            "val$separator"
        }
    .end annotation

    .line 172
    iput-object p3, p0, Lcom/google/common/base/Splitter$2;->val$separator:Ljava/lang/String;

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

    .line 191
    iget-object p0, p0, Lcom/google/common/base/Splitter$2;->val$separator:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    add-int/2addr p1, p0

    return p1
.end method

.method separatorStart(I)I
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "start"
        }
    .end annotation

    .line 175
    iget-object v0, p0, Lcom/google/common/base/Splitter$2;->val$separator:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    .line 178
    iget-object v1, p0, Lcom/google/common/base/Splitter$2;->toSplit:Ljava/lang/CharSequence;

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    sub-int/2addr v1, v0

    :goto_0
    if-gt p1, v1, :cond_2

    const/4 v2, 0x0

    :goto_1
    if-ge v2, v0, :cond_1

    .line 180
    iget-object v3, p0, Lcom/google/common/base/Splitter$2;->toSplit:Ljava/lang/CharSequence;

    add-int v4, v2, p1

    invoke-interface {v3, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    iget-object v4, p0, Lcom/google/common/base/Splitter$2;->val$separator:Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-eq v3, v4, :cond_0

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_1
    return p1

    :cond_2
    const/4 p0, -0x1

    return p0
.end method
