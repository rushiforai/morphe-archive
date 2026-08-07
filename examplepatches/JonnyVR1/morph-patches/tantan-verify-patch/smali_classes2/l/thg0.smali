.class public final Ll/thg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bkg0;


# static fields
.field public static final j:Ljava/lang/String;


# instance fields
.field public final a:Landroid/content/Context;

.field public b:Ltech/sud/gip/core/GameInfo;

.field public final c:Ll/mrg0;

.field public final d:Ll/cmg0;

.field public e:J

.field public f:Z

.field public g:J

.field public final h:Ll/leg0;

.field public final i:Ll/tgg0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-class v0, Ll/thg0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "SudGIP "

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Ll/thg0;->j:Ljava/lang/String;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ll/dlg0;Ll/mrg0;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Ll/thg0;->e:J

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    iput-boolean v2, p0, Ll/thg0;->f:Z

    .line 10
    .line 11
    iput-wide v0, p0, Ll/thg0;->g:J

    .line 12
    .line 13
    new-instance v0, Ll/leg0;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/leg0;-><init>(Ll/thg0;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/thg0;->h:Ll/leg0;

    .line 19
    .line 20
    new-instance v0, Ll/tgg0;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ll/tgg0;-><init>(Ll/thg0;)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Ll/thg0;->i:Ll/tgg0;

    .line 26
    .line 27
    iput-object p1, p0, Ll/thg0;->a:Landroid/content/Context;

    .line 28
    .line 29
    iget-object p1, p2, Ll/dlg0;->a:Ll/cmg0;

    .line 30
    .line 31
    iput-object p1, p0, Ll/thg0;->d:Ll/cmg0;

    .line 32
    .line 33
    iput-object p3, p0, Ll/thg0;->c:Ll/mrg0;

    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public final a(Ltech/sud/gip/core/GameInfo;ILjava/lang/String;)V
    .locals 4

    .line 1
    const/4 p2, 0x0

    .line 2
    iput-boolean p2, p0, Ll/thg0;->f:Z

    .line 3
    .line 4
    const/4 p2, -0x1

    .line 5
    const/4 p3, 0x3

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Ll/thg0;->c:Ll/mrg0;

    .line 9
    .line 10
    const-string p1, "null == gameInfo"

    .line 11
    .line 12
    invoke-virtual {p0, p3, p2, p1}, Ll/mrg0;->b(IILjava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iput-object p1, p0, Ll/thg0;->b:Ltech/sud/gip/core/GameInfo;

    .line 17
    .line 18
    iget-wide v0, p1, Ltech/sud/gip/core/GameInfo;->mgId:J

    .line 19
    .line 20
    iput-wide v0, p0, Ll/thg0;->g:J

    .line 21
    .line 22
    iget-boolean v0, p1, Ltech/sud/gip/core/GameInfo;->isInstalled:Z

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Ll/thg0;->c:Ll/mrg0;

    .line 27
    .line 28
    invoke-virtual {p0, p3}, Ll/mrg0;->a(I)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    iget v0, p1, Ltech/sud/gip/core/GameInfo;->engine:I

    .line 33
    .line 34
    const/4 v1, 0x1

    .line 35
    if-ne v1, v0, :cond_2

    .line 36
    .line 37
    iget-object v0, p1, Ltech/sud/gip/core/GameInfo;->eUrl:Ljava/lang/String;

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    const-string v0, ""

    .line 41
    .line 42
    :goto_0
    if-eqz v0, :cond_6

    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-eqz v2, :cond_3

    .line 49
    .line 50
    goto :goto_2

    .line 51
    :cond_3
    new-instance p2, Ll/oqg0;

    .line 52
    .line 53
    invoke-direct {p2}, Ll/oqg0;-><init>()V

    .line 54
    .line 55
    .line 56
    iget p3, p1, Ltech/sud/gip/core/GameInfo;->engine:I

    .line 57
    .line 58
    iput p3, p2, Ll/oqg0;->a:I

    .line 59
    .line 60
    sget-object p3, LSudabstract/Sudfor;->Sudif:LSudabstract/Sudfor;

    .line 61
    .line 62
    iput-object p3, p2, Ll/oqg0;->b:LSudabstract/Sudfor;

    .line 63
    .line 64
    iget-wide v2, p1, Ltech/sud/gip/core/GameInfo;->mgId:J

    .line 65
    .line 66
    iput-wide v2, p2, Ll/oqg0;->c:J

    .line 67
    .line 68
    iput-object v0, p2, Ll/oqg0;->d:Ljava/lang/String;

    .line 69
    .line 70
    iget-object p3, p1, Ltech/sud/gip/core/GameInfo;->version:Ljava/lang/String;

    .line 71
    .line 72
    iput-object p3, p2, Ll/oqg0;->e:Ljava/lang/String;

    .line 73
    .line 74
    iget-object p1, p1, Ltech/sud/gip/core/GameInfo;->hash:Ljava/lang/String;

    .line 75
    .line 76
    iput-object p1, p2, Ll/oqg0;->f:Ljava/lang/String;

    .line 77
    .line 78
    iget-object p1, p0, Ll/thg0;->d:Ll/cmg0;

    .line 79
    .line 80
    iget-object p3, p0, Ll/thg0;->h:Ll/leg0;

    .line 81
    .line 82
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 83
    .line 84
    .line 85
    iget v0, p2, Ll/oqg0;->a:I

    .line 86
    .line 87
    if-ne v1, v0, :cond_4

    .line 88
    .line 89
    iget-object p1, p1, Ll/cmg0;->a:Ll/nsg0;

    .line 90
    .line 91
    invoke-virtual {p1, p2, p3}, Ll/vog0;->a(Ll/oqg0;Ll/klg0;)J

    .line 92
    .line 93
    .line 94
    move-result-wide p1

    .line 95
    goto :goto_1

    .line 96
    :cond_4
    const/4 v1, 0x5

    .line 97
    if-ne v1, v0, :cond_5

    .line 98
    .line 99
    iget-object p1, p1, Ll/cmg0;->b:Ll/osg0;

    .line 100
    .line 101
    invoke-virtual {p1, p2, p3}, Ll/vog0;->a(Ll/oqg0;Ll/klg0;)J

    .line 102
    .line 103
    .line 104
    move-result-wide p1

    .line 105
    goto :goto_1

    .line 106
    :cond_5
    const-wide/16 p1, 0x0

    .line 107
    .line 108
    :goto_1
    iput-wide p1, p0, Ll/thg0;->e:J

    .line 109
    .line 110
    return-void

    .line 111
    :cond_6
    :goto_2
    iget-object p0, p0, Ll/thg0;->c:Ll/mrg0;

    .line 112
    .line 113
    const-string p1, "null == gameInfo.eUrl || gameInfo.eUrl.isEmpty()"

    .line 114
    .line 115
    invoke-virtual {p0, p3, p2, p1}, Ll/mrg0;->b(IILjava/lang/String;)V

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method public final cancel()V
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/thg0;->f:Z

    .line 3
    .line 4
    iget-object v1, p0, Ll/thg0;->b:Ltech/sud/gip/core/GameInfo;

    .line 5
    .line 6
    if-eqz v1, :cond_2

    .line 7
    .line 8
    iget-object v2, p0, Ll/thg0;->d:Ll/cmg0;

    .line 9
    .line 10
    iget v1, v1, Ltech/sud/gip/core/GameInfo;->engine:I

    .line 11
    .line 12
    iget-wide v3, p0, Ll/thg0;->e:J

    .line 13
    .line 14
    if-ne v0, v1, :cond_0

    .line 15
    .line 16
    iget-object p0, v2, Ll/cmg0;->a:Ll/nsg0;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    sget-object p0, Ll/bhg0;->d:Ljava/lang/String;

    .line 22
    .line 23
    sget-object p0, Ll/weg0;->a:Ll/bhg0;

    .line 24
    .line 25
    invoke-virtual {p0, v3, v4}, Ll/bhg0;->e(J)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    const/4 p0, 0x5

    .line 30
    if-ne p0, v1, :cond_1

    .line 31
    .line 32
    iget-object p0, v2, Ll/cmg0;->b:Ll/osg0;

    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    .line 36
    .line 37
    sget-object p0, Ll/bhg0;->d:Ljava/lang/String;

    .line 38
    .line 39
    sget-object p0, Ll/weg0;->a:Ll/bhg0;

    .line 40
    .line 41
    invoke-virtual {p0, v3, v4}, Ll/bhg0;->e(J)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 46
    .line 47
    .line 48
    :cond_2
    return-void
.end method
