.class public abstract Lyjf;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/Map;

.field public static final b:Ljava/util/Set;


# direct methods
.method static constructor <clinit>()V
    .registers 16

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    const/4 v6, 0x0

    const/4 v7, 0x1

    const v2, 0x7f140b57

    const/4 v3, 0x2

    const-string v4, "media"

    const/4 v5, 0x0

    invoke-static/range {v2 .. v7}, Lrr4;->a(IILjava/lang/String;ZZI)Lrr4;

    move-result-object v2

    const-string v3, "media"

    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    const/4 v8, 0x0

    const/4 v9, 0x1

    const v4, 0x7f140b5e

    const/4 v5, 0x4

    const-string v6, "screen_capture"

    const/4 v7, 0x0

    invoke-static/range {v4 .. v9}, Lrr4;->a(IILjava/lang/String;ZZI)Lrr4;

    move-result-object v2

    const-string v3, "screen_capture"

    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    new-instance v4, Lrr4;

    const-string v5, "news"

    const v6, 0x7f140b59

    const/4 v7, 0x2

    const/4 v8, 0x1

    const/4 v9, 0x0

    const/4 v10, 0x1

    const/4 v11, 0x1

    const/4 v12, 0x1

    invoke-direct/range {v4 .. v12}, Lrr4;-><init>(Ljava/lang/String;IIZZIZZ)V

    const-string v2, "news"

    invoke-virtual {v0, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    const/4 v10, 0x0

    const v5, 0x7f140b52

    const/4 v6, 0x2

    const-string v7, "downloads_active"

    const/4 v8, 0x0

    invoke-static/range {v5 .. v10}, Lrr4;->a(IILjava/lang/String;ZZI)Lrr4;

    move-result-object v2

    const-string v3, "downloads_active"

    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    const v4, 0x7f140b53

    const/4 v5, 0x1

    const-string v6, "downloads_finished"

    const/4 v7, 0x1

    invoke-static/range {v4 .. v9}, Lrr4;->a(IILjava/lang/String;ZZI)Lrr4;

    move-result-object v2

    const-string v3, "downloads_finished"

    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    new-instance v4, Lrr4;

    const-string v5, "other"

    const v6, 0x7f140b5b

    const/4 v7, 0x2

    const/4 v8, 0x1

    const/4 v11, 0x0

    invoke-direct/range {v4 .. v12}, Lrr4;-><init>(Ljava/lang/String;IIZZIZZ)V

    const-string v2, "other"

    invoke-virtual {v0, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    const v5, 0x7f140b5c

    const/4 v6, 0x2

    const-string v7, "private_tabs"

    invoke-static/range {v5 .. v10}, Lrr4;->a(IILjava/lang/String;ZZI)Lrr4;

    move-result-object v2

    const-string v3, "private_tabs"

    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    new-instance v4, Lrr4;

    const-string v5, "com_appboy_default_notification_channel"

    const v6, 0x7f140bf2

    const/4 v7, 0x3

    const/4 v10, 0x1

    invoke-direct/range {v4 .. v12}, Lrr4;-><init>(Ljava/lang/String;IIZZIZZ)V

    const-string v2, "com_appboy_default_notification_channel"

    invoke-virtual {v0, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    new-instance v5, Lrr4;

    const-string v6, "wallet"

    const v7, 0x7f140b61

    const/4 v8, 0x4

    const/4 v9, 0x1

    const/4 v10, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x1

    invoke-direct/range {v5 .. v13}, Lrr4;-><init>(Ljava/lang/String;IIZZIZZ)V

    const-string v2, "wallet"

    invoke-virtual {v0, v2, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    new-instance v6, Lrr4;

    const-string v7, "installation"

    const v8, 0x7f140b56

    const/4 v9, 0x4

    const/4 v10, 0x1

    const/4 v12, 0x1

    const/4 v13, 0x0

    const/4 v14, 0x1

    invoke-direct/range {v6 .. v14}, Lrr4;-><init>(Ljava/lang/String;IIZZIZZ)V

    const-string v2, "installation"

    invoke-virtual {v0, v2, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    const/4 v12, 0x0

    const v7, 0x7f140b5a

    const/4 v8, 0x2

    const-string v9, "offline_pages_migration"

    const/4 v10, 0x0

    invoke-static/range {v7 .. v12}, Lrr4;->a(IILjava/lang/String;ZZI)Lrr4;

    move-result-object v2

    const-string v3, "offline_pages_migration"

    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    new-instance v4, Lrr4;

    const-string v5, "flow"

    const v6, 0x7f140b54

    const/4 v7, 0x3

    const/4 v8, 0x1

    const/4 v9, 0x0

    const/4 v12, 0x1

    invoke-direct/range {v4 .. v12}, Lrr4;-><init>(Ljava/lang/String;IIZZIZZ)V

    const-string v2, "flow"

    invoke-virtual {v0, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    new-instance v5, Lrr4;

    const-string v6, "account_and_subscriptions"

    const v7, 0x7f140b4e

    const/4 v8, 0x4

    const/4 v9, 0x1

    const/4 v13, 0x1

    invoke-direct/range {v5 .. v13}, Lrr4;-><init>(Ljava/lang/String;IIZZIZZ)V

    const-string v2, "account_and_subscriptions"

    invoke-virtual {v0, v2, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    new-instance v6, Lrr4;

    const-string v7, "livescore"

    const v8, 0x7f140946

    const/4 v9, 0x4

    const/4 v10, 0x1

    invoke-direct/range {v6 .. v14}, Lrr4;-><init>(Ljava/lang/String;IIZZIZZ)V

    const-string v2, "livescore"

    invoke-virtual {v0, v2, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    new-instance v7, Lrr4;

    const-string v8, "rewards"

    const v9, 0x7f140b5d

    const/4 v10, 0x4

    const/4 v11, 0x1

    const/4 v12, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x1

    invoke-direct/range {v7 .. v15}, Lrr4;-><init>(Ljava/lang/String;IIZZIZZ)V

    const-string v2, "rewards"

    invoke-virtual {v0, v2, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v12, 0x1

    const v8, 0x7f140b50

    const/4 v9, 0x2

    const-string v10, "weather_forecast"

    const/4 v11, 0x0

    invoke-static/range {v8 .. v13}, Lrr4;->a(IILjava/lang/String;ZZI)Lrr4;

    move-result-object v2

    const-string v3, "weather_forecast"

    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    new-instance v4, Lrr4;

    const-string v5, "weather_alerts"

    const v6, 0x7f140b5f

    const/4 v7, 0x4

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x1

    const/4 v11, 0x1

    invoke-direct/range {v4 .. v12}, Lrr4;-><init>(Ljava/lang/String;IIZZIZZ)V

    const-string v2, "weather_alerts"

    invoke-virtual {v0, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    new-instance v5, Lrr4;

    const-string v6, "esim"

    const v7, 0x7f1406d0

    const/4 v8, 0x3

    const/4 v10, 0x0

    invoke-direct/range {v5 .. v13}, Lrr4;-><init>(Ljava/lang/String;IIZZIZZ)V

    const-string v2, "esim"

    invoke-virtual {v0, v2, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lyjf;->a:Ljava/util/Map;

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lyjf;->b:Ljava/util/Set;

    return-void
.end method
