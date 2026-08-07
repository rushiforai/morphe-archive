.class public Ll/dx6$a;
.super Ll/dyd0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/dx6;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dyd0<",
        "Lcom/p1/mobile/putong/data/LastMatchesData;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/dx6;


# direct methods
.method public constructor <init>(Ll/dx6;Ljava/lang/String;Lcom/p1/mobile/putong/data/LastMatchesData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dx6$a;->a:Ll/dx6;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3}, Ll/dyd0;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/LastMatchesData;Lcom/p1/mobile/putong/data/LastMatchesData;)Z
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/data/LastMatchesData;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/data/LastMatchesData;->equals(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public b(Lcom/p1/mobile/putong/data/LastMatchesData;Lcom/p1/mobile/putong/data/LastMatchesData;)Lcom/p1/mobile/putong/data/LastMatchesData;
    .locals 0
    .param p2    # Lcom/p1/mobile/putong/data/LastMatchesData;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/LastMatchesData;->clone()Lcom/p1/mobile/putong/data/LastMatchesData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c()Lcom/p1/mobile/putong/data/LastMatchesData;
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
    if-nez v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/hxd0;->defaultValue:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast p0, Lcom/p1/mobile/putong/data/LastMatchesData;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    :try_start_0
    sget-object v1, Lcom/p1/mobile/putong/data/LastMatchesData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/p1/mobile/putong/data/LastMatchesData;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    .line 27
    return-object v0

    .line 28
    :catch_0
    iget-object p0, p0, Ll/hxd0;->defaultValue:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast p0, Lcom/p1/mobile/putong/data/LastMatchesData;

    .line 31
    .line 32
    return-object p0
.end method

.method public bridge synthetic checkEquals(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/LastMatchesData;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/data/LastMatchesData;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/dx6$a;->a(Lcom/p1/mobile/putong/data/LastMatchesData;Lcom/p1/mobile/putong/data/LastMatchesData;)Z

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
    check-cast p1, Lcom/p1/mobile/putong/data/LastMatchesData;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/data/LastMatchesData;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/dx6$a;->b(Lcom/p1/mobile/putong/data/LastMatchesData;Lcom/p1/mobile/putong/data/LastMatchesData;)Lcom/p1/mobile/putong/data/LastMatchesData;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public d(Lcom/p1/mobile/putong/data/LastMatchesData;)Landroid/content/SharedPreferences$Editor;
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
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/LastMatchesData;->toJson()Ljava/lang/String;

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
    invoke-virtual {p0}, Ll/dx6$a;->c()Lcom/p1/mobile/putong/data/LastMatchesData;

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
    check-cast p1, Lcom/p1/mobile/putong/data/LastMatchesData;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/dx6$a;->d(Lcom/p1/mobile/putong/data/LastMatchesData;)Landroid/content/SharedPreferences$Editor;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
