.class Lcom/immomo/momomediaext/MMLiveEngine$j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/pub/MomoPipelineModuleRegister$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/momomediaext/MMLiveEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/momomediaext/MMLiveEngine;


# direct methods
.method public constructor <init>(Lcom/immomo/momomediaext/MMLiveEngine;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/momomediaext/MMLiveEngine$j;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(IILl/c4m;)V
    .locals 3

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    goto/16 :goto_0

    .line 4
    .line 5
    :cond_0
    iget-object v0, p0, Lcom/immomo/momomediaext/MMLiveEngine$j;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/immomo/momomediaext/MMLiveEngine;->a(Lcom/immomo/momomediaext/MMLiveEngine;)Landroid/os/Handler;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_a

    .line 12
    .line 13
    new-instance v1, Landroid/os/Bundle;

    .line 14
    .line 15
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v2, "what"

    .line 19
    .line 20
    invoke-virtual {v1, v2, p1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 21
    .line 22
    .line 23
    const-string v2, "extra"

    .line 24
    .line 25
    invoke-virtual {v1, v2, p2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    iget-object p0, p0, Lcom/immomo/momomediaext/MMLiveEngine$j;->a:Lcom/immomo/momomediaext/MMLiveEngine;

    .line 33
    .line 34
    invoke-virtual {p0, p3}, Lcom/immomo/momomediaext/MMLiveEngine;->D(Ll/c4m;)Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const-string p3, "pushtype"

    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    invoke-virtual {v1, p3, p0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p2, v1}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 48
    .line 49
    .line 50
    const/16 p0, 0x67

    .line 51
    .line 52
    const-string p3, "EVT_MSG"

    .line 53
    .line 54
    if-eq p1, p0, :cond_9

    .line 55
    .line 56
    const/16 p0, 0x69

    .line 57
    .line 58
    if-eq p1, p0, :cond_8

    .line 59
    .line 60
    const/16 p0, 0x2005

    .line 61
    .line 62
    if-eq p1, p0, :cond_7

    .line 63
    .line 64
    const/16 p0, 0x3001

    .line 65
    .line 66
    if-eq p1, p0, :cond_6

    .line 67
    .line 68
    const/16 p0, 0x3004

    .line 69
    .line 70
    if-eq p1, p0, :cond_5

    .line 71
    .line 72
    const/16 p0, 0x3011

    .line 73
    .line 74
    if-eq p1, p0, :cond_4

    .line 75
    .line 76
    const p0, 0x8002

    .line 77
    .line 78
    .line 79
    if-eq p1, p0, :cond_3

    .line 80
    .line 81
    const/16 p0, 0x1007

    .line 82
    .line 83
    if-eq p1, p0, :cond_2

    .line 84
    .line 85
    const/16 p0, 0x1008

    .line 86
    .line 87
    if-eq p1, p0, :cond_1

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_1
    const/16 p0, 0x13bc

    .line 91
    .line 92
    iput p0, p2, Landroid/os/Message;->what:I

    .line 93
    .line 94
    const-string p0, "link rtmp published"

    .line 95
    .line 96
    invoke-virtual {v1, p3, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0, p2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_2
    const/16 p0, 0x13bb

    .line 104
    .line 105
    iput p0, p2, Landroid/os/Message;->what:I

    .line 106
    .line 107
    const-string p0, "link start rtmp publish"

    .line 108
    .line 109
    invoke-virtual {v1, p3, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v0, p2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :cond_3
    const/16 p0, 0x1775

    .line 117
    .line 118
    iput p0, p2, Landroid/os/Message;->what:I

    .line 119
    .line 120
    const-string p0, "AID_INFO"

    .line 121
    .line 122
    invoke-virtual {v1, p3, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v0, p2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 126
    .line 127
    .line 128
    return-void

    .line 129
    :cond_4
    const/16 p0, 0x106c

    .line 130
    .line 131
    iput p0, p2, Landroid/os/Message;->what:I

    .line 132
    .line 133
    const-string p0, "publish started,OK"

    .line 134
    .line 135
    invoke-virtual {v1, p3, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v0, p2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 139
    .line 140
    .line 141
    return-void

    .line 142
    :cond_5
    const/16 p0, 0x106b

    .line 143
    .line 144
    iput p0, p2, Landroid/os/Message;->what:I

    .line 145
    .line 146
    const-string p0, "publish start"

    .line 147
    .line 148
    invoke-virtual {v1, p3, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {v0, p2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 152
    .line 153
    .line 154
    return-void

    .line 155
    :cond_6
    const/16 p0, 0x106d

    .line 156
    .line 157
    iput p0, p2, Landroid/os/Message;->what:I

    .line 158
    .line 159
    const-string p0, "publish stopped"

    .line 160
    .line 161
    invoke-virtual {v1, p3, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {v0, p2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 165
    .line 166
    .line 167
    return-void

    .line 168
    :cond_7
    const/16 p0, 0x1770

    .line 169
    .line 170
    iput p0, p2, Landroid/os/Message;->what:I

    .line 171
    .line 172
    const-string p0, "PUBLISH_PUSH_LEVEL_CHANGE"

    .line 173
    .line 174
    invoke-virtual {v1, p3, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    invoke-virtual {v0, p2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 178
    .line 179
    .line 180
    return-void

    .line 181
    :cond_8
    const/16 p0, 0x1070

    .line 182
    .line 183
    iput p0, p2, Landroid/os/Message;->what:I

    .line 184
    .line 185
    const-string p0, "publish buffering stop"

    .line 186
    .line 187
    invoke-virtual {v1, p3, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {v0, p2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 191
    .line 192
    .line 193
    return-void

    .line 194
    :cond_9
    const/16 p0, 0x106f

    .line 195
    .line 196
    iput p0, p2, Landroid/os/Message;->what:I

    .line 197
    .line 198
    const-string p0, "publish buffering start"

    .line 199
    .line 200
    invoke-virtual {v1, p3, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    invoke-virtual {v0, p2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 204
    .line 205
    .line 206
    :cond_a
    :goto_0
    return-void
.end method
