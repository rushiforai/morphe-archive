.class Lcom/google/common/base/Joiner$1;
.super Lcom/google/common/base/Joiner;
.source "Joiner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/base/Joiner;->useForNull(Ljava/lang/String;)Lcom/google/common/base/Joiner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/base/Joiner;

.field final synthetic val$nullText:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/common/base/Joiner;Lcom/google/common/base/Joiner;Ljava/lang/String;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x1010
        }
        names = {
            "this$0",
            "prototype",
            "val$nullText"
        }
    .end annotation

    .line 243
    iput-object p3, p0, Lcom/google/common/base/Joiner$1;->val$nullText:Ljava/lang/String;

    iput-object p1, p0, Lcom/google/common/base/Joiner$1;->this$0:Lcom/google/common/base/Joiner;

    const/4 p1, 0x0

    invoke-direct {p0, p2, p1}, Lcom/google/common/base/Joiner;-><init>(Lcom/google/common/base/Joiner;Lcom/google/common/base/Joiner$1;)V

    return-void
.end method


# virtual methods
.method public skipNulls()Lcom/google/common/base/Joiner;
    .registers 2

    .line 256
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string v0, "already specified useForNull"

    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method toString(Ljava/lang/Object;)Ljava/lang/CharSequence;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "part"
        }
    .end annotation

    if-nez p1, :cond_0

    .line 246
    iget-object p0, p0, Lcom/google/common/base/Joiner$1;->val$nullText:Ljava/lang/String;

    return-object p0

    :cond_0
    iget-object p0, p0, Lcom/google/common/base/Joiner$1;->this$0:Lcom/google/common/base/Joiner;

    invoke-virtual {p0, p1}, Lcom/google/common/base/Joiner;->toString(Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0
.end method

.method public useForNull(Ljava/lang/String;)Lcom/google/common/base/Joiner;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "nullText"
        }
    .end annotation

    .line 251
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "already specified useForNull"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
