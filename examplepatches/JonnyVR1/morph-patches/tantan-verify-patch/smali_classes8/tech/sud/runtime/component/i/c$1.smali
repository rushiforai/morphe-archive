.class Ltech/sud/runtime/component/i/c$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/MediaPlayer$OnPreparedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltech/sud/runtime/component/i/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ltech/sud/runtime/component/i/c;


# direct methods
.method public constructor <init>(Ltech/sud/runtime/component/i/c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltech/sud/runtime/component/i/c$1;->a:Ltech/sud/runtime/component/i/c;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/component/i/c$1;->a:Ltech/sud/runtime/component/i/c;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-static {v0, v1}, Ltech/sud/runtime/component/i/c;->a(Ltech/sud/runtime/component/i/c;I)I

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ltech/sud/runtime/component/i/c$1;->a:Ltech/sud/runtime/component/i/c;

    .line 8
    .line 9
    invoke-static {v0}, Ltech/sud/runtime/component/i/c;->a(Ltech/sud/runtime/component/i/c;)Ltech/sud/runtime/component/i/d;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ltech/sud/runtime/component/i/c$1;->a:Ltech/sud/runtime/component/i/c;

    .line 16
    .line 17
    invoke-static {v0}, Ltech/sud/runtime/component/i/c;->a(Ltech/sud/runtime/component/i/c;)Ltech/sud/runtime/component/i/d;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p0, Ltech/sud/runtime/component/i/c$1;->a:Ltech/sud/runtime/component/i/c;

    .line 22
    .line 23
    invoke-static {v1}, Ltech/sud/runtime/component/i/c;->b(Ltech/sud/runtime/component/i/c;)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getDuration()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    invoke-interface {v0, v1, v2, v3}, Ltech/sud/runtime/component/i/d;->a(III)V

    .line 36
    .line 37
    .line 38
    :cond_0
    iget-object v0, p0, Ltech/sud/runtime/component/i/c$1;->a:Ltech/sud/runtime/component/i/c;

    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getVideoWidth()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-static {v0, v1}, Ltech/sud/runtime/component/i/c;->b(Ltech/sud/runtime/component/i/c;I)I

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ltech/sud/runtime/component/i/c$1;->a:Ltech/sud/runtime/component/i/c;

    .line 48
    .line 49
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getVideoHeight()I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    invoke-static {v0, p1}, Ltech/sud/runtime/component/i/c;->c(Ltech/sud/runtime/component/i/c;I)I

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Ltech/sud/runtime/component/i/c$1;->a:Ltech/sud/runtime/component/i/c;

    .line 57
    .line 58
    invoke-static {p1}, Ltech/sud/runtime/component/i/c;->c(Ltech/sud/runtime/component/i/c;)I

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-eqz p1, :cond_1

    .line 63
    .line 64
    iget-object v0, p0, Ltech/sud/runtime/component/i/c$1;->a:Ltech/sud/runtime/component/i/c;

    .line 65
    .line 66
    invoke-virtual {v0, p1}, Ltech/sud/runtime/component/i/c;->seekTo(I)V

    .line 67
    .line 68
    .line 69
    :cond_1
    iget-object p1, p0, Ltech/sud/runtime/component/i/c$1;->a:Ltech/sud/runtime/component/i/c;

    .line 70
    .line 71
    invoke-static {p1}, Ltech/sud/runtime/component/i/c;->e(Ltech/sud/runtime/component/i/c;)Landroid/media/MediaPlayer;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    iget-object v0, p0, Ltech/sud/runtime/component/i/c$1;->a:Ltech/sud/runtime/component/i/c;

    .line 76
    .line 77
    invoke-static {v0}, Ltech/sud/runtime/component/i/c;->d(Ltech/sud/runtime/component/i/c;)F

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    iget-object v1, p0, Ltech/sud/runtime/component/i/c$1;->a:Ltech/sud/runtime/component/i/c;

    .line 82
    .line 83
    invoke-static {v1}, Ltech/sud/runtime/component/i/c;->d(Ltech/sud/runtime/component/i/c;)F

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    invoke-virtual {p1, v0, v1}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Ltech/sud/runtime/component/i/c$1;->a:Ltech/sud/runtime/component/i/c;

    .line 91
    .line 92
    invoke-static {p1}, Ltech/sud/runtime/component/i/c;->f(Ltech/sud/runtime/component/i/c;)I

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    const/4 v0, 0x3

    .line 97
    if-ne p1, v0, :cond_2

    .line 98
    .line 99
    iget-object p0, p0, Ltech/sud/runtime/component/i/c$1;->a:Ltech/sud/runtime/component/i/c;

    .line 100
    .line 101
    invoke-virtual {p0}, Ltech/sud/runtime/component/i/c;->start()V

    .line 102
    .line 103
    .line 104
    :cond_2
    return-void
.end method
