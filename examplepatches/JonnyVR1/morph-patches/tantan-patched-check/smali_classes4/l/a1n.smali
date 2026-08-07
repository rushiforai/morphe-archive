.class public Ll/a1n;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Lcom/p1/mobile/putong/data/PushMessageCustom;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "anchor_id"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "close_kind"

    .line 10
    .line 11
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v1, "live_id"

    .line 16
    .line 17
    iget-object v2, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveId:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const-string v2, "live_push_page_id"

    .line 24
    .line 25
    invoke-static {v2, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    const-string v2, "push_text"

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->content:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    filled-new-array {v0, p1, v1, p2, p0}, [Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const-string p1, "e_live_innerpush_close"

    .line 42
    .line 43
    const-string p2, "p_live_inner_push"

    .line 44
    .line 45
    invoke-static {p1, p2, p0}, Ll/i4g0;->w(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/data/PushMessageCustom;Ljava/lang/String;)V
    .locals 11

    .line 1
    const-string v0, "liveId"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    const-string v0, "anchorId"

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    const-string v0, "index"

    .line 18
    .line 19
    const-string v1, "NA"

    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    const-string v0, "show_label"

    .line 26
    .line 27
    const-string v5, ""

    .line 28
    .line 29
    invoke-static {v0, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v6, "module"

    .line 34
    .line 35
    const-string v7, "page"

    .line 36
    .line 37
    invoke-static {v6, v7}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    const-string v7, "right_recommend_type"

    .line 42
    .line 43
    invoke-static {v7, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object v7

    .line 47
    const-string v5, "live_status"

    .line 48
    .line 49
    const-string v8, "on"

    .line 50
    .line 51
    invoke-static {v5, v8}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object v8

    .line 55
    const-string v5, "live_push_page_id"

    .line 56
    .line 57
    invoke-static {v5, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object v9

    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->category:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-eqz p1, :cond_0

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->category:Ljava/lang/String;

    .line 71
    .line 72
    :goto_0
    const-string p0, "liveRecommendCategory"

    .line 73
    .line 74
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 75
    .line 76
    .line 77
    move-result-object v10

    .line 78
    move-object v5, v0

    .line 79
    filled-new-array/range {v2 .. v10}, [Ll/pf60;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    const-string p1, "e_live_room_enter"

    .line 84
    .line 85
    const-string v0, "p_live_inner_push"

    .line 86
    .line 87
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public static c(Lcom/p1/mobile/putong/data/PushMessageCustom;Ljava/lang/String;)V
    .locals 12

    .line 1
    const-string v0, "index"

    .line 2
    .line 3
    const-string v1, "NA"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    const-string v0, "module"

    .line 10
    .line 11
    const-string v3, "page"

    .line 12
    .line 13
    invoke-static {v0, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    const-string v0, "liveId"

    .line 18
    .line 19
    iget-object v4, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveId:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v0, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    const-string v0, "anchorId"

    .line 26
    .line 27
    iget-object v5, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v0, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    const-string v0, "trace_id"

    .line 34
    .line 35
    const-string v6, ""

    .line 36
    .line 37
    invoke-static {v0, v6}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const-string v7, "show_label"

    .line 42
    .line 43
    invoke-static {v7, v6}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object v7

    .line 47
    iget-object v8, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->category:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v8

    .line 53
    if-eqz v8, :cond_0

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->category:Ljava/lang/String;

    .line 57
    .line 58
    :goto_0
    const-string p0, "liveRecommendCategory"

    .line 59
    .line 60
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 61
    .line 62
    .line 63
    move-result-object v8

    .line 64
    const-string p0, "live_status"

    .line 65
    .line 66
    const-string v1, "on"

    .line 67
    .line 68
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 69
    .line 70
    .line 71
    move-result-object v9

    .line 72
    const-string p0, "live_push_page_id"

    .line 73
    .line 74
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 75
    .line 76
    .line 77
    move-result-object v10

    .line 78
    const-string p0, "right_recommend_type"

    .line 79
    .line 80
    invoke-static {p0, v6}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 81
    .line 82
    .line 83
    move-result-object v11

    .line 84
    move-object v6, v0

    .line 85
    filled-new-array/range {v2 .. v11}, [Ll/pf60;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    const-string p1, "e_live_room_enter"

    .line 90
    .line 91
    const-string v0, "p_live_inner_push"

    .line 92
    .line 93
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public static d(Lcom/p1/mobile/putong/data/PushMessage;Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->category:Ljava/lang/String;

    .line 4
    .line 5
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 6
    .line 7
    iget-object v2, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 8
    .line 9
    iget-object v2, v2, Lcom/p1/mobile/putong/data/PushMessageCustom;->extra:Ljava/lang/String;

    .line 10
    .line 11
    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const-string v2, "search"

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    goto :goto_0

    .line 21
    :catch_0
    move-exception v1

    .line 22
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    const-string v1, "push_category"

    .line 26
    .line 27
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->traceId:Ljava/lang/String;

    .line 34
    .line 35
    const-string v1, "push_id"

    .line 36
    .line 37
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    filled-new-array {v0, p0}, [Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const-string v0, "e_live_inner_push"

    .line 46
    .line 47
    invoke-static {v0, p1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public static e(Lcom/p1/mobile/putong/data/PushMessage;Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->category:Ljava/lang/String;

    .line 4
    .line 5
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 6
    .line 7
    iget-object v2, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 8
    .line 9
    iget-object v2, v2, Lcom/p1/mobile/putong/data/PushMessageCustom;->extra:Ljava/lang/String;

    .line 10
    .line 11
    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const-string v2, "search"

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    goto :goto_0

    .line 21
    :catch_0
    move-exception v1

    .line 22
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    const-string v1, "push_category"

    .line 26
    .line 27
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->traceId:Ljava/lang/String;

    .line 34
    .line 35
    const-string v1, "push_id"

    .line 36
    .line 37
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    filled-new-array {v0, p0}, [Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const-string v0, "e_live_inner_push"

    .line 46
    .line 47
    invoke-static {v0, p1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public static f(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    .line 1
    const-string v0, "liveId"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "push_id"

    .line 8
    .line 9
    invoke-static {v2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    const-string v4, "liveRecommendCategory"

    .line 14
    .line 15
    const-string v5, "official_channel"

    .line 16
    .line 17
    invoke-static {v4, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v6

    .line 21
    filled-new-array {v1, v3, v6}, [Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-string v3, "e_live_room_enter"

    .line 26
    .line 27
    const-string v6, "p_live_inner_push"

    .line 28
    .line 29
    invoke-static {v3, v6, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {v2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-static {v4, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    filled-new-array {p0, p1, v0}, [Ll/pf60;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-static {v3, v6, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method
