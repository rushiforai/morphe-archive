.class public Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$b;
.super Ll/dyd0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dyd0<",
        "Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/dyd0;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;)Z
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

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
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public b(Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;)Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;
    .locals 0
    .param p2    # Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->clone()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;
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
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Ll/hxd0;->defaultValue:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_0
    :try_start_0
    sget-object v1, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    .line 31
    return-object v0

    .line 32
    :catch_0
    iget-object p0, p0, Ll/hxd0;->defaultValue:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast p0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;

    .line 35
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
    check-cast p1, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$b;->a(Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;)Z

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
    check-cast p1, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$b;->b(Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;)Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public d(Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;)Landroid/content/SharedPreferences$Editor;
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
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;->toJson()Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$b;->c()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;

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
    check-cast p1, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$b;->d(Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;)Landroid/content/SharedPreferences$Editor;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
