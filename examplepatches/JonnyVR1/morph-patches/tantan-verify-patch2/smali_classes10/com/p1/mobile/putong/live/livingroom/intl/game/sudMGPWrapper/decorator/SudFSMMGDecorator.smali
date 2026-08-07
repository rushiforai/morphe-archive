.class public Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltech/sud/gip/core/ISudFSMMG;


# instance fields
.field private final sudFSMMGCache:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;

.field private sudFSMMGListener:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;->sudFSMMGCache:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public destroyMG()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;->sudFSMMGCache:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->destroyMG()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;->sudFSMMGListener:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;

    .line 8
    .line 9
    return-void
.end method

.method public getCaptainUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;->sudFSMMGCache:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->getCaptainUserId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getGameState()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;->sudFSMMGCache:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->getGameState()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getPlayerInNumber()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;->sudFSMMGCache:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->getPlayerInNumber()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getSudFSMMGCache()Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;->sudFSMMGCache:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;

    .line 2
    .line 3
    return-object p0
.end method

.method public isHitBomb()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;->sudFSMMGCache:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->isHitBomb()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public onExpireCode(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;->sudFSMMGListener:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onExpireCode(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onGameDestroyed()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;->sudFSMMGListener:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameDestroyed()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onGameLoadingProgress(III)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;->sudFSMMGListener:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameLoadingProgress(III)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onGameLog(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;->sudFSMMGListener:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameLog(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onGameStarted()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;->sudFSMMGListener:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameStarted()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onGameStateChange(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;->sudFSMMGListener:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;

    if-eqz v0, :cond_0

    .line 2
    invoke-interface {v0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameStateChange(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    .line 3
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/4 v2, -0x1

    sparse-switch v1, :sswitch_data_0

    goto/16 :goto_0

    :sswitch_0
    const-string v1, "mg_common_game_player_icon_position"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_1

    goto/16 :goto_0

    :cond_1
    const/16 v2, 0x5c

    goto/16 :goto_0

    :sswitch_1
    const-string v1, "mg_common_game_player_scores"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_2

    goto/16 :goto_0

    :cond_2
    const/16 v2, 0x5b

    goto/16 :goto_0

    :sswitch_2
    const-string v1, "mg_common_game_create_order"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_3

    goto/16 :goto_0

    :cond_3
    const/16 v2, 0x5a

    goto/16 :goto_0

    :sswitch_3
    const-string v1, "mg_common_game_settle"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_4

    goto/16 :goto_0

    :cond_4
    const/16 v2, 0x59

    goto/16 :goto_0

    :sswitch_4
    const-string v1, "mg_common_game_ui_custom_config"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_5

    goto/16 :goto_0

    :cond_5
    const/16 v2, 0x58

    goto/16 :goto_0

    :sswitch_5
    const-string v1, "mg_custom_cr_click_seat"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_6

    goto/16 :goto_0

    :cond_6
    const/16 v2, 0x57

    goto/16 :goto_0

    :sswitch_6
    const-string v1, "mg_baseball_range_info"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_7

    goto/16 :goto_0

    :cond_7
    const/16 v2, 0x56

    goto/16 :goto_0

    :sswitch_7
    const-string v1, "mg_common_game_settings"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_8

    goto/16 :goto_0

    :cond_8
    const/16 v2, 0x55

    goto/16 :goto_0

    :sswitch_8
    const-string v1, "mg_common_game_prepare_finish"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_9

    goto/16 :goto_0

    :cond_9
    const/16 v2, 0x54

    goto/16 :goto_0

    :sswitch_9
    const-string v1, "mg_custom_rocket_create_model"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_a

    goto/16 :goto_0

    :cond_a
    const/16 v2, 0x53

    goto/16 :goto_0

    :sswitch_a
    const-string v1, "mg_common_hide_game_scene"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_b

    goto/16 :goto_0

    :cond_b
    const/16 v2, 0x52

    goto/16 :goto_0

    :sswitch_b
    const-string v1, "mg_custom_rocket_fire_model"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_c

    goto/16 :goto_0

    :cond_c
    const/16 v2, 0x51

    goto/16 :goto_0

    :sswitch_c
    const-string v1, "mg_common_users_info"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_d

    goto/16 :goto_0

    :cond_d
    const/16 v2, 0x50

    goto/16 :goto_0

    :sswitch_d
    const-string v1, "mg_baseball_ranking"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_e

    goto/16 :goto_0

    :cond_e
    const/16 v2, 0x4f

    goto/16 :goto_0

    :sswitch_e
    const-string v1, "mg_custom_rocket_room_record_list"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_f

    goto/16 :goto_0

    :cond_f
    const/16 v2, 0x4e

    goto/16 :goto_0

    :sswitch_f
    const-string v1, "mg_baseball_hide_game_scene"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_10

    goto/16 :goto_0

    :cond_10
    const/16 v2, 0x4d

    goto/16 :goto_0

    :sswitch_10
    const-string v1, "mg_custom_rocket_fly_click"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_11

    goto/16 :goto_0

    :cond_11
    const/16 v2, 0x4c

    goto/16 :goto_0

    :sswitch_11
    const-string v1, "mg_custom_rocket_set_default_model"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_12

    goto/16 :goto_0

    :cond_12
    const/16 v2, 0x4b

    goto/16 :goto_0

    :sswitch_12
    const-string v1, "mg_common_game_player_monopoly_cards"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_13

    goto/16 :goto_0

    :cond_13
    const/16 v2, 0x4a

    goto/16 :goto_0

    :sswitch_13
    const-string v1, "mg_common_game_player_pair_singular"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_14

    goto/16 :goto_0

    :cond_14
    const/16 v2, 0x49

    goto/16 :goto_0

    :sswitch_14
    const-string v1, "mg_common_self_microphone"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_15

    goto/16 :goto_0

    :cond_15
    const/16 v2, 0x48

    goto/16 :goto_0

    :sswitch_15
    const-string v1, "mg_common_game_money_not_enough"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_16

    goto/16 :goto_0

    :cond_16
    const/16 v2, 0x47

    goto/16 :goto_0

    :sswitch_16
    const-string v1, "mg_common_game_over_tip"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_17

    goto/16 :goto_0

    :cond_17
    const/16 v2, 0x46

    goto/16 :goto_0

    :sswitch_17
    const-string v1, "mg_common_game_disco_action_end"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_18

    goto/16 :goto_0

    :cond_18
    const/16 v2, 0x45

    goto/16 :goto_0

    :sswitch_18
    const-string v1, "mg_baseball_defualt_state"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_19

    goto/16 :goto_0

    :cond_19
    const/16 v2, 0x44

    goto/16 :goto_0

    :sswitch_19
    const-string v1, "mg_custom_rocket_dynamic_fire_price"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_1a

    goto/16 :goto_0

    :cond_1a
    const/16 v2, 0x43

    goto/16 :goto_0

    :sswitch_1a
    const-string v1, "mg_custom_rocket_order_record_list"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_1b

    goto/16 :goto_0

    :cond_1b
    const/16 v2, 0x42

    goto/16 :goto_0

    :sswitch_1b
    const-string v1, "mg_custom_rocket_user_record_list"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_1c

    goto/16 :goto_0

    :cond_1c
    const/16 v2, 0x41

    goto/16 :goto_0

    :sswitch_1c
    const-string v1, "mg_custom_rocket_verify_sign"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_1d

    goto/16 :goto_0

    :cond_1d
    const/16 v2, 0x40

    goto/16 :goto_0

    :sswitch_1d
    const-string v1, "mg_common_game_send_burst_word"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_1e

    goto/16 :goto_0

    :cond_1e
    const/16 v2, 0x3f

    goto/16 :goto_0

    :sswitch_1e
    const-string v1, "mg_common_self_click_game_settle_close_btn"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_1f

    goto/16 :goto_0

    :cond_1f
    const/16 v2, 0x3e

    goto/16 :goto_0

    :sswitch_1f
    const-string v1, "mg_common_game_add_ai_players"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_20

    goto/16 :goto_0

    :cond_20
    const/16 v2, 0x3d

    goto/16 :goto_0

    :sswitch_20
    const-string v1, "mg_common_game_is_app_chip"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_21

    goto/16 :goto_0

    :cond_21
    const/16 v2, 0x3c

    goto/16 :goto_0

    :sswitch_21
    const-string v1, "mg_custom_rocket_replace_component"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_22

    goto/16 :goto_0

    :cond_22
    const/16 v2, 0x3b

    goto/16 :goto_0

    :sswitch_22
    const-string v1, "mg_custom_rocket_buy_component"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_23

    goto/16 :goto_0

    :cond_23
    const/16 v2, 0x3a

    goto/16 :goto_0

    :sswitch_23
    const-string v1, "mg_common_show_game_scene"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_24

    goto/16 :goto_0

    :cond_24
    const/16 v2, 0x39

    goto/16 :goto_0

    :sswitch_24
    const-string v1, "mg_common_game_get_score"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_25

    goto/16 :goto_0

    :cond_25
    const/16 v2, 0x38

    goto/16 :goto_0

    :sswitch_25
    const-string v1, "mg_common_self_click_join_btn"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_26

    goto/16 :goto_0

    :cond_26
    const/16 v2, 0x37

    goto/16 :goto_0

    :sswitch_26
    const-string v1, "mg_custom_rocket_click_lock_component"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_27

    goto/16 :goto_0

    :cond_27
    const/16 v2, 0x36

    goto/16 :goto_0

    :sswitch_27
    const-string v1, "mg_baseball_show_game_scene"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_28

    goto/16 :goto_0

    :cond_28
    const/16 v2, 0x35

    goto/16 :goto_0

    :sswitch_28
    const-string v1, "mg_common_game_player_ranks"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_29

    goto/16 :goto_0

    :cond_29
    const/16 v2, 0x34

    goto/16 :goto_0

    :sswitch_29
    const-string v1, "mg_common_game_piece_arrive_end"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_2a

    goto/16 :goto_0

    :cond_2a
    const/16 v2, 0x33

    goto/16 :goto_0

    :sswitch_2a
    const-string v1, "mg_baseball_send_distance"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_2b

    goto/16 :goto_0

    :cond_2b
    const/16 v2, 0x32

    goto/16 :goto_0

    :sswitch_2b
    const-string v1, "mg_custom_rocket_save_sign_color"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_2c

    goto/16 :goto_0

    :cond_2c
    const/16 v2, 0x31

    goto/16 :goto_0

    :sswitch_2c
    const-string v1, "mg_common_game_player_color"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_2d

    goto/16 :goto_0

    :cond_2d
    const/16 v2, 0x30

    goto/16 :goto_0

    :sswitch_2d
    const-string v1, "mg_common_game_set_score"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_2e

    goto/16 :goto_0

    :cond_2e
    const/16 v2, 0x2f

    goto/16 :goto_0

    :sswitch_2e
    const-string v1, "mg_baseball_text_config"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_2f

    goto/16 :goto_0

    :cond_2f
    const/16 v2, 0x2e

    goto/16 :goto_0

    :sswitch_2f
    const-string v1, "mg_common_set_click_rect"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_30

    goto/16 :goto_0

    :cond_30
    const/16 v2, 0x2d

    goto/16 :goto_0

    :sswitch_30
    const-string v1, "mg_common_game_sound_list"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_31

    goto/16 :goto_0

    :cond_31
    const/16 v2, 0x2c

    goto/16 :goto_0

    :sswitch_31
    const-string v1, "mg_common_self_click_game_settle_again_btn"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_32

    goto/16 :goto_0

    :cond_32
    const/16 v2, 0x2b

    goto/16 :goto_0

    :sswitch_32
    const-string v1, "mg_custom_cr_room_init_data"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_33

    goto/16 :goto_0

    :cond_33
    const/16 v2, 0x2a

    goto/16 :goto_0

    :sswitch_33
    const-string v1, "mg_custom_rocket_hide_game_scene"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_34

    goto/16 :goto_0

    :cond_34
    const/16 v2, 0x29

    goto/16 :goto_0

    :sswitch_34
    const-string v1, "mg_common_game_state"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_35

    goto/16 :goto_0

    :cond_35
    const/16 v2, 0x28

    goto/16 :goto_0

    :sswitch_35
    const-string v1, "mg_common_game_sound"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_36

    goto/16 :goto_0

    :cond_36
    const/16 v2, 0x27

    goto/16 :goto_0

    :sswitch_36
    const-string v1, "mg_common_game_player_managed_state"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_37

    goto/16 :goto_0

    :cond_37
    const/16 v2, 0x26

    goto/16 :goto_0

    :sswitch_37
    const-string v1, "mg_common_game_bg_music_state"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_38

    goto/16 :goto_0

    :cond_38
    const/16 v2, 0x25

    goto/16 :goto_0

    :sswitch_38
    const-string v1, "mg_common_worst_teammate"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_39

    goto/16 :goto_0

    :cond_39
    const/16 v2, 0x24

    goto/16 :goto_0

    :sswitch_39
    const-string v1, "mg_custom_rocket_play_effect_start"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_3a

    goto/16 :goto_0

    :cond_3a
    const/16 v2, 0x23

    goto/16 :goto_0

    :sswitch_3a
    const-string v1, "mg_common_self_click_ready_btn"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_3b

    goto/16 :goto_0

    :cond_3b
    const/16 v2, 0x22

    goto/16 :goto_0

    :sswitch_3b
    const-string v1, "mg_common_key_word_to_hit"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_3c

    goto/16 :goto_0

    :cond_3c
    const/16 v2, 0x21

    goto/16 :goto_0

    :sswitch_3c
    const-string v1, "mg_common_player_role_id"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_3d

    goto/16 :goto_0

    :cond_3d
    const/16 v2, 0x20

    goto/16 :goto_0

    :sswitch_3d
    const-string v1, "mg_common_self_click_gold_btn"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_3e

    goto/16 :goto_0

    :cond_3e
    const/16 v2, 0x1f

    goto/16 :goto_0

    :sswitch_3e
    const-string v1, "mg_custom_rocket_model_list"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_3f

    goto/16 :goto_0

    :cond_3f
    const/16 v2, 0x1e

    goto/16 :goto_0

    :sswitch_3f
    const-string v1, "mg_common_self_click_exit_game_btn"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_40

    goto/16 :goto_0

    :cond_40
    const/16 v2, 0x1d

    goto/16 :goto_0

    :sswitch_40
    const-string v1, "mg_custom_rocket_config"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_41

    goto/16 :goto_0

    :cond_41
    const/16 v2, 0x1c

    goto/16 :goto_0

    :sswitch_41
    const-string v1, "mg_common_self_click_share_btn"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_42

    goto/16 :goto_0

    :cond_42
    const/16 v2, 0x1b

    goto/16 :goto_0

    :sswitch_42
    const-string v1, "mg_baseball_set_click_rect"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_43

    goto/16 :goto_0

    :cond_43
    const/16 v2, 0x1a

    goto/16 :goto_0

    :sswitch_43
    const-string v1, "mg_common_self_click_cancel_ready_btn"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_44

    goto/16 :goto_0

    :cond_44
    const/16 v2, 0x19

    goto/16 :goto_0

    :sswitch_44
    const-string v1, "mg_common_public_message"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_45

    goto/16 :goto_0

    :cond_45
    const/16 v2, 0x18

    goto/16 :goto_0

    :sswitch_45
    const-string v1, "mg_custom_rocket_component_list"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_46

    goto/16 :goto_0

    :cond_46
    const/16 v2, 0x17

    goto/16 :goto_0

    :sswitch_46
    const-string v1, "mg_custom_rocket_fly_end"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_47

    goto/16 :goto_0

    :cond_47
    const/16 v2, 0x16

    goto/16 :goto_0

    :sswitch_47
    const-string v1, "mg_baseball_prepare_finish"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_48

    goto/16 :goto_0

    :cond_48
    const/16 v2, 0x15

    goto/16 :goto_0

    :sswitch_48
    const-string v1, "mg_custom_rocket_user_info"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_49

    goto/16 :goto_0

    :cond_49
    const/16 v2, 0x14

    goto/16 :goto_0

    :sswitch_49
    const-string v1, "mg_common_alert"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_4a

    goto/16 :goto_0

    :cond_4a
    const/16 v2, 0x13

    goto/16 :goto_0

    :sswitch_4a
    const-string v1, "mg_common_app_common_self_x_resp"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_4b

    goto/16 :goto_0

    :cond_4b
    const/16 v2, 0x12

    goto/16 :goto_0

    :sswitch_4b
    const-string v1, "mg_custom_rocket_show_game_scene"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_4c

    goto/16 :goto_0

    :cond_4c
    const/16 v2, 0x11

    goto/16 :goto_0

    :sswitch_4c
    const-string v1, "mg_common_self_click_poop"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_4d

    goto/16 :goto_0

    :cond_4d
    const/16 v2, 0x10

    goto/16 :goto_0

    :sswitch_4d
    const-string v1, "mg_common_self_click_good"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_4e

    goto/16 :goto_0

    :cond_4e
    const/16 v2, 0xf

    goto/16 :goto_0

    :sswitch_4e
    const-string v1, "mg_baseball_my_ranking"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_4f

    goto/16 :goto_0

    :cond_4f
    const/16 v2, 0xe

    goto/16 :goto_0

    :sswitch_4f
    const-string v1, "mg_common_game_rule"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_50

    goto/16 :goto_0

    :cond_50
    const/16 v2, 0xd

    goto/16 :goto_0

    :sswitch_50
    const-string v1, "mg_custom_rocket_upload_model_icon"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_51

    goto/16 :goto_0

    :cond_51
    const/16 v2, 0xc

    goto/16 :goto_0

    :sswitch_51
    const-string v1, "mg_common_game_network_state"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_52

    goto/16 :goto_0

    :cond_52
    const/16 v2, 0xb

    goto/16 :goto_0

    :sswitch_52
    const-string v1, "mg_common_self_click_start_btn"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_53

    goto/16 :goto_0

    :cond_53
    const/16 v2, 0xa

    goto/16 :goto_0

    :sswitch_53
    const-string v1, "mg_common_self_headphone"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_54

    goto/16 :goto_0

    :cond_54
    const/16 v2, 0x9

    goto/16 :goto_0

    :sswitch_54
    const-string v1, "mg_common_destroy_game_scene"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_55

    goto/16 :goto_0

    :cond_55
    const/16 v2, 0x8

    goto/16 :goto_0

    :sswitch_55
    const-string v1, "mg_custom_rocket_set_click_rect"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_56

    goto :goto_0

    :cond_56
    const/4 v2, 0x7

    goto :goto_0

    :sswitch_56
    const-string v1, "mg_common_self_click_cancel_join_btn"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_57

    goto :goto_0

    :cond_57
    const/4 v2, 0x6

    goto :goto_0

    :sswitch_57
    const-string v1, "mg_custom_rocket_prepare_finish"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_58

    goto :goto_0

    :cond_58
    const/4 v2, 0x5

    goto :goto_0

    :sswitch_58
    const-string v1, "mg_custom_rocket_play_effect_finish"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_59

    goto :goto_0

    :cond_59
    const/4 v2, 0x4

    goto :goto_0

    :sswitch_59
    const-string v1, "mg_common_game_sound_state"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_5a

    goto :goto_0

    :cond_5a
    const/4 v2, 0x3

    goto :goto_0

    :sswitch_5a
    const-string v1, "mg_common_game_disco_action"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_5b

    goto :goto_0

    :cond_5b
    const/4 v2, 0x2

    goto :goto_0

    :sswitch_5b
    const-string v1, "mg_common_game_fps"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_5c

    goto :goto_0

    :cond_5c
    const/4 v2, 0x1

    goto :goto_0

    :sswitch_5c
    const-string v1, "mg_common_game_asr"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_5d

    goto :goto_0

    :cond_5d
    const/4 v2, 0x0

    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 4
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 5
    :pswitch_0
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGamePlayerIconPosition;

    .line 6
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGamePlayerIconPosition;

    if-nez v0, :cond_5e

    .line 7
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 8
    :cond_5e
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonGamePlayerIconPosition(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGamePlayerIconPosition;)V

    return-void

    .line 9
    :pswitch_1
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGamePlayerScores;

    .line 10
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGamePlayerScores;

    if-nez v0, :cond_5f

    .line 11
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 12
    :cond_5f
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonGamePlayerScores(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGamePlayerScores;)V

    return-void

    .line 13
    :pswitch_2
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameCreateOrder;

    .line 14
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameCreateOrder;

    if-nez v0, :cond_60

    .line 15
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 16
    :cond_60
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonGameCreateOrder(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameCreateOrder;)V

    return-void

    .line 17
    :pswitch_3
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameSettle;

    .line 18
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameSettle;

    if-nez v0, :cond_61

    .line 19
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 20
    :cond_61
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonGameSettle(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameSettle;)V

    return-void

    .line 21
    :pswitch_4
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameUiCustomConfig;

    .line 22
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameUiCustomConfig;

    if-nez v0, :cond_62

    .line 23
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 24
    :cond_62
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonGameUiCustomConfig(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameUiCustomConfig;)V

    return-void

    .line 25
    :pswitch_5
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomCrClickSeat;

    .line 26
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomCrClickSeat;

    if-nez v0, :cond_63

    .line 27
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 28
    :cond_63
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCustomCrClickSeat(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomCrClickSeat;)V

    return-void

    .line 29
    :pswitch_6
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGBaseballRangeInfo;

    .line 30
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGBaseballRangeInfo;

    if-nez v0, :cond_64

    .line 31
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 32
    :cond_64
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGBaseballRangeInfo(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGBaseballRangeInfo;)V

    return-void

    .line 33
    :pswitch_7
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameSettings;

    .line 34
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameSettings;

    if-nez v0, :cond_65

    .line 35
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 36
    :cond_65
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonGameSettings(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameSettings;)V

    return-void

    .line 37
    :pswitch_8
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGamePrepareFinish;

    .line 38
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGamePrepareFinish;

    if-nez v0, :cond_66

    .line 39
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 40
    :cond_66
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonGamePrepareFinish(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGamePrepareFinish;)V

    return-void

    .line 41
    :pswitch_9
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketCreateModel;

    .line 42
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketCreateModel;

    if-nez v0, :cond_67

    .line 43
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 44
    :cond_67
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCustomRocketCreateModel(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketCreateModel;)V

    return-void

    .line 45
    :pswitch_a
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonHideGameScene;

    .line 46
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonHideGameScene;

    if-nez v0, :cond_68

    .line 47
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 48
    :cond_68
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonHideGameScene(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonHideGameScene;)V

    return-void

    .line 49
    :pswitch_b
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketFireModel;

    .line 50
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketFireModel;

    if-nez v0, :cond_69

    .line 51
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 52
    :cond_69
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCustomRocketFireModel(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketFireModel;)V

    return-void

    .line 53
    :pswitch_c
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonUsersInfo;

    .line 54
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonUsersInfo;

    if-nez v0, :cond_6a

    .line 55
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 56
    :cond_6a
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonUsersInfo(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonUsersInfo;)V

    return-void

    .line 57
    :pswitch_d
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGBaseballRanking;

    .line 58
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGBaseballRanking;

    if-nez v0, :cond_6b

    .line 59
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 60
    :cond_6b
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGBaseballRanking(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGBaseballRanking;)V

    return-void

    .line 61
    :pswitch_e
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketRoomRecordList;

    .line 62
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketRoomRecordList;

    if-nez v0, :cond_6c

    .line 63
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 64
    :cond_6c
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCustomRocketRoomRecordList(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketRoomRecordList;)V

    return-void

    .line 65
    :pswitch_f
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGBaseballHideGameScene;

    .line 66
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGBaseballHideGameScene;

    if-nez v0, :cond_6d

    .line 67
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 68
    :cond_6d
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGBaseballHideGameScene(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGBaseballHideGameScene;)V

    return-void

    .line 69
    :pswitch_10
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketFlyClick;

    .line 70
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketFlyClick;

    if-nez v0, :cond_6e

    .line 71
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 72
    :cond_6e
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCustomRocketFlyClick(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketFlyClick;)V

    return-void

    .line 73
    :pswitch_11
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketSetDefaultModel;

    .line 74
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketSetDefaultModel;

    if-nez v0, :cond_6f

    .line 75
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 76
    :cond_6f
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCustomRocketSetDefaultModel(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketSetDefaultModel;)V

    return-void

    .line 77
    :pswitch_12
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGamePlayerMonopolyCards;

    .line 78
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGamePlayerMonopolyCards;

    if-nez v0, :cond_70

    .line 79
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 80
    :cond_70
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonGamePlayerMonopolyCards(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGamePlayerMonopolyCards;)V

    return-void

    .line 81
    :pswitch_13
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGamePlayerPairSingular;

    .line 82
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGamePlayerPairSingular;

    if-nez v0, :cond_71

    .line 83
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 84
    :cond_71
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonGamePlayerPairSingular(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGamePlayerPairSingular;)V

    return-void

    .line 85
    :pswitch_14
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfMicrophone;

    .line 86
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfMicrophone;

    if-nez v0, :cond_72

    .line 87
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 88
    :cond_72
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonSelfMicrophone(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfMicrophone;)V

    return-void

    .line 89
    :pswitch_15
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameMoneyNotEnough;

    .line 90
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameMoneyNotEnough;

    if-nez v0, :cond_73

    .line 91
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 92
    :cond_73
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonGameMoneyNotEnough(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameMoneyNotEnough;)V

    return-void

    .line 93
    :pswitch_16
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameOverTip;

    .line 94
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameOverTip;

    if-nez v0, :cond_74

    .line 95
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 96
    :cond_74
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonGameOverTip(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameOverTip;)V

    return-void

    .line 97
    :pswitch_17
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameDiscoActionEnd;

    .line 98
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameDiscoActionEnd;

    if-nez v0, :cond_75

    .line 99
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 100
    :cond_75
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonGameDiscoActionEnd(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameDiscoActionEnd;)V

    return-void

    .line 101
    :pswitch_18
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGBaseballDefaultState;

    .line 102
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGBaseballDefaultState;

    if-nez v0, :cond_76

    .line 103
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 104
    :cond_76
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGBaseballDefaultState(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGBaseballDefaultState;)V

    return-void

    .line 105
    :pswitch_19
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketDynamicFirePrice;

    .line 106
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketDynamicFirePrice;

    if-nez v0, :cond_77

    .line 107
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 108
    :cond_77
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCustomRocketDynamicFirePrice(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketDynamicFirePrice;)V

    return-void

    .line 109
    :pswitch_1a
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketOrderRecordList;

    .line 110
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketOrderRecordList;

    if-nez v0, :cond_78

    .line 111
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 112
    :cond_78
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCustomRocketOrderRecordList(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketOrderRecordList;)V

    return-void

    .line 113
    :pswitch_1b
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketUserRecordList;

    .line 114
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketUserRecordList;

    if-nez v0, :cond_79

    .line 115
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 116
    :cond_79
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCustomRocketUserRecordList(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketUserRecordList;)V

    return-void

    .line 117
    :pswitch_1c
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketVerifySign;

    .line 118
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketVerifySign;

    if-nez v0, :cond_7a

    .line 119
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 120
    :cond_7a
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCustomRocketVerifySign(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketVerifySign;)V

    return-void

    .line 121
    :pswitch_1d
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameSendBurstWord;

    .line 122
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameSendBurstWord;

    if-nez v0, :cond_7b

    .line 123
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 124
    :cond_7b
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonGameSendBurstWord(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameSendBurstWord;)V

    return-void

    .line 125
    :pswitch_1e
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickGameSettleCloseBtn;

    .line 126
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickGameSettleCloseBtn;

    if-nez v0, :cond_7c

    .line 127
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 128
    :cond_7c
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonSelfClickGameSettleCloseBtn(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickGameSettleCloseBtn;)V

    return-void

    .line 129
    :pswitch_1f
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameAddAIPlayers;

    .line 130
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameAddAIPlayers;

    if-nez v0, :cond_7d

    .line 131
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 132
    :cond_7d
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonGameAddAIPlayers(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameAddAIPlayers;)V

    return-void

    .line 133
    :pswitch_20
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameIsAppChip;

    .line 134
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameIsAppChip;

    if-nez v0, :cond_7e

    .line 135
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 136
    :cond_7e
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonGameIsAppChip(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameIsAppChip;)V

    return-void

    .line 137
    :pswitch_21
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketReplaceComponent;

    .line 138
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketReplaceComponent;

    if-nez v0, :cond_7f

    .line 139
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 140
    :cond_7f
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCustomRocketReplaceComponent(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketReplaceComponent;)V

    return-void

    .line 141
    :pswitch_22
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketBuyComponent;

    .line 142
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketBuyComponent;

    if-nez v0, :cond_80

    .line 143
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 144
    :cond_80
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCustomRocketBuyComponent(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketBuyComponent;)V

    return-void

    .line 145
    :pswitch_23
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonShowGameScene;

    .line 146
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonShowGameScene;

    if-nez v0, :cond_81

    .line 147
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 148
    :cond_81
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonShowGameScene(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonShowGameScene;)V

    return-void

    .line 149
    :pswitch_24
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameGetScore;

    .line 150
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameGetScore;

    if-nez v0, :cond_82

    .line 151
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 152
    :cond_82
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonGameGetScore(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameGetScore;)V

    return-void

    .line 153
    :pswitch_25
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickJoinBtn;

    .line 154
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickJoinBtn;

    if-nez v0, :cond_83

    .line 155
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 156
    :cond_83
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonSelfClickJoinBtn(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickJoinBtn;)V

    return-void

    .line 157
    :pswitch_26
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketClickLockComponent;

    .line 158
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketClickLockComponent;

    if-nez v0, :cond_84

    .line 159
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 160
    :cond_84
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCustomRocketClickLockComponent(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketClickLockComponent;)V

    return-void

    .line 161
    :pswitch_27
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGBaseballShowGameScene;

    .line 162
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGBaseballShowGameScene;

    if-nez v0, :cond_85

    .line 163
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 164
    :cond_85
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGBaseballShowGameScene(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGBaseballShowGameScene;)V

    return-void

    .line 165
    :pswitch_28
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGamePlayerRanks;

    .line 166
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGamePlayerRanks;

    if-nez v0, :cond_86

    .line 167
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 168
    :cond_86
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonGamePlayerRanks(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGamePlayerRanks;)V

    return-void

    .line 169
    :pswitch_29
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGamePieceArriveEnd;

    .line 170
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGamePieceArriveEnd;

    if-nez v0, :cond_87

    .line 171
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 172
    :cond_87
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonGamePieceArriveEnd(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGamePieceArriveEnd;)V

    return-void

    .line 173
    :pswitch_2a
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGBaseballSendDistance;

    .line 174
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGBaseballSendDistance;

    if-nez v0, :cond_88

    .line 175
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 176
    :cond_88
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGBaseballSendDistance(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGBaseballSendDistance;)V

    return-void

    .line 177
    :pswitch_2b
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketSaveSignColor;

    .line 178
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketSaveSignColor;

    if-nez v0, :cond_89

    .line 179
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 180
    :cond_89
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCustomRocketSaveSignColor(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketSaveSignColor;)V

    return-void

    .line 181
    :pswitch_2c
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGamePlayerColor;

    .line 182
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGamePlayerColor;

    if-nez v0, :cond_8a

    .line 183
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 184
    :cond_8a
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonGamePlayerColor(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGamePlayerColor;)V

    return-void

    .line 185
    :pswitch_2d
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameSetScore;

    .line 186
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameSetScore;

    if-nez v0, :cond_8b

    .line 187
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 188
    :cond_8b
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonGameSetScore(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameSetScore;)V

    return-void

    .line 189
    :pswitch_2e
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGBaseballTextConfig;

    .line 190
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGBaseballTextConfig;

    if-nez v0, :cond_8c

    .line 191
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 192
    :cond_8c
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGBaseballTextConfig(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGBaseballTextConfig;)V

    return-void

    .line 193
    :pswitch_2f
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSetClickRect;

    .line 194
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSetClickRect;

    if-nez v0, :cond_8d

    .line 195
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 196
    :cond_8d
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonSetClickRect(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSetClickRect;)V

    return-void

    .line 197
    :pswitch_30
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameSoundList;

    .line 198
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameSoundList;

    if-nez v0, :cond_8e

    .line 199
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 200
    :cond_8e
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonGameSoundList(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameSoundList;)V

    return-void

    .line 201
    :pswitch_31
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickGameSettleAgainBtn;

    .line 202
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickGameSettleAgainBtn;

    if-nez v0, :cond_8f

    .line 203
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 204
    :cond_8f
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonSelfClickGameSettleAgainBtn(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickGameSettleAgainBtn;)V

    return-void

    .line 205
    :pswitch_32
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomCrRoomInitData;

    .line 206
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomCrRoomInitData;

    if-nez v0, :cond_90

    .line 207
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 208
    :cond_90
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCustomCrRoomInitData(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomCrRoomInitData;)V

    return-void

    .line 209
    :pswitch_33
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketHideGameScene;

    .line 210
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketHideGameScene;

    if-nez v0, :cond_91

    .line 211
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 212
    :cond_91
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCustomRocketHideGameScene(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketHideGameScene;)V

    return-void

    .line 213
    :pswitch_34
    const-class p2, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameState;

    .line 214
    invoke-static {p3, p2}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameState;

    .line 215
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;->sudFSMMGCache:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;

    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->onGameMGCommonGameState(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameState;)V

    if-nez v0, :cond_92

    .line 216
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 217
    :cond_92
    invoke-interface {v0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonGameState(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameState;)V

    return-void

    .line 218
    :pswitch_35
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameSound;

    .line 219
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameSound;

    if-nez v0, :cond_93

    .line 220
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 221
    :cond_93
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonGameSound(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameSound;)V

    return-void

    .line 222
    :pswitch_36
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGamePlayerManagedState;

    .line 223
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGamePlayerManagedState;

    if-nez v0, :cond_94

    .line 224
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 225
    :cond_94
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonGamePlayerManagedState(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGamePlayerManagedState;)V

    return-void

    .line 226
    :pswitch_37
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameBgMusicState;

    .line 227
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameBgMusicState;

    if-nez v0, :cond_95

    .line 228
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 229
    :cond_95
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonGameBgMusicState(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameBgMusicState;)V

    return-void

    .line 230
    :pswitch_38
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonWorstTeammate;

    .line 231
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonWorstTeammate;

    if-nez v0, :cond_96

    .line 232
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 233
    :cond_96
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonWorstTeammate(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonWorstTeammate;)V

    return-void

    .line 234
    :pswitch_39
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketPlayEffectStart;

    .line 235
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketPlayEffectStart;

    if-nez v0, :cond_97

    .line 236
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 237
    :cond_97
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCustomRocketPlayEffectStart(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketPlayEffectStart;)V

    return-void

    .line 238
    :pswitch_3a
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickReadyBtn;

    .line 239
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickReadyBtn;

    if-nez v0, :cond_98

    .line 240
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 241
    :cond_98
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonSelfClickReadyBtn(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickReadyBtn;)V

    return-void

    .line 242
    :pswitch_3b
    const-class p2, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonKeyWordToHit;

    .line 243
    invoke-static {p3, p2}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonKeyWordToHit;

    .line 244
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;->sudFSMMGCache:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;

    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->onGameMGCommonKeyWordToHit(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonKeyWordToHit;)V

    if-nez v0, :cond_99

    .line 245
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 246
    :cond_99
    invoke-interface {v0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonKeyWordToHit(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonKeyWordToHit;)V

    return-void

    .line 247
    :pswitch_3c
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerRoleId;

    .line 248
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerRoleId;

    if-nez v0, :cond_9a

    .line 249
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 250
    :cond_9a
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonPlayerRoleId(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerRoleId;)V

    return-void

    .line 251
    :pswitch_3d
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickGoldBtn;

    .line 252
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickGoldBtn;

    if-nez v0, :cond_9b

    .line 253
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 254
    :cond_9b
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonSelfClickGoldBtn(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickGoldBtn;)V

    return-void

    .line 255
    :pswitch_3e
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketModelList;

    .line 256
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketModelList;

    if-nez v0, :cond_9c

    .line 257
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 258
    :cond_9c
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCustomRocketModelList(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketModelList;)V

    return-void

    .line 259
    :pswitch_3f
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickExitGameBtn;

    .line 260
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickExitGameBtn;

    if-nez v0, :cond_9d

    .line 261
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 262
    :cond_9d
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonSelfClickExitGameBtn(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickExitGameBtn;)V

    return-void

    .line 263
    :pswitch_40
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketConfig;

    .line 264
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketConfig;

    if-nez v0, :cond_9e

    .line 265
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 266
    :cond_9e
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCustomRocketConfig(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketConfig;)V

    return-void

    .line 267
    :pswitch_41
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickShareBtn;

    .line 268
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickShareBtn;

    if-nez v0, :cond_9f

    .line 269
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 270
    :cond_9f
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonSelfClickShareBtn(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickShareBtn;)V

    return-void

    .line 271
    :pswitch_42
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGBaseballSetClickRect;

    .line 272
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGBaseballSetClickRect;

    if-nez v0, :cond_a0

    .line 273
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 274
    :cond_a0
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGBaseballSetClickRect(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGBaseballSetClickRect;)V

    return-void

    .line 275
    :pswitch_43
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickCancelReadyBtn;

    .line 276
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickCancelReadyBtn;

    if-nez v0, :cond_a1

    .line 277
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 278
    :cond_a1
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonSelfClickCancelReadyBtn(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickCancelReadyBtn;)V

    return-void

    .line 279
    :pswitch_44
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPublicMessage;

    .line 280
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPublicMessage;

    if-nez v0, :cond_a2

    .line 281
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 282
    :cond_a2
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonPublicMessage(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPublicMessage;)V

    return-void

    .line 283
    :pswitch_45
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketComponentList;

    .line 284
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketComponentList;

    if-nez v0, :cond_a3

    .line 285
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 286
    :cond_a3
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCustomRocketComponentList(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketComponentList;)V

    return-void

    .line 287
    :pswitch_46
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketFlyEnd;

    .line 288
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketFlyEnd;

    if-nez v0, :cond_a4

    .line 289
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 290
    :cond_a4
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCustomRocketFlyEnd(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketFlyEnd;)V

    return-void

    .line 291
    :pswitch_47
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGBaseballPrepareFinish;

    .line 292
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGBaseballPrepareFinish;

    if-nez v0, :cond_a5

    .line 293
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 294
    :cond_a5
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGBaseballPrepareFinish(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGBaseballPrepareFinish;)V

    return-void

    .line 295
    :pswitch_48
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketUserInfo;

    .line 296
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketUserInfo;

    if-nez v0, :cond_a6

    .line 297
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 298
    :cond_a6
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCustomRocketUserInfo(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketUserInfo;)V

    return-void

    .line 299
    :pswitch_49
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonAlert;

    .line 300
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonAlert;

    if-nez v0, :cond_a7

    .line 301
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 302
    :cond_a7
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonAlert(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonAlert;)V

    return-void

    .line 303
    :pswitch_4a
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonAPPCommonSelfXResp;

    .line 304
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonAPPCommonSelfXResp;

    if-nez v0, :cond_a8

    .line 305
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 306
    :cond_a8
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonAPPCommonSelfXResp(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonAPPCommonSelfXResp;)V

    return-void

    .line 307
    :pswitch_4b
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketShowGameScene;

    .line 308
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketShowGameScene;

    if-nez v0, :cond_a9

    .line 309
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 310
    :cond_a9
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCustomRocketShowGameScene(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketShowGameScene;)V

    return-void

    .line 311
    :pswitch_4c
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickPoop;

    .line 312
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickPoop;

    if-nez v0, :cond_aa

    .line 313
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 314
    :cond_aa
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonSelfClickPoop(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickPoop;)V

    return-void

    .line 315
    :pswitch_4d
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickGood;

    .line 316
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickGood;

    if-nez v0, :cond_ab

    .line 317
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 318
    :cond_ab
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonSelfClickGood(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickGood;)V

    return-void

    .line 319
    :pswitch_4e
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGBaseballMyRanking;

    .line 320
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGBaseballMyRanking;

    if-nez v0, :cond_ac

    .line 321
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 322
    :cond_ac
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGBaseballMyRanking(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGBaseballMyRanking;)V

    return-void

    .line 323
    :pswitch_4f
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameRule;

    .line 324
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameRule;

    if-nez v0, :cond_ad

    .line 325
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 326
    :cond_ad
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonGameRule(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameRule;)V

    return-void

    .line 327
    :pswitch_50
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketUploadModelIcon;

    .line 328
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketUploadModelIcon;

    if-nez v0, :cond_ae

    .line 329
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 330
    :cond_ae
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCustomRocketUploadModelIcon(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketUploadModelIcon;)V

    return-void

    .line 331
    :pswitch_51
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameNetworkState;

    .line 332
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameNetworkState;

    if-nez v0, :cond_af

    .line 333
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 334
    :cond_af
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonGameNetworkState(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameNetworkState;)V

    return-void

    .line 335
    :pswitch_52
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickStartBtn;

    .line 336
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickStartBtn;

    if-nez v0, :cond_b0

    .line 337
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 338
    :cond_b0
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonSelfClickStartBtn(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickStartBtn;)V

    return-void

    .line 339
    :pswitch_53
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfHeadphone;

    .line 340
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfHeadphone;

    if-nez v0, :cond_b1

    .line 341
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 342
    :cond_b1
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonSelfHeadphone(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfHeadphone;)V

    return-void

    :pswitch_54
    if-nez v0, :cond_b2

    .line 343
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 344
    :cond_b2
    invoke-interface {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonDestroyGameScene(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 345
    :pswitch_55
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketSetClickRect;

    .line 346
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketSetClickRect;

    if-nez v0, :cond_b3

    .line 347
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 348
    :cond_b3
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCustomRocketSetClickRect(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketSetClickRect;)V

    return-void

    .line 349
    :pswitch_56
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickCancelJoinBtn;

    .line 350
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickCancelJoinBtn;

    if-nez v0, :cond_b4

    .line 351
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 352
    :cond_b4
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonSelfClickCancelJoinBtn(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickCancelJoinBtn;)V

    return-void

    .line 353
    :pswitch_57
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketPrepareFinish;

    .line 354
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketPrepareFinish;

    if-nez v0, :cond_b5

    .line 355
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 356
    :cond_b5
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCustomRocketPrepareFinish(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketPrepareFinish;)V

    return-void

    .line 357
    :pswitch_58
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketPlayEffectFinish;

    .line 358
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketPlayEffectFinish;

    if-nez v0, :cond_b6

    .line 359
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 360
    :cond_b6
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCustomRocketPlayEffectFinish(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCustomRocketPlayEffectFinish;)V

    return-void

    .line 361
    :pswitch_59
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameSoundState;

    .line 362
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameSoundState;

    if-nez v0, :cond_b7

    .line 363
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 364
    :cond_b7
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonGameSoundState(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameSoundState;)V

    return-void

    .line 365
    :pswitch_5a
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameDiscoAction;

    .line 366
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameDiscoAction;

    if-nez v0, :cond_b8

    .line 367
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 368
    :cond_b8
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonGameDiscoAction(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameDiscoAction;)V

    return-void

    .line 369
    :pswitch_5b
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameFps;

    .line 370
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameFps;

    if-nez v0, :cond_b9

    .line 371
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 372
    :cond_b9
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonGameFps(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameFps;)V

    return-void

    .line 373
    :pswitch_5c
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameASR;

    .line 374
    invoke-static {p3, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameASR;

    if-nez v0, :cond_ba

    .line 375
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    return-void

    .line 376
    :cond_ba
    invoke-interface {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonGameASR(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameASR;)V

    return-void

    :sswitch_data_0
    .sparse-switch
        -0x7e48641e -> :sswitch_5c
        -0x7e4851b5 -> :sswitch_5b
        -0x7b5b1a87 -> :sswitch_5a
        -0x7895b73d -> :sswitch_59
        -0x76c810c8 -> :sswitch_58
        -0x6f1f7633 -> :sswitch_57
        -0x6c03f20f -> :sswitch_56
        -0x6be1a2c6 -> :sswitch_55
        -0x610fa02d -> :sswitch_54
        -0x5f7f39b6 -> :sswitch_53
        -0x54256b3c -> :sswitch_52
        -0x533709de -> :sswitch_51
        -0x510ab175 -> :sswitch_50
        -0x4abc5e26 -> :sswitch_4f
        -0x4881da33 -> :sswitch_4e
        -0x46dfaa28 -> :sswitch_4d
        -0x46db92c5 -> :sswitch_4c
        -0x4452de41 -> :sswitch_4b
        -0x439160fd -> :sswitch_4a
        -0x403d7f73 -> :sswitch_49
        -0x3b44f3a0 -> :sswitch_48
        -0x3af97d0b -> :sswitch_47
        -0x3a8a21b3 -> :sswitch_46
        -0x3998aa5e -> :sswitch_45
        -0x398c8fe0 -> :sswitch_44
        -0x37f8252a -> :sswitch_43
        -0x37bba99e -> :sswitch_42
        -0x3386e63f -> :sswitch_41
        -0x3026e7bc -> :sswitch_40
        -0x292ebc2b -> :sswitch_3f
        -0x22a7bc0a -> :sswitch_3e
        -0x22203268 -> :sswitch_3d
        -0x1c3909eb -> :sswitch_3c
        -0x1737f94b -> :sswitch_3b
        -0x1638de7b -> :sswitch_3a
        -0x139d06e3 -> :sswitch_39
        -0x1100adeb -> :sswitch_38
        -0xfde21a5 -> :sswitch_37
        -0xf005e0f -> :sswitch_36
        -0xcc3e60f -> :sswitch_35
        -0xcc1ea8d -> :sswitch_34
        -0x9018da6 -> :sswitch_33
        -0x8b29564 -> :sswitch_32
        -0x5f9c805 -> :sswitch_31
        -0x3e721d4 -> :sswitch_30
        0x25c7a27 -> :sswitch_2f
        0x2e492aa -> :sswitch_2e
        0x6831c57 -> :sswitch_2d
        0xb3d0d63 -> :sswitch_2c
        0xb3e0fa1 -> :sswitch_2b
        0xbc74d62 -> :sswitch_2a
        0xbf86342 -> :sswitch_29
        0xc0a17c7 -> :sswitch_28
        0xc464d97 -> :sswitch_27
        0x10443402 -> :sswitch_26
        0x10f1b562 -> :sswitch_25
        0x134de84b -> :sswitch_24
        0x1532a272 -> :sswitch_23
        0x1668cb42 -> :sswitch_22
        0x198e8ef0 -> :sswitch_21
        0x19fbf281 -> :sswitch_20
        0x1a613857 -> :sswitch_1f
        0x1f1dd693 -> :sswitch_1e
        0x23d16a42 -> :sswitch_1d
        0x2864ae01 -> :sswitch_1c
        0x2cb0b3da -> :sswitch_1b
        0x2d04fe19 -> :sswitch_1a
        0x2da8d402 -> :sswitch_19
        0x2f251a01 -> :sswitch_18
        0x34803915 -> :sswitch_17
        0x36c00e8e -> :sswitch_16
        0x374fc319 -> :sswitch_15
        0x392b45ee -> :sswitch_14
        0x3a8e11dc -> :sswitch_13
        0x3b3cf653 -> :sswitch_12
        0x3c20904c -> :sswitch_11
        0x3f5a867a -> :sswitch_10
        0x47979e32 -> :sswitch_f
        0x4aa830ea -> :sswitch_e
        0x4cf45b4c -> :sswitch_d
        0x4dbbf3f4 -> :sswitch_c
        0x4ea397e2 -> :sswitch_b
        0x5083f30d -> :sswitch_a
        0x63c29da8 -> :sswitch_9
        0x64ffa429 -> :sswitch_8
        0x6cb42801 -> :sswitch_7
        0x6ccf339a -> :sswitch_6
        0x6ef4e963 -> :sswitch_5
        0x7200df43 -> :sswitch_4
        0x73b9dca9 -> :sswitch_3
        0x767a2b29 -> :sswitch_2
        0x770a7621 -> :sswitch_1
        0x7ef8642f -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5c
        :pswitch_5b
        :pswitch_5a
        :pswitch_59
        :pswitch_58
        :pswitch_57
        :pswitch_56
        :pswitch_55
        :pswitch_54
        :pswitch_53
        :pswitch_52
        :pswitch_51
        :pswitch_50
        :pswitch_4f
        :pswitch_4e
        :pswitch_4d
        :pswitch_4c
        :pswitch_4b
        :pswitch_4a
        :pswitch_49
        :pswitch_48
        :pswitch_47
        :pswitch_46
        :pswitch_45
        :pswitch_44
        :pswitch_43
        :pswitch_42
        :pswitch_41
        :pswitch_40
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_3c
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
        :pswitch_37
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onGetGameCfg(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;->sudFSMMGListener:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGetGameCfg(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onGetGameViewInfo(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;->sudFSMMGListener:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGetGameViewInfo(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onPlayerStateChange(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;->sudFSMMGListener:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onPlayerStateChange(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    invoke-virtual {p3}, Ljava/lang/String;->hashCode()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const/4 v2, -0x1

    .line 20
    sparse-switch v1, :sswitch_data_0

    .line 21
    .line 22
    .line 23
    goto/16 :goto_0

    .line 24
    .line 25
    :sswitch_0
    const-string v1, "mg_common_player_playing"

    .line 26
    .line 27
    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p3

    .line 31
    if-nez p3, :cond_1

    .line 32
    .line 33
    goto/16 :goto_0

    .line 34
    .line 35
    :cond_1
    const/16 v2, 0x10

    .line 36
    .line 37
    goto/16 :goto_0

    .line 38
    .line 39
    :sswitch_1
    const-string v1, "mg_dg_totalscore"

    .line 40
    .line 41
    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p3

    .line 45
    if-nez p3, :cond_2

    .line 46
    .line 47
    goto/16 :goto_0

    .line 48
    .line 49
    :cond_2
    const/16 v2, 0xf

    .line 50
    .line 51
    goto/16 :goto_0

    .line 52
    .line 53
    :sswitch_2
    const-string v1, "mg_dg_erroranswer"

    .line 54
    .line 55
    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result p3

    .line 59
    if-nez p3, :cond_3

    .line 60
    .line 61
    goto/16 :goto_0

    .line 62
    .line 63
    :cond_3
    const/16 v2, 0xe

    .line 64
    .line 65
    goto/16 :goto_0

    .line 66
    .line 67
    :sswitch_3
    const-string v1, "mg_common_self_turn_status"

    .line 68
    .line 69
    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result p3

    .line 73
    if-nez p3, :cond_4

    .line 74
    .line 75
    goto/16 :goto_0

    .line 76
    .line 77
    :cond_4
    const/16 v2, 0xd

    .line 78
    .line 79
    goto/16 :goto_0

    .line 80
    .line 81
    :sswitch_4
    const-string v1, "mg_dg_score"

    .line 82
    .line 83
    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result p3

    .line 87
    if-nez p3, :cond_5

    .line 88
    .line 89
    goto/16 :goto_0

    .line 90
    .line 91
    :cond_5
    const/16 v2, 0xc

    .line 92
    .line 93
    goto/16 :goto_0

    .line 94
    .line 95
    :sswitch_5
    const-string v1, "mg_common_self_ob_status"

    .line 96
    .line 97
    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result p3

    .line 101
    if-nez p3, :cond_6

    .line 102
    .line 103
    goto/16 :goto_0

    .line 104
    .line 105
    :cond_6
    const/16 v2, 0xb

    .line 106
    .line 107
    goto/16 :goto_0

    .line 108
    .line 109
    :sswitch_6
    const-string v1, "mg_common_player_online"

    .line 110
    .line 111
    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result p3

    .line 115
    if-nez p3, :cond_7

    .line 116
    .line 117
    goto/16 :goto_0

    .line 118
    .line 119
    :cond_7
    const/16 v2, 0xa

    .line 120
    .line 121
    goto/16 :goto_0

    .line 122
    .line 123
    :sswitch_7
    const-string v1, "mg_common_player_in"

    .line 124
    .line 125
    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result p3

    .line 129
    if-nez p3, :cond_8

    .line 130
    .line 131
    goto/16 :goto_0

    .line 132
    .line 133
    :cond_8
    const/16 v2, 0x9

    .line 134
    .line 135
    goto/16 :goto_0

    .line 136
    .line 137
    :sswitch_8
    const-string v1, "mg_common_self_click_game_player_icon"

    .line 138
    .line 139
    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result p3

    .line 143
    if-nez p3, :cond_9

    .line 144
    .line 145
    goto/16 :goto_0

    .line 146
    .line 147
    :cond_9
    const/16 v2, 0x8

    .line 148
    .line 149
    goto/16 :goto_0

    .line 150
    .line 151
    :sswitch_9
    const-string v1, "mg_common_player_ready"

    .line 152
    .line 153
    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    move-result p3

    .line 157
    if-nez p3, :cond_a

    .line 158
    .line 159
    goto :goto_0

    .line 160
    :cond_a
    const/4 v2, 0x7

    .line 161
    goto :goto_0

    .line 162
    :sswitch_a
    const-string v1, "mg_common_self_select_status"

    .line 163
    .line 164
    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    move-result p3

    .line 168
    if-nez p3, :cond_b

    .line 169
    .line 170
    goto :goto_0

    .line 171
    :cond_b
    const/4 v2, 0x6

    .line 172
    goto :goto_0

    .line 173
    :sswitch_b
    const-string v1, "mg_dg_selecting"

    .line 174
    .line 175
    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    move-result p3

    .line 179
    if-nez p3, :cond_c

    .line 180
    .line 181
    goto :goto_0

    .line 182
    :cond_c
    const/4 v2, 0x5

    .line 183
    goto :goto_0

    .line 184
    :sswitch_c
    const-string v1, "mg_common_player_captain"

    .line 185
    .line 186
    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 187
    .line 188
    .line 189
    move-result p3

    .line 190
    if-nez p3, :cond_d

    .line 191
    .line 192
    goto :goto_0

    .line 193
    :cond_d
    const/4 v2, 0x4

    .line 194
    goto :goto_0

    .line 195
    :sswitch_d
    const-string v1, "mg_dg_painting"

    .line 196
    .line 197
    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 198
    .line 199
    .line 200
    move-result p3

    .line 201
    if-nez p3, :cond_e

    .line 202
    .line 203
    goto :goto_0

    .line 204
    :cond_e
    const/4 v2, 0x3

    .line 205
    goto :goto_0

    .line 206
    :sswitch_e
    const-string v1, "mg_common_player_change_seat"

    .line 207
    .line 208
    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 209
    .line 210
    .line 211
    move-result p3

    .line 212
    if-nez p3, :cond_f

    .line 213
    .line 214
    goto :goto_0

    .line 215
    :cond_f
    const/4 v2, 0x2

    .line 216
    goto :goto_0

    .line 217
    :sswitch_f
    const-string v1, "mg_common_self_die_status"

    .line 218
    .line 219
    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 220
    .line 221
    .line 222
    move-result p3

    .line 223
    if-nez p3, :cond_10

    .line 224
    .line 225
    goto :goto_0

    .line 226
    :cond_10
    const/4 v2, 0x1

    .line 227
    goto :goto_0

    .line 228
    :sswitch_10
    const-string v1, "mg_common_game_countdown_time"

    .line 229
    .line 230
    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 231
    .line 232
    .line 233
    move-result p3

    .line 234
    if-nez p3, :cond_11

    .line 235
    .line 236
    goto :goto_0

    .line 237
    :cond_11
    const/4 v2, 0x0

    .line 238
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 239
    .line 240
    .line 241
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    .line 242
    .line 243
    .line 244
    return-void

    .line 245
    :pswitch_0
    const-class p3, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerPlaying;

    .line 246
    .line 247
    invoke-static {p4, p3}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 248
    .line 249
    .line 250
    move-result-object p3

    .line 251
    check-cast p3, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerPlaying;

    .line 252
    .line 253
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;->sudFSMMGCache:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;

    .line 254
    .line 255
    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->onPlayerMGCommonPlayerPlaying(Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerPlaying;)V

    .line 256
    .line 257
    .line 258
    if-nez v0, :cond_12

    .line 259
    .line 260
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    .line 261
    .line 262
    .line 263
    return-void

    .line 264
    :cond_12
    invoke-interface {v0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onPlayerMGCommonPlayerPlaying(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerPlaying;)V

    .line 265
    .line 266
    .line 267
    return-void

    .line 268
    :pswitch_1
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGDGTotalscore;

    .line 269
    .line 270
    invoke-static {p4, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 271
    .line 272
    .line 273
    move-result-object p0

    .line 274
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGDGTotalscore;

    .line 275
    .line 276
    if-nez v0, :cond_13

    .line 277
    .line 278
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    .line 279
    .line 280
    .line 281
    return-void

    .line 282
    :cond_13
    invoke-interface {v0, p1, p2, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onPlayerMGDGTotalscore(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGDGTotalscore;)V

    .line 283
    .line 284
    .line 285
    return-void

    .line 286
    :pswitch_2
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGDGErroranswer;

    .line 287
    .line 288
    invoke-static {p4, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 289
    .line 290
    .line 291
    move-result-object p0

    .line 292
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGDGErroranswer;

    .line 293
    .line 294
    if-nez v0, :cond_14

    .line 295
    .line 296
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    .line 297
    .line 298
    .line 299
    return-void

    .line 300
    :cond_14
    invoke-interface {v0, p1, p2, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onPlayerMGDGErroranswer(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGDGErroranswer;)V

    .line 301
    .line 302
    .line 303
    return-void

    .line 304
    :pswitch_3
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfTurnStatus;

    .line 305
    .line 306
    invoke-static {p4, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 307
    .line 308
    .line 309
    move-result-object p0

    .line 310
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfTurnStatus;

    .line 311
    .line 312
    if-nez v0, :cond_15

    .line 313
    .line 314
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    .line 315
    .line 316
    .line 317
    return-void

    .line 318
    :cond_15
    invoke-interface {v0, p1, p2, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onPlayerMGCommonSelfTurnStatus(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfTurnStatus;)V

    .line 319
    .line 320
    .line 321
    return-void

    .line 322
    :pswitch_4
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGDGScore;

    .line 323
    .line 324
    invoke-static {p4, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 325
    .line 326
    .line 327
    move-result-object p0

    .line 328
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGDGScore;

    .line 329
    .line 330
    if-nez v0, :cond_16

    .line 331
    .line 332
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    .line 333
    .line 334
    .line 335
    return-void

    .line 336
    :cond_16
    invoke-interface {v0, p1, p2, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onPlayerMGDGScore(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGDGScore;)V

    .line 337
    .line 338
    .line 339
    return-void

    .line 340
    :pswitch_5
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfObStatus;

    .line 341
    .line 342
    invoke-static {p4, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 343
    .line 344
    .line 345
    move-result-object p0

    .line 346
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfObStatus;

    .line 347
    .line 348
    if-nez v0, :cond_17

    .line 349
    .line 350
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    .line 351
    .line 352
    .line 353
    return-void

    .line 354
    :cond_17
    invoke-interface {v0, p1, p2, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onPlayerMGCommonSelfObStatus(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfObStatus;)V

    .line 355
    .line 356
    .line 357
    return-void

    .line 358
    :pswitch_6
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerOnline;

    .line 359
    .line 360
    invoke-static {p4, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 361
    .line 362
    .line 363
    move-result-object p0

    .line 364
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerOnline;

    .line 365
    .line 366
    if-nez v0, :cond_18

    .line 367
    .line 368
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    .line 369
    .line 370
    .line 371
    return-void

    .line 372
    :cond_18
    invoke-interface {v0, p1, p2, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onPlayerMGCommonPlayerOnline(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerOnline;)V

    .line 373
    .line 374
    .line 375
    return-void

    .line 376
    :pswitch_7
    const-class p3, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerIn;

    .line 377
    .line 378
    invoke-static {p4, p3}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 379
    .line 380
    .line 381
    move-result-object p3

    .line 382
    check-cast p3, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerIn;

    .line 383
    .line 384
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;->sudFSMMGCache:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;

    .line 385
    .line 386
    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->onPlayerMGCommonPlayerIn(Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerIn;)V

    .line 387
    .line 388
    .line 389
    if-nez v0, :cond_19

    .line 390
    .line 391
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    .line 392
    .line 393
    .line 394
    return-void

    .line 395
    :cond_19
    invoke-interface {v0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onPlayerMGCommonPlayerIn(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerIn;)V

    .line 396
    .line 397
    .line 398
    return-void

    .line 399
    :pswitch_8
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickGamePlayerIcon;

    .line 400
    .line 401
    invoke-static {p4, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 402
    .line 403
    .line 404
    move-result-object p0

    .line 405
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickGamePlayerIcon;

    .line 406
    .line 407
    if-nez v0, :cond_1a

    .line 408
    .line 409
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    .line 410
    .line 411
    .line 412
    return-void

    .line 413
    :cond_1a
    invoke-interface {v0, p1, p2, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onPlayerMGCommonSelfClickGamePlayerIcon(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickGamePlayerIcon;)V

    .line 414
    .line 415
    .line 416
    return-void

    .line 417
    :pswitch_9
    const-class p3, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerReady;

    .line 418
    .line 419
    invoke-static {p4, p3}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 420
    .line 421
    .line 422
    move-result-object p3

    .line 423
    check-cast p3, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerReady;

    .line 424
    .line 425
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;->sudFSMMGCache:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;

    .line 426
    .line 427
    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->onPlayerMGCommonPlayerReady(Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerReady;)V

    .line 428
    .line 429
    .line 430
    if-nez v0, :cond_1b

    .line 431
    .line 432
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    .line 433
    .line 434
    .line 435
    return-void

    .line 436
    :cond_1b
    invoke-interface {v0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onPlayerMGCommonPlayerReady(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerReady;)V

    .line 437
    .line 438
    .line 439
    return-void

    .line 440
    :pswitch_a
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfSelectStatus;

    .line 441
    .line 442
    invoke-static {p4, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 443
    .line 444
    .line 445
    move-result-object p0

    .line 446
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfSelectStatus;

    .line 447
    .line 448
    if-nez v0, :cond_1c

    .line 449
    .line 450
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    .line 451
    .line 452
    .line 453
    return-void

    .line 454
    :cond_1c
    invoke-interface {v0, p1, p2, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onPlayerMGCommonSelfSelectStatus(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfSelectStatus;)V

    .line 455
    .line 456
    .line 457
    return-void

    .line 458
    :pswitch_b
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGDGSelecting;

    .line 459
    .line 460
    invoke-static {p4, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 461
    .line 462
    .line 463
    move-result-object p0

    .line 464
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGDGSelecting;

    .line 465
    .line 466
    if-nez v0, :cond_1d

    .line 467
    .line 468
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    .line 469
    .line 470
    .line 471
    return-void

    .line 472
    :cond_1d
    invoke-interface {v0, p1, p2, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onPlayerMGDGSelecting(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGDGSelecting;)V

    .line 473
    .line 474
    .line 475
    return-void

    .line 476
    :pswitch_c
    const-class p3, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerCaptain;

    .line 477
    .line 478
    invoke-static {p4, p3}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 479
    .line 480
    .line 481
    move-result-object p3

    .line 482
    check-cast p3, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerCaptain;

    .line 483
    .line 484
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;->sudFSMMGCache:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;

    .line 485
    .line 486
    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->onPlayerMGCommonPlayerCaptain(Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerCaptain;)V

    .line 487
    .line 488
    .line 489
    if-nez v0, :cond_1e

    .line 490
    .line 491
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    .line 492
    .line 493
    .line 494
    return-void

    .line 495
    :cond_1e
    invoke-interface {v0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onPlayerMGCommonPlayerCaptain(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerCaptain;)V

    .line 496
    .line 497
    .line 498
    return-void

    .line 499
    :pswitch_d
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGDGPainting;

    .line 500
    .line 501
    invoke-static {p4, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 502
    .line 503
    .line 504
    move-result-object p0

    .line 505
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGDGPainting;

    .line 506
    .line 507
    if-nez v0, :cond_1f

    .line 508
    .line 509
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    .line 510
    .line 511
    .line 512
    return-void

    .line 513
    :cond_1f
    invoke-interface {v0, p1, p2, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onPlayerMGDGPainting(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGDGPainting;)V

    .line 514
    .line 515
    .line 516
    return-void

    .line 517
    :pswitch_e
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerChangeSeat;

    .line 518
    .line 519
    invoke-static {p4, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 520
    .line 521
    .line 522
    move-result-object p0

    .line 523
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerChangeSeat;

    .line 524
    .line 525
    if-nez v0, :cond_20

    .line 526
    .line 527
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    .line 528
    .line 529
    .line 530
    return-void

    .line 531
    :cond_20
    invoke-interface {v0, p1, p2, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onPlayerMGCommonPlayerChangeSeat(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerChangeSeat;)V

    .line 532
    .line 533
    .line 534
    return-void

    .line 535
    :pswitch_f
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfDieStatus;

    .line 536
    .line 537
    invoke-static {p4, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 538
    .line 539
    .line 540
    move-result-object p0

    .line 541
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfDieStatus;

    .line 542
    .line 543
    if-nez v0, :cond_21

    .line 544
    .line 545
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    .line 546
    .line 547
    .line 548
    return-void

    .line 549
    :cond_21
    invoke-interface {v0, p1, p2, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onPlayerMGCommonSelfDieStatus(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfDieStatus;)V

    .line 550
    .line 551
    .line 552
    return-void

    .line 553
    :pswitch_10
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameCountdownTime;

    .line 554
    .line 555
    invoke-static {p4, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 556
    .line 557
    .line 558
    move-result-object p0

    .line 559
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameCountdownTime;

    .line 560
    .line 561
    if-nez v0, :cond_22

    .line 562
    .line 563
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/ISudFSMStateHandleUtils;->handleSuccess(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    .line 564
    .line 565
    .line 566
    return-void

    .line 567
    :cond_22
    invoke-interface {v0, p1, p2, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onPlayerMGCommonGameCountdownTime(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameCountdownTime;)V

    .line 568
    .line 569
    .line 570
    return-void

    :sswitch_data_0
    .sparse-switch
        -0x76488687 -> :sswitch_10
        -0x73b51aab -> :sswitch_f
        -0x629d0ebb -> :sswitch_e
        -0x53744825 -> :sswitch_d
        -0x4d5b244b -> :sswitch_c
        -0x305648d1 -> :sswitch_b
        -0x946ceaf -> :sswitch_a
        0x7c2a74 -> :sswitch_9
        0x5ba52e5 -> :sswitch_8
        0xa02d5f4 -> :sswitch_7
        0xa6e7fa2 -> :sswitch_6
        0x26bdc69a -> :sswitch_5
        0x3988d0db -> :sswitch_4
        0x39cb21b0 -> :sswitch_3
        0x5112634f -> :sswitch_2
        0x5f3e4125 -> :sswitch_1
        0x744a30bf -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public playerIsIn(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;->sudFSMMGCache:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->playerIsIn(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public playerIsPlaying(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;->sudFSMMGCache:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->playerIsPlaying(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public playerIsReady(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;->sudFSMMGCache:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;->playerIsReady(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public setSudFSMMGListener(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;->sudFSMMGListener:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;

    .line 2
    .line 3
    return-void
.end method
