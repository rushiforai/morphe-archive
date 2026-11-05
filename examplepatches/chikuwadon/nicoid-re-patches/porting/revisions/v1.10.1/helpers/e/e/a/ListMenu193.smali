.class public final Le/e/a/ListMenu193;
.super Ljava/lang/Object;
.source "ListMenu193.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static add(Landroid/view/Menu;Ljava/util/List;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Object;I)V
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/Menu;",
            "Ljava/util/List<",
            "Le/e/a/ListActions$Action;",
            ">;",
            "Landroid/app/Activity;",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "I)V"
        }
    .end annotation

    .line 6
    invoke-static {p2}, Le/e/a/ListActions;->cacheList(Landroid/app/Activity;)Z

    move-result v0

    invoke-static {p2}, Le/e/a/ListActions;->history(Landroid/app/Activity;)Z

    move-result v1

    .line 7
    const/4 v2, 0x0

    if-nez v0, :cond_d

    if-eqz v1, :cond_28

    :cond_d
    add-int/lit8 v1, p5, 0x4

    if-eqz v0, :cond_14

    const-string v3, "\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u524a\u9664"

    goto :goto_16

    :cond_14
    const-string v3, "\u8996\u8074\u5c65\u6b74\u3092\u524a\u9664"

    :goto_16
    invoke-static {v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x46b8

    invoke-interface {p0, v2, v4, v1, v3}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v1

    new-instance v3, Le/e/a/ListMenu193$$ExternalSyntheticLambda1;

    invoke-direct {v3, p2, p4}, Le/e/a/ListMenu193$$ExternalSyntheticLambda1;-><init>(Landroid/app/Activity;Ljava/lang/Object;)V

    invoke-static {p1, v1, v3}, Le/e/a/ListMenu193;->add(Ljava/util/List;Landroid/view/MenuItem;Ljava/lang/Runnable;)V

    .line 8
    :cond_28
    const-string v1, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u306b\u8ffd\u52a0"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/16 v3, 0x46b6

    invoke-interface {p0, v2, v3, p5, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v1

    new-instance v3, Le/e/a/ListMenu193$$ExternalSyntheticLambda2;

    invoke-direct {v3, p2, p4}, Le/e/a/ListMenu193$$ExternalSyntheticLambda2;-><init>(Landroid/app/Activity;Ljava/lang/Object;)V

    invoke-static {p1, v1, v3}, Le/e/a/ListMenu193;->add(Ljava/util/List;Landroid/view/MenuItem;Ljava/lang/Runnable;)V

    .line 9
    if-eqz v0, :cond_54

    add-int/lit8 v0, p5, 0x2

    const-string v1, "\u30ad\u30e3\u30c3\u30b7\u30e5\u3092\u518d\u53d6\u5f97"

    invoke-static {v1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/16 v3, 0x46b7

    invoke-interface {p0, v2, v3, v0, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    new-instance v1, Le/e/a/ListMenu193$$ExternalSyntheticLambda3;

    invoke-direct {v1, p2, p4}, Le/e/a/ListMenu193$$ExternalSyntheticLambda3;-><init>(Landroid/app/Activity;Ljava/lang/Object;)V

    invoke-static {p1, v0, v1}, Le/e/a/ListMenu193;->add(Ljava/util/List;Landroid/view/MenuItem;Ljava/lang/Runnable;)V

    .line 10
    :cond_54
    add-int/lit8 p5, p5, 0x1

    const-string v0, "\u6295\u7a3f\u8005\u3092NG"

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x46b5

    invoke-interface {p0, v2, v1, p5, v0}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p0

    new-instance p5, Le/e/a/ListMenu193$$ExternalSyntheticLambda4;

    invoke-direct {p5, p2, p3, p4}, Le/e/a/ListMenu193$$ExternalSyntheticLambda4;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {p1, p0, p5}, Le/e/a/ListMenu193;->add(Ljava/util/List;Landroid/view/MenuItem;Ljava/lang/Runnable;)V

    .line 11
    return-void
.end method

.method static add(Ljava/util/List;Landroid/view/MenuItem;Ljava/lang/Runnable;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Le/e/a/ListActions$Action;",
            ">;",
            "Landroid/view/MenuItem;",
            "Ljava/lang/Runnable;",
            ")V"
        }
    .end annotation

    .line 12
    new-instance v0, Le/e/a/ListMenu193$$ExternalSyntheticLambda0;

    invoke-direct {v0, p2}, Le/e/a/ListMenu193$$ExternalSyntheticLambda0;-><init>(Ljava/lang/Runnable;)V

    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    new-instance v0, Le/e/a/ListActions$Action;

    invoke-direct {v0, p1, p2}, Le/e/a/ListActions$Action;-><init>(Landroid/view/MenuItem;Ljava/lang/Runnable;)V

    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method static synthetic lambda$0(Landroid/app/Activity;Ljava/lang/Object;)V
    .registers 2

    .line 7
    invoke-static {p0, p1}, Le/e/a/BulkSelection;->deleteOne(Landroid/app/Activity;Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$1(Landroid/app/Activity;Ljava/lang/Object;)V
    .registers 2

    .line 8
    invoke-static {p0, p1}, Le/e/a/LocalPlaylists;->addRow(Landroid/content/Context;Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$2(Landroid/app/Activity;Ljava/lang/Object;)V
    .registers 4

    .line 9
    const-string v0, "videourl"

    invoke-static {p1, v0}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "title"

    invoke-static {p1, v1}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, v0, p1}, Le/e/a/CacheRetry;->confirm(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$3(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 3

    .line 10
    invoke-static {p0, p1, p2}, Le/e/a/OwnerNg194;->confirmOwner(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic lambda$4(Ljava/lang/Runnable;Landroid/view/MenuItem;)Z
    .registers 2

    .line 12
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    const/4 p0, 0x1

    return p0
.end method
