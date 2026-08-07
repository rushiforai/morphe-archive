.class public Ll/eln0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->grabHatGame:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->grabHatGame:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->grabHatGame:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->grabHatCps:Ljava/util/List;

    .line 4
    .line 5
    return-object p0
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "closeGame"

    .line 2
    .line 3
    invoke-static {p0, p1, v0}, Ll/eln0;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "/voice-lives/"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p0, "/grab-hats/"

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->m(Ljava/lang/String;)Ll/rnl$a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string p1, "action"

    .line 32
    .line 33
    invoke-virtual {p0, p1, p2}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Ll/rnl$a;->d()Ll/rnl;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    new-instance p1, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    const-string v0, "controlGame"

    .line 44
    .line 45
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    const-string p2, ""

    .line 56
    .line 57
    invoke-static {p0, p1, p2}, Ll/vrv;->m(Ll/rnl;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    new-instance p1, Ll/dln0;

    .line 62
    .line 63
    invoke-direct {p1}, Ll/dln0;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0
.end method

.method public static g(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "/voice-grab-hats/"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p0, "/cps"

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {p0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Ll/rnl;->l(Ljava/lang/String;)Ll/rnl;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string v0, "getCps"

    .line 29
    .line 30
    invoke-static {p0, v0}, Ll/vrv;->w(Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    new-instance v0, Ll/bln0;

    .line 35
    .line 36
    invoke-direct {v0}, Ll/bln0;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method public static h(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "/voice-lives/"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p0, "/grabhats"

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {p0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Ll/rnl;->l(Ljava/lang/String;)Ll/rnl;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string v0, "grabhats"

    .line 29
    .line 30
    invoke-static {p0, v0}, Ll/vrv;->w(Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    new-instance v0, Ll/aln0;

    .line 35
    .line 36
    invoke-direct {v0}, Ll/aln0;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method public static i(Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "/voice-lives/"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p0, "/grab-hat"

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {p0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Ll/rnl;->l(Ljava/lang/String;)Ll/rnl;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string v0, "openGrabGame"

    .line 29
    .line 30
    const-string v1, ""

    .line 31
    .line 32
    invoke-static {p0, v0, v1}, Ll/vrv;->p(Ll/rnl;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    new-instance v0, Ll/cln0;

    .line 37
    .line 38
    invoke-direct {v0}, Ll/cln0;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

.method public static j(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "startGrab"

    .line 2
    .line 3
    invoke-static {p0, p1, v0}, Ll/eln0;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static k(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatGame;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "stopGrab"

    .line 2
    .line 3
    invoke-static {p0, p1, v0}, Ll/eln0;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
