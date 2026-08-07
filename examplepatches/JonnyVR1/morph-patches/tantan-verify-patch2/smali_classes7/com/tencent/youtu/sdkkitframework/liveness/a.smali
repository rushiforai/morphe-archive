.class public Lcom/tencent/youtu/sdkkitframework/liveness/a;
.super Ljava/util/HashMap;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/HashMap<",
        "Ljava/lang/String;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;


# direct methods
.method public constructor <init>(Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/a;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->e(Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const-string v1, "action_detect_done_type"

    .line 17
    .line 18
    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    iget-object v0, p1, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->d(Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;)[Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    const/4 p1, 0x0

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget-object v0, p1, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;

    .line 32
    .line 33
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->d(Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;)[Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    array-length v0, v0

    .line 38
    iget-object p1, p1, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState$j;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;

    .line 39
    .line 40
    invoke-static {p1}, Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;->f(Lcom/tencent/youtu/sdkkitframework/liveness/ActionLivenessState;)I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    add-int/lit8 p1, p1, 0x1

    .line 45
    .line 46
    sub-int p1, v0, p1

    .line 47
    .line 48
    :goto_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    const-string v0, "action_detect_done_last_count"

    .line 53
    .line 54
    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    return-void
.end method
