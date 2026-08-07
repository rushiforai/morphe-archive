.class public Ll/tl8;
.super Ll/xi5;
.source "SourceFile"


# static fields
.field public static final d:Ll/byd0;

.field public static final e:Ll/wyd0;

.field public static f:Ljava/lang/String;


# instance fields
.field public a:Ll/wyd0;

.field public b:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ll/vxd0;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Ll/byd0;

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "create_device_time"

    .line 10
    .line 11
    invoke-direct {v0, v2, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Ll/tl8;->d:Ll/byd0;

    .line 15
    .line 16
    new-instance v0, Ll/wyd0;

    .line 17
    .line 18
    const-string v1, "idfp_sp"

    .line 19
    .line 20
    const-string v2, ""

    .line 21
    .line 22
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    sput-object v0, Ll/tl8;->e:Ll/wyd0;

    .line 26
    .line 27
    new-instance v0, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    sget-object v1, Ll/uqb0;->s:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v1, "_"

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    sget v3, Ll/uqb0;->t:I

    .line 43
    .line 44
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v3, "nolive"

    .line 48
    .line 49
    const-string v4, "intl"

    .line 50
    .line 51
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    if-eqz v3, :cond_0

    .line 56
    .line 57
    const-string v2, "_nolive"

    .line 58
    .line 59
    :cond_0
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    sget-object v1, Ll/ls4;->a:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    sput-object v0, Ll/tl8;->f:Ljava/lang/String;

    .line 75
    .line 76
    return-void
.end method

.method public constructor <init>(Ll/xi5;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/xi5;-><init>(Lcom/tantanapp/common/network/RunnerProxy;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/wyd0;

    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "reigistered_device_id"

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sget-object v1, Ll/uqb0;->c0:Ll/bn5;

    .line 14
    .line 15
    invoke-interface {v1}, Ll/bn5;->userId()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-direct {p1, v0, v1}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iput-object p1, p0, Ll/tl8;->a:Ll/wyd0;

    .line 31
    .line 32
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 33
    .line 34
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iput-object p1, p0, Ll/tl8;->b:Lrx/subjects/a;

    .line 39
    .line 40
    new-instance p1, Ll/vxd0;

    .line 41
    .line 42
    const-string v0, "device_info_version"

    .line 43
    .line 44
    const/4 v1, 0x0

    .line 45
    invoke-direct {p1, v0, v1}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 46
    .line 47
    .line 48
    iput-object p1, p0, Ll/tl8;->c:Ll/vxd0;

    .line 49
    .line 50
    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/data/Device;)Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Ll/xi5;->network:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "/devices"

    .line 8
    .line 9
    invoke-static {v1}, Ll/xi5;->p(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Device;->toJson()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {v1, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public static synthetic C(Ll/tl8;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tl8;->J(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic D(Ll/tl8;Lcom/p1/mobile/putong/data/Device;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tl8;->L(Lcom/p1/mobile/putong/data/Device;)V

    return-void
.end method

.method public static synthetic E(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static F(Ljava/util/List;)Lcom/p1/mobile/putong/data/Device;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/DevicePush;",
            ">;)",
            "Lcom/p1/mobile/putong/data/Device;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/tl8;->M()Lcom/p1/mobile/putong/data/Device;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->devicePushNotifications:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v1, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public static G()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/tl8;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static H()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/nrb0;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "4.0.0"

    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    const-string v0, "1.0.0"

    .line 11
    .line 12
    return-object v0
.end method

.method public static M()Lcom/p1/mobile/putong/data/Device;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Device;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Device;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/tl8;->G()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->appBuild:Ljava/lang/String;

    .line 11
    .line 12
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->bundleId:Ljava/lang/String;

    .line 19
    .line 20
    sget-object v1, Ll/uqb0;->s:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->appVersion:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {}, Ll/qzd;->a()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->identifier:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {}, Ll/tl8;->N()Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->identifiers:Ljava/util/List;

    .line 35
    .line 36
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 37
    .line 38
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->name:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/api/api/Network;->language()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->language:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v1}, Ljava/util/Locale;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->locale:Ljava/lang/String;

    .line 55
    .line 56
    new-instance v1, Lcom/p1/mobile/putong/data/DeviceOs;

    .line 57
    .line 58
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/DeviceOs;-><init>()V

    .line 59
    .line 60
    .line 61
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->operatingSystem:Lcom/p1/mobile/putong/data/DeviceOs;

    .line 62
    .line 63
    const-string v2, "Android"

    .line 64
    .line 65
    iput-object v2, v1, Lcom/p1/mobile/putong/data/DeviceOs;->name:Ljava/lang/String;

    .line 66
    .line 67
    sget-object v2, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    .line 68
    .line 69
    iput-object v2, v1, Lcom/p1/mobile/putong/data/DeviceOs;->version:Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {}, Ll/uqb0;->J0()Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-eqz v1, :cond_0

    .line 76
    .line 77
    invoke-static {}, Ll/tl8;->H()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->appUIVersion:Ljava/lang/String;

    .line 82
    .line 83
    :cond_0
    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 84
    .line 85
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->brand:Ljava/lang/String;

    .line 86
    .line 87
    invoke-static {}, Ll/nrb0;->a()Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-eqz v1, :cond_1

    .line 92
    .line 93
    invoke-static {}, Ll/yp50;->d()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->oneid:Ljava/lang/String;

    .line 98
    .line 99
    :cond_1
    return-object v0
.end method

.method public static N()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/DeviceIdentifier;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/data/DeviceIdentifier;->new_()Lcom/p1/mobile/putong/data/DeviceIdentifier;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    const-string v2, "uuid"

    .line 11
    .line 12
    iput-object v2, v1, Lcom/p1/mobile/putong/data/DeviceIdentifier;->name:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {}, Ll/qzd;->a()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    iput-object v2, v1, Lcom/p1/mobile/putong/data/DeviceIdentifier;->token:Ljava/lang/String;

    .line 19
    .line 20
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ll/qzd;->d()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-nez v1, :cond_0

    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/data/DeviceIdentifier;->new_()Lcom/p1/mobile/putong/data/DeviceIdentifier;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const-string v2, "imei"

    .line 38
    .line 39
    iput-object v2, v1, Lcom/p1/mobile/putong/data/DeviceIdentifier;->name:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {}, Ll/qzd;->d()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    iput-object v2, v1, Lcom/p1/mobile/putong/data/DeviceIdentifier;->token:Ljava/lang/String;

    .line 46
    .line 47
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    :cond_0
    invoke-static {}, Ll/qzd;->e()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-nez v1, :cond_1

    .line 59
    .line 60
    invoke-static {}, Lcom/p1/mobile/putong/data/DeviceIdentifier;->new_()Lcom/p1/mobile/putong/data/DeviceIdentifier;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    const-string v2, "ime1"

    .line 65
    .line 66
    iput-object v2, v1, Lcom/p1/mobile/putong/data/DeviceIdentifier;->name:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {}, Ll/qzd;->e()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    iput-object v2, v1, Lcom/p1/mobile/putong/data/DeviceIdentifier;->token:Ljava/lang/String;

    .line 73
    .line 74
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    :cond_1
    invoke-static {}, Ll/qzd;->f()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    if-nez v1, :cond_2

    .line 86
    .line 87
    invoke-static {}, Lcom/p1/mobile/putong/data/DeviceIdentifier;->new_()Lcom/p1/mobile/putong/data/DeviceIdentifier;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    const-string v2, "ime2"

    .line 92
    .line 93
    iput-object v2, v1, Lcom/p1/mobile/putong/data/DeviceIdentifier;->name:Ljava/lang/String;

    .line 94
    .line 95
    invoke-static {}, Ll/qzd;->f()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    iput-object v2, v1, Lcom/p1/mobile/putong/data/DeviceIdentifier;->token:Ljava/lang/String;

    .line 100
    .line 101
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    :cond_2
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 105
    .line 106
    const/16 v2, 0x1a

    .line 107
    .line 108
    if-lt v1, v2, :cond_3

    .line 109
    .line 110
    invoke-static {}, Ll/qzd;->g()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 115
    .line 116
    .line 117
    move-result v3

    .line 118
    if-nez v3, :cond_3

    .line 119
    .line 120
    invoke-static {}, Lcom/p1/mobile/putong/data/DeviceIdentifier;->new_()Lcom/p1/mobile/putong/data/DeviceIdentifier;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    const-string v4, "meid"

    .line 125
    .line 126
    iput-object v4, v3, Lcom/p1/mobile/putong/data/DeviceIdentifier;->name:Ljava/lang/String;

    .line 127
    .line 128
    invoke-static {}, Ll/qzd;->g()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v4

    .line 132
    iput-object v4, v3, Lcom/p1/mobile/putong/data/DeviceIdentifier;->token:Ljava/lang/String;

    .line 133
    .line 134
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    :cond_3
    if-lt v1, v2, :cond_4

    .line 138
    .line 139
    invoke-static {}, Ll/qzd;->h()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 144
    .line 145
    .line 146
    move-result v3

    .line 147
    if-nez v3, :cond_4

    .line 148
    .line 149
    invoke-static {}, Lcom/p1/mobile/putong/data/DeviceIdentifier;->new_()Lcom/p1/mobile/putong/data/DeviceIdentifier;

    .line 150
    .line 151
    .line 152
    move-result-object v3

    .line 153
    const-string v4, "mei1"

    .line 154
    .line 155
    iput-object v4, v3, Lcom/p1/mobile/putong/data/DeviceIdentifier;->name:Ljava/lang/String;

    .line 156
    .line 157
    invoke-static {}, Ll/qzd;->h()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v4

    .line 161
    iput-object v4, v3, Lcom/p1/mobile/putong/data/DeviceIdentifier;->token:Ljava/lang/String;

    .line 162
    .line 163
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 164
    .line 165
    .line 166
    :cond_4
    if-lt v1, v2, :cond_5

    .line 167
    .line 168
    invoke-static {}, Ll/qzd;->i()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 173
    .line 174
    .line 175
    move-result v1

    .line 176
    if-nez v1, :cond_5

    .line 177
    .line 178
    invoke-static {}, Lcom/p1/mobile/putong/data/DeviceIdentifier;->new_()Lcom/p1/mobile/putong/data/DeviceIdentifier;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    const-string v2, "mei2"

    .line 183
    .line 184
    iput-object v2, v1, Lcom/p1/mobile/putong/data/DeviceIdentifier;->name:Ljava/lang/String;

    .line 185
    .line 186
    invoke-static {}, Ll/qzd;->i()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v2

    .line 190
    iput-object v2, v1, Lcom/p1/mobile/putong/data/DeviceIdentifier;->token:Ljava/lang/String;

    .line 191
    .line 192
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 193
    .line 194
    .line 195
    :cond_5
    invoke-static {}, Ll/hb00;->b()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 200
    .line 201
    .line 202
    move-result v1

    .line 203
    if-nez v1, :cond_6

    .line 204
    .line 205
    invoke-static {}, Lcom/p1/mobile/putong/data/DeviceIdentifier;->new_()Lcom/p1/mobile/putong/data/DeviceIdentifier;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    const-string v2, "oaid"

    .line 210
    .line 211
    iput-object v2, v1, Lcom/p1/mobile/putong/data/DeviceIdentifier;->name:Ljava/lang/String;

    .line 212
    .line 213
    invoke-static {}, Ll/hb00;->b()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v2

    .line 217
    iput-object v2, v1, Lcom/p1/mobile/putong/data/DeviceIdentifier;->token:Ljava/lang/String;

    .line 218
    .line 219
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 220
    .line 221
    .line 222
    :cond_6
    invoke-static {}, Ll/yp50;->d()Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v1

    .line 226
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 227
    .line 228
    .line 229
    move-result v2

    .line 230
    if-nez v2, :cond_7

    .line 231
    .line 232
    invoke-static {}, Lcom/p1/mobile/putong/data/DeviceIdentifier;->new_()Lcom/p1/mobile/putong/data/DeviceIdentifier;

    .line 233
    .line 234
    .line 235
    move-result-object v2

    .line 236
    const-string v3, "onei"

    .line 237
    .line 238
    iput-object v3, v2, Lcom/p1/mobile/putong/data/DeviceIdentifier;->name:Ljava/lang/String;

    .line 239
    .line 240
    iput-object v1, v2, Lcom/p1/mobile/putong/data/DeviceIdentifier;->token:Ljava/lang/String;

    .line 241
    .line 242
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 243
    .line 244
    .line 245
    :cond_7
    invoke-static {}, Lcom/p1/mobile/putong/data/DeviceIdentifier;->new_()Lcom/p1/mobile/putong/data/DeviceIdentifier;

    .line 246
    .line 247
    .line 248
    move-result-object v1

    .line 249
    const-string v2, "idfp"

    .line 250
    .line 251
    iput-object v2, v1, Lcom/p1/mobile/putong/data/DeviceIdentifier;->name:Ljava/lang/String;

    .line 252
    .line 253
    sget-object v2, Ll/tl8;->e:Ll/wyd0;

    .line 254
    .line 255
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 256
    .line 257
    .line 258
    move-result-object v3

    .line 259
    check-cast v3, Ljava/lang/CharSequence;

    .line 260
    .line 261
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 262
    .line 263
    .line 264
    move-result v3

    .line 265
    if-eqz v3, :cond_8

    .line 266
    .line 267
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 268
    .line 269
    .line 270
    move-result-object v3

    .line 271
    invoke-virtual {v3}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object v3

    .line 275
    invoke-virtual {v2, v3}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 276
    .line 277
    .line 278
    :cond_8
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 279
    .line 280
    .line 281
    move-result-object v2

    .line 282
    check-cast v2, Ljava/lang/String;

    .line 283
    .line 284
    iput-object v2, v1, Lcom/p1/mobile/putong/data/DeviceIdentifier;->token:Ljava/lang/String;

    .line 285
    .line 286
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 287
    .line 288
    .line 289
    return-object v0
.end method

.method public static synthetic x(Lcom/p1/mobile/putong/data/Device;)Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Ll/xi5;->network:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "/devices?method=delete"

    .line 8
    .line 9
    invoke-static {v1}, Ll/xi5;->p(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Device;->toJson()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {v1, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public static synthetic y(Ll/tl8;Lcom/p1/mobile/putong/data/Device;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Device;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tl8;->K(Lcom/p1/mobile/putong/data/Device;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Device;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic z(ZLcom/p1/mobile/putong/data/Device;)Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Ll/xi5;->network:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const-string p0, "/devices/bind"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string p0, "/devices/bind?method=delete"

    .line 13
    .line 14
    :goto_0
    invoke-static {p0}, Ll/xi5;->j(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    sget-object v0, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Device;->toJson()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-static {v0, p1}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, p1}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method


# virtual methods
.method public I()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/tl8;->b:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic J(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tl8;->a:Ll/wyd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/wyd0;->clear()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic K(Lcom/p1/mobile/putong/data/Device;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Device;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tl8;->b:Lrx/subjects/a;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Device;->devicePushNotifications:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    xor-int/lit8 p1, p1, 0x1

    .line 10
    .line 11
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    const-class p0, Lcom/p1/mobile/putong/data/CommonData;

    .line 19
    .line 20
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Lcom/p1/mobile/putong/data/CommonData;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/data/CommonData;->devices:Ljava/util/List;

    .line 27
    .line 28
    const/4 p1, 0x0

    .line 29
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Lcom/p1/mobile/putong/data/Device;

    .line 34
    .line 35
    return-object p0
.end method

.method public final synthetic L(Lcom/p1/mobile/putong/data/Device;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tl8;->a:Ll/wyd0;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Device;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public O()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/nrb0;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Ll/uqb0;->O:Ll/tl8;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1}, Ll/tl8;->P(Z)V

    .line 11
    .line 12
    .line 13
    :cond_0
    invoke-static {}, Ll/tl8;->M()Lcom/p1/mobile/putong/data/Device;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Ll/tl8;->b:Lrx/subjects/a;

    .line 18
    .line 19
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    new-instance v1, Ll/si20;

    .line 25
    .line 26
    new-instance v2, Ll/ll8;

    .line 27
    .line 28
    invoke-direct {v2, v0}, Ll/ll8;-><init>(Lcom/p1/mobile/putong/data/Device;)V

    .line 29
    .line 30
    .line 31
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->UNIT_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 32
    .line 33
    invoke-direct {v1, v2, v0}, Ll/si20;-><init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;)V

    .line 34
    .line 35
    .line 36
    new-instance v0, Ll/ml8;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Ll/ml8;-><init>(Ll/tl8;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

.method public P(Z)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/app/TantanApp;->c:Ll/cmb0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/cmb0;->y()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/tl8;->F(Ljava/util/List;)Lcom/p1/mobile/putong/data/Device;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/si20;

    .line 12
    .line 13
    new-instance v2, Ll/nl8;

    .line 14
    .line 15
    invoke-direct {v2, p1, v0}, Ll/nl8;-><init>(ZLcom/p1/mobile/putong/data/Device;)V

    .line 16
    .line 17
    .line 18
    sget-object p1, Lcom/p1/mobile/putong/data/Envelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 19
    .line 20
    invoke-direct {v1, v2, p1}, Ll/si20;-><init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {v1, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/network/RunnerProxy;->now(Lrx/c;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    new-instance p1, Ll/ol8;

    .line 36
    .line 37
    invoke-direct {p1}, Ll/ol8;-><init>()V

    .line 38
    .line 39
    .line 40
    new-instance v0, Ll/pl8;

    .line 41
    .line 42
    invoke-direct {v0}, Ll/pl8;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {p1, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public Q(Ljava/util/List;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/DevicePush;",
            ">;)",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/Device;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/tl8;->c:Ll/vxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    if-eq v0, v1, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/tl8;->a:Ll/wyd0;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/wyd0;->clear()Z

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/tl8;->c:Ll/vxd0;

    .line 22
    .line 23
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    :cond_0
    invoke-static {}, Ll/tl8;->M()Lcom/p1/mobile/putong/data/Device;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Device;->devicePushNotifications:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_1

    .line 50
    .line 51
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    check-cast v1, Lcom/p1/mobile/putong/data/DevicePush;

    .line 56
    .line 57
    iget-object v2, v0, Lcom/p1/mobile/putong/data/Device;->devicePushNotifications:Ljava/util/List;

    .line 58
    .line 59
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    new-instance p1, Ll/si20;

    .line 64
    .line 65
    new-instance v1, Ll/ql8;

    .line 66
    .line 67
    invoke-direct {v1, v0}, Ll/ql8;-><init>(Lcom/p1/mobile/putong/data/Device;)V

    .line 68
    .line 69
    .line 70
    sget-object v2, Lcom/p1/mobile/putong/data/Envelope;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 71
    .line 72
    invoke-direct {p1, v1, v2}, Ll/si20;-><init>(Ll/pcj;Lcom/tantanapp/common/data/INetParser;)V

    .line 73
    .line 74
    .line 75
    new-instance v1, Ll/rl8;

    .line 76
    .line 77
    invoke-direct {v1, p0, v0}, Ll/rl8;-><init>(Ll/tl8;Lcom/p1/mobile/putong/data/Device;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    new-instance v0, Ll/sl8;

    .line 85
    .line 86
    invoke-direct {v0, p0}, Ll/sl8;-><init>(Ll/tl8;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p1, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    return-object p0
.end method
