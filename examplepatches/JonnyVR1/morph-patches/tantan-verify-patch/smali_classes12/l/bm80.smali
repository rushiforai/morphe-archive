.class public Ll/bm80;
.super Ll/ngk;
.source "SourceFile"

# interfaces
.implements Ll/i3m;


# instance fields
.field private I:Ll/klk0;

.field private J:Ll/mlj;

.field private K:Ll/rv40;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/ngk;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/rv40;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/rv40;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/bm80;->K:Ll/rv40;

    .line 10
    .line 11
    new-instance v0, Ll/mlj;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-direct {v0, v1}, Ll/mlj;-><init>(F)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/bm80;->J:Ll/mlj;

    .line 18
    .line 19
    new-instance v0, Ll/klk0;

    .line 20
    .line 21
    invoke-direct {v0}, Ll/klk0;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/bm80;->I:Ll/klk0;

    .line 25
    .line 26
    iget-object v0, p0, Ll/bm80;->K:Ll/rv40;

    .line 27
    .line 28
    iget-object v1, p0, Ll/bm80;->J:Ll/mlj;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/ffj;->H(Ll/cfj;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/bm80;->I:Ll/klk0;

    .line 34
    .line 35
    iget-object v1, p0, Ll/bm80;->K:Ll/rv40;

    .line 36
    .line 37
    const/4 v2, 0x0

    .line 38
    invoke-virtual {v0, v1, v2}, Ll/gs10;->R(Ll/ffj;I)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/bm80;->I:Ll/klk0;

    .line 42
    .line 43
    iget-object v1, p0, Ll/bm80;->J:Ll/mlj;

    .line 44
    .line 45
    const/4 v2, 0x1

    .line 46
    invoke-virtual {v0, v1, v2}, Ll/gs10;->R(Ll/ffj;I)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/bm80;->K:Ll/rv40;

    .line 50
    .line 51
    iget-object v1, p0, Ll/bm80;->I:Ll/klk0;

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ll/ffj;->H(Ll/cfj;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ll/bm80;->J:Ll/mlj;

    .line 57
    .line 58
    iget-object v1, p0, Ll/bm80;->I:Ll/klk0;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ll/ffj;->H(Ll/cfj;)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Ll/bm80;->I:Ll/klk0;

    .line 64
    .line 65
    invoke-virtual {v0, p0}, Ll/ffj;->H(Ll/cfj;)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ll/bm80;->K:Ll/rv40;

    .line 69
    .line 70
    invoke-virtual {p0, v0}, Ll/ngk;->R(Ll/it2;)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/bm80;->J:Ll/mlj;

    .line 74
    .line 75
    invoke-virtual {p0, v0}, Ll/ngk;->Q(Ll/it2;)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Ll/bm80;->I:Ll/klk0;

    .line 79
    .line 80
    invoke-virtual {p0, v0}, Ll/ngk;->S(Ll/it2;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method


# virtual methods
.method public d(Lcom/immomo/velib/anim/model/PostProcessingModel$ParamsModel;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bm80;->J:Ll/mlj;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/PostProcessingModel$ParamsModel;->getRadius()F

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    :goto_0
    invoke-virtual {v0, v1}, Ll/mlj;->R(F)V

    .line 14
    .line 15
    .line 16
    if-nez p1, :cond_1

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_1
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/PostProcessingModel$ParamsModel;->getRadius()F

    .line 20
    .line 21
    .line 22
    :cond_2
    :goto_1
    iget-object v0, p0, Ll/bm80;->I:Ll/klk0;

    .line 23
    .line 24
    if-eqz v0, :cond_7

    .line 25
    .line 26
    if-nez p1, :cond_3

    .line 27
    .line 28
    const/high16 v1, 0x3f000000    # 0.5f

    .line 29
    .line 30
    goto :goto_2

    .line 31
    :cond_3
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/PostProcessingModel$ParamsModel;->getScale()F

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    :goto_2
    invoke-virtual {v0, v1}, Ll/klk0;->T(F)V

    .line 36
    .line 37
    .line 38
    if-nez p1, :cond_4

    .line 39
    .line 40
    goto :goto_3

    .line 41
    :cond_4
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/PostProcessingModel$ParamsModel;->getScale()F

    .line 42
    .line 43
    .line 44
    :goto_3
    iget-object p0, p0, Ll/bm80;->I:Ll/klk0;

    .line 45
    .line 46
    if-nez p1, :cond_5

    .line 47
    .line 48
    const v0, 0x3ca3d70a    # 0.02f

    .line 49
    .line 50
    .line 51
    goto :goto_4

    .line 52
    :cond_5
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/PostProcessingModel$ParamsModel;->getThreshold()F

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    :goto_4
    invoke-virtual {p0, v0}, Ll/klk0;->U(F)V

    .line 57
    .line 58
    .line 59
    if-nez p1, :cond_6

    .line 60
    .line 61
    goto :goto_5

    .line 62
    :cond_6
    invoke-virtual {p1}, Lcom/immomo/velib/anim/model/PostProcessingModel$ParamsModel;->getThreshold()F

    .line 63
    .line 64
    .line 65
    :cond_7
    :goto_5
    return-void
.end method

.method public f(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bm80;->I:Ll/klk0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/klk0;->f(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/bm80;->J:Ll/mlj;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/mlj;->f(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method
