.class Lcom/immomo/moment/mediautils/o$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/moment/mediautils/m$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/moment/mediautils/o;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/moment/mediautils/o;


# direct methods
.method public constructor <init>(Lcom/immomo/moment/mediautils/o;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/o$a;->a:Lcom/immomo/moment/mediautils/o;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/o$a;->a:Lcom/immomo/moment/mediautils/o;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Lcom/immomo/moment/mediautils/o;->x(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public d(Landroid/media/MediaFormat;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/o$a;->a:Lcom/immomo/moment/mediautils/o;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/moment/mediautils/o;->a(Lcom/immomo/moment/mediautils/o;)Lcom/immomo/moment/mediautils/o$d;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/immomo/moment/mediautils/o$a;->a:Lcom/immomo/moment/mediautils/o;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/immomo/moment/mediautils/o;->a(Lcom/immomo/moment/mediautils/o;)Lcom/immomo/moment/mediautils/o$d;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0, p1}, Lcom/immomo/moment/mediautils/o$d;->d(Landroid/media/MediaFormat;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public e(Ljava/nio/ByteBuffer;IJ)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/o$a;->a:Lcom/immomo/moment/mediautils/o;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/immomo/moment/mediautils/o;->a(Lcom/immomo/moment/mediautils/o;)Lcom/immomo/moment/mediautils/o$d;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Lcom/immomo/moment/mediautils/o$a;->a:Lcom/immomo/moment/mediautils/o;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/immomo/moment/mediautils/o;->b(Lcom/immomo/moment/mediautils/o;)J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    const-wide/16 v2, 0x0

    .line 16
    .line 17
    cmp-long v0, v0, v2

    .line 18
    .line 19
    if-gez v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/immomo/moment/mediautils/o$a;->a:Lcom/immomo/moment/mediautils/o;

    .line 22
    .line 23
    invoke-static {v0, p3, p4}, Lcom/immomo/moment/mediautils/o;->d(Lcom/immomo/moment/mediautils/o;J)J

    .line 24
    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 v0, 0x0

    .line 29
    :goto_0
    iget-object v1, p0, Lcom/immomo/moment/mediautils/o$a;->a:Lcom/immomo/moment/mediautils/o;

    .line 30
    .line 31
    invoke-static {v1}, Lcom/immomo/moment/mediautils/o;->l(Lcom/immomo/moment/mediautils/o;)J

    .line 32
    .line 33
    .line 34
    move-result-wide v4

    .line 35
    iget-object v1, p0, Lcom/immomo/moment/mediautils/o$a;->a:Lcom/immomo/moment/mediautils/o;

    .line 36
    .line 37
    invoke-static {v1}, Lcom/immomo/moment/mediautils/o;->b(Lcom/immomo/moment/mediautils/o;)J

    .line 38
    .line 39
    .line 40
    move-result-wide v6

    .line 41
    sub-long/2addr p3, v6

    .line 42
    add-long/2addr v4, p3

    .line 43
    iget-object p3, p0, Lcom/immomo/moment/mediautils/o$a;->a:Lcom/immomo/moment/mediautils/o;

    .line 44
    .line 45
    invoke-static {p3}, Lcom/immomo/moment/mediautils/o;->n(Lcom/immomo/moment/mediautils/o;)J

    .line 46
    .line 47
    .line 48
    move-result-wide p3

    .line 49
    cmp-long p3, p3, v4

    .line 50
    .line 51
    if-nez p3, :cond_2

    .line 52
    .line 53
    cmp-long p3, v4, v2

    .line 54
    .line 55
    if-nez p3, :cond_1

    .line 56
    .line 57
    if-nez p3, :cond_2

    .line 58
    .line 59
    if-nez v0, :cond_2

    .line 60
    .line 61
    :cond_1
    iget-object p3, p0, Lcom/immomo/moment/mediautils/o$a;->a:Lcom/immomo/moment/mediautils/o;

    .line 62
    .line 63
    const-wide/16 v0, 0x5ab4

    .line 64
    .line 65
    invoke-static {p3, v0, v1}, Lcom/immomo/moment/mediautils/o;->m(Lcom/immomo/moment/mediautils/o;J)J

    .line 66
    .line 67
    .line 68
    add-long/2addr v4, v0

    .line 69
    new-instance p3, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    const-string p4, "adjust AudioPtsOffset for same pts:"

    .line 72
    .line 73
    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    iget-object p4, p0, Lcom/immomo/moment/mediautils/o$a;->a:Lcom/immomo/moment/mediautils/o;

    .line 77
    .line 78
    invoke-static {p4}, Lcom/immomo/moment/mediautils/o;->n(Lcom/immomo/moment/mediautils/o;)J

    .line 79
    .line 80
    .line 81
    move-result-wide v0

    .line 82
    invoke-virtual {p3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    const-string p4, " AudioPtsOffset:"

    .line 86
    .line 87
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    iget-object p4, p0, Lcom/immomo/moment/mediautils/o$a;->a:Lcom/immomo/moment/mediautils/o;

    .line 91
    .line 92
    invoke-static {p4}, Lcom/immomo/moment/mediautils/o;->l(Lcom/immomo/moment/mediautils/o;)J

    .line 93
    .line 94
    .line 95
    move-result-wide v0

    .line 96
    invoke-virtual {p3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p3

    .line 103
    const-string p4, "MediaSourceManager"

    .line 104
    .line 105
    invoke-static {p4, p3}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    :cond_2
    iget-object p3, p0, Lcom/immomo/moment/mediautils/o$a;->a:Lcom/immomo/moment/mediautils/o;

    .line 109
    .line 110
    invoke-static {p3}, Lcom/immomo/moment/mediautils/o;->a(Lcom/immomo/moment/mediautils/o;)Lcom/immomo/moment/mediautils/o$d;

    .line 111
    .line 112
    .line 113
    move-result-object p3

    .line 114
    invoke-interface {p3, p1, p2, v4, v5}, Lcom/immomo/moment/mediautils/o$d;->g(Ljava/nio/ByteBuffer;IJ)V

    .line 115
    .line 116
    .line 117
    iget-object p0, p0, Lcom/immomo/moment/mediautils/o$a;->a:Lcom/immomo/moment/mediautils/o;

    .line 118
    .line 119
    invoke-static {p0, v4, v5}, Lcom/immomo/moment/mediautils/o;->o(Lcom/immomo/moment/mediautils/o;J)J

    .line 120
    .line 121
    .line 122
    :cond_3
    return-void
.end method
