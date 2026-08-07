.class public Lcom/p1/mobile/putong/live/base/mmsdk/player/a$c;
.super Landroid/telephony/PhoneStateListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/mmsdk/player/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/mmsdk/player/a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/mmsdk/player/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/a$c;->a:Lcom/p1/mobile/putong/live/base/mmsdk/player/a;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/telephony/PhoneStateListener;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/mmsdk/player/a;Ll/eb1;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/base/mmsdk/player/a$c;-><init>(Lcom/p1/mobile/putong/live/base/mmsdk/player/a;)V

    return-void
.end method


# virtual methods
.method public onCallStateChanged(ILjava/lang/String;)V
    .locals 1

    .line 1
    if-nez p1, :cond_1

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/a$c;->a:Lcom/p1/mobile/putong/live/base/mmsdk/player/a;

    .line 4
    .line 5
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->a(Lcom/p1/mobile/putong/live/base/mmsdk/player/a;)Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lcom/p1/mobile/putong/live/base/mmsdk/player/a$b;

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-interface {v0, p1, p2}, Lcom/p1/mobile/putong/live/base/mmsdk/player/a$b;->b(ILjava/lang/String;)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    return-void
.end method
