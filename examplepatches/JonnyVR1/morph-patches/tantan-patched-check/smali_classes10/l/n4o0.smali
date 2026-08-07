.class public Ll/n4o0;
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

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->backGroundPicSetting:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPicSetting;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPicSetting;->backGroundPics:Ljava/util/List;

    .line 6
    .line 7
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;->url:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)V
    .locals 1

    .line 1
    new-instance v0, Ll/i4o0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/i4o0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance v0, Ll/j4o0;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/j4o0;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {p1, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p0, p1}, Ll/rcu;->d(Landroid/content/Context;Ljava/util/List;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ljava/util/List;
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->backGroundPicSetting:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPicSetting;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPicSetting;->currentId:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPicSetting;->backGroundPics:Ljava/util/List;

    .line 8
    .line 9
    new-instance v2, Ll/l4o0;

    .line 10
    .line 11
    invoke-direct {v2, p0, v0}, Ll/l4o0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPicSetting;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v1, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPicSetting;->backGroundPics:Ljava/util/List;

    .line 18
    .line 19
    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPicSetting;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPicSetting;->currentId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    iput-boolean p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;->check:Z

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    iput-boolean p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;->check:Z

    .line 23
    .line 24
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceRooms:Ljava/util/List;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 11
    .line 12
    return-object p0
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;->picType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "svga"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static h(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "/voice-rooms/"

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
    const-string p0, "/settingBackGroundPics"

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
    invoke-virtual {p0}, Ll/rnl;->p()Ll/rnl$a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_0

    .line 37
    .line 38
    const-string v0, "source"

    .line 39
    .line 40
    invoke-virtual {p0, v0, p1}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 41
    .line 42
    .line 43
    :cond_0
    invoke-virtual {p0}, Ll/rnl$a;->d()Ll/rnl;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    const-string p1, "getRoomSettingBackgroundPics"

    .line 48
    .line 49
    invoke-static {p0, p1}, Ll/vrv;->w(Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    new-instance p1, Ll/k4o0;

    .line 54
    .line 55
    invoke-direct {p1}, Ll/k4o0;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method

.method public static i(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    const-string v0, "/voice-rooms/-1/settingBackGroundPics"

    .line 2
    .line 3
    invoke-static {v0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/rnl;->l(Ljava/lang/String;)Ll/rnl;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/rnl;->p()Ll/rnl$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/rnl$a;->d()Ll/rnl;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "getRoomSettingBackgroundPicsWithPreLoad"

    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/vrv;->w(Ll/rnl;Ljava/lang/String;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/g4o0;

    .line 26
    .line 27
    invoke-direct {v1}, Ll/g4o0;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/h4o0;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/h4o0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public static j(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "backGroundPicId"

    .line 2
    .line 3
    new-instance v1, Lorg/json/JSONObject;

    .line 4
    .line 5
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 6
    .line 7
    .line 8
    :try_start_0
    invoke-virtual {v1, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catch_0
    move-exception p1

    .line 13
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 14
    .line 15
    .line 16
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v2, "/voice-rooms/"

    .line 19
    .line 20
    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {p0}, Ll/zvr;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {p0}, Ll/rnl;->l(Ljava/lang/String;)Ll/rnl;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Ll/rnl;->p()Ll/rnl$a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    const-string p1, "fields"

    .line 43
    .line 44
    invoke-virtual {p0, p1, v0}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Ll/rnl$a;->d()Ll/rnl;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    const-string p1, "requestChangeRoomBackground"

    .line 53
    .line 54
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-static {p0, p1, v0}, Ll/vrv;->m(Ll/rnl;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    new-instance p1, Ll/m4o0;

    .line 63
    .line 64
    invoke-direct {p1}, Ll/m4o0;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    return-object p0
.end method
