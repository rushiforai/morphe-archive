.class public final synthetic Lcom/momo/xeengine/gift/d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/gift/GiftPlayer;

.field public final synthetic b:Ljava/util/Set;

.field public final synthetic c:Ljava/util/Map;

.field public final synthetic d:Z

.field public final synthetic e:Lcom/momo/xeengine/gift/GiftPlayData;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/gift/GiftPlayer;Ljava/util/Set;Ljava/util/Map;ZLcom/momo/xeengine/gift/GiftPlayData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/xeengine/gift/d;->a:Lcom/momo/xeengine/gift/GiftPlayer;

    iput-object p2, p0, Lcom/momo/xeengine/gift/d;->b:Ljava/util/Set;

    iput-object p3, p0, Lcom/momo/xeengine/gift/d;->c:Ljava/util/Map;

    iput-boolean p4, p0, Lcom/momo/xeengine/gift/d;->d:Z

    iput-object p5, p0, Lcom/momo/xeengine/gift/d;->e:Lcom/momo/xeengine/gift/GiftPlayData;

    return-void
.end method


# virtual methods
.method public final onComplete(Z)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/gift/d;->a:Lcom/momo/xeengine/gift/GiftPlayer;

    iget-object v1, p0, Lcom/momo/xeengine/gift/d;->b:Ljava/util/Set;

    iget-object v2, p0, Lcom/momo/xeengine/gift/d;->c:Ljava/util/Map;

    iget-boolean v3, p0, Lcom/momo/xeengine/gift/d;->d:Z

    iget-object v4, p0, Lcom/momo/xeengine/gift/d;->e:Lcom/momo/xeengine/gift/GiftPlayData;

    move v5, p1

    invoke-static/range {v0 .. v5}, Lcom/momo/xeengine/gift/GiftPlayer;->a(Lcom/momo/xeengine/gift/GiftPlayer;Ljava/util/Set;Ljava/util/Map;ZLcom/momo/xeengine/gift/GiftPlayData;Z)V

    return-void
.end method
