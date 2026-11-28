.class Lcom/google/common/io/LineReader$1;
.super Lcom/google/common/io/LineBuffer;
.source "LineReader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/io/LineReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/io/LineReader;


# direct methods
.method constructor <init>(Lcom/google/common/io/LineReader;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 48
    iput-object p1, p0, Lcom/google/common/io/LineReader$1;->this$0:Lcom/google/common/io/LineReader;

    invoke-direct {p0}, Lcom/google/common/io/LineBuffer;-><init>()V

    return-void
.end method


# virtual methods
.method handleLine(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "line",
            "end"
        }
    .end annotation

    .line 51
    iget-object p0, p0, Lcom/google/common/io/LineReader$1;->this$0:Lcom/google/common/io/LineReader;

    # getter for: Lcom/google/common/io/LineReader;->lines:Ljava/util/Queue;
    invoke-static {p0}, Lcom/google/common/io/LineReader;->access$000(Lcom/google/common/io/LineReader;)Ljava/util/Queue;

    move-result-object p0

    invoke-interface {p0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    return-void
.end method
