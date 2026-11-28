.class Lcom/google/common/base/Splitter$3;
.super Lcom/google/common/base/Splitter$SplittingIterator;
.source "Splitter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/base/Splitter;->onPatternInternal(Lcom/google/common/base/CommonPattern;)Lcom/google/common/base/Splitter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$matcher:Lcom/google/common/base/CommonMatcher;


# direct methods
.method constructor <init>(Lcom/google/common/base/Splitter;Ljava/lang/CharSequence;Lcom/google/common/base/CommonMatcher;)V
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
            "val$matcher"
        }
    .end annotation

    .line 221
    iput-object p3, p0, Lcom/google/common/base/Splitter$3;->val$matcher:Lcom/google/common/base/CommonMatcher;

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

    .line 229
    iget-object p0, p0, Lcom/google/common/base/Splitter$3;->val$matcher:Lcom/google/common/base/CommonMatcher;

    invoke-virtual {p0}, Lcom/google/common/base/CommonMatcher;->end()I

    move-result p0

    return p0
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

    .line 224
    iget-object v0, p0, Lcom/google/common/base/Splitter$3;->val$matcher:Lcom/google/common/base/CommonMatcher;

    invoke-virtual {v0, p1}, Lcom/google/common/base/CommonMatcher;->find(I)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p0, p0, Lcom/google/common/base/Splitter$3;->val$matcher:Lcom/google/common/base/CommonMatcher;

    invoke-virtual {p0}, Lcom/google/common/base/CommonMatcher;->start()I

    move-result p0

    return p0

    :cond_0
    const/4 p0, -0x1

    return p0
.end method
