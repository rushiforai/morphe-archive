.class public Ll/wf70$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ga1;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/wf70;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/wf70;


# direct methods
.method public constructor <init>(Ll/wf70;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wf70$c;->a:Ll/wf70;

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
    iget-object p1, p0, Ll/wf70$c;->a:Ll/wf70;

    .line 2
    .line 3
    invoke-static {p1}, Ll/wf70;->A(Ll/wf70;)I

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
    iget-object p0, p0, Ll/wf70$c;->a:Ll/wf70;

    .line 11
    .line 12
    invoke-static {p0}, Ll/wf70;->D(Ll/wf70;)Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0, p1}, Ll/wf70;->i0(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 21
    .line 22
    iget-boolean p1, p1, Ll/jka;->H:Z

    .line 23
    .line 24
    if-nez p1, :cond_1

    .line 25
    .line 26
    iget-object p1, p0, Ll/wf70$c;->a:Ll/wf70;

    .line 27
    .line 28
    invoke-virtual {p1}, Ll/wf70;->H()V

    .line 29
    .line 30
    .line 31
    :cond_1
    iget-object p1, p0, Ll/wf70$c;->a:Ll/wf70;

    .line 32
    .line 33
    invoke-static {p1}, Ll/wf70;->E(Ll/wf70;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-nez p1, :cond_2

    .line 38
    .line 39
    iget-object p0, p0, Ll/wf70$c;->a:Ll/wf70;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/wf70;->p0()V

    .line 42
    .line 43
    .line 44
    :cond_2
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
    if-eqz p4, :cond_3

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
    iget-object p1, p0, Ll/wf70$c;->a:Ll/wf70;

    .line 20
    .line 21
    invoke-static {p1}, Ll/wf70;->A(Ll/wf70;)I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-ne p1, v0, :cond_2

    .line 26
    .line 27
    iget-object p1, p0, Ll/wf70$c;->a:Ll/wf70;

    .line 28
    .line 29
    invoke-static {p1}, Ll/wf70;->E(Ll/wf70;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-nez p1, :cond_0

    .line 34
    .line 35
    iget-object p1, p0, Ll/wf70$c;->a:Ll/wf70;

    .line 36
    .line 37
    invoke-virtual {p1}, Ll/wf70;->p0()V

    .line 38
    .line 39
    .line 40
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 41
    .line 42
    iget-boolean p1, p1, Ll/jka;->H:Z

    .line 43
    .line 44
    iget-object p0, p0, Ll/wf70$c;->a:Ll/wf70;

    .line 45
    .line 46
    if-nez p1, :cond_1

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/wf70;->H()V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_1
    invoke-static {p0}, Ll/wf70;->D(Ll/wf70;)Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p0, p1}, Ll/wf70;->i0(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;)V

    .line 57
    .line 58
    .line 59
    :cond_2
    return-void

    .line 60
    :cond_3
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 61
    .line 62
    .line 63
    move-result-object p4

    .line 64
    invoke-virtual {p4, p1, p2, p3}, Ll/pb1;->g(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Ll/wf70$c;->a:Ll/wf70;

    .line 68
    .line 69
    invoke-static {p1}, Ll/wf70;->A(Ll/wf70;)I

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    iget-object p2, p0, Ll/wf70$c;->a:Ll/wf70;

    .line 74
    .line 75
    if-ne p1, v0, :cond_4

    .line 76
    .line 77
    invoke-static {p2}, Ll/wf70;->D(Ll/wf70;)Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {p2, p0}, Ll/wf70;->i0(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_4
    invoke-virtual {p2}, Ll/wf70;->H()V

    .line 86
    .line 87
    .line 88
    iget-object p0, p0, Ll/wf70$c;->a:Ll/wf70;

    .line 89
    .line 90
    invoke-virtual {p0}, Ll/wf70;->p0()V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public success()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/wf70$c;->a:Ll/wf70;

    .line 2
    .line 3
    invoke-static {v0}, Ll/wf70;->A(Ll/wf70;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/wf70$c;->a:Ll/wf70;

    .line 8
    .line 9
    const/4 v2, -0x1

    .line 10
    if-ne v0, v2, :cond_0

    .line 11
    .line 12
    invoke-static {v1}, Ll/wf70;->D(Ll/wf70;)Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {v1, p0}, Ll/wf70;->i0(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-virtual {v1}, Ll/wf70;->H()V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/wf70$c;->a:Ll/wf70;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/wf70;->p0()V

    .line 26
    .line 27
    .line 28
    return-void
.end method
