.class Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor$AudioKitCallbackImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/reflect/InvocationHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AudioKitCallbackImpl"
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;


# direct methods
.method private constructor <init>(Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor$AudioKitCallbackImpl;->this$0:Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor$1;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor$AudioKitCallbackImpl;-><init>(Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;)V

    return-void
.end method


# virtual methods
.method public invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    const-string v0, "IAudioKitCallback: onResult error number "

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
    if-eqz p2, :cond_7

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
    invoke-static {}, Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;->access$100()Ljava/lang/String;

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
    invoke-static {v2, v1}, Lio/agora/base/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor$AudioKitCallbackImpl;->this$0:Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;

    .line 46
    .line 47
    invoke-static {v1}, Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;->access$200(Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    const/16 v2, 0x3e8

    .line 52
    .line 53
    if-eqz v1, :cond_1

    .line 54
    .line 55
    invoke-static {}, Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;->access$100()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    const-string v0, "ignore result after destroy"

    .line 60
    .line 61
    invoke-static {p2, v0}, Lio/agora/base/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    if-eqz p3, :cond_0

    .line 65
    .line 66
    if-ne p3, v2, :cond_7

    .line 67
    .line 68
    :cond_0
    iget-object p0, p0, Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor$AudioKitCallbackImpl;->this$0:Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;

    .line 69
    .line 70
    invoke-static {p0}, Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;->access$300(Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;)V

    .line 71
    .line 72
    .line 73
    return-object p1

    .line 74
    :catchall_0
    move-exception p0

    .line 75
    goto :goto_0

    .line 76
    :cond_1
    if-eqz p3, :cond_5

    .line 77
    .line 78
    const/4 p2, 0x2

    .line 79
    if-eq p3, p2, :cond_4

    .line 80
    .line 81
    if-eq p3, v2, :cond_2

    .line 82
    .line 83
    invoke-static {}, Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;->access$100()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    new-instance p2, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p2

    .line 99
    invoke-static {p0, p2}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    return-object p1

    .line 103
    :cond_2
    iget-object p2, p0, Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor$AudioKitCallbackImpl;->this$0:Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;

    .line 104
    .line 105
    invoke-virtual {p2}, Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;->isHardwareEarMonitorSupported()Z

    .line 106
    .line 107
    .line 108
    move-result p2

    .line 109
    iget-object p3, p0, Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor$AudioKitCallbackImpl;->this$0:Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;

    .line 110
    .line 111
    invoke-static {p3}, Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;->access$400(Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;)Lio/agora/base/internal/voiceengine/earmonitor/HardwareEarMonitorListener;

    .line 112
    .line 113
    .line 114
    move-result-object p3

    .line 115
    if-eqz p3, :cond_3

    .line 116
    .line 117
    iget-object p0, p0, Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor$AudioKitCallbackImpl;->this$0:Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;

    .line 118
    .line 119
    invoke-static {p0}, Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;->access$400(Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;)Lio/agora/base/internal/voiceengine/earmonitor/HardwareEarMonitorListener;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-interface {p0, p2}, Lio/agora/base/internal/voiceengine/earmonitor/HardwareEarMonitorListener;->onHardwareEarMonitorSupported(Z)V

    .line 124
    .line 125
    .line 126
    :cond_3
    invoke-static {}, Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;->access$100()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    const-string p2, "IAudioKitCallback: Karaoke feature created"

    .line 131
    .line 132
    invoke-static {p0, p2}, Lio/agora/base/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    return-object p1

    .line 136
    :cond_4
    invoke-static {}, Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;->access$100()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p3

    .line 140
    const-string v0, "IAudioKitCallback: HwAudioKit not installed"

    .line 141
    .line 142
    invoke-static {p3, v0}, Lio/agora/base/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    iget-object p3, p0, Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor$AudioKitCallbackImpl;->this$0:Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;

    .line 146
    .line 147
    invoke-static {p3}, Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;->access$400(Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;)Lio/agora/base/internal/voiceengine/earmonitor/HardwareEarMonitorListener;

    .line 148
    .line 149
    .line 150
    move-result-object p3

    .line 151
    if-eqz p3, :cond_7

    .line 152
    .line 153
    iget-object p0, p0, Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor$AudioKitCallbackImpl;->this$0:Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;

    .line 154
    .line 155
    invoke-static {p0}, Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;->access$400(Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;)Lio/agora/base/internal/voiceengine/earmonitor/HardwareEarMonitorListener;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    invoke-interface {p0, p2}, Lio/agora/base/internal/voiceengine/earmonitor/HardwareEarMonitorListener;->onInitResult(I)V

    .line 160
    .line 161
    .line 162
    return-object p1

    .line 163
    :cond_5
    iget-object p3, p0, Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor$AudioKitCallbackImpl;->this$0:Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;

    .line 164
    .line 165
    invoke-static {p3}, Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;->access$400(Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;)Lio/agora/base/internal/voiceengine/earmonitor/HardwareEarMonitorListener;

    .line 166
    .line 167
    .line 168
    move-result-object p3

    .line 169
    if-eqz p3, :cond_6

    .line 170
    .line 171
    iget-object p0, p0, Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor$AudioKitCallbackImpl;->this$0:Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;

    .line 172
    .line 173
    invoke-static {p0}, Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;->access$400(Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;)Lio/agora/base/internal/voiceengine/earmonitor/HardwareEarMonitorListener;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    invoke-interface {p0, p2}, Lio/agora/base/internal/voiceengine/earmonitor/HardwareEarMonitorListener;->onInitResult(I)V

    .line 178
    .line 179
    .line 180
    :cond_6
    invoke-static {}, Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;->access$100()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    const-string p2, "IAudioKitCallback: HwAudioKit init success"

    .line 185
    .line 186
    invoke-static {p0, p2}, Lio/agora/base/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 187
    .line 188
    .line 189
    :cond_7
    return-object p1

    .line 190
    :goto_0
    invoke-static {}, Lio/agora/base/internal/voiceengine/earmonitor/HuaweiHardwareEarMonitor;->access$100()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object p2

    .line 194
    const-string p3, "AudioKitCallbackImpl invoke failed "

    .line 195
    .line 196
    invoke-static {p2, p3, p0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 197
    .line 198
    .line 199
    return-object p1
.end method
