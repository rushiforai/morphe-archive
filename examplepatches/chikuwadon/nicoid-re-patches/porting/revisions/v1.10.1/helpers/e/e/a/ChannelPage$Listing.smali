.class final Le/e/a/ChannelPage$Listing;
.super Ljava/lang/Object;
.source "ChannelPage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/ChannelPage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Listing"
.end annotation


# instance fields
.field final a:Landroid/app/Activity;

.field final adapter:Landroid/widget/BaseAdapter;

.field busy:Z

.field final id:Ljava/lang/String;

.field final metadata:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/NetworkTask;",
            ">;"
        }
    .end annotation
.end field

.field final more:Landroid/widget/Button;

.field final name:Ljava/lang/String;

.field page:I

.field final root:Landroid/view/View;

.field final rows:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final seen:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field task:Le/e/a/NetworkTask;


# direct methods
.method constructor <init>(Landroid/app/Activity;Landroid/view/View;Landroid/widget/Button;Ljava/util/ArrayList;Landroid/widget/BaseAdapter;Ljava/lang/String;Ljava/lang/String;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Landroid/view/View;",
            "Landroid/widget/Button;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;",
            "Landroid/widget/BaseAdapter;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Le/e/a/ChannelPage$Listing;->seen:Ljava/util/Set;

    const/4 v0, 0x1

    iput v0, p0, Le/e/a/ChannelPage$Listing;->page:I

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/ChannelPage$Listing;->metadata:Ljava/util/ArrayList;

    .line 17
    iput-object p1, p0, Le/e/a/ChannelPage$Listing;->a:Landroid/app/Activity;

    iput-object p2, p0, Le/e/a/ChannelPage$Listing;->root:Landroid/view/View;

    iput-object p3, p0, Le/e/a/ChannelPage$Listing;->more:Landroid/widget/Button;

    iput-object p4, p0, Le/e/a/ChannelPage$Listing;->rows:Ljava/util/ArrayList;

    iput-object p5, p0, Le/e/a/ChannelPage$Listing;->adapter:Landroid/widget/BaseAdapter;

    iput-object p6, p0, Le/e/a/ChannelPage$Listing;->id:Ljava/lang/String;

    iput-object p7, p0, Le/e/a/ChannelPage$Listing;->name:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method hydrate(Le/e/a/ChannelFeed$Video;Ljava/lang/Object;)V
    .registers 6

    .line 19
    new-instance v0, Le/e/a/NetworkTask;

    invoke-direct {v0}, Le/e/a/NetworkTask;-><init>()V

    iget-object v1, p0, Le/e/a/ChannelPage$Listing;->metadata:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    # getter for: Le/e/a/ChannelPage;->WORK:Ljava/util/concurrent/ExecutorService;
    invoke-static {}, Le/e/a/ChannelPage;->access$0()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    new-instance v2, Le/e/a/ChannelPage$Listing$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0, v0, p1, p2}, Le/e/a/ChannelPage$Listing$$ExternalSyntheticLambda1;-><init>(Le/e/a/ChannelPage$Listing;Le/e/a/NetworkTask;Le/e/a/ChannelFeed$Video;Ljava/lang/Object;)V

    invoke-virtual {v0, v1, v2}, Le/e/a/NetworkTask;->start(Ljava/util/concurrent/ExecutorService;Ljava/lang/Runnable;)V

    return-void
.end method

.method synthetic lambda$0$e-e-a-ChannelPage$Listing(Le/e/a/NetworkTask;Le/e/a/ChannelFeed$Video;Ljava/lang/Object;)V
    .registers 11

    .line 19
    const-string v0, " "

    :try_start_2
    invoke-static {p2, p1}, Le/e/a/ChannelVideoMetadata;->fetch(Le/e/a/ChannelFeed$Video;Le/e/a/NetworkTask;)Le/e/a/ChannelVideoMetadata$Result;

    move-result-object v1

    iget-object v2, v1, Le/e/a/ChannelVideoMetadata$Result;->response:Lorg/json/JSONObject;

    invoke-static {v2}, Le/e/a/DetailData;->watchData(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "video"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "client"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "metadata "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, p2, Le/e/a/ChannelFeed$Video;->id:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " resolved="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4
    :try_end_2b
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2b} :catch_d3
    .catchall {:try_start_2 .. :try_end_2b} :catchall_d1

    const-string v5, "missing"

    if-nez v3, :cond_31

    move-object v6, v5

    goto :goto_37

    :cond_31
    :try_start_31
    const-string v6, "id"

    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    :goto_37
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " client="

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    if-nez v2, :cond_45

    move-object v2, v5

    goto :goto_4b

    :cond_45
    const-string v6, "watchId"

    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :goto_4b
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " count="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    if-eqz v3, :cond_61

    const-string v4, "count"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    if-eqz v3, :cond_61

    const/4 v3, 0x1

    goto :goto_62

    :cond_61
    const/4 v3, 0x0

    :goto_62
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Le/e/a/ChannelPage;->record(Ljava/lang/String;)V

    invoke-static {p2, v1}, Le/e/a/ChannelVideoMetadata;->applyFetched(Le/e/a/ChannelFeed$Video;Le/e/a/ChannelVideoMetadata$Result;)Z

    move-result v1

    if-nez v1, :cond_94

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v1, "metadata rejected "

    invoke-direct {p3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p2, Le/e/a/ChannelFeed$Video;->id:Ljava/lang/String;

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, Le/e/a/ChannelPage;->record(Ljava/lang/String;)V
    :try_end_87
    .catch Ljava/lang/Exception; {:try_start_31 .. :try_end_87} :catch_d3
    .catchall {:try_start_31 .. :try_end_87} :catchall_d1

    # getter for: Le/e/a/ChannelPage;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/ChannelPage;->access$1()Landroid/os/Handler;

    move-result-object p2

    new-instance p3, Le/e/a/ChannelPage$Listing$$ExternalSyntheticLambda4;

    invoke-direct {p3, p0, p1}, Le/e/a/ChannelPage$Listing$$ExternalSyntheticLambda4;-><init>(Le/e/a/ChannelPage$Listing;Le/e/a/NetworkTask;)V

    invoke-virtual {p2, p3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_94
    :try_start_94
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "counts "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p2, Le/e/a/ChannelFeed$Video;->id:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p2, Le/e/a/ChannelFeed$Video;->counts:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_ae

    goto :goto_b0

    :cond_ae
    iget-object v5, p2, Le/e/a/ChannelFeed$Video;->counts:Ljava/lang/String;

    :goto_b0
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Le/e/a/ChannelPage;->record(Ljava/lang/String;)V

    # getter for: Le/e/a/ChannelPage;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/ChannelPage;->access$1()Landroid/os/Handler;

    move-result-object v1

    new-instance v2, Le/e/a/ChannelPage$Listing$$ExternalSyntheticLambda5;

    invoke-direct {v2, p0, p1, p3, p2}, Le/e/a/ChannelPage$Listing$$ExternalSyntheticLambda5;-><init>(Le/e/a/ChannelPage$Listing;Le/e/a/NetworkTask;Ljava/lang/Object;Le/e/a/ChannelFeed$Video;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_c7
    .catch Ljava/lang/Exception; {:try_start_94 .. :try_end_c7} :catch_d3
    .catchall {:try_start_94 .. :try_end_c7} :catchall_d1

    # getter for: Le/e/a/ChannelPage;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/ChannelPage;->access$1()Landroid/os/Handler;

    move-result-object p2

    new-instance p3, Le/e/a/ChannelPage$Listing$$ExternalSyntheticLambda4;

    invoke-direct {p3, p0, p1}, Le/e/a/ChannelPage$Listing$$ExternalSyntheticLambda4;-><init>(Le/e/a/ChannelPage$Listing;Le/e/a/NetworkTask;)V

    goto :goto_12f

    :catchall_d1
    move-exception p2

    goto :goto_133

    :catch_d3
    move-exception p3

    :try_start_d4
    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v1

    if-nez v1, :cond_11f

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "metadata failed "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p2, p2, Le/e/a/ChannelFeed$Video;->id:Ljava/lang/String;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_112

    invoke-virtual {p3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    const-string v1, "HTTP "

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_112

    invoke-virtual {p3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    goto :goto_114

    :cond_112
    const-string v0, ""

    :goto_114
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Le/e/a/ChannelPage;->record(Ljava/lang/String;)V

    :cond_11f
    const-string p2, "nicoid-channel"

    const-string v0, "Unable to load video metadata"

    invoke-static {p2, v0, p3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_126
    .catchall {:try_start_d4 .. :try_end_126} :catchall_d1

    # getter for: Le/e/a/ChannelPage;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/ChannelPage;->access$1()Landroid/os/Handler;

    move-result-object p2

    new-instance p3, Le/e/a/ChannelPage$Listing$$ExternalSyntheticLambda4;

    invoke-direct {p3, p0, p1}, Le/e/a/ChannelPage$Listing$$ExternalSyntheticLambda4;-><init>(Le/e/a/ChannelPage$Listing;Le/e/a/NetworkTask;)V

    :goto_12f
    invoke-virtual {p2, p3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :goto_133
    # getter for: Le/e/a/ChannelPage;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/ChannelPage;->access$1()Landroid/os/Handler;

    move-result-object p3

    new-instance v0, Le/e/a/ChannelPage$Listing$$ExternalSyntheticLambda4;

    invoke-direct {v0, p0, p1}, Le/e/a/ChannelPage$Listing$$ExternalSyntheticLambda4;-><init>(Le/e/a/ChannelPage$Listing;Le/e/a/NetworkTask;)V

    invoke-virtual {p3, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    throw p2
.end method

.method synthetic lambda$1$e-e-a-ChannelPage$Listing(Le/e/a/NetworkTask;)V
    .registers 3

    .line 19
    iget-object v0, p0, Le/e/a/ChannelPage$Listing;->metadata:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method synthetic lambda$2$e-e-a-ChannelPage$Listing(Le/e/a/NetworkTask;Ljava/lang/Object;Le/e/a/ChannelFeed$Video;)V
    .registers 10

    .line 19
    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p1

    if-nez p1, :cond_96

    iget-object p1, p0, Le/e/a/ChannelPage$Listing;->a:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result p1

    if-nez p1, :cond_96

    iget-object p1, p0, Le/e/a/ChannelPage$Listing;->rows:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_18

    goto/16 :goto_96

    :cond_18
    :try_start_18
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    const-string v0, "a"

    const/4 v1, 0x2

    new-array v2, v1, [Ljava/lang/Class;

    const-class v3, Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-class v3, Ljava/lang/Object;

    const/4 v5, 0x1

    aput-object v3, v2, v5

    invoke-virtual {p1, v0, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    new-array v0, v1, [Ljava/lang/Object;

    const-string v2, "thumbnail"

    aput-object v2, v0, v4

    iget-object v2, p3, Le/e/a/ChannelFeed$Video;->image:Ljava/lang/String;

    aput-object v2, v0, v5

    invoke-virtual {p1, p2, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    new-array v0, v1, [Ljava/lang/Object;

    const-string v1, "videoinfo"

    aput-object v1, v0, v4

    new-instance v1, Landroid/text/SpannableString;

    iget-object v2, p3, Le/e/a/ChannelFeed$Video;->counts:Ljava/lang/String;

    invoke-direct {v1, v2}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    aput-object v1, v0, v5

    invoke-virtual {p1, p2, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Le/e/a/ChannelPage$Listing;->adapter:Landroid/widget/BaseAdapter;

    invoke-virtual {p1}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "row updated "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p2, p3, Le/e/a/ChannelFeed$Video;->id:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/ChannelPage;->record(Ljava/lang/String;)V
    :try_end_67
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_67} :catch_68

    goto :goto_96

    :catch_68
    move-exception p1

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "row update failed "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p3, Le/e/a/ChannelFeed$Video;->id:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, " "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Le/e/a/ChannelPage;->record(Ljava/lang/String;)V

    const-string p2, "nicoid-channel"

    const-string p3, "Unable to update video metadata"

    invoke-static {p2, p3, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_96
    :goto_96
    return-void
.end method

.method synthetic lambda$3$e-e-a-ChannelPage$Listing(ILe/e/a/NetworkTask;)V
    .registers 5

    .line 21
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "https://ch.nicovideo.jp/"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Le/e/a/ChannelPage$Listing;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/video?rss=2.0&page="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p2}, Le/e/a/ChannelPage;->read(Ljava/lang/String;Le/e/a/NetworkTask;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/ChannelFeed;->parse(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    # getter for: Le/e/a/ChannelPage;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/ChannelPage;->access$1()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Le/e/a/ChannelPage$Listing$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0, p2, p1}, Le/e/a/ChannelPage$Listing$$ExternalSyntheticLambda2;-><init>(Le/e/a/ChannelPage$Listing;Le/e/a/NetworkTask;Ljava/util/List;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_2f} :catch_30

    goto :goto_3d

    :catch_30
    move-exception p1

    # getter for: Le/e/a/ChannelPage;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/ChannelPage;->access$1()Landroid/os/Handler;

    move-result-object p1

    new-instance v0, Le/e/a/ChannelPage$Listing$$ExternalSyntheticLambda3;

    invoke-direct {v0, p0, p2}, Le/e/a/ChannelPage$Listing$$ExternalSyntheticLambda3;-><init>(Le/e/a/ChannelPage$Listing;Le/e/a/NetworkTask;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_3d
    return-void
.end method

.method synthetic lambda$4$e-e-a-ChannelPage$Listing(Le/e/a/NetworkTask;Ljava/util/List;)V
    .registers 13

    .line 21
    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p1

    if-nez p1, :cond_13d

    iget-object p1, p0, Le/e/a/ChannelPage$Listing;->a:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result p1

    if-eqz p1, :cond_10

    goto/16 :goto_13d

    :cond_10
    const/4 p1, 0x0

    iput-boolean p1, p0, Le/e/a/ChannelPage$Listing;->busy:Z

    const/4 v0, 0x1

    :try_start_14
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x0

    :goto_19
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_6b

    iget p1, p0, Le/e/a/ChannelPage$Listing;->page:I

    add-int/2addr p1, v0

    iput p1, p0, Le/e/a/ChannelPage$Listing;->page:I

    iget-object p1, p0, Le/e/a/ChannelPage$Listing;->adapter:Landroid/widget/BaseAdapter;

    invoke-virtual {p1}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    iget-object p1, p0, Le/e/a/ChannelPage$Listing;->more:Landroid/widget/Button;

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object p1, p0, Le/e/a/ChannelPage$Listing;->more:Landroid/widget/Button;

    iget-object v1, p0, Le/e/a/ChannelPage$Listing;->rows:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_41

    iget-object v1, p0, Le/e/a/ChannelPage$Listing;->a:Landroid/app/Activity;

    const-string v3, "\u52d5\u753b\u306f\u3042\u308a\u307e\u305b\u3093"

    const-string v4, "No videos"

    const-string v5, "\u5f71\u7247\u4e0d\u5b58\u5728"

    goto :goto_49

    :cond_41
    iget-object v1, p0, Le/e/a/ChannelPage$Listing;->a:Landroid/app/Activity;

    const-string v3, "\u3082\u3063\u3068\u898b\u308b"

    const-string v4, "View more"

    const-string v5, "\u67e5\u770b\u66f4\u591a"

    :goto_49
    invoke-static {v1, v3, v4, v5}, Le/e/a/ChannelPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Le/e/a/ChannelPage$Listing;->rows:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_13d

    if-eqz v2, :cond_62

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p1

    const/16 p2, 0xa

    if-ge p1, p2, :cond_13d

    :cond_62
    iget-object p1, p0, Le/e/a/ChannelPage$Listing;->more:Landroid/widget/Button;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setVisibility(I)V

    goto/16 :goto_13d

    :cond_6b
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/ChannelFeed$Video;

    iget-object v4, p0, Le/e/a/ChannelPage$Listing;->seen:Ljava/util/Set;

    iget-object v5, v3, Le/e/a/ChannelFeed$Video;->id:Ljava/lang/String;

    invoke-interface {v4, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_7c

    :goto_7b
    goto :goto_19

    :cond_7c
    add-int/lit8 v2, v2, 0x1

    iget-object v4, p0, Le/e/a/ChannelPage$Listing;->a:Landroid/app/Activity;

    iget-object v5, v3, Le/e/a/ChannelFeed$Video;->title:Ljava/lang/String;

    iget-object v6, p0, Le/e/a/ChannelPage$Listing;->name:Ljava/lang/String;

    invoke-static {v4, v5, v6}, Le/e/a/ContentFilter;->blocked(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_8b

    goto :goto_7b

    :cond_8b
    const-string v4, "e.e.a.x1"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    new-array v5, p1, [Ljava/lang/Class;

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v4

    new-array v5, p1, [Ljava/lang/Object;

    invoke-virtual {v4, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-string v6, "a"

    const/4 v7, 0x2

    new-array v8, v7, [Ljava/lang/Class;

    const-class v9, Ljava/lang/String;

    aput-object v9, v8, p1

    const-class v9, Ljava/lang/Object;

    aput-object v9, v8, v0

    invoke-virtual {v5, v6, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    new-array v6, v7, [Ljava/lang/Object;

    const-string v8, "videourl"

    aput-object v8, v6, p1

    iget-object v8, v3, Le/e/a/ChannelFeed$Video;->url:Ljava/lang/String;

    aput-object v8, v6, v0

    invoke-virtual {v5, v4, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    new-array v6, v7, [Ljava/lang/Object;

    const-string v8, "title"

    aput-object v8, v6, p1

    iget-object v8, v3, Le/e/a/ChannelFeed$Video;->title:Ljava/lang/String;

    aput-object v8, v6, v0

    invoke-virtual {v5, v4, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    new-array v6, v7, [Ljava/lang/Object;

    const-string v8, "thumbnail"

    aput-object v8, v6, p1

    iget-object v8, v3, Le/e/a/ChannelFeed$Video;->image:Ljava/lang/String;

    aput-object v8, v6, v0

    invoke-virtual {v5, v4, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    new-array v6, v7, [Ljava/lang/Object;

    const-string v8, "videoinfo"

    aput-object v8, v6, p1

    new-instance v8, Landroid/text/SpannableString;

    iget-object v9, v3, Le/e/a/ChannelFeed$Video;->counts:Ljava/lang/String;

    invoke-direct {v8, v9}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    aput-object v8, v6, v0

    invoke-virtual {v5, v4, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    new-array v6, v7, [Ljava/lang/Object;

    const-string v8, "posttime"

    aput-object v8, v6, p1

    new-instance v8, Landroid/text/SpannableString;

    iget-object v9, v3, Le/e/a/ChannelFeed$Video;->date:Ljava/lang/String;

    invoke-direct {v8, v9}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    aput-object v8, v6, v0

    invoke-virtual {v5, v4, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    new-array v6, v7, [Ljava/lang/Object;

    const-string v7, "length"

    aput-object v7, v6, p1

    iget-object v7, v3, Le/e/a/ChannelFeed$Video;->length:Ljava/lang/String;

    invoke-static {v7}, Le/e/a/ChannelPage;->duration(Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object v7

    aput-object v7, v6, v0

    invoke-virtual {v5, v4, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    const-string v5, "b"

    iget-object v6, v3, Le/e/a/ChannelFeed$Video;->id:Ljava/lang/String;

    invoke-static {v4, v5, v6}, Le/e/a/ChannelPage;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v5, "y"

    iget-object v6, p0, Le/e/a/ChannelPage$Listing;->name:Ljava/lang/String;

    invoke-static {v4, v5, v6}, Le/e/a/ChannelPage;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v5, p0, Le/e/a/ChannelPage$Listing;->rows:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v3, v4}, Le/e/a/ChannelPage$Listing;->hydrate(Le/e/a/ChannelFeed$Video;Ljava/lang/Object;)V
    :try_end_124
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_124} :catch_126

    goto/16 :goto_7b

    :catch_126
    move-exception p1

    iget-object p1, p0, Le/e/a/ChannelPage$Listing;->more:Landroid/widget/Button;

    iget-object p2, p0, Le/e/a/ChannelPage$Listing;->a:Landroid/app/Activity;

    const-string v1, "Retry"

    const-string v2, "\u91cd\u8a66"

    const-string v3, "\u518d\u8a66\u884c"

    invoke-static {p2, v3, v1, v2}, Le/e/a/ChannelPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Le/e/a/ChannelPage$Listing;->more:Landroid/widget/Button;

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    :cond_13d
    :goto_13d
    return-void
.end method

.method synthetic lambda$5$e-e-a-ChannelPage$Listing(Le/e/a/NetworkTask;)V
    .registers 6

    .line 21
    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancelled()Z

    move-result p1

    if-nez p1, :cond_28

    iget-object p1, p0, Le/e/a/ChannelPage$Listing;->a:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result p1

    if-nez p1, :cond_28

    const/4 p1, 0x0

    iput-boolean p1, p0, Le/e/a/ChannelPage$Listing;->busy:Z

    iget-object p1, p0, Le/e/a/ChannelPage$Listing;->more:Landroid/widget/Button;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object p1, p0, Le/e/a/ChannelPage$Listing;->more:Landroid/widget/Button;

    iget-object v0, p0, Le/e/a/ChannelPage$Listing;->a:Landroid/app/Activity;

    const-string v1, "Unable to load. Retry"

    const-string v2, "\u8f09\u5165\u5931\u6557\uff0c\u91cd\u8a66"

    const-string v3, "\u8aad\u307f\u8fbc\u307f\u306b\u5931\u6557\u3057\u307e\u3057\u305f\u3002\u518d\u8a66\u884c"

    invoke-static {v0, v3, v1, v2}, Le/e/a/ChannelPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    :cond_28
    return-void
.end method

.method load()V
    .registers 6

    .line 21
    iget-boolean v0, p0, Le/e/a/ChannelPage$Listing;->busy:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/ChannelPage$Listing;->busy:Z

    iget-object v0, p0, Le/e/a/ChannelPage$Listing;->more:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v0, p0, Le/e/a/ChannelPage$Listing;->more:Landroid/widget/Button;

    iget-object v1, p0, Le/e/a/ChannelPage$Listing;->a:Landroid/app/Activity;

    const-string v2, "Loading\u2026"

    const-string v3, "\u8f09\u5165\u4e2d\u2026"

    const-string v4, "\u8aad\u307f\u8fbc\u307f\u4e2d\u2026"

    invoke-static {v1, v4, v2, v3}, Le/e/a/ChannelPage;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    new-instance v0, Le/e/a/NetworkTask;

    invoke-direct {v0}, Le/e/a/NetworkTask;-><init>()V

    iput-object v0, p0, Le/e/a/ChannelPage$Listing;->task:Le/e/a/NetworkTask;

    iget v1, p0, Le/e/a/ChannelPage$Listing;->page:I

    # getter for: Le/e/a/ChannelPage;->WORK:Ljava/util/concurrent/ExecutorService;
    invoke-static {}, Le/e/a/ChannelPage;->access$0()Ljava/util/concurrent/ExecutorService;

    move-result-object v2

    new-instance v3, Le/e/a/ChannelPage$Listing$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0, v1, v0}, Le/e/a/ChannelPage$Listing$$ExternalSyntheticLambda0;-><init>(Le/e/a/ChannelPage$Listing;ILe/e/a/NetworkTask;)V

    invoke-virtual {v0, v2, v3}, Le/e/a/NetworkTask;->start(Ljava/util/concurrent/ExecutorService;Ljava/lang/Runnable;)V

    return-void
.end method

.method reload()V
    .registers 3

    .line 20
    iget-boolean v0, p0, Le/e/a/ChannelPage$Listing;->busy:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    invoke-virtual {p0}, Le/e/a/ChannelPage$Listing;->stop()V

    const/4 v0, 0x1

    iput v0, p0, Le/e/a/ChannelPage$Listing;->page:I

    iget-object v0, p0, Le/e/a/ChannelPage$Listing;->rows:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p0, Le/e/a/ChannelPage$Listing;->seen:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    iget-object v0, p0, Le/e/a/ChannelPage$Listing;->adapter:Landroid/widget/BaseAdapter;

    invoke-virtual {v0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    iget-object v0, p0, Le/e/a/ChannelPage$Listing;->more:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    invoke-virtual {p0}, Le/e/a/ChannelPage$Listing;->load()V

    return-void
.end method

.method stop()V
    .registers 3

    .line 18
    iget-object v0, p0, Le/e/a/ChannelPage$Listing;->task:Le/e/a/NetworkTask;

    if-eqz v0, :cond_9

    iget-object v0, p0, Le/e/a/ChannelPage$Listing;->task:Le/e/a/NetworkTask;

    invoke-virtual {v0}, Le/e/a/NetworkTask;->cancel()V

    :cond_9
    iget-object v0, p0, Le/e/a/ChannelPage$Listing;->metadata:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_1b

    iget-object v0, p0, Le/e/a/ChannelPage$Listing;->metadata:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    return-void

    :cond_1b
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/NetworkTask;

    invoke-virtual {v1}, Le/e/a/NetworkTask;->cancel()V

    goto :goto_f
.end method
