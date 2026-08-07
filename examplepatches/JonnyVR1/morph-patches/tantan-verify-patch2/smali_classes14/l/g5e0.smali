.class public Ll/g5e0;
.super Ll/o5e0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/o5e0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public c(Ll/abe0;Ll/z20;)Landroid/content/Intent;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/abe0;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/content/Intent;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p2, "cards"

    .line 6
    .line 7
    invoke-static {p2}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    const-string v0, "wanwan"

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/putong/data/NavigationCardIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationCardIntent;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p1}, Ll/abe0;->f()Ljava/util/Map;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-static {p0, p2, v0, p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->O5(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;Lcom/p1/mobile/putong/data/NavigationCardIntent;Ljava/util/Map;)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method
