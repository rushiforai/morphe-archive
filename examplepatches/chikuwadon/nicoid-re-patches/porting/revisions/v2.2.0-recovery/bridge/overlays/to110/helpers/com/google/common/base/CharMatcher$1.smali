.class Lcom/google/common/base/CharMatcher$1;
.super Lcom/google/common/base/CharMatcher$NegatedFastMatcher;
.source "CharMatcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/base/CharMatcher;->precomputedInternal()Lcom/google/common/base/CharMatcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/base/CharMatcher;

.field final synthetic val$description:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/common/base/CharMatcher;Lcom/google/common/base/CharMatcher;Ljava/lang/String;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x1010
        }
        names = {
            "this$0",
            "original",
            "val$description"
        }
    .end annotation

    .line 435
    iput-object p3, p0, Lcom/google/common/base/CharMatcher$1;->val$description:Ljava/lang/String;

    iput-object p1, p0, Lcom/google/common/base/CharMatcher$1;->this$0:Lcom/google/common/base/CharMatcher;

    invoke-direct {p0, p2}, Lcom/google/common/base/CharMatcher$NegatedFastMatcher;-><init>(Lcom/google/common/base/CharMatcher;)V

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 1

    .line 438
    iget-object p0, p0, Lcom/google/common/base/CharMatcher$1;->val$description:Ljava/lang/String;

    return-object p0
.end method
