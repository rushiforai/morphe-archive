.class public Ll/s4n0;
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

.method public static a(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 1
    :try_start_0
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p0, p1}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :catch_0
    move-exception p0

    .line 12
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZILjava/lang/String;)V
    .locals 7

    .line 1
    if-nez p4, :cond_1

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    const-string p3, "anchor"

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-string p3, "audience_voicechat"

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_1
    const-string p3, "NA"

    .line 12
    .line 13
    :goto_0
    const-string v0, "liveId"

    .line 14
    .line 15
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string p0, "anchorId"

    .line 20
    .line 21
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    const-string p0, "voice_template"

    .line 26
    .line 27
    invoke-static {p0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    const-string p0, "user_type"

    .line 32
    .line 33
    invoke-static {p0, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    const-string p0, "source"

    .line 38
    .line 39
    invoke-static {p0, p6}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object v5

    .line 43
    if-eqz p4, :cond_2

    .line 44
    .line 45
    const-string p0, "swipe_card_room"

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_2
    const-string p0, "swipe_card"

    .line 49
    .line 50
    :goto_1
    const-string p1, "audio_card_type"

    .line 51
    .line 52
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object v6

    .line 56
    filled-new-array/range {v1 .. v6}, [Ll/pf60;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    const-string p1, "e_live_audio_room_enter"

    .line 61
    .line 62
    const-string p2, "p_suggest_users_home_view"

    .line 63
    .line 64
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 65
    .line 66
    .line 67
    const-string p0, "card_name"

    .line 68
    .line 69
    const-string p1, "live_audio_room"

    .line 70
    .line 71
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    const-string p1, "swipe_direction"

    .line 76
    .line 77
    const-string p3, "left"

    .line 78
    .line 79
    invoke-static {p1, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    const-string p3, "is_guided_action"

    .line 84
    .line 85
    const-string p4, "1"

    .line 86
    .line 87
    invoke-static {p3, p4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 88
    .line 89
    .line 90
    move-result-object p3

    .line 91
    const-string p4, "card_order"

    .line 92
    .line 93
    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 94
    .line 95
    .line 96
    move-result-object p5

    .line 97
    invoke-static {p4, p5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 98
    .line 99
    .line 100
    move-result-object p4

    .line 101
    filled-new-array {p0, p1, p3, p4}, [Ll/pf60;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    const-string p1, "e_card"

    .line 106
    .line 107
    invoke-static {p1, p2, p0}, Ll/i4g0;->w(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 108
    .line 109
    .line 110
    return-void
.end method

.method public static c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLjava/lang/String;)V
    .locals 7

    .line 1
    if-nez p4, :cond_1

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    const-string p3, "anchor"

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-string p3, "audience_voicechat"

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_1
    const-string p3, "NA"

    .line 12
    .line 13
    :goto_0
    const-string v0, "liveId"

    .line 14
    .line 15
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string p0, "anchorId"

    .line 20
    .line 21
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    const-string p0, "voice_template"

    .line 26
    .line 27
    invoke-static {p0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    const-string p0, "user_type"

    .line 32
    .line 33
    invoke-static {p0, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    const-string p0, "source"

    .line 38
    .line 39
    invoke-static {p0, p5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object v5

    .line 43
    if-eqz p4, :cond_2

    .line 44
    .line 45
    const-string p0, "swipe_card_room"

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_2
    const-string p0, "swipe_card"

    .line 49
    .line 50
    :goto_1
    const-string p1, "audio_card_type"

    .line 51
    .line 52
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object v6

    .line 56
    filled-new-array/range {v1 .. v6}, [Ll/pf60;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    const-string p1, "e_live_audio_room_enter"

    .line 61
    .line 62
    const-string p2, "p_suggest_users_home_view"

    .line 63
    .line 64
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method
