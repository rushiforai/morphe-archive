.class public Ll/gyd0;
.super Ll/dyd0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dyd0<",
        "Lcom/p1/mobile/putong/data/SettingGroups;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;ZLjava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0, p2, p3}, Ll/dyd0;-><init>(Ljava/lang/String;Ljava/lang/Object;ZLjava/lang/String;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/SettingGroups;Lcom/p1/mobile/putong/data/SettingGroups;)Z
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/data/SettingGroups;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/data/SettingGroups;->equals(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public b(Lcom/p1/mobile/putong/data/SettingGroups;Lcom/p1/mobile/putong/data/SettingGroups;)Lcom/p1/mobile/putong/data/SettingGroups;
    .locals 0
    .param p2    # Lcom/p1/mobile/putong/data/SettingGroups;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/SettingGroups;->clone()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final c()Lcom/p1/mobile/putong/data/SettingGroups;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/SettingGroups;->new_()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->fake:Lcom/p1/mobile/putong/data/UserFakeSettings;

    .line 6
    .line 7
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 8
    .line 9
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserFakeSettings;->momentPush:Ljava/lang/Boolean;

    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 12
    .line 13
    iput-object v1, v2, Lcom/p1/mobile/putong/data/UserPushSettings;->superLikePush:Ljava/lang/Boolean;

    .line 14
    .line 15
    iput-object v1, v2, Lcom/p1/mobile/putong/data/UserPushSettings;->messagePush:Ljava/lang/Boolean;

    .line 16
    .line 17
    iput-object v1, v2, Lcom/p1/mobile/putong/data/UserPushSettings;->newMatchPush:Ljava/lang/Boolean;

    .line 18
    .line 19
    iput-object v1, v2, Lcom/p1/mobile/putong/data/UserPushSettings;->previewMessage:Ljava/lang/Boolean;

    .line 20
    .line 21
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserFakeSettings;->weeklyReportPush:Ljava/lang/Boolean;

    .line 22
    .line 23
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserFakeSettings;->dailyReportPush:Ljava/lang/Boolean;

    .line 24
    .line 25
    iput-object v1, v2, Lcom/p1/mobile/putong/data/UserPushSettings;->officialPush:Ljava/lang/Boolean;

    .line 26
    .line 27
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserFakeSettings;->syncMoment:Ljava/lang/Boolean;

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 30
    .line 31
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 32
    .line 33
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->closeSmallWindow:Ljava/lang/Boolean;

    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 36
    .line 37
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->hideVIP:Ljava/lang/Boolean;

    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->subscription:Lcom/p1/mobile/putong/data/UserSubscriptionSettings;

    .line 40
    .line 41
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserSubscriptionSettings;->refuseSMS:Ljava/lang/Boolean;

    .line 42
    .line 43
    return-object p0
.end method

.method public bridge synthetic checkEquals(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/gyd0;->a(Lcom/p1/mobile/putong/data/SettingGroups;Lcom/p1/mobile/putong/data/SettingGroups;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public bridge synthetic copyed(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/gyd0;->b(Lcom/p1/mobile/putong/data/SettingGroups;Lcom/p1/mobile/putong/data/SettingGroups;)Lcom/p1/mobile/putong/data/SettingGroups;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public d()Lcom/p1/mobile/putong/data/SettingGroups;
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/hxd0;->pref()Landroid/content/SharedPreferences;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/hxd0;->id:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    :try_start_0
    sget-object v1, Lcom/p1/mobile/putong/data/SettingGroups;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/data/SettingGroups;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    .line 22
    return-object v0

    .line 23
    :catch_0
    move-exception v0

    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/gyd0;->c()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0

    .line 32
    :cond_0
    invoke-virtual {p0}, Ll/gyd0;->c()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public e(Lcom/p1/mobile/putong/data/SettingGroups;)Landroid/content/SharedPreferences$Editor;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/hxd0;->pref()Landroid/content/SharedPreferences;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Ll/hxd0;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/SettingGroups;->toJson()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {v0, p0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public bridge synthetic retrieveValue()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gyd0;->d()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic saveValue(Ljava/lang/Object;)Landroid/content/SharedPreferences$Editor;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/gyd0;->e(Lcom/p1/mobile/putong/data/SettingGroups;)Landroid/content/SharedPreferences$Editor;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
