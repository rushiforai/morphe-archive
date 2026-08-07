.class public Ll/xu90;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ll/xu90;


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

.method public static d()Ll/xu90;
    .locals 2

    .line 1
    sget-object v0, Ll/xu90;->a:Ll/xu90;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/xu90;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/xu90;->a:Ll/xu90;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/xu90;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/xu90;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/xu90;->a:Ll/xu90;

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
    sget-object v0, Ll/xu90;->a:Ll/xu90;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/User;)I
    .locals 4

    .line 1
    invoke-virtual {p0, p1}, Ll/xu90;->h(Lcom/p1/mobile/putong/data/User;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, -0x1

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v2, "intl_good_c_bage_config"

    .line 14
    .line 15
    sget-object v3, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 16
    .line 17
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->v(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/p1/mobile/putong/core/data/ProfileGoodc;

    .line 22
    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    return v1

    .line 26
    :cond_1
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->nullCheck()V

    .line 27
    .line 28
    .line 29
    iget-boolean v2, v0, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->enabled:Z

    .line 30
    .line 31
    if-nez v2, :cond_2

    .line 32
    .line 33
    return v1

    .line 34
    :cond_2
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->photo_badge:Lcom/p1/mobile/putong/core/data/ProfileGoodcPhotoBadge;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 37
    .line 38
    iget v2, v0, Lcom/p1/mobile/putong/core/data/ProfileGoodcPhotoBadge;->divisor:I

    .line 39
    .line 40
    invoke-virtual {p0, p1, v2}, Ll/xu90;->e(Ljava/lang/String;I)I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-ne p1, v1, :cond_3

    .line 45
    .line 46
    return v1

    .line 47
    :cond_3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ProfileGoodcPhotoBadge;->rules:Lcom/p1/mobile/putong/core/data/ProfileGoodcPhotoRules;

    .line 48
    .line 49
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/ProfileGoodcPhotoRules;->real_user:Ljava/util/List;

    .line 50
    .line 51
    const-string v3, "real_user"

    .line 52
    .line 53
    invoke-virtual {p0, v2, v3, p1}, Ll/xu90;->c(Ljava/util/List;Ljava/lang/String;I)I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-ne v2, v1, :cond_4

    .line 58
    .line 59
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/ProfileGoodcPhotoRules;->facebook:Ljava/util/List;

    .line 60
    .line 61
    const-string v3, "facebook"

    .line 62
    .line 63
    invoke-virtual {p0, v2, v3, p1}, Ll/xu90;->c(Ljava/util/List;Ljava/lang/String;I)I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    if-ne v2, v1, :cond_4

    .line 68
    .line 69
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ProfileGoodcPhotoRules;->vip:Ljava/util/List;

    .line 70
    .line 71
    const-string v2, "vip"

    .line 72
    .line 73
    invoke-virtual {p0, v0, v2, p1}, Ll/xu90;->c(Ljava/util/List;Ljava/lang/String;I)I

    .line 74
    .line 75
    .line 76
    move-result p0
    :try_end_0
    .catch Lcom/p1/mobile/putong/remote_config/RemoteConfigException; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    return p0

    .line 78
    :cond_4
    return v2

    .line 79
    :catch_0
    return v1
.end method

.method public final b()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final c(Ljava/util/List;Ljava/lang/String;I)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/lang/String;",
            "I)I"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, -0x1

    .line 6
    if-nez p0, :cond_3

    .line 7
    .line 8
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p1, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-eqz p0, :cond_3

    .line 17
    .line 18
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    const/4 p1, 0x2

    .line 26
    const/4 p3, 0x1

    .line 27
    sparse-switch p0, :sswitch_data_0

    .line 28
    .line 29
    .line 30
    :goto_0
    move p0, v0

    .line 31
    goto :goto_1

    .line 32
    :sswitch_0
    const-string p0, "facebook"

    .line 33
    .line 34
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-nez p0, :cond_0

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    move p0, p1

    .line 42
    goto :goto_1

    .line 43
    :sswitch_1
    const-string p0, "vip"

    .line 44
    .line 45
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-nez p0, :cond_1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    move p0, p3

    .line 53
    goto :goto_1

    .line 54
    :sswitch_2
    const-string p0, "real_user"

    .line 55
    .line 56
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    if-nez p0, :cond_2

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_2
    const/4 p0, 0x0

    .line 64
    :goto_1
    packed-switch p0, :pswitch_data_0

    .line 65
    .line 66
    .line 67
    goto :goto_2

    .line 68
    :pswitch_0
    return p1

    .line 69
    :pswitch_1
    const/4 p0, 0x3

    .line 70
    return p0

    .line 71
    :pswitch_2
    return p3

    .line 72
    :cond_3
    :goto_2
    return v0

    .line 73
    :sswitch_data_0
    .sparse-switch
        -0x34b66234 -> :sswitch_2
        0x1c81d -> :sswitch_1
        0x1da19ac6 -> :sswitch_0
    .end sparse-switch

    .line 74
    .line 75
    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    .line 84
    .line 85
    .line 86
    .line 87
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final e(Ljava/lang/String;I)I
    .locals 2

    .line 1
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    const/4 p0, -0x1

    .line 8
    return p0

    .line 9
    :cond_0
    int-to-long v0, p2

    .line 10
    rem-long/2addr p0, v0

    .line 11
    long-to-int p0, p0

    .line 12
    return p0
.end method

.method public f(Lcom/p1/mobile/putong/data/User;)I
    .locals 4

    .line 1
    invoke-virtual {p0, p1}, Ll/xu90;->h(Lcom/p1/mobile/putong/data/User;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, -0x1

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v2, "intl_good_c_bage_config"

    .line 14
    .line 15
    sget-object v3, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 16
    .line 17
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->v(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/p1/mobile/putong/core/data/ProfileGoodc;

    .line 22
    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    return v1

    .line 26
    :cond_1
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->nullCheck()V

    .line 27
    .line 28
    .line 29
    iget-boolean v2, v0, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->enabled:Z

    .line 30
    .line 31
    if-nez v2, :cond_2

    .line 32
    .line 33
    return v1

    .line 34
    :cond_2
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->name_badge:Lcom/p1/mobile/putong/core/data/ProfileGoodcNameBadge;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 37
    .line 38
    iget v2, v0, Lcom/p1/mobile/putong/core/data/ProfileGoodcNameBadge;->divisor:I

    .line 39
    .line 40
    invoke-virtual {p0, p1, v2}, Ll/xu90;->e(Ljava/lang/String;I)I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-ne p1, v1, :cond_3

    .line 45
    .line 46
    return v1

    .line 47
    :cond_3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ProfileGoodcNameBadge;->rules:Lcom/p1/mobile/putong/core/data/ProfileGoodcNameRules;

    .line 48
    .line 49
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/ProfileGoodcNameRules;->real_user:Ljava/util/List;

    .line 50
    .line 51
    const-string v3, "real_user"

    .line 52
    .line 53
    invoke-virtual {p0, v2, v3, p1}, Ll/xu90;->c(Ljava/util/List;Ljava/lang/String;I)I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-ne v2, v1, :cond_4

    .line 58
    .line 59
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ProfileGoodcNameRules;->facebook:Ljava/util/List;

    .line 60
    .line 61
    const-string v2, "facebook"

    .line 62
    .line 63
    invoke-virtual {p0, v0, v2, p1}, Ll/xu90;->c(Ljava/util/List;Ljava/lang/String;I)I

    .line 64
    .line 65
    .line 66
    move-result p0
    :try_end_0
    .catch Lcom/p1/mobile/putong/remote_config/RemoteConfigException; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    return p0

    .line 68
    :cond_4
    return v2

    .line 69
    :catch_0
    return v1
.end method

.method public g(Lcom/p1/mobile/putong/data/User;)Z
    .locals 4

    const/4 v0, 0x0

    return v0

    .line 1
    invoke-virtual {p0, p1}, Ll/xu90;->h(Lcom/p1/mobile/putong/data/User;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v2, "intl_good_c_bage_config"

    .line 14
    .line 15
    sget-object v3, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 16
    .line 17
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->v(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/p1/mobile/putong/core/data/ProfileGoodc;

    .line 22
    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    return v1

    .line 26
    :cond_1
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->nullCheck()V

    .line 27
    .line 28
    .line 29
    iget-boolean v2, v0, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->enabled:Z

    .line 30
    .line 31
    if-nez v2, :cond_2

    .line 32
    .line 33
    return v1

    .line 34
    :cond_2
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ProfileGoodc;->info_badge:Lcom/p1/mobile/putong/core/data/ProfileGoodcInfoBadge;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 37
    .line 38
    iget v2, v0, Lcom/p1/mobile/putong/core/data/ProfileGoodcInfoBadge;->divisor:I

    .line 39
    .line 40
    invoke-virtual {p0, p1, v2}, Ll/xu90;->e(Ljava/lang/String;I)I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    const/4 v2, -0x1

    .line 45
    if-ne p1, v2, :cond_3

    .line 46
    .line 47
    return v1

    .line 48
    :cond_3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ProfileGoodcInfoBadge;->rules:Lcom/p1/mobile/putong/core/data/ProfileGoodcVipRules;

    .line 49
    .line 50
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ProfileGoodcVipRules;->vip:Ljava/util/List;

    .line 51
    .line 52
    const-string v2, "vip"

    .line 53
    .line 54
    invoke-virtual {p0, v0, v2, p1}, Ll/xu90;->c(Ljava/util/List;Ljava/lang/String;I)I

    .line 55
    .line 56
    .line 57
    move-result p0
    :try_end_0
    .catch Lcom/p1/mobile/putong/remote_config/RemoteConfigException; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    const/4 p1, 0x3

    .line 59
    if-ne p0, p1, :cond_4

    .line 60
    .line 61
    const/4 p0, 0x1

    .line 62
    return p0

    .line 63
    :catch_0
    :cond_4
    return v1
.end method

.method public final h(Lcom/p1/mobile/putong/data/User;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-lez p0, :cond_0

    .line 22
    .line 23
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 24
    .line 25
    const-string p1, "RISK_TAG_GOOD_FACELESS_STATUS_3"

    .line 26
    .line 27
    invoke-static {p1}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_0
    const/4 p0, 0x0

    .line 40
    return p0
.end method

.method public i(ILandroid/widget/ImageView;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p1, v0, :cond_2

    .line 3
    .line 4
    const/4 p0, 0x2

    .line 5
    if-eq p1, p0, :cond_1

    .line 6
    .line 7
    const/4 p0, 0x3

    .line 8
    if-eq p1, p0, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    sget p0, Ll/dbc0;->J1:I

    .line 12
    .line 13
    invoke-virtual {p2, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_1
    sget p0, Ll/dbc0;->B1:I

    .line 18
    .line 19
    invoke-virtual {p2, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_2
    invoke-virtual {p0}, Ll/xu90;->b()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string p1, "in"

    .line 28
    .line 29
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-nez p1, :cond_9

    .line 34
    .line 35
    const-string p1, "id"

    .line 36
    .line 37
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_3

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_3
    const-string p1, "ja"

    .line 45
    .line 46
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_4

    .line 51
    .line 52
    sget p0, Ll/dbc0;->E1:I

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_4
    const-string p1, "ko"

    .line 56
    .line 57
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-eqz p1, :cond_5

    .line 62
    .line 63
    sget p0, Ll/dbc0;->F1:I

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_5
    const-string p1, "th"

    .line 67
    .line 68
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-eqz p1, :cond_6

    .line 73
    .line 74
    sget p0, Ll/dbc0;->H1:I

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_6
    const-string p1, "zh"

    .line 78
    .line 79
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-eqz v0, :cond_7

    .line 84
    .line 85
    sget p0, Ll/dbc0;->I1:I

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_7
    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    if-eqz p0, :cond_8

    .line 93
    .line 94
    sget p0, Ll/dbc0;->G1:I

    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_8
    sget p0, Ll/dbc0;->C1:I

    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_9
    :goto_0
    sget p0, Ll/dbc0;->D1:I

    .line 101
    .line 102
    :goto_1
    invoke-virtual {p2, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public j(ILandroid/widget/ImageView;Z)V
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    if-eq p1, p0, :cond_2

    .line 3
    .line 4
    const/4 p0, 0x2

    .line 5
    if-eq p1, p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    if-eqz p3, :cond_1

    .line 9
    .line 10
    sget p0, Ll/dbc0;->z1:I

    .line 11
    .line 12
    invoke-virtual {p2, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    sget p0, Ll/dbc0;->Yp:I

    .line 17
    .line 18
    invoke-virtual {p2, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_2
    if-eqz p3, :cond_3

    .line 23
    .line 24
    sget p0, Ll/dbc0;->A1:I

    .line 25
    .line 26
    invoke-virtual {p2, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_3
    sget p0, Ll/dbc0;->Zp:I

    .line 31
    .line 32
    invoke-virtual {p2, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
