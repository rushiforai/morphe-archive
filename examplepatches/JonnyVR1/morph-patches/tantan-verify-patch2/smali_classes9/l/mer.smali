.class public Ll/mer;
.super Ll/l6t;
.source "SourceFile"


# instance fields
.field public final e:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

.field public f:Ll/dum;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/l6t;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/mer;->e:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public D2()Ll/dum;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mer;->f:Ll/dum;

    .line 2
    .line 3
    return-object p0
.end method

.method public E2(Ll/dum;)V
    .locals 0

    .line 1
    return-void
.end method

.method public F2(Ll/dum;)V
    .locals 0

    .line 1
    return-void
.end method

.method public H2(Ll/l6t;Ll/dum;)Ll/l6t;
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of v0, p1, Ll/mer;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p1, Ll/mer;

    .line 10
    .line 11
    invoke-virtual {p1, p2}, Ll/mer;->I2(Ll/dum;)Ll/l6t;

    .line 12
    .line 13
    .line 14
    :cond_0
    return-object p0
.end method

.method public I2(Ll/dum;)Ll/l6t;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mer;->f:Ll/dum;

    .line 2
    .line 3
    return-object p0
.end method

.method public final n()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mer;->f:Ll/dum;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Ll/dum;->h:Ll/oo2;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/mer;->f:Ll/dum;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/mer;->E2(Ll/dum;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    invoke-super {p0}, Ll/l6t;->n()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final t()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mer;->f:Ll/dum;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Ll/dum;->h:Ll/oo2;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/mer;->f:Ll/dum;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/mer;->F2(Ll/dum;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    invoke-super {p0}, Ll/l6t;->t()V

    .line 19
    .line 20
    .line 21
    return-void
.end method
