.class public Ll/d19$a;
.super Ll/dyd0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/d19;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dyd0<",
        "Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/d19;


# direct methods
.method public constructor <init>(Ll/d19;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/d19$a;->a:Ll/d19;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3}, Ll/dyd0;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;)Z
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;->equals(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public b(Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;)Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;
    .locals 0
    .param p2    # Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;->clone()Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c()Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;
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
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    :try_start_0
    sget-object v1, Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    .line 26
    return-object v0

    .line 27
    :catch_0
    move-exception v0

    .line 28
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/d19$a;->a:Ll/d19;

    .line 32
    .line 33
    invoke-static {p0}, Ll/d19;->z3(Ll/d19;)Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0

    .line 38
    :cond_0
    iget-object p0, p0, Ll/d19$a;->a:Ll/d19;

    .line 39
    .line 40
    invoke-static {p0}, Ll/d19;->z3(Ll/d19;)Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method

.method public bridge synthetic checkEquals(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/d19$a;->a(Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;)Z

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/d19$a;->b(Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;)Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public d(Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;)Landroid/content/SharedPreferences$Editor;
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
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;->toJson()Ljava/lang/String;

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
    invoke-virtual {p0}, Ll/d19$a;->c()Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/d19$a;->d(Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;)Landroid/content/SharedPreferences$Editor;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
