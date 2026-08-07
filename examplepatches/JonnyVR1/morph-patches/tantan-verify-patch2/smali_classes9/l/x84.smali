.class public Ll/x84;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/x84$a;
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:I

.field public d:I

.field public e:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

.field public f:I

.field public g:I

.field public h:Z

.field public i:Z

.field public j:Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/x84;->i:Z

    .line 6
    .line 7
    iput p1, p0, Ll/x84;->c:I

    .line 8
    .line 9
    return-void
.end method

.method public static a(I)Ll/x84;
    .locals 1

    .line 1
    new-instance v0, Ll/x84;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/x84;-><init>(I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public b()I
    .locals 0

    .line 1
    iget p0, p0, Ll/x84;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public c()Ljava/lang/String;
    .locals 1

    .line 1
    iget p0, p0, Ll/x84;->c:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const-string p0, "token request"

    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    const/4 v0, 0x2

    .line 10
    if-ne p0, v0, :cond_1

    .line 11
    .line 12
    const-string p0, "member leave channel"

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_1
    const/4 v0, 0x3

    .line 16
    if-ne p0, v0, :cond_2

    .line 17
    .line 18
    const-string p0, "remote member  add"

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_2
    const/4 v0, 0x4

    .line 22
    if-ne p0, v0, :cond_3

    .line 23
    .line 24
    const-string p0, "query user info "

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_3
    const/4 v0, 0x5

    .line 28
    if-ne p0, v0, :cond_4

    .line 29
    .line 30
    const-string p0, "local leave channel"

    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_4
    const/4 v0, 0x6

    .line 34
    if-ne p0, v0, :cond_5

    .line 35
    .line 36
    const-string p0, "local join channel"

    .line 37
    .line 38
    return-object p0

    .line 39
    :cond_5
    const/4 v0, 0x7

    .line 40
    if-ne p0, v0, :cond_6

    .line 41
    .line 42
    const-string p0, "push  failed"

    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_6
    const/16 v0, 0x8

    .line 46
    .line 47
    if-ne p0, v0, :cond_7

    .line 48
    .line 49
    const-string p0, "update volume"

    .line 50
    .line 51
    return-object p0

    .line 52
    :cond_7
    const/16 v0, 0xb

    .line 53
    .line 54
    if-ne p0, v0, :cond_8

    .line 55
    .line 56
    const-string p0, "push starting"

    .line 57
    .line 58
    return-object p0

    .line 59
    :cond_8
    const/16 v0, 0xc

    .line 60
    .line 61
    if-ne p0, v0, :cond_9

    .line 62
    .line 63
    const-string p0, "Join channel failed"

    .line 64
    .line 65
    return-object p0

    .line 66
    :cond_9
    const/16 v0, 0xd

    .line 67
    .line 68
    if-ne p0, v0, :cond_a

    .line 69
    .line 70
    const-string p0, "on received first video frame"

    .line 71
    .line 72
    return-object p0

    .line 73
    :cond_a
    const/16 v0, 0xe

    .line 74
    .line 75
    if-ne p0, v0, :cond_b

    .line 76
    .line 77
    const-string p0, "on received user inifo"

    .line 78
    .line 79
    return-object p0

    .line 80
    :cond_b
    const/16 v0, 0xf

    .line 81
    .line 82
    if-ne p0, v0, :cond_c

    .line 83
    .line 84
    const-string p0, "on connection lost"

    .line 85
    .line 86
    return-object p0

    .line 87
    :cond_c
    const/16 v0, 0x10

    .line 88
    .line 89
    if-ne p0, v0, :cond_d

    .line 90
    .line 91
    const-string p0, "on engine error"

    .line 92
    .line 93
    return-object p0

    .line 94
    :cond_d
    const-string p0, ""

    .line 95
    .line 96
    return-object p0
.end method

.method public d()Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x84;->j:Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Lcom/immomo/momomediaext/utils/MMLiveTranscoding;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x84;->e:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x84;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x84;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()I
    .locals 0

    .line 1
    iget p0, p0, Ll/x84;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public i()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/x84;->i:Z

    .line 2
    .line 3
    return p0
.end method

.method public j()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/x84;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method public k(I)Ll/x84;
    .locals 0

    .line 1
    iput p1, p0, Ll/x84;->g:I

    .line 2
    .line 3
    return-object p0
.end method

.method public l(Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)Ll/x84;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/x84;->e:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 2
    .line 3
    return-object p0
.end method

.method public m(Z)Ll/x84;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/x84;->i:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public n(Ljava/lang/String;)Ll/x84;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/x84;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public o(Z)Ll/x84;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/x84;->h:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public p(Ljava/lang/Long;)Ll/x84;
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/x84;->a:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0
.end method

.method public q(Ljava/lang/String;)Ll/x84;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/x84;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public r(I)Ll/x84;
    .locals 0

    .line 1
    iput p1, p0, Ll/x84;->d:I

    .line 2
    .line 3
    return-object p0
.end method

.method public s(Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;)Ll/x84;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/x84;->j:Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;

    .line 2
    .line 3
    return-object p0
.end method

.method public t(I)Ll/x84;
    .locals 0

    .line 1
    iput p1, p0, Ll/x84;->f:I

    .line 2
    .line 3
    return-object p0
.end method
