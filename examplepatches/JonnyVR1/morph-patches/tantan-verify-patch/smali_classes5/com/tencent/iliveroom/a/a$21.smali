.class Lcom/tencent/iliveroom/a/a$21;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/a;->playEffectWithId(ILjava/lang/String;ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Z

.field final synthetic d:Z

.field final synthetic e:Lcom/tencent/iliveroom/a/a;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/a;ILjava/lang/String;ZZ)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a$21;->e:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/iliveroom/a/a$21;->a:I

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/iliveroom/a/a$21;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-boolean p4, p0, Lcom/tencent/iliveroom/a/a$21;->c:Z

    .line 8
    .line 9
    iput-boolean p5, p0, Lcom/tencent/iliveroom/a/a$21;->d:Z

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$21;->e:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/iliveroom/a/a;->f:Ljava/util/Set;

    .line 4
    .line 5
    iget v1, p0, Lcom/tencent/iliveroom/a/a$21;->a:I

    .line 6
    .line 7
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    new-instance v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioEffectParam;

    .line 15
    .line 16
    iget v1, p0, Lcom/tencent/iliveroom/a/a$21;->a:I

    .line 17
    .line 18
    iget-object v2, p0, Lcom/tencent/iliveroom/a/a$21;->b:Ljava/lang/String;

    .line 19
    .line 20
    invoke-direct {v0, v1, v2}, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioEffectParam;-><init>(ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-boolean v1, p0, Lcom/tencent/iliveroom/a/a$21;->c:Z

    .line 24
    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    const v1, 0x7fffffff

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const/4 v1, 0x0

    .line 32
    :goto_0
    iput v1, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioEffectParam;->loopCount:I

    .line 33
    .line 34
    iget-boolean v1, p0, Lcom/tencent/iliveroom/a/a$21;->d:Z

    .line 35
    .line 36
    iput-boolean v1, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioEffectParam;->publish:Z

    .line 37
    .line 38
    iget-object v1, p0, Lcom/tencent/iliveroom/a/a$21;->e:Lcom/tencent/iliveroom/a/a;

    .line 39
    .line 40
    invoke-static {v1}, Lcom/tencent/iliveroom/a/a;->D(Lcom/tencent/iliveroom/a/a;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    iget-object v2, p0, Lcom/tencent/iliveroom/a/a$21;->e:Lcom/tencent/iliveroom/a/a;

    .line 49
    .line 50
    if-eqz v1, :cond_1

    .line 51
    .line 52
    invoke-static {v2}, Lcom/tencent/iliveroom/a/a;->l(Lcom/tencent/iliveroom/a/a;)Ljava/util/Map;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iget p0, p0, Lcom/tencent/iliveroom/a/a$21;->a:I

    .line 57
    .line 58
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-interface {v1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_1
    invoke-static {v2, v0}, Lcom/tencent/iliveroom/a/a;->a(Lcom/tencent/iliveroom/a/a;Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioEffectParam;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method
