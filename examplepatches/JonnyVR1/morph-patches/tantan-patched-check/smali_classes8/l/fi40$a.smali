.class public Ll/fi40$a;
.super Ll/dyd0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/fi40;->b(Ljava/lang/String;)Ll/dyd0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dyd0<",
        "Lcom/p1/mobile/putong/core/data/Surveys;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/fi40;


# direct methods
.method public constructor <init>(Ll/fi40;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Surveys;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fi40$a;->a:Ll/fi40;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3}, Ll/dyd0;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/data/Surveys;Lcom/p1/mobile/putong/core/data/Surveys;)Z
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/data/Surveys;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Surveys;->id:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Surveys;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public b(Lcom/p1/mobile/putong/core/data/Surveys;Lcom/p1/mobile/putong/core/data/Surveys;)Lcom/p1/mobile/putong/core/data/Surveys;
    .locals 0
    .param p2    # Lcom/p1/mobile/putong/core/data/Surveys;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Surveys;->clone()Lcom/p1/mobile/putong/core/data/Surveys;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c()Lcom/p1/mobile/putong/core/data/Surveys;
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
    check-cast p0, Lcom/p1/mobile/putong/core/data/Surveys;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    check-cast p0, Lcom/p1/mobile/putong/core/data/Surveys;

    .line 20
    .line 21
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/data/Surveys;->parse(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Surveys;)Lcom/p1/mobile/putong/core/data/Surveys;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/Surveys;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/core/data/Surveys;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/fi40$a;->a(Lcom/p1/mobile/putong/core/data/Surveys;Lcom/p1/mobile/putong/core/data/Surveys;)Z

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/Surveys;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/core/data/Surveys;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/fi40$a;->b(Lcom/p1/mobile/putong/core/data/Surveys;Lcom/p1/mobile/putong/core/data/Surveys;)Lcom/p1/mobile/putong/core/data/Surveys;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public d(Lcom/p1/mobile/putong/core/data/Surveys;)Landroid/content/SharedPreferences$Editor;
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
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Surveys;->toJson()Ljava/lang/String;

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
    invoke-virtual {p0}, Ll/fi40$a;->c()Lcom/p1/mobile/putong/core/data/Surveys;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/Surveys;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/fi40$a;->d(Lcom/p1/mobile/putong/core/data/Surveys;)Landroid/content/SharedPreferences$Editor;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
