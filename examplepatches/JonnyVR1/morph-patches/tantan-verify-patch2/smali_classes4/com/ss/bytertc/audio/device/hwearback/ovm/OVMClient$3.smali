.class Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$3;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$3;->this$0:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    goto/16 :goto_4

    .line 4
    .line 5
    :cond_0
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "OVMClient"

    .line 10
    .line 11
    if-nez p1, :cond_1

    .line 12
    .line 13
    const-string p0, "action is null"

    .line 14
    .line 15
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string v2, "onReceive: "

    .line 22
    .line 23
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    invoke-virtual {v1}, Landroid/os/BaseBundle;->keySet()Ljava/util/Set;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    if-eqz v3, :cond_2

    .line 55
    .line 56
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    check-cast v3, Ljava/lang/String;

    .line 61
    .line 62
    new-instance v4, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    const-string v5, ": "

    .line 71
    .line 72
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v1, v3}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    invoke-static {v0, v3}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_2
    const-string v1, "android.intent.action.HEADSET_PLUG"

    .line 91
    .line 92
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    if-eqz p1, :cond_8

    .line 97
    .line 98
    const-string p1, "state"

    .line 99
    .line 100
    const/16 v1, -0x63

    .line 101
    .line 102
    invoke-virtual {p2, p1, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    const/4 p2, 0x0

    .line 107
    const/4 v1, 0x1

    .line 108
    if-ne p1, v1, :cond_3

    .line 109
    .line 110
    move p1, v1

    .line 111
    goto :goto_1

    .line 112
    :cond_3
    move p1, p2

    .line 113
    :goto_1
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$3;->this$0:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 114
    .line 115
    invoke-static {v2}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->access$700(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;)Z

    .line 116
    .line 117
    .line 118
    move-result v2

    .line 119
    if-eq v2, p1, :cond_4

    .line 120
    .line 121
    goto :goto_2

    .line 122
    :cond_4
    move v1, p2

    .line 123
    :goto_2
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$3;->this$0:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 124
    .line 125
    invoke-static {v2, p1}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->access$702(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;Z)Z

    .line 126
    .line 127
    .line 128
    if-nez v1, :cond_5

    .line 129
    .line 130
    const-string p0, "headset plug not changed, ignore"

    .line 131
    .line 132
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    return-void

    .line 136
    :cond_5
    if-eqz p1, :cond_7

    .line 137
    .line 138
    const-string p1, "need restart media helper"

    .line 139
    .line 140
    invoke-static {v0, p1}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    invoke-static {}, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker;->getManufacturerType()Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    sget-object p2, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;->OP:Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 148
    .line 149
    if-ne p1, p2, :cond_6

    .line 150
    .line 151
    const/16 p1, 0x9c4

    .line 152
    .line 153
    goto :goto_3

    .line 154
    :cond_6
    const/16 p1, 0xc8

    .line 155
    .line 156
    :goto_3
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$3;->this$0:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 157
    .line 158
    invoke-static {p0, p1}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->access$800(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;I)V

    .line 159
    .line 160
    .line 161
    return-void

    .line 162
    :cond_7
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$3;->this$0:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 163
    .line 164
    invoke-static {p1}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->access$900(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;)V

    .line 165
    .line 166
    .line 167
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$3;->this$0:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 168
    .line 169
    invoke-static {p1}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->access$600(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;)Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    if-eqz p1, :cond_8

    .line 174
    .line 175
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$3;->this$0:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 176
    .line 177
    invoke-static {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->access$500(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;)Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    iget-boolean p0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;->isKTVDeviceOpen:Z

    .line 182
    .line 183
    if-eqz p0, :cond_8

    .line 184
    .line 185
    const-string p0, "closeKTVDevice and feedback with unplug headset"

    .line 186
    .line 187
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {p1, p2}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;->setPlayFeedbackParam(I)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {p1}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;->closeKTVDevice()V

    .line 194
    .line 195
    .line 196
    :cond_8
    :goto_4
    return-void
.end method
