.class Lcom/momo/xeengine/gift/GiftPlayer$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/game/XEGameViewCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/xeengine/gift/GiftPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/xeengine/gift/GiftPlayer;


# direct methods
.method public constructor <init>(Lcom/momo/xeengine/gift/GiftPlayer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftPlayer$2;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/momo/xeengine/gift/GiftPlayer;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/momo/xeengine/gift/GiftPlayer;->access$1900(Lcom/momo/xeengine/gift/GiftPlayer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/momo/xeengine/gift/GiftPlayer;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/momo/xeengine/gift/GiftPlayer;->access$1900(Lcom/momo/xeengine/gift/GiftPlayer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public onEngineDynamicLinkLibraryDownloadProcess(ID)V
    .locals 0

    return-void
.end method

.method public onRenderSizeChanged(II)V
    .locals 0

    return-void
.end method

.method public onRenderViewCreate(Landroid/view/View;)V
    .locals 0

    return-void
.end method

.method public onStart(Lcom/momo/xeengine/IXEngine;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer$2;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/gift/GiftPlayer;->access$100(Lcom/momo/xeengine/gift/GiftPlayer;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayer$2;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 8
    .line 9
    new-instance v2, Lcom/momo/xeengine/gift/o;

    .line 10
    .line 11
    invoke-direct {v2, v1}, Lcom/momo/xeengine/gift/o;-><init>(Lcom/momo/xeengine/gift/GiftPlayer;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer$2;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/momo/xeengine/gift/GiftPlayer;->access$200(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/GiftPlayData;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_5

    .line 24
    .line 25
    iget-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayer$2;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 26
    .line 27
    invoke-static {v1, p1}, Lcom/momo/xeengine/gift/GiftPlayer;->access$1302(Lcom/momo/xeengine/gift/GiftPlayer;Lcom/momo/xeengine/IXEngine;)Lcom/momo/xeengine/IXEngine;

    .line 28
    .line 29
    .line 30
    invoke-interface {p1}, Lcom/momo/xeengine/IXEngine;->getLogger()Lcom/momo/xeengine/XELogger;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iget-object v2, p0, Lcom/momo/xeengine/gift/GiftPlayer$2;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 35
    .line 36
    invoke-static {v2}, Lcom/momo/xeengine/gift/GiftPlayer;->access$700(Lcom/momo/xeengine/gift/GiftPlayer;)Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    invoke-virtual {v1, v2}, Lcom/momo/xeengine/XELogger;->setLogEnable(Z)V

    .line 41
    .line 42
    .line 43
    invoke-interface {p1}, Lcom/momo/xeengine/IXEngine;->getScriptEngine()Lcom/momo/xeengine/script/XEScriptEngine;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-interface {v1}, Lcom/momo/xeengine/script/XEScriptEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    iget-object v2, p0, Lcom/momo/xeengine/gift/GiftPlayer$2;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 52
    .line 53
    invoke-static {v2}, Lcom/momo/xeengine/gift/GiftPlayer;->access$1400(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/GameDelegate;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    const-string v3, "GameDelegate"

    .line 58
    .line 59
    invoke-interface {v1, v2, v3}, Lcom/momo/xeengine/script/ScriptBridge;->add(Ljava/lang/Object;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-static {}, Lcom/momo/xeengine/gift/GiftUtils;->getCacheDir()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-interface {p1, v1}, Lcom/momo/xeengine/IXEngine;->addLibraryPath(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0}, Lcom/momo/xeengine/gift/GiftPlayData;->getGiftEntity()Lcom/momo/xeengine/gift/GiftEntity;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v1}, Lcom/momo/xeengine/gift/GiftEntity;->getPath()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-interface {p1, v1}, Lcom/momo/xeengine/IXEngine;->addLibraryPath(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    sget-object v1, Lcom/momo/xeengine/gift/GiftPlayerType;->Software:Lcom/momo/xeengine/gift/GiftPlayerType;

    .line 81
    .line 82
    iget-object v2, p0, Lcom/momo/xeengine/gift/GiftPlayer$2;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 83
    .line 84
    invoke-static {v2}, Lcom/momo/xeengine/gift/GiftPlayer;->access$1500(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/GiftPlayerType;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    if-eq v1, v2, :cond_0

    .line 89
    .line 90
    sget-object v1, Lcom/momo/xeengine/gift/GiftPlayerType;->Auto:Lcom/momo/xeengine/gift/GiftPlayerType;

    .line 91
    .line 92
    iget-object v2, p0, Lcom/momo/xeengine/gift/GiftPlayer$2;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 93
    .line 94
    invoke-static {v2}, Lcom/momo/xeengine/gift/GiftPlayer;->access$1500(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/GiftPlayerType;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    if-ne v1, v2, :cond_1

    .line 99
    .line 100
    :cond_0
    invoke-static {}, Lcom/momo/xeengine/gift/SOLoader;->load()Z

    .line 101
    .line 102
    .line 103
    iget-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayer$2;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 104
    .line 105
    invoke-static {v1}, Lcom/momo/xeengine/gift/GiftPlayer;->access$1500(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/GiftPlayerType;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    invoke-virtual {v1}, Lcom/momo/xeengine/gift/GiftPlayerType;->getValue()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    const-string v2, "_G_UIManager:SetVideoPlayerType(\'%s\')"

    .line 118
    .line 119
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-interface {p1}, Lcom/momo/xeengine/IXEngine;->getScriptEngine()Lcom/momo/xeengine/script/XEScriptEngine;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    invoke-interface {v2, v1}, Lcom/momo/xeengine/script/XEScriptEngine;->executeScriptString(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    :cond_1
    invoke-virtual {v0}, Lcom/momo/xeengine/gift/GiftPlayData;->getType()Lcom/momo/xeengine/gift/GiftType;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    sget-object v2, Lcom/momo/xeengine/gift/GiftType;->ENGINE:Lcom/momo/xeengine/gift/GiftType;

    .line 135
    .line 136
    if-ne v1, v2, :cond_2

    .line 137
    .line 138
    invoke-interface {p1}, Lcom/momo/xeengine/IXEngine;->getScriptEngine()Lcom/momo/xeengine/script/XEScriptEngine;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    const-string v1, "app"

    .line 143
    .line 144
    invoke-interface {p1, v1}, Lcom/momo/xeengine/script/XEScriptEngine;->executeScriptFile(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    goto :goto_0

    .line 148
    :cond_2
    sget-object v2, Lcom/momo/xeengine/gift/GiftType;->VIDEO:Lcom/momo/xeengine/gift/GiftType;

    .line 149
    .line 150
    if-ne v1, v2, :cond_4

    .line 151
    .line 152
    iget-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayer$2;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 153
    .line 154
    invoke-static {v1}, Lcom/momo/xeengine/gift/GiftPlayer;->access$1600(Lcom/momo/xeengine/gift/GiftPlayer;)Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v1

    .line 158
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 159
    .line 160
    .line 161
    move-result v2

    .line 162
    if-eqz v2, :cond_3

    .line 163
    .line 164
    invoke-interface {p1}, Lcom/momo/xeengine/IXEngine;->getScriptEngine()Lcom/momo/xeengine/script/XEScriptEngine;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    check-cast p1, Lcom/momo/xeengine/lua/XELuaEngine;

    .line 169
    .line 170
    iget-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayer$2;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 171
    .line 172
    invoke-virtual {p1}, Lcom/momo/xeengine/lua/XELuaEngine;->getNative()J

    .line 173
    .line 174
    .line 175
    move-result-wide v2

    .line 176
    invoke-static {v1, v2, v3}, Lcom/momo/xeengine/gift/GiftPlayer;->access$1700(Lcom/momo/xeengine/gift/GiftPlayer;J)V

    .line 177
    .line 178
    .line 179
    goto :goto_0

    .line 180
    :cond_3
    invoke-interface {p1}, Lcom/momo/xeengine/IXEngine;->getScriptEngine()Lcom/momo/xeengine/script/XEScriptEngine;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    invoke-interface {p1, v1}, Lcom/momo/xeengine/script/XEScriptEngine;->executeScriptString(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    :cond_4
    :goto_0
    iget-object p1, p0, Lcom/momo/xeengine/gift/GiftPlayer$2;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 188
    .line 189
    invoke-static {p1}, Lcom/momo/xeengine/gift/GiftPlayer;->access$1800(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/GiftPlayerListener;

    .line 190
    .line 191
    .line 192
    move-result-object p1

    .line 193
    if-eqz p1, :cond_5

    .line 194
    .line 195
    iget-object p1, p0, Lcom/momo/xeengine/gift/GiftPlayer$2;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 196
    .line 197
    invoke-static {p1}, Lcom/momo/xeengine/gift/GiftPlayer;->access$1800(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/GiftPlayerListener;

    .line 198
    .line 199
    .line 200
    move-result-object p1

    .line 201
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayer$2;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 202
    .line 203
    invoke-virtual {v0}, Lcom/momo/xeengine/gift/GiftPlayData;->getGiftEntity()Lcom/momo/xeengine/gift/GiftEntity;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    invoke-interface {p1, p0, v0}, Lcom/momo/xeengine/gift/GiftPlayerListener;->onGiftPrepared(Lcom/momo/xeengine/gift/GiftPlayer;Lcom/momo/xeengine/gift/GiftEntity;)V

    .line 208
    .line 209
    .line 210
    :cond_5
    return-void
.end method

.method public onStartFailed(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer$2;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/gift/GiftPlayer;->access$100(Lcom/momo/xeengine/gift/GiftPlayer;)Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayer$2;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 8
    .line 9
    new-instance v2, Lcom/momo/xeengine/gift/n;

    .line 10
    .line 11
    invoke-direct {v2, v1}, Lcom/momo/xeengine/gift/n;-><init>(Lcom/momo/xeengine/gift/GiftPlayer;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayer$2;->this$0:Lcom/momo/xeengine/gift/GiftPlayer;

    .line 18
    .line 19
    const/16 v0, 0x6b

    .line 20
    .line 21
    invoke-static {p0, v0, p1}, Lcom/momo/xeengine/gift/GiftPlayer;->access$1100(Lcom/momo/xeengine/gift/GiftPlayer;ILjava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
