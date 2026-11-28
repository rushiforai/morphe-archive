.class final Lcom/google/common/collect/Streams$1OptionalState;
.super Ljava/lang/Object;
.source "Streams.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/Streams;->findLast(Ljava/util/stream/Stream;)Ljava/util/Optional;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "OptionalState"
.end annotation


# instance fields
.field set:Z

.field value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .registers 2

    .line 895
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 878
    iput-boolean v0, p0, Lcom/google/common/collect/Streams$1OptionalState;->set:Z

    const/4 v0, 0x0

    .line 879
    iput-object v0, p0, Lcom/google/common/collect/Streams$1OptionalState;->value:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method get()Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 892
    iget-object p0, p0, Lcom/google/common/collect/Streams$1OptionalState;->value:Ljava/lang/Object;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method set(Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    const/4 v0, 0x1

    .line 882
    iput-boolean v0, p0, Lcom/google/common/collect/Streams$1OptionalState;->set:Z

    .line 883
    iput-object p1, p0, Lcom/google/common/collect/Streams$1OptionalState;->value:Ljava/lang/Object;

    return-void
.end method
