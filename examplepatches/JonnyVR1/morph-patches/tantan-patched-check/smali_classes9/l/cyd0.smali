.class public Ll/cyd0;
.super Ll/dyd0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dyd0<",
        "Lcom/p1/mobile/putong/core/data/IntlRecordNightClub;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Ll/dyd0;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/data/IntlRecordNightClub;Lcom/p1/mobile/putong/core/data/IntlRecordNightClub;)Z
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/data/IntlRecordNightClub;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/data/IntlRecordNightClub;->equals(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public b(Lcom/p1/mobile/putong/core/data/IntlRecordNightClub;Lcom/p1/mobile/putong/core/data/IntlRecordNightClub;)Lcom/p1/mobile/putong/core/data/IntlRecordNightClub;
    .locals 0
    .param p2    # Lcom/p1/mobile/putong/core/data/IntlRecordNightClub;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/IntlRecordNightClub;->clone()Lcom/p1/mobile/putong/core/data/IntlRecordNightClub;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c()Lcom/p1/mobile/putong/core/data/IntlRecordNightClub;
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
    iget-object p0, p0, Ll/hxd0;->defaultValue:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast p0, Lcom/p1/mobile/putong/core/data/IntlRecordNightClub;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    :try_start_0
    sget-object v1, Lcom/p1/mobile/putong/core/data/IntlRecordNightClub;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/p1/mobile/putong/core/data/IntlRecordNightClub;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    .line 30
    move-object p0, v0

    .line 31
    goto :goto_0

    .line 32
    :catch_0
    move-exception v0

    .line 33
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    :goto_0
    if-nez p0, :cond_1

    .line 37
    .line 38
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IntlRecordNightClub;->new_()Lcom/p1/mobile/putong/core/data/IntlRecordNightClub;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    :cond_1
    return-object p0
.end method

.method public bridge synthetic checkEquals(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlRecordNightClub;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/core/data/IntlRecordNightClub;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/cyd0;->a(Lcom/p1/mobile/putong/core/data/IntlRecordNightClub;Lcom/p1/mobile/putong/core/data/IntlRecordNightClub;)Z

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlRecordNightClub;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/core/data/IntlRecordNightClub;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/cyd0;->b(Lcom/p1/mobile/putong/core/data/IntlRecordNightClub;Lcom/p1/mobile/putong/core/data/IntlRecordNightClub;)Lcom/p1/mobile/putong/core/data/IntlRecordNightClub;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public d(Lcom/p1/mobile/putong/core/data/IntlRecordNightClub;)Landroid/content/SharedPreferences$Editor;
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
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/IntlRecordNightClub;->toJson()Ljava/lang/String;

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
    invoke-virtual {p0}, Ll/cyd0;->c()Lcom/p1/mobile/putong/core/data/IntlRecordNightClub;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlRecordNightClub;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/cyd0;->d(Lcom/p1/mobile/putong/core/data/IntlRecordNightClub;)Landroid/content/SharedPreferences$Editor;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
