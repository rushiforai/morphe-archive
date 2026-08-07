.class public Lcom/p1/mobile/putong/live/base/mmsdk/player/a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/base/mmsdk/player/a$a;,
        Lcom/p1/mobile/putong/live/base/mmsdk/player/a$c;,
        Lcom/p1/mobile/putong/live/base/mmsdk/player/a$b;
    }
.end annotation


# static fields
.field public static volatile h:Lcom/p1/mobile/putong/live/base/mmsdk/player/a;


# instance fields
.field public a:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue<",
            "Lcom/p1/mobile/putong/live/base/mmsdk/player/a$b;",
            ">;"
        }
    .end annotation
.end field

.field public b:Landroid/media/AudioManager$OnAudioFocusChangeListener;

.field public c:Landroid/media/AudioManager;

.field public d:Lcom/p1/mobile/putong/live/base/mmsdk/player/a$c;

.field public e:Landroid/telephony/TelephonyManager;

.field public f:I

.field public g:Landroid/media/AudioFocusRequest;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->a:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->f:I

    .line 13
    .line 14
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/live/base/mmsdk/player/a;)Ljava/util/concurrent/ConcurrentLinkedQueue;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->a:Ljava/util/concurrent/ConcurrentLinkedQueue;

    return-object p0
.end method

.method public static b()Lcom/p1/mobile/putong/live/base/mmsdk/player/a;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->h:Lcom/p1/mobile/putong/live/base/mmsdk/player/a;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->h:Lcom/p1/mobile/putong/live/base/mmsdk/player/a;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;

    .line 13
    .line 14
    invoke-direct {v1}, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->h:Lcom/p1/mobile/putong/live/base/mmsdk/player/a;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->h:Lcom/p1/mobile/putong/live/base/mmsdk/player/a;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public c(Lcom/p1/mobile/putong/live/base/mmsdk/player/a$b;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->a:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->a:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->offer(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/live/base/mmsdk/player/a$b;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->a:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public declared-synchronized e(Landroid/content/Context;)I
    .locals 6

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->c:Landroid/media/AudioManager;

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const-string v0, "audio"

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Landroid/media/AudioManager;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->c:Landroid/media/AudioManager;

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catchall_0
    move-exception p1

    .line 18
    goto/16 :goto_2

    .line 19
    .line 20
    :cond_0
    :goto_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 21
    .line 22
    const/16 v1, 0x1a

    .line 23
    .line 24
    const/4 v2, 0x1

    .line 25
    const/4 v3, 0x0

    .line 26
    const/4 v4, 0x2

    .line 27
    if-lt v0, v1, :cond_3

    .line 28
    .line 29
    new-instance v0, Landroid/media/AudioAttributes$Builder;

    .line 30
    .line 31
    invoke-direct {v0}, Landroid/media/AudioAttributes$Builder;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v2}, Landroid/media/AudioAttributes$Builder;->setUsage(I)Landroid/media/AudioAttributes$Builder;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0, v4}, Landroid/media/AudioAttributes$Builder;->setContentType(I)Landroid/media/AudioAttributes$Builder;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->b:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 47
    .line 48
    if-nez v1, :cond_1

    .line 49
    .line 50
    new-instance v1, Lcom/p1/mobile/putong/live/base/mmsdk/player/a$a;

    .line 51
    .line 52
    invoke-direct {v1, p0, v3}, Lcom/p1/mobile/putong/live/base/mmsdk/player/a$a;-><init>(Lcom/p1/mobile/putong/live/base/mmsdk/player/a;Ll/eb1;)V

    .line 53
    .line 54
    .line 55
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->b:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 56
    .line 57
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->g:Landroid/media/AudioFocusRequest;

    .line 58
    .line 59
    if-nez v1, :cond_2

    .line 60
    .line 61
    invoke-static {}, Ll/wa1;->a()V

    .line 62
    .line 63
    .line 64
    invoke-static {v4}, Ll/ta1;->a(I)Landroid/media/AudioFocusRequest$Builder;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-static {v1, v0}, Ll/ya1;->a(Landroid/media/AudioFocusRequest$Builder;Landroid/media/AudioAttributes;)Landroid/media/AudioFocusRequest$Builder;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->b:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 73
    .line 74
    invoke-static {v0, v1}, Ll/ab1;->a(Landroid/media/AudioFocusRequest$Builder;Landroid/media/AudioManager$OnAudioFocusChangeListener;)Landroid/media/AudioFocusRequest$Builder;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-static {v0}, Ll/bb1;->a(Landroid/media/AudioFocusRequest$Builder;)Landroid/media/AudioFocusRequest;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->g:Landroid/media/AudioFocusRequest;

    .line 83
    .line 84
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->c:Landroid/media/AudioManager;

    .line 85
    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->g:Landroid/media/AudioFocusRequest;

    .line 87
    .line 88
    invoke-static {v0, v1}, Ll/cb1;->a(Landroid/media/AudioManager;Landroid/media/AudioFocusRequest;)I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    iput v0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->f:I

    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->b:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 96
    .line 97
    if-nez v0, :cond_4

    .line 98
    .line 99
    new-instance v0, Lcom/p1/mobile/putong/live/base/mmsdk/player/a$a;

    .line 100
    .line 101
    invoke-direct {v0, p0, v3}, Lcom/p1/mobile/putong/live/base/mmsdk/player/a$a;-><init>(Lcom/p1/mobile/putong/live/base/mmsdk/player/a;Ll/eb1;)V

    .line 102
    .line 103
    .line 104
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->b:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 105
    .line 106
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->c:Landroid/media/AudioManager;

    .line 107
    .line 108
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->b:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 109
    .line 110
    const/4 v5, 0x3

    .line 111
    invoke-virtual {v0, v1, v5, v4}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    iput v0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->f:I

    .line 116
    .line 117
    :goto_1
    iget v0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->f:I

    .line 118
    .line 119
    if-ne v0, v2, :cond_5

    .line 120
    .line 121
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->b:Landroid/media/AudioManager$OnAudioFocusChangeListener;

    .line 122
    .line 123
    invoke-interface {v1, v0}, Landroid/media/AudioManager$OnAudioFocusChangeListener;->onAudioFocusChange(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 124
    .line 125
    .line 126
    :cond_5
    :try_start_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->e:Landroid/telephony/TelephonyManager;

    .line 127
    .line 128
    if-nez v0, :cond_6

    .line 129
    .line 130
    const-string v0, "phone"

    .line 131
    .line 132
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    check-cast p1, Landroid/telephony/TelephonyManager;

    .line 137
    .line 138
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->e:Landroid/telephony/TelephonyManager;

    .line 139
    .line 140
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->d:Lcom/p1/mobile/putong/live/base/mmsdk/player/a$c;

    .line 141
    .line 142
    if-nez p1, :cond_7

    .line 143
    .line 144
    new-instance p1, Lcom/p1/mobile/putong/live/base/mmsdk/player/a$c;

    .line 145
    .line 146
    invoke-direct {p1, p0, v3}, Lcom/p1/mobile/putong/live/base/mmsdk/player/a$c;-><init>(Lcom/p1/mobile/putong/live/base/mmsdk/player/a;Ll/eb1;)V

    .line 147
    .line 148
    .line 149
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->d:Lcom/p1/mobile/putong/live/base/mmsdk/player/a$c;

    .line 150
    .line 151
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->e:Landroid/telephony/TelephonyManager;

    .line 152
    .line 153
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->d:Lcom/p1/mobile/putong/live/base/mmsdk/player/a$c;

    .line 154
    .line 155
    const/16 v1, 0x20

    .line 156
    .line 157
    invoke-virtual {p1, v0, v1}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 158
    .line 159
    .line 160
    :catch_0
    :try_start_2
    iget p1, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->f:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 161
    .line 162
    monitor-exit p0

    .line 163
    return p1

    .line 164
    :goto_2
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 165
    throw p1
.end method
