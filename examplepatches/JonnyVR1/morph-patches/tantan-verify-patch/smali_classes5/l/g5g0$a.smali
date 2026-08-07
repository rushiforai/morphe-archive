.class public Ll/g5g0$a;
.super Ll/dyd0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/g5g0;->b(Ljava/lang/String;)Ll/dyd0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dyd0<",
        "Lcom/p1/mobile/putong/core/data/EmojiCacheData;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/g5g0;


# direct methods
.method public constructor <init>(Ll/g5g0;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/EmojiCacheData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g5g0$a;->a:Ll/g5g0;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3}, Ll/dyd0;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/data/EmojiCacheData;Lcom/p1/mobile/putong/core/data/EmojiCacheData;)Z
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/data/EmojiCacheData;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/data/EmojiCacheData;->equals(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public b(Lcom/p1/mobile/putong/core/data/EmojiCacheData;Lcom/p1/mobile/putong/core/data/EmojiCacheData;)Lcom/p1/mobile/putong/core/data/EmojiCacheData;
    .locals 0
    .param p2    # Lcom/p1/mobile/putong/core/data/EmojiCacheData;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/EmojiCacheData;->clone()Lcom/p1/mobile/putong/core/data/EmojiCacheData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c()Lcom/p1/mobile/putong/core/data/EmojiCacheData;
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
    if-nez v0, :cond_0

    .line 15
    .line 16
    check-cast p0, Lcom/p1/mobile/putong/core/data/EmojiCacheData;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    check-cast p0, Lcom/p1/mobile/putong/core/data/EmojiCacheData;

    .line 20
    .line 21
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/data/EmojiCacheData;->parse(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/EmojiCacheData;)Lcom/p1/mobile/putong/core/data/EmojiCacheData;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public bridge synthetic checkEquals(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/data/EmojiCacheData;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/core/data/EmojiCacheData;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/g5g0$a;->a(Lcom/p1/mobile/putong/core/data/EmojiCacheData;Lcom/p1/mobile/putong/core/data/EmojiCacheData;)Z

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/EmojiCacheData;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/core/data/EmojiCacheData;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/g5g0$a;->b(Lcom/p1/mobile/putong/core/data/EmojiCacheData;Lcom/p1/mobile/putong/core/data/EmojiCacheData;)Lcom/p1/mobile/putong/core/data/EmojiCacheData;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public d(Lcom/p1/mobile/putong/core/data/EmojiCacheData;)Landroid/content/SharedPreferences$Editor;
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
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/EmojiCacheData;->toJson()Ljava/lang/String;

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
    invoke-virtual {p0}, Ll/g5g0$a;->c()Lcom/p1/mobile/putong/core/data/EmojiCacheData;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/EmojiCacheData;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/g5g0$a;->d(Lcom/p1/mobile/putong/core/data/EmojiCacheData;)Landroid/content/SharedPreferences$Editor;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
