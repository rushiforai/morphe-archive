.class public Ll/exd0;
.super Ll/dyd0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dyd0<",
        "Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;",
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
.method public a(Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;)Z
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->equals(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public b(Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;)Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;
    .locals 0
    .param p2    # Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->clone()Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c()Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/hxd0;->pref()Landroid/content/SharedPreferences;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Ll/hxd0;->id:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-interface {v0, p0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    .line 22
    return-object p0

    .line 23
    :catch_0
    move-exception p0

    .line 24
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->getDefaultSettings()Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0

    .line 32
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->getDefaultSettings()Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public bridge synthetic checkEquals(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/exd0;->a(Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;)Z

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/exd0;->b(Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;)Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public d(Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;)Landroid/content/SharedPreferences$Editor;
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
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;->toJson()Ljava/lang/String;

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
    invoke-virtual {p0}, Ll/exd0;->c()Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/exd0;->d(Lcom/p1/mobile/putong/core/data/LikedUserFilterSettings;)Landroid/content/SharedPreferences$Editor;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
