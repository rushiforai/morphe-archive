.class Lcom/immomo/moment/mediautils/c$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/moment/mediautils/c$a;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/moment/mediautils/c$a;


# direct methods
.method public constructor <init>(Lcom/immomo/moment/mediautils/c$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/c$a$a;->a:Lcom/immomo/moment/mediautils/c$a;

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
    iget-object v0, p0, Lcom/immomo/moment/mediautils/c$a$a;->a:Lcom/immomo/moment/mediautils/c$a;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/immomo/moment/mediautils/c$a;->a:Lcom/immomo/moment/mediautils/c;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/immomo/moment/mediautils/b;->l:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object v1, p0, Lcom/immomo/moment/mediautils/c$a$a;->a:Lcom/immomo/moment/mediautils/c$a;

    .line 9
    .line 10
    iget-object v1, v1, Lcom/immomo/moment/mediautils/c$a;->a:Lcom/immomo/moment/mediautils/c;

    .line 11
    .line 12
    invoke-static {v1}, Lcom/immomo/moment/mediautils/c;->o(Lcom/immomo/moment/mediautils/c;)Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    const-string v1, "AudioDecoderBySoft"

    .line 19
    .line 20
    const-string v2, "AudioDecoder release"

    .line 21
    .line 22
    invoke-static {v1, v2}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/immomo/moment/mediautils/c$a$a;->a:Lcom/immomo/moment/mediautils/c$a;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/immomo/moment/mediautils/c$a;->a:Lcom/immomo/moment/mediautils/c;

    .line 28
    .line 29
    invoke-static {v1}, Lcom/immomo/moment/mediautils/c;->o(Lcom/immomo/moment/mediautils/c;)Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->release()V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/immomo/moment/mediautils/c$a$a;->a:Lcom/immomo/moment/mediautils/c$a;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/immomo/moment/mediautils/c$a;->a:Lcom/immomo/moment/mediautils/c;

    .line 39
    .line 40
    const/4 v1, 0x0

    .line 41
    invoke-static {p0, v1}, Lcom/immomo/moment/mediautils/c;->p(Lcom/immomo/moment/mediautils/c;Lcom/immomo/moment/mediautils/FFVideoDecoder;)Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :catchall_0
    move-exception p0

    .line 46
    goto :goto_1

    .line 47
    :cond_0
    :goto_0
    monitor-exit v0

    .line 48
    return-void

    .line 49
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    throw p0
.end method
