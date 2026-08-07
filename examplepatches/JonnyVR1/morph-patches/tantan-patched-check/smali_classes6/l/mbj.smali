.class public Ll/mbj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/fmj;

.field public b:Lcom/p1/mobile/putong/data/DoublePair;

.field public c:Ljava/lang/String;

.field public d:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/mbj;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-static {p1, v0}, Ll/fmj;->c(Ll/ner;Z)Ll/fmj;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Ll/mbj;->a:Ll/fmj;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic a(Ll/mbj;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mbj;->e(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic b(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c(Ll/mbj;Ll/z80;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mbj;->f(Ll/z80;)V

    return-void
.end method


# virtual methods
.method public d()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mbj;->g()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic e(Lcom/p1/mobile/putong/data/User;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getMomentRoamLatitudeAndLongitude()Lcom/p1/mobile/putong/data/DoublePair;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    iget-wide v1, v0, Lcom/p1/mobile/putong/data/DoublePair;->first:D

    .line 8
    .line 9
    const-wide/16 v3, 0x0

    .line 10
    .line 11
    cmpl-double v1, v1, v3

    .line 12
    .line 13
    if-eqz v1, :cond_2

    .line 14
    .line 15
    iget-wide v1, v0, Lcom/p1/mobile/putong/data/DoublePair;->second:D

    .line 16
    .line 17
    cmpl-double v1, v1, v3

    .line 18
    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p1, p0, Ll/mbj;->b:Lcom/p1/mobile/putong/data/DoublePair;

    .line 23
    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/DoublePair;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-nez p1, :cond_4

    .line 31
    .line 32
    :cond_1
    iput-object v0, p0, Ll/mbj;->b:Lcom/p1/mobile/putong/data/DoublePair;

    .line 33
    .line 34
    iget-wide v1, v0, Lcom/p1/mobile/putong/data/DoublePair;->first:D

    .line 35
    .line 36
    iget-wide v3, v0, Lcom/p1/mobile/putong/data/DoublePair;->second:D

    .line 37
    .line 38
    invoke-virtual {p0, v1, v2, v3, v4}, Ll/mbj;->h(DD)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_2
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 43
    .line 44
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_4

    .line 49
    .line 50
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 51
    .line 52
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 53
    .line 54
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_4

    .line 59
    .line 60
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 61
    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 63
    .line 64
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-nez v0, :cond_4

    .line 71
    .line 72
    iget-object v0, p0, Ll/mbj;->c:Ljava/lang/String;

    .line 73
    .line 74
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 75
    .line 76
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 77
    .line 78
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 79
    .line 80
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-nez v0, :cond_4

    .line 85
    .line 86
    iget-object v0, p0, Ll/mbj;->c:Ljava/lang/String;

    .line 87
    .line 88
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-nez v0, :cond_3

    .line 93
    .line 94
    iget-object v0, p0, Ll/mbj;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 95
    .line 96
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->Y4()V

    .line 97
    .line 98
    .line 99
    :cond_3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 100
    .line 101
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 102
    .line 103
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 104
    .line 105
    iput-object p1, p0, Ll/mbj;->c:Ljava/lang/String;

    .line 106
    .line 107
    invoke-static {}, Ll/nyh;->a()Ll/nyh;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    iget-object p0, p0, Ll/mbj;->c:Ljava/lang/String;

    .line 112
    .line 113
    invoke-virtual {p1, p0}, Ll/nyh;->b(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    :cond_4
    return-void
.end method

.method public final synthetic f(Ll/z80;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p1}, Ll/z80;->b()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    iget-object v0, p0, Ll/mbj;->c:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    iput-object p1, p0, Ll/mbj;->c:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {}, Ll/nyh;->a()Ll/nyh;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iget-object v0, p0, Ll/mbj;->c:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Ll/nyh;->b(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/mbj;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->Y4()V

    .line 37
    .line 38
    .line 39
    :cond_2
    :goto_0
    return-void
.end method

.method public final g()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mbj;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {}, Ll/mrb0;->B()Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/jbj;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/jbj;-><init>(Ll/mbj;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final h(DD)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mbj;->a:Ll/fmj;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {v0, p1, p2, p3, p4}, Ll/fmj;->d(DD)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance p2, Ll/kbj;

    .line 11
    .line 12
    invoke-direct {p2, p0}, Ll/kbj;-><init>(Ll/mbj;)V

    .line 13
    .line 14
    .line 15
    new-instance p0, Ll/lbj;

    .line 16
    .line 17
    invoke-direct {p0}, Ll/lbj;-><init>()V

    .line 18
    .line 19
    .line 20
    const/4 p3, 0x0

    .line 21
    invoke-static {p2, p0, p3}, Ll/psd0;->K(Ll/y20;Ll/y20;Z)Lcom/p1/mobile/android/rx/a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method
