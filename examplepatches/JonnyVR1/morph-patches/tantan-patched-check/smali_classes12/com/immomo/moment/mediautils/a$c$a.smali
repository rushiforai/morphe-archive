.class Lcom/immomo/moment/mediautils/a$c$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/moment/mediautils/a$c;->onDataOutput(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/moment/mediautils/a$c;


# direct methods
.method public constructor <init>(Lcom/immomo/moment/mediautils/a$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/a$c$a;->a:Lcom/immomo/moment/mediautils/a$c;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/a$c$a;->a:Lcom/immomo/moment/mediautils/a$c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/immomo/moment/mediautils/b;->l:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object v1, p0, Lcom/immomo/moment/mediautils/a$c$a;->a:Lcom/immomo/moment/mediautils/a$c;

    .line 9
    .line 10
    iget-object v1, v1, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 11
    .line 12
    invoke-static {v1}, Lcom/immomo/moment/mediautils/a;->t(Lcom/immomo/moment/mediautils/a;)Lcom/immomo/moment/mediautils/h;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const/4 v2, 0x0

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-object v1, p0, Lcom/immomo/moment/mediautils/a$c$a;->a:Lcom/immomo/moment/mediautils/a$c;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 22
    .line 23
    invoke-static {v1}, Lcom/immomo/moment/mediautils/a;->t(Lcom/immomo/moment/mediautils/a;)Lcom/immomo/moment/mediautils/h;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/h;->C()V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Lcom/immomo/moment/mediautils/a$c$a;->a:Lcom/immomo/moment/mediautils/a$c;

    .line 31
    .line 32
    iget-object v1, v1, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 33
    .line 34
    invoke-static {v1, v2}, Lcom/immomo/moment/mediautils/a;->u(Lcom/immomo/moment/mediautils/a;Lcom/immomo/moment/mediautils/h;)Lcom/immomo/moment/mediautils/h;

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :catchall_0
    move-exception p0

    .line 39
    goto :goto_1

    .line 40
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/immomo/moment/mediautils/a$c$a;->a:Lcom/immomo/moment/mediautils/a$c;

    .line 41
    .line 42
    iget-object v1, v1, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 43
    .line 44
    invoke-static {v1}, Lcom/immomo/moment/mediautils/a;->n(Lcom/immomo/moment/mediautils/a;)Lcom/immomo/moment/mediautils/j;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    if-eqz v1, :cond_1

    .line 49
    .line 50
    iget-object v1, p0, Lcom/immomo/moment/mediautils/a$c$a;->a:Lcom/immomo/moment/mediautils/a$c;

    .line 51
    .line 52
    iget-object v1, v1, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 53
    .line 54
    invoke-static {v1}, Lcom/immomo/moment/mediautils/a;->n(Lcom/immomo/moment/mediautils/a;)Lcom/immomo/moment/mediautils/j;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/j;->e()V

    .line 59
    .line 60
    .line 61
    iget-object v1, p0, Lcom/immomo/moment/mediautils/a$c$a;->a:Lcom/immomo/moment/mediautils/a$c;

    .line 62
    .line 63
    iget-object v1, v1, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 64
    .line 65
    invoke-static {v1, v2}, Lcom/immomo/moment/mediautils/a;->o(Lcom/immomo/moment/mediautils/a;Lcom/immomo/moment/mediautils/j;)Lcom/immomo/moment/mediautils/j;

    .line 66
    .line 67
    .line 68
    :cond_1
    iget-object v1, p0, Lcom/immomo/moment/mediautils/a$c$a;->a:Lcom/immomo/moment/mediautils/a$c;

    .line 69
    .line 70
    iget-object v1, v1, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 71
    .line 72
    invoke-static {v1}, Lcom/immomo/moment/mediautils/a;->p(Lcom/immomo/moment/mediautils/a;)Lcom/immomo/moment/mediautils/AudioResampleUtils;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    if-eqz v1, :cond_2

    .line 77
    .line 78
    iget-object v1, p0, Lcom/immomo/moment/mediautils/a$c$a;->a:Lcom/immomo/moment/mediautils/a$c;

    .line 79
    .line 80
    iget-object v1, v1, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 81
    .line 82
    invoke-static {v1}, Lcom/immomo/moment/mediautils/a;->p(Lcom/immomo/moment/mediautils/a;)Lcom/immomo/moment/mediautils/AudioResampleUtils;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/AudioResampleUtils;->release()V

    .line 87
    .line 88
    .line 89
    iget-object p0, p0, Lcom/immomo/moment/mediautils/a$c$a;->a:Lcom/immomo/moment/mediautils/a$c;

    .line 90
    .line 91
    iget-object p0, p0, Lcom/immomo/moment/mediautils/a$c;->a:Lcom/immomo/moment/mediautils/a;

    .line 92
    .line 93
    invoke-static {p0, v2}, Lcom/immomo/moment/mediautils/a;->q(Lcom/immomo/moment/mediautils/a;Lcom/immomo/moment/mediautils/AudioResampleUtils;)Lcom/immomo/moment/mediautils/AudioResampleUtils;

    .line 94
    .line 95
    .line 96
    :cond_2
    monitor-exit v0

    .line 97
    return-void

    .line 98
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 99
    throw p0
.end method
