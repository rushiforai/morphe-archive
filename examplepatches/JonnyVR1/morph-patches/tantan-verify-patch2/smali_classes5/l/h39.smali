.class public Ll/h39;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static A()I
    .locals 1

    .line 1
    invoke-static {}, Ll/h39;->W()Lcom/p1/mobile/putong/core/data/PrologueConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget v0, v0, Lcom/p1/mobile/putong/core/data/PrologueConfig;->enter_conv_limit:I

    .line 8
    .line 9
    return v0

    .line 10
    :cond_0
    const/4 v0, 0x1

    .line 11
    return v0
.end method

.method public static B(Z)I
    .locals 1

    .line 1
    invoke-static {}, Ll/h39;->W()Lcom/p1/mobile/putong/core/data/PrologueConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget p0, v0, Lcom/p1/mobile/putong/core/data/PrologueConfig;->unreply_daily_show_count:I

    .line 10
    .line 11
    return p0

    .line 12
    :cond_0
    iget p0, v0, Lcom/p1/mobile/putong/core/data/PrologueConfig;->untalked_daily_show_count:I

    .line 13
    .line 14
    return p0

    .line 15
    :cond_1
    const/4 p0, 0x3

    .line 16
    return p0
.end method

.method public static C()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "\u540c\u610f\u914d\u5bf9\u53ef\u65e0\u9650\u804a\u5929\uff08\u5f53\u524d\u6700\u591a\u53d1\u900120\u6761\u6d88\u606f\uff09"

    .line 2
    .line 3
    return-object v0
.end method

.method public static D()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 2
    .line 3
    return-object v0
.end method

.method public static E()I
    .locals 3

    .line 1
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "ice_break_dlg_config"

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/core/data/IceBreakDlgConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->v(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/core/data/IceBreakDlgConfig;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    iget v0, v0, Lcom/p1/mobile/putong/core/data/IceBreakDlgConfig;->maxNum:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    return v0

    .line 24
    :catch_0
    :cond_0
    const/16 v0, 0xa

    .line 25
    .line 26
    return v0
.end method

.method public static F()I
    .locals 3

    .line 1
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "ice_break_dlg_config"

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/core/data/IceBreakDlgConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->v(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/core/data/IceBreakDlgConfig;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    iget v0, v0, Lcom/p1/mobile/putong/core/data/IceBreakDlgConfig;->timeInterval:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    return v0

    .line 24
    :catch_0
    :cond_0
    const/16 v0, 0x30

    .line 25
    .line 26
    return v0
.end method

.method public static G()Z
    .locals 2

    .line 1
    invoke-static {}, Ll/h39;->t()Lcom/p1/mobile/putong/core/data/MsgIcebreakConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/MsgIcebreakConfig;->enable:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    return v0

    .line 17
    :cond_0
    const-string v0, "sticker_show_time"

    .line 18
    .line 19
    invoke-static {v0}, Lcom/p1/mobile/putong/api/ABManager;->i0(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "exp"

    .line 24
    .line 25
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    return v0
.end method

.method public static H()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->De()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method

.method public static I()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->o()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method

.method public static J()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/h39;->W()Lcom/p1/mobile/putong/core/data/PrologueConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/PrologueConfig;->enable:Z

    .line 8
    .line 9
    return v0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    return v0
.end method

.method public static K()Z
    .locals 2

    .line 1
    const-string v0, "fake_to_good"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/api/ABManager;->i0(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "exp"

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "register_channel"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "natural"

    .line 26
    .line 27
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    const/4 v0, 0x1

    .line 34
    return v0

    .line 35
    :cond_0
    const/4 v0, 0x0

    .line 36
    return v0
.end method

.method public static L()Z
    .locals 3

    .line 1
    const-string v0, "groupchat"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/api/ABManager;->i0(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "realname_3"

    .line 8
    .line 9
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_1

    .line 14
    .line 15
    invoke-static {v0}, Lcom/p1/mobile/putong/api/ABManager;->i0(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "anonymous_3"

    .line 20
    .line 21
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 v0, 0x0

    .line 29
    return v0

    .line 30
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 31
    return v0
.end method

.method public static M()Z
    .locals 3

    .line 1
    const-string v0, "batch_icebreak"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/api/ABManager;->i0(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "exp1"

    .line 8
    .line 9
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_1

    .line 14
    .line 15
    invoke-static {v0}, Lcom/p1/mobile/putong/api/ABManager;->i0(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "exp2"

    .line 20
    .line 21
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 v0, 0x0

    .line 29
    return v0

    .line 30
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 31
    return v0
.end method

.method public static N()Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-static {}, Ll/h39;->r()Lcom/p1/mobile/putong/core/data/LoveLetterConfig;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->enable:Z

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move v1, v0

    .line 12
    :goto_0
    if-nez v1, :cond_2

    .line 13
    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-interface {v1}, Ll/r97;->a5()Z

    .line 23
    .line 24
    .line 25
    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_1
    return v0

    .line 30
    :cond_2
    :goto_1
    const/4 v0, 0x1

    .line 31
    :catch_0
    return v0
.end method

.method public static O()Z
    .locals 2

    .line 1
    const-string v0, "male_heartbeat_unactive"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/api/ABManager;->i0(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "exp2"

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method

.method public static P()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->uh()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method

.method public static Q()Z
    .locals 2

    .line 1
    const-string v0, "quick_message"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/api/ABManager;->i0(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "exp"

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method

.method public static R()Z
    .locals 2

    .line 1
    invoke-static {}, Ll/h39;->s()Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-boolean v1, v0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->mainSwitch:Z

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->exchangeAnswerSwitch:Z

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-static {}, Ll/h39;->D()Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    const/4 v0, 0x1

    .line 30
    return v0

    .line 31
    :cond_0
    const/4 v0, 0x0

    .line 32
    return v0
.end method

.method public static S()Z
    .locals 3

    .line 1
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "chat_photo_interaction"

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/core/data/ChatPhotoInteraction;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->v(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/core/data/ChatPhotoInteraction;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/ChatPhotoInteraction;->enable:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    return v0

    .line 24
    :catch_0
    :cond_0
    const/4 v0, 0x0

    .line 25
    return v0
.end method

.method public static T()Z
    .locals 2

    .line 1
    const-string v0, "verified_to_chat"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/api/ABManager;->i0(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "exp"

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method

.method public static U()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->cn()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method

.method public static V()Ljava/lang/String;
    .locals 3

    .line 1
    const-string v0, "\u5207\u6362\u4e0b\u4e00\u4e2a"

    .line 2
    .line 3
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "chat_new_match_config"

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-nez v2, :cond_0

    .line 18
    .line 19
    new-instance v2, Lorg/json/JSONObject;

    .line 20
    .line 21
    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const-string v1, "content"

    .line 25
    .line 26
    invoke-virtual {v2, v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    :catch_0
    :cond_0
    return-object v0
.end method

.method public static W()Lcom/p1/mobile/putong/core/data/PrologueConfig;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return-object v0
.end method

.method public static X()Z
    .locals 2

    .line 1
    invoke-static {}, Ll/h39;->s()Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-boolean v1, v0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->mainSwitch:Z

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->integration:Lcom/p1/mobile/putong/core/data/MessageIntegration;

    .line 16
    .line 17
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/MessageIntegration;->enable:Z

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    return v0

    .line 23
    :cond_0
    const/4 v0, 0x0

    .line 24
    return v0
.end method

.method public static Y()Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;
    .locals 3

    .line 1
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "spry_emoji_args_config"

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->v(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    return-object v0

    .line 22
    :catch_0
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;->new_()Lcom/p1/mobile/putong/core/data/SpryEmojiArgsConfig;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    return-object v0
.end method

.method public static a()Z
    .locals 2

    .line 1
    invoke-static {}, Ll/h39;->s()Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-boolean v1, v0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->mainSwitch:Z

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->breakIceGuide:Lcom/p1/mobile/putong/core/data/MessageBreakIce;

    .line 16
    .line 17
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/MessageBreakIce;->enable:Z

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    return v0

    .line 23
    :cond_0
    const/4 v0, 0x0

    .line 24
    return v0
.end method

.method public static b()Z
    .locals 2

    .line 1
    invoke-static {}, Ll/h39;->s()Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-boolean v1, v0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->mainSwitch:Z

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-boolean v1, v0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->exchangeAnswerSwitch:Z

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->breakIceGuide:Lcom/p1/mobile/putong/core/data/MessageBreakIce;

    .line 20
    .line 21
    iget-boolean v1, v0, Lcom/p1/mobile/putong/core/data/MessageBreakIce;->enable:Z

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/MessageBreakIce;->exchangeAnswerEnable:Z

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-static {}, Ll/h39;->D()Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_0

    .line 38
    .line 39
    const/4 v0, 0x1

    .line 40
    return v0

    .line 41
    :cond_0
    const/4 v0, 0x0

    .line 42
    return v0
.end method

.method public static c()Z
    .locals 2

    .line 1
    invoke-static {}, Ll/h39;->s()Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->mainSwitch:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    return v0

    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    return v0
.end method

.method public static d()Z
    .locals 2

    .line 1
    invoke-static {}, Ll/h39;->s()Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-boolean v1, v0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->mainSwitch:Z

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->directlyToPicLikeDialog:Z

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    return v0

    .line 21
    :cond_0
    const/4 v0, 0x0

    .line 22
    return v0
.end method

.method public static e()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->iq()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method

.method public static f()Z
    .locals 2

    .line 1
    const-string v0, "friend_active_remind_female"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/api/ABManager;->i0(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "exp"

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method

.method public static g()Lcom/p1/mobile/putong/core/data/AiPictureConfig;
    .locals 3

    .line 1
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "ai_picture_config"

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/core/data/AiPictureConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->v(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/core/data/AiPictureConfig;
    :try_end_0
    .catch Lcom/p1/mobile/putong/remote_config/RemoteConfigException; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catch_0
    const/4 v0, 0x0

    .line 17
    :goto_0
    if-nez v0, :cond_0

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/data/AiPictureConfig;->new_()Lcom/p1/mobile/putong/core/data/AiPictureConfig;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v1, 0x0

    .line 24
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/AiPictureConfig;->exp:Z

    .line 25
    .line 26
    const/4 v1, 0x7

    .line 27
    iput v1, v0, Lcom/p1/mobile/putong/core/data/AiPictureConfig;->timeout:I

    .line 28
    .line 29
    const/4 v1, 0x5

    .line 30
    iput v1, v0, Lcom/p1/mobile/putong/core/data/AiPictureConfig;->quick_access_limit:I

    .line 31
    .line 32
    :cond_0
    return-object v0
.end method

.method public static h()Lcom/p1/mobile/putong/core/data/ChatInviteToVerifyConfig;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return-object v0
.end method

.method public static i()Lcom/p1/mobile/putong/core/data/CityCentreConfig;
    .locals 3

    .line 1
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "city_c_config"

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/core/data/CityCentreConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->v(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/core/data/CityCentreConfig;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    return-object v0

    .line 16
    :catch_0
    const/4 v0, 0x0

    .line 17
    return-object v0
.end method

.method public static j(Z)Ljava/lang/String;
    .locals 4

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "moment_greeting_say_hi"

    .line 8
    .line 9
    sget-object v3, Lcom/p1/mobile/putong/core/data/GreetGuideData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 10
    .line 11
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->v(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Lcom/p1/mobile/putong/core/data/GreetGuideData;

    .line 16
    .line 17
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 20
    .line 21
    invoke-virtual {v2}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-eqz v3, :cond_1

    .line 30
    .line 31
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-eqz v3, :cond_1

    .line 36
    .line 37
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/GreetGuideData;->male:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    if-nez v3, :cond_1

    .line 44
    .line 45
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/GreetGuideData;->female:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    if-nez v3, :cond_1

    .line 52
    .line 53
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-eqz v2, :cond_0

    .line 58
    .line 59
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/GreetGuideData;->female:Ljava/util/List;

    .line 60
    .line 61
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    invoke-static {v2}, Ll/gkc0;->b(I)I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    check-cast v1, Ljava/lang/String;

    .line 74
    .line 75
    :goto_0
    move-object v0, v1

    .line 76
    goto :goto_1

    .line 77
    :catch_0
    move-exception p0

    .line 78
    goto :goto_3

    .line 79
    :cond_0
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/GreetGuideData;->male:Ljava/util/List;

    .line 80
    .line 81
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    invoke-static {v2}, Ll/gkc0;->b(I)I

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    check-cast v1, Ljava/lang/String;

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_1
    :goto_1
    const-string v1, "{{gender}}"

    .line 97
    .line 98
    if-eqz p0, :cond_2

    .line 99
    .line 100
    const-string p0, "\u5979"

    .line 101
    .line 102
    goto :goto_2

    .line 103
    :cond_2
    const-string p0, "\u4ed6"

    .line 104
    .line 105
    :goto_2
    invoke-virtual {v0, v1, p0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p0
    :try_end_0
    .catch Lcom/p1/mobile/putong/remote_config/RemoteConfigException; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    return-object p0

    .line 110
    :goto_3
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 111
    .line 112
    .line 113
    return-object v0
.end method

.method public static k()Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;
    .locals 3

    .line 1
    invoke-static {}, Ll/h39;->t()Lcom/p1/mobile/putong/core/data/MsgIcebreakConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_4

    .line 10
    .line 11
    iget-boolean v1, v0, Lcom/p1/mobile/putong/core/data/MsgIcebreakConfig;->enable:Z

    .line 12
    .line 13
    if-eqz v1, :cond_4

    .line 14
    .line 15
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 18
    .line 19
    invoke-virtual {v1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MsgIcebreakConfig;->femaleType:Ljava/lang/String;

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MsgIcebreakConfig;->maleType:Ljava/lang/String;

    .line 33
    .line 34
    :goto_0
    sget-object v1, Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;->ALL:Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;->getValue()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-eqz v2, :cond_1

    .line 45
    .line 46
    return-object v1

    .line 47
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;->NONE:Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;

    .line 48
    .line 49
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;->getValue()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-eqz v2, :cond_2

    .line 58
    .line 59
    return-object v1

    .line 60
    :cond_2
    sget-object v1, Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;->TEXT_BREAK:Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;

    .line 61
    .line 62
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;->getValue()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-eqz v2, :cond_3

    .line 71
    .line 72
    return-object v1

    .line 73
    :cond_3
    sget-object v1, Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;->STICKER_BREAK:Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;

    .line 74
    .line 75
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;->getValue()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-eqz v0, :cond_4

    .line 84
    .line 85
    return-object v1

    .line 86
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;->ALL:Lcom/p1/mobile/putong/core/message/inner/data/MsgIcebreakType;

    .line 87
    .line 88
    return-object v0
.end method

.method public static l()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/MessageIntegrationItem;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/h39;->s()Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->integration:Lcom/p1/mobile/putong/core/data/MessageIntegration;

    .line 12
    .line 13
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;->integration:Lcom/p1/mobile/putong/core/data/MessageIntegration;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageIntegration;->items:Ljava/util/List;

    .line 22
    .line 23
    return-object v0

    .line 24
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 27
    .line 28
    .line 29
    return-object v0
.end method

.method public static m()I
    .locals 1

    .line 1
    invoke-static {}, Ll/h39;->r()Lcom/p1/mobile/putong/core/data/LoveLetterConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget v0, v0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->chat_guide_interval:I

    .line 8
    .line 9
    return v0

    .line 10
    :cond_0
    const/4 v0, 0x2

    .line 11
    return v0
.end method

.method public static n()I
    .locals 1

    .line 1
    invoke-static {}, Ll/h39;->r()Lcom/p1/mobile/putong/core/data/LoveLetterConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget v0, v0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->chat_guide_trigger_mm:I

    .line 8
    .line 9
    return v0

    .line 10
    :cond_0
    const/4 v0, 0x5

    .line 11
    return v0
.end method

.method public static o()I
    .locals 1

    .line 1
    invoke-static {}, Ll/h39;->r()Lcom/p1/mobile/putong/core/data/LoveLetterConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget v0, v0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->chat_guide_trigger_message_count:I

    .line 8
    .line 9
    return v0

    .line 10
    :cond_0
    const/4 v0, 0x2

    .line 11
    return v0
.end method

.method public static p()I
    .locals 1

    .line 1
    invoke-static {}, Ll/h39;->r()Lcom/p1/mobile/putong/core/data/LoveLetterConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget v0, v0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->chat_guide_trigger_time_no_response:I

    .line 8
    .line 9
    return v0

    .line 10
    :cond_0
    const/4 v0, 0x2

    .line 11
    return v0
.end method

.method public static q()I
    .locals 1

    .line 1
    invoke-static {}, Ll/h39;->r()Lcom/p1/mobile/putong/core/data/LoveLetterConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget v0, v0, Lcom/p1/mobile/putong/core/data/LoveLetterConfig;->chat_guide_trigger_time_window:I

    .line 8
    .line 9
    return v0

    .line 10
    :cond_0
    const/16 v0, 0x30

    .line 11
    .line 12
    return v0
.end method

.method public static r()Lcom/p1/mobile/putong/core/data/LoveLetterConfig;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return-object v0
.end method

.method public static s()Lcom/p1/mobile/putong/core/data/MessageRedesignBreakIceGuide;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return-object v0
.end method

.method public static t()Lcom/p1/mobile/putong/core/data/MsgIcebreakConfig;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    return-object v0
.end method

.method public static u()Lcom/p1/mobile/putong/core/data/MsgIcebreakConfigV2;
    .locals 3

    .line 1
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "msg_ice_break_config_v2"

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/core/data/MsgIcebreakConfigV2;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->v(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/core/data/MsgIcebreakConfigV2;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catch_0
    const/4 v0, 0x0

    .line 17
    :goto_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    return-object v0

    .line 24
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MsgIcebreakConfigV2;->new_()Lcom/p1/mobile/putong/core/data/MsgIcebreakConfigV2;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const/4 v1, 0x0

    .line 29
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/MsgIcebreakConfigV2;->enable:Z

    .line 30
    .line 31
    return-object v0
.end method

.method public static v()Lcom/p1/mobile/putong/core/data/OptimizeRecommendStickerConfig;
    .locals 3

    .line 1
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "optimize_recommend_sticker_config"

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/core/data/OptimizeRecommendStickerConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->v(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/core/data/OptimizeRecommendStickerConfig;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    return-object v0

    .line 22
    :catch_0
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/data/OptimizeRecommendStickerConfig;->new_()Lcom/p1/mobile/putong/core/data/OptimizeRecommendStickerConfig;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    return-object v0
.end method

.method public static w()I
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "vas_platinum_top_message_guide_max_show_per_conv"

    .line 6
    .line 7
    const/4 v2, 0x2

    .line 8
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->z(Ljava/lang/String;I)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    return v0
.end method

.method public static x()I
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "vas_platinum_top_message_guide_max_show"

    .line 6
    .line 7
    const/16 v2, 0x14

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->z(Ljava/lang/String;I)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method

.method public static y()J
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "intl_premuim_match_tag_show_start_time"

    .line 6
    .line 7
    const-wide v2, 0x1914c77b800L

    .line 8
    .line 9
    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->B(Ljava/lang/String;J)J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    return-wide v0
.end method

.method public static z(Z)I
    .locals 1

    .line 1
    invoke-static {}, Ll/h39;->W()Lcom/p1/mobile/putong/core/data/PrologueConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget p0, v0, Lcom/p1/mobile/putong/core/data/PrologueConfig;->unreply_show_days_count:I

    .line 10
    .line 11
    return p0

    .line 12
    :cond_0
    iget p0, v0, Lcom/p1/mobile/putong/core/data/PrologueConfig;->untalked_show_days_count:I

    .line 13
    .line 14
    return p0

    .line 15
    :cond_1
    const/4 p0, 0x3

    .line 16
    return p0
.end method
