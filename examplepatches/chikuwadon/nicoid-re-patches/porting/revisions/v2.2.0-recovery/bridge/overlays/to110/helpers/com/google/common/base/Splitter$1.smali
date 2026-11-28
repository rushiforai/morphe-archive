.class Lcom/google/common/base/Splitter$1;
.super Lcom/google/common/base/Splitter$SplittingIterator;
.source "Splitter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/base/Splitter;->on(Lcom/google/common/base/CharMatcher;)Lcom/google/common/base/Splitter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$separatorMatcher:Lcom/google/common/base/CharMatcher;


# direct methods
.method constructor <init>(Lcom/google/common/base/Splitter;Ljava/lang/CharSequence;Lcom/google/common/base/CharMatcher;)V
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
            "val$separatorMatcher"
        }
    .end annotation

    .line 144
    iput-object p3, p0, Lcom/google/common/base/Splitter$1;->val$separatorMatcher:Lcom/google/common/base/CharMatcher;

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

    add-int/lit8 p1, p1, 0x1

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

    .line 147
    iget-object v0, p0, Lcom/google/common/base/Splitter$1;->val$separatorMatcher:Lcom/google/common/base/CharMatcher;

    iget-object p0, p0, Lcom/google/common/base/Splitter$1;->toSplit:Ljava/lang/CharSequence;

    invoke-virtual {v0, p0, p1}, Lcom/google/common/base/CharMatcher;->indexIn(Ljava/lang/CharSequence;I)I

    move-result p0

    return p0
.end method
