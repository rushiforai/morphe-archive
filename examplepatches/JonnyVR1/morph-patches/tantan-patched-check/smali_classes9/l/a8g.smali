.class public Ll/a8g;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final b:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseHierarchy;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final c:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedal;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseDetails:Ljava/util/List;

    .line 7
    .line 8
    new-instance v1, Ll/y7g;

    .line 9
    .line 10
    invoke-direct {v1, p2}, Ll/y7g;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;

    .line 18
    .line 19
    iput-object v0, p0, Ll/a8g;->a:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;

    .line 20
    .line 21
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseHierarchies:Ljava/util/List;

    .line 24
    .line 25
    new-instance v1, Ll/z7g;

    .line 26
    .line 27
    invoke-direct {v1, p2}, Ll/z7g;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseHierarchy;

    .line 35
    .line 36
    iput-object p2, p0, Ll/a8g;->b:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseHierarchy;

    .line 37
    .line 38
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 39
    .line 40
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseMedals:Ljava/util/List;

    .line 41
    .line 42
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    if-nez p2, :cond_0

    .line 47
    .line 48
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 49
    .line 50
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->fanbaseMedals:Ljava/util/List;

    .line 51
    .line 52
    const/4 p2, 0x0

    .line 53
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedal;

    .line 58
    .line 59
    iput-object p1, p0, Ll/a8g;->c:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedal;

    .line 60
    .line 61
    return-void

    .line 62
    :cond_0
    const/4 p1, 0x0

    .line 63
    iput-object p1, p0, Ll/a8g;->c:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedal;

    .line 64
    .line 65
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic b(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseHierarchy;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseHierarchy;->fanbaseId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
