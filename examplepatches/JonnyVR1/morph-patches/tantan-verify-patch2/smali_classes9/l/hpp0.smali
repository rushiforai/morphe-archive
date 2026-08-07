.class public Ll/hpp0;
.super Ll/mer;
.source "SourceFile"


# instance fields
.field public final g:Ljava/lang/String;

.field public h:J

.field public i:Z

.field public j:Ll/kcg0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/mer;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/hpp0;->i:Z

    .line 6
    .line 7
    iput-object p2, p0, Ll/hpp0;->g:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/hpp0;->L2()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic K2(Ll/hpp0;Lcom/p1/mobile/android/app/Act$r;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hpp0;->M2(Lcom/p1/mobile/android/app/Act$r;)V

    return-void
.end method


# virtual methods
.method public E2(Ll/dum;)V
    .locals 7

    .line 1
    invoke-super {p0, p1}, Ll/mer;->E2(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Ll/dum;->h:Ll/oo2;

    .line 5
    .line 6
    invoke-static {}, Ll/pzi0;->o()J

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    iget-wide v3, p0, Ll/hpp0;->h:J

    .line 11
    .line 12
    sub-long v3, v1, v3

    .line 13
    .line 14
    iget-object v5, p0, Ll/hpp0;->g:Ljava/lang/String;

    .line 15
    .line 16
    iget-object p0, p1, Ll/dum;->h:Ll/oo2;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/oo2;->D0()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v6

    .line 22
    const-string v1, "liveroom"

    .line 23
    .line 24
    const-string v2, "ending"

    .line 25
    .line 26
    invoke-static/range {v0 .. v6}, Ll/ipp0;->a(Ll/oo2;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public F2(Ll/dum;)V
    .locals 7

    .line 1
    invoke-super {p0, p1}, Ll/mer;->F2(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Ll/dum;->h:Ll/oo2;

    .line 5
    .line 6
    iget-object v5, p0, Ll/hpp0;->g:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/oo2;->D0()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v6

    .line 12
    const-string v1, "liveroom"

    .line 13
    .line 14
    const-string v2, "start"

    .line 15
    .line 16
    const-wide/16 v3, 0x0

    .line 17
    .line 18
    invoke-static/range {v0 .. v6}, Ll/ipp0;->a(Ll/oo2;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Ll/pzi0;->o()J

    .line 22
    .line 23
    .line 24
    move-result-wide v0

    .line 25
    iput-wide v0, p0, Ll/hpp0;->h:J

    .line 26
    .line 27
    return-void
.end method

.method public final L2()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/gpp0;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/gpp0;-><init>(Ll/hpp0;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Ll/hpp0;->j:Ll/kcg0;

    .line 24
    .line 25
    return-void
.end method

.method public final synthetic M2(Lcom/p1/mobile/android/app/Act$r;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Ll/mer;->D2()Ll/dum;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    iget-object v0, p0, Ll/mer;->e:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->R4()Ll/ogd0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ll/ogd0;->Q0()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_0
    invoke-virtual {p0}, Ll/mer;->D2()Ll/dum;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v1, v0, Ll/dum;->h:Ll/oo2;

    .line 25
    .line 26
    if-nez p1, :cond_1

    .line 27
    .line 28
    const/4 p1, 0x1

    .line 29
    iput-boolean p1, p0, Ll/hpp0;->i:Z

    .line 30
    .line 31
    invoke-static {}, Ll/pzi0;->o()J

    .line 32
    .line 33
    .line 34
    move-result-wide v2

    .line 35
    iget-wide v4, p0, Ll/hpp0;->h:J

    .line 36
    .line 37
    sub-long v4, v2, v4

    .line 38
    .line 39
    iget-object v6, p0, Ll/hpp0;->g:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v1}, Ll/oo2;->D0()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v7

    .line 45
    const-string v2, "liveroom"

    .line 46
    .line 47
    const-string v3, "ending"

    .line 48
    .line 49
    invoke-static/range {v1 .. v7}, Ll/ipp0;->a(Ll/oo2;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-object v6, p0, Ll/hpp0;->g:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {v1}, Ll/oo2;->D0()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v7

    .line 58
    const-string v2, "backgroundroom"

    .line 59
    .line 60
    const-string v3, "start"

    .line 61
    .line 62
    const-wide/16 v4, 0x0

    .line 63
    .line 64
    invoke-static/range {v1 .. v7}, Ll/ipp0;->a(Ll/oo2;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    iget-boolean p1, p0, Ll/hpp0;->i:Z

    .line 69
    .line 70
    if-eqz p1, :cond_2

    .line 71
    .line 72
    const/4 p1, 0x0

    .line 73
    iput-boolean p1, p0, Ll/hpp0;->i:Z

    .line 74
    .line 75
    invoke-static {}, Ll/pzi0;->o()J

    .line 76
    .line 77
    .line 78
    move-result-wide v2

    .line 79
    iget-wide v4, p0, Ll/hpp0;->h:J

    .line 80
    .line 81
    sub-long v4, v2, v4

    .line 82
    .line 83
    iget-object v6, p0, Ll/hpp0;->g:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {v1}, Ll/oo2;->D0()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v7

    .line 89
    const-string v2, "backgroundroom"

    .line 90
    .line 91
    const-string v3, "ending"

    .line 92
    .line 93
    invoke-static/range {v1 .. v7}, Ll/ipp0;->a(Ll/oo2;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    iget-object v6, p0, Ll/hpp0;->g:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {v1}, Ll/oo2;->D0()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v7

    .line 102
    const-string v2, "liveroom"

    .line 103
    .line 104
    const-string v3, "start"

    .line 105
    .line 106
    const-wide/16 v4, 0x0

    .line 107
    .line 108
    invoke-static/range {v1 .. v7}, Ll/ipp0;->a(Ll/oo2;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    :cond_2
    :goto_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 112
    .line 113
    .line 114
    move-result-wide v0

    .line 115
    iput-wide v0, p0, Ll/hpp0;->h:J

    .line 116
    .line 117
    :cond_3
    :goto_1
    return-void
.end method

.method public s2()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->s2()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/hpp0;->j:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
