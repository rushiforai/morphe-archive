.class Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor$AudioServiceCallbackImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/reflect/InvocationHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AudioServiceCallbackImpl"
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;


# direct methods
.method private constructor <init>(Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor$AudioServiceCallbackImpl;->this$0:Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor$1;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor$AudioServiceCallbackImpl;-><init>(Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;)V

    return-void
.end method


# virtual methods
.method public invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    const-string v0, "IAudioServiceCallback: onResult error number "

    .line 2
    .line 3
    const-string v1, "onResult: "

    .line 4
    .line 5
    :try_start_0
    const-string v2, "onResult"

    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-eqz p2, :cond_5

    .line 16
    .line 17
    const/4 p2, 0x0

    .line 18
    aget-object p3, p3, p2

    .line 19
    .line 20
    check-cast p3, Ljava/lang/Integer;

    .line 21
    .line 22
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 23
    .line 24
    .line 25
    move-result p3

    .line 26
    invoke-static {}, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->access$100()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    new-instance v3, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-static {v2, v1}, Lio/agora/base/internal/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor$AudioServiceCallbackImpl;->this$0:Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;

    .line 46
    .line 47
    invoke-static {v1}, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->access$200(Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_0

    .line 52
    .line 53
    invoke-static {}, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->access$100()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    const-string v0, "ignore result after destroy"

    .line 58
    .line 59
    invoke-static {p2, v0}, Lio/agora/base/internal/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    if-nez p3, :cond_5

    .line 63
    .line 64
    iget-object p0, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor$AudioServiceCallbackImpl;->this$0:Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;

    .line 65
    .line 66
    invoke-static {p0}, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->access$300(Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;)V

    .line 67
    .line 68
    .line 69
    return-object p1

    .line 70
    :catchall_0
    move-exception p0

    .line 71
    goto :goto_0

    .line 72
    :cond_0
    if-eqz p3, :cond_3

    .line 73
    .line 74
    const/16 p2, 0x3e8

    .line 75
    .line 76
    if-eq p3, p2, :cond_1

    .line 77
    .line 78
    invoke-static {}, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->access$100()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    new-instance p2, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    invoke-static {p0, p2}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    return-object p1

    .line 98
    :cond_1
    iget-object p2, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor$AudioServiceCallbackImpl;->this$0:Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;

    .line 99
    .line 100
    invoke-virtual {p2}, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->isHardwareEarMonitorSupported()Z

    .line 101
    .line 102
    .line 103
    move-result p2

    .line 104
    iget-object p3, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor$AudioServiceCallbackImpl;->this$0:Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;

    .line 105
    .line 106
    invoke-static {p3}, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->access$500(Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;)Lio/agora/base/internal/voiceengine/earmonitor/HardwareEarMonitorListener;

    .line 107
    .line 108
    .line 109
    move-result-object p3

    .line 110
    if-eqz p3, :cond_2

    .line 111
    .line 112
    iget-object p0, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor$AudioServiceCallbackImpl;->this$0:Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;

    .line 113
    .line 114
    invoke-static {p0}, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->access$500(Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;)Lio/agora/base/internal/voiceengine/earmonitor/HardwareEarMonitorListener;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-interface {p0, p2}, Lio/agora/base/internal/voiceengine/earmonitor/HardwareEarMonitorListener;->onHardwareEarMonitorSupported(Z)V

    .line 119
    .line 120
    .line 121
    :cond_2
    invoke-static {}, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->access$100()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    const-string p2, "IAudioServiceCallback: Karaoke feature bind service success"

    .line 126
    .line 127
    invoke-static {p0, p2}, Lio/agora/base/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    return-object p1

    .line 131
    :cond_3
    iget-object p3, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor$AudioServiceCallbackImpl;->this$0:Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;

    .line 132
    .line 133
    invoke-static {p3}, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->access$400(Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;)V

    .line 134
    .line 135
    .line 136
    iget-object p3, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor$AudioServiceCallbackImpl;->this$0:Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;

    .line 137
    .line 138
    invoke-static {p3}, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->access$500(Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;)Lio/agora/base/internal/voiceengine/earmonitor/HardwareEarMonitorListener;

    .line 139
    .line 140
    .line 141
    move-result-object p3

    .line 142
    if-eqz p3, :cond_4

    .line 143
    .line 144
    iget-object p0, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor$AudioServiceCallbackImpl;->this$0:Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;

    .line 145
    .line 146
    invoke-static {p0}, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->access$500(Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;)Lio/agora/base/internal/voiceengine/earmonitor/HardwareEarMonitorListener;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    invoke-interface {p0, p2}, Lio/agora/base/internal/voiceengine/earmonitor/HardwareEarMonitorListener;->onInitResult(I)V

    .line 151
    .line 152
    .line 153
    :cond_4
    invoke-static {}, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->access$100()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    const-string p2, "IAudioServiceCallback: HnAudioClient init success"

    .line 158
    .line 159
    invoke-static {p0, p2}, Lio/agora/base/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 160
    .line 161
    .line 162
    :cond_5
    return-object p1

    .line 163
    :goto_0
    invoke-static {}, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->access$100()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object p2

    .line 167
    const-string p3, "AudioServiceCallbackImpl invoke failed "

    .line 168
    .line 169
    invoke-static {p2, p3, p0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 170
    .line 171
    .line 172
    return-object p1
.end method
