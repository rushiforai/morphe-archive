.class public Ll/foh;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/joh;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/aggregation/FeedPoiAggregationAct;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/foh;->e0(Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/aggregation/FeedPoiAggregationAct;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e0(Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/aggregation/FeedPoiAggregationAct;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/aggregation/FeedPoiAggregationAct;->e:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Ll/foh;->a:Ljava/lang/String;

    .line 15
    .line 16
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/aggregation/FeedPoiAggregationAct;->f:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Ll/foh;->b:Ljava/lang/String;

    .line 23
    .line 24
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/aggregation/FeedPoiAggregationAct;->g:Ljava/lang/String;

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    iput-boolean p1, p0, Ll/foh;->c:Z

    .line 32
    .line 33
    return-void
.end method
