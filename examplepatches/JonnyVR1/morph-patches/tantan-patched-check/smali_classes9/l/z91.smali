.class public Ll/z91;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:J

.field public static b:J

.field public static final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/a3g0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/z91;->c:Ljava/util/List;

    .line 7
    .line 8
    const/4 v1, 0x2

    .line 9
    invoke-static {v1}, Ll/wft;->b(I)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    new-instance v1, Ll/c1w;

    .line 16
    .line 17
    invoke-direct {v1}, Ll/c1w;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    new-instance v1, Ll/n35;

    .line 24
    .line 25
    invoke-direct {v1}, Ll/n35;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    :cond_0
    new-instance v1, Ll/bn80;

    .line 32
    .line 33
    invoke-direct {v1}, Ll/bn80;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    new-instance v1, Ll/a45;

    .line 40
    .line 41
    invoke-direct {v1}, Ll/a45;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    new-instance v1, Ll/ezl0;

    .line 48
    .line 49
    invoke-direct {v1}, Ll/ezl0;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    new-instance v1, Ll/zki;

    .line 56
    .line 57
    invoke-direct {v1}, Ll/zki;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;
    .locals 3

    .line 1
    new-instance v0, Ll/x91;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/x91;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/d3g0;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-direct {v1, v2, p1, p0}, Ll/d3g0;-><init>(Landroid/content/Intent;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    sget-object p0, Ll/z91;->c:Ljava/util/List;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-virtual {v0, p0, v2, v1}, Ll/x91;->c(Ljava/util/List;ILl/d3g0;)Ll/x91;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/x91;->b(Ll/d3g0;)Ll/p2g0;

    .line 19
    .line 20
    .line 21
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->live:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isNormalLive()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    invoke-static {}, Ll/pzi0;->o()J

    .line 32
    .line 33
    .line 34
    move-result-wide p0

    .line 35
    sput-wide p0, Ll/z91;->a:J

    .line 36
    .line 37
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 38
    .line 39
    .line 40
    move-result-wide p0

    .line 41
    sput-wide p0, Ll/z91;->b:J

    .line 42
    .line 43
    invoke-virtual {v1}, Ll/d3g0;->b()Landroid/content/Intent;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method

.method public static b()J
    .locals 4

    .line 1
    sget-wide v0, Ll/z91;->a:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    sput-wide v2, Ll/z91;->a:J

    .line 6
    .line 7
    return-wide v0
.end method

.method public static c()J
    .locals 2

    .line 1
    sget-wide v0, Ll/z91;->a:J

    .line 2
    .line 3
    return-wide v0
.end method
