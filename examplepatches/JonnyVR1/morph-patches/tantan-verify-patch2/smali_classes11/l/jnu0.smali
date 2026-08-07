.class public final synthetic Ll/jnu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqs0;


# instance fields
.field public final synthetic a:Ll/mnu0;


# direct methods
.method public synthetic constructor <init>(Ll/mnu0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jnu0;->a:Ll/mnu0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/util/Map;)V
    .locals 6

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Ll/wit0;

    .line 3
    .line 4
    invoke-interface {v0}, Ll/wit0;->zzN()Ll/nkt0;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    new-instance v1, Ll/gnu0;

    .line 9
    .line 10
    iget-object p0, p0, Ll/jnu0;->a:Ll/mnu0;

    .line 11
    .line 12
    invoke-direct {v1, p0, p2}, Ll/gnu0;-><init>(Ll/mnu0;Ljava/util/Map;)V

    .line 13
    .line 14
    .line 15
    invoke-interface {p1, v1}, Ll/nkt0;->zzB(Ll/lkt0;)V

    .line 16
    .line 17
    .line 18
    const-string p0, "overlayHtml"

    .line 19
    .line 20
    invoke-interface {p2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    move-object v2, p0

    .line 25
    check-cast v2, Ljava/lang/String;

    .line 26
    .line 27
    const-string p0, "baseUrl"

    .line 28
    .line 29
    invoke-interface {p2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    move-object v1, p0

    .line 34
    check-cast v1, Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-eqz p0, :cond_0

    .line 41
    .line 42
    const-string p0, "text/html"

    .line 43
    .line 44
    const-string p1, "UTF-8"

    .line 45
    .line 46
    invoke-interface {v0, v2, p0, p1}, Ll/wit0;->loadData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    const-string v4, "UTF-8"

    .line 51
    .line 52
    const/4 v5, 0x0

    .line 53
    const-string v3, "text/html"

    .line 54
    .line 55
    invoke-interface/range {v0 .. v5}, Ll/wit0;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method
