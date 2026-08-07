.class public Ll/eft;
.super Ll/eas;
.source "SourceFile"


# instance fields
.field public a:Ll/rwl;


# direct methods
.method public constructor <init>(Ll/rwl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/eas;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/eft;->a:Ll/rwl;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public I0(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/eas;->I0(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/v2t;->b:Ljava/lang/String;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "onEnginePushStarting\uff0crtcType:"

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {p1}, Ll/xau;->m(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {v0, p1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/eft;->a:Ll/rwl;

    .line 28
    .line 29
    invoke-interface {p0}, Ll/rwl;->l()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public K0(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/eas;->K0(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/v2t;->b:Ljava/lang/String;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "onEngineBufferStopped\uff0crtcType:"

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {p1}, Ll/xau;->m(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {v0, p1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/eft;->a:Ll/rwl;

    .line 28
    .line 29
    invoke-interface {p0}, Ll/rwl;->V()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public S(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/eas;->S(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;II)V

    .line 2
    .line 3
    .line 4
    const/16 p1, -0x16a9

    .line 5
    .line 6
    if-ne p2, p1, :cond_0

    .line 7
    .line 8
    const/4 p1, 0x2

    .line 9
    if-ne p3, p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/eft;->a:Ll/rwl;

    .line 12
    .line 13
    invoke-interface {p0}, Ll/rwl;->J()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-static {}, Ll/t3f;->b()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-ne p2, p1, :cond_1

    .line 22
    .line 23
    iget-object p0, p0, Ll/eft;->a:Ll/rwl;

    .line 24
    .line 25
    invoke-interface {p0, p3}, Ll/rwl;->N0(I)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    invoke-static {}, Ll/t3f;->c()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-ne p2, p1, :cond_2

    .line 34
    .line 35
    iget-object p0, p0, Ll/eft;->a:Ll/rwl;

    .line 36
    .line 37
    invoke-interface {p0, p3}, Ll/rwl;->y(I)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_2
    invoke-static {}, Ll/t3f;->a()I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-ne p2, p1, :cond_3

    .line 46
    .line 47
    iget-object p0, p0, Ll/eft;->a:Ll/rwl;

    .line 48
    .line 49
    invoke-interface {p0}, Ll/rwl;->s0()V

    .line 50
    .line 51
    .line 52
    :cond_3
    return-void
.end method

.method public S0(Ll/rwl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eft;->a:Ll/rwl;

    .line 2
    .line 3
    return-void
.end method

.method public w0(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/eas;->w0(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/v2t;->b:Ljava/lang/String;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "onEngineBufferStart\uff0crtcType:"

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {p1}, Ll/xau;->m(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {v0, p1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/eft;->a:Ll/rwl;

    .line 28
    .line 29
    invoke-interface {p0}, Ll/rwl;->O()V

    .line 30
    .line 31
    .line 32
    return-void
.end method
