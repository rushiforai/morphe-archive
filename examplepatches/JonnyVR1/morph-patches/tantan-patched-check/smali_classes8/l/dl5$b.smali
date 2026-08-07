.class public Ll/dl5$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ga1;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/dl5;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/dl5;


# direct methods
.method public constructor <init>(Ll/dl5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dl5$b;->a:Ll/dl5;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/dl5$b;->a:Ll/dl5;

    .line 2
    .line 3
    invoke-static {p1}, Ll/dl5;->u(Ll/dl5;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 p2, -0x1

    .line 8
    if-ne p1, p2, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Ll/dl5$b;->a:Ll/dl5;

    .line 11
    .line 12
    invoke-static {p0}, Ll/dl5;->w(Ll/dl5;)Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0, p1}, Ll/dl5;->O(Lcom/p1/mobile/putong/core/ui/PlayerView;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->sh()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-nez p1, :cond_1

    .line 29
    .line 30
    iget-object p0, p0, Ll/dl5$b;->a:Ll/dl5;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/dl5;->A()V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public d(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 2
    .line 3
    .line 4
    move-result-object p4

    .line 5
    invoke-virtual {p4, p5}, Ll/pb1;->d(Lcom/p1/mobile/putong/util/audio/AudioBusinessType;)Z

    .line 6
    .line 7
    .line 8
    move-result p4

    .line 9
    const/4 v0, -0x1

    .line 10
    if-eqz p4, :cond_2

    .line 11
    .line 12
    invoke-virtual {p5}, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->getBusinessMsg()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-static {p1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/dl5$b;->a:Ll/dl5;

    .line 20
    .line 21
    invoke-static {p1}, Ll/dl5;->u(Ll/dl5;)I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-ne p1, v0, :cond_1

    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->sh()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    iget-object p0, p0, Ll/dl5$b;->a:Ll/dl5;

    .line 36
    .line 37
    if-nez p1, :cond_0

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/dl5;->A()V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    invoke-static {p0}, Ll/dl5;->w(Ll/dl5;)Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p0, p1}, Ll/dl5;->O(Lcom/p1/mobile/putong/core/ui/PlayerView;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    return-void

    .line 51
    :cond_2
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 52
    .line 53
    .line 54
    move-result-object p4

    .line 55
    invoke-virtual {p4, p1, p2, p3}, Ll/pb1;->g(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Ll/dl5$b;->a:Ll/dl5;

    .line 59
    .line 60
    invoke-static {p1}, Ll/dl5;->u(Ll/dl5;)I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    iget-object p0, p0, Ll/dl5$b;->a:Ll/dl5;

    .line 65
    .line 66
    if-ne p1, v0, :cond_3

    .line 67
    .line 68
    invoke-static {p0}, Ll/dl5;->w(Ll/dl5;)Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p0, p1}, Ll/dl5;->O(Lcom/p1/mobile/putong/core/ui/PlayerView;)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_3
    invoke-virtual {p0}, Ll/dl5;->A()V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public success()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dl5$b;->a:Ll/dl5;

    .line 2
    .line 3
    invoke-static {v0}, Ll/dl5;->u(Ll/dl5;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object p0, p0, Ll/dl5$b;->a:Ll/dl5;

    .line 8
    .line 9
    const/4 v1, -0x1

    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    invoke-static {p0}, Ll/dl5;->w(Ll/dl5;)Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ll/dl5;->O(Lcom/p1/mobile/putong/core/ui/PlayerView;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-virtual {p0}, Ll/dl5;->A()V

    .line 21
    .line 22
    .line 23
    return-void
.end method
