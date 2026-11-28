.class final Lcom/google/common/base/CharMatcher$InRange;
.super Lcom/google/common/base/CharMatcher$FastMatcher;
.source "CharMatcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/base/CharMatcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "InRange"
.end annotation


# instance fields
.field private final endInclusive:C

.field private final startInclusive:C


# direct methods
.method constructor <init>(CC)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "startInclusive",
            "endInclusive"
        }
    .end annotation

    .line 1774
    invoke-direct {p0}, Lcom/google/common/base/CharMatcher$FastMatcher;-><init>()V

    if-lt p2, p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 1775
    :goto_0
    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 1776
    iput-char p1, p0, Lcom/google/common/base/CharMatcher$InRange;->startInclusive:C

    .line 1777
    iput-char p2, p0, Lcom/google/common/base/CharMatcher$InRange;->endInclusive:C

    return-void
.end method


# virtual methods
.method public matches(C)Z
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "c"
        }
    .end annotation

    .line 1782
    iget-char v0, p0, Lcom/google/common/base/CharMatcher$InRange;->startInclusive:C

    if-gt v0, p1, :cond_0

    iget-char p0, p0, Lcom/google/common/base/CharMatcher$InRange;->endInclusive:C

    if-gt p1, p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method setBits(Ljava/util/BitSet;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "table"
        }
    .end annotation

    .line 1788
    iget-char v0, p0, Lcom/google/common/base/CharMatcher$InRange;->startInclusive:C

    iget-char p0, p0, Lcom/google/common/base/CharMatcher$InRange;->endInclusive:C

    add-int/lit8 p0, p0, 0x1

    invoke-virtual {p1, v0, p0}, Ljava/util/BitSet;->set(II)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 1793
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "CharMatcher.inRange(\'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-char v1, p0, Lcom/google/common/base/CharMatcher$InRange;->startInclusive:C

    .line 1794
    # invokes: Lcom/google/common/base/CharMatcher;->showCharacter(C)Ljava/lang/String;
    invoke-static {v1}, Lcom/google/common/base/CharMatcher;->access$100(C)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-char p0, p0, Lcom/google/common/base/CharMatcher$InRange;->endInclusive:C

    .line 1796
    # invokes: Lcom/google/common/base/CharMatcher;->showCharacter(C)Ljava/lang/String;
    invoke-static {p0}, Lcom/google/common/base/CharMatcher;->access$100(C)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "\')"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
