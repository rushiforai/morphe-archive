.class public Lcom/idv/identity/face/photinus/PhotinusEmulator;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/idv/identity/face/photinus/VideoWriter$c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/idv/identity/face/photinus/PhotinusEmulator$State;
    }
.end annotation


# instance fields
.field private A:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private B:I

.field private final C:I

.field private final D:Landroid/os/Handler;

.field private final E:Ljava/lang/Runnable;

.field private a:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "[B>;"
        }
    .end annotation
.end field

.field private final b:[Ljava/lang/String;

.field private final c:Ljava/lang/Object;

.field private d:I

.field private e:I

.field private f:I

.field private g:I

.field private h:I

.field private i:I

.field private j:Z

.field private k:F

.field private l:F

.field private m:[I

.field private n:[I

.field private o:I

.field private p:I

.field private q:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

.field private r:J

.field private s:Landroid/net/Uri;

.field private t:Landroid/net/Uri;

.field private u:Ll/y270;

.field private v:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/e7j;",
            ">;"
        }
    .end annotation
.end field

.field private w:Ll/e7j;

.field private x:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private y:Lcom/idv/identity/face/photinus/VideoWriter;

.field private z:Ll/qer;


# direct methods
.method public constructor <init>()V
    .locals 31

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v29, "FNumber"

    .line 7
    .line 8
    const-string v30, "ISOSpeedRatings"

    .line 9
    .line 10
    const-string v1, "ApertureValue"

    .line 11
    .line 12
    const-string v2, "Contrast"

    .line 13
    .line 14
    const-string v3, "CustomRendered"

    .line 15
    .line 16
    const-string v4, "DefaultCropSize"

    .line 17
    .line 18
    const-string v5, "DeviceSettingDescription"

    .line 19
    .line 20
    const-string v6, "DigitalZoomRatio"

    .line 21
    .line 22
    const-string v7, "DateTime"

    .line 23
    .line 24
    const-string v8, "ExifVersion"

    .line 25
    .line 26
    const-string v9, "ExposureBiasValue"

    .line 27
    .line 28
    const-string v10, "ExposureIndex"

    .line 29
    .line 30
    const-string v11, "ExposureMode"

    .line 31
    .line 32
    const-string v12, "ExposureProgram"

    .line 33
    .line 34
    const-string v13, "FocalLength"

    .line 35
    .line 36
    const-string v14, "FocalLengthIn35mmFilm"

    .line 37
    .line 38
    const-string v15, "FocalPlaneResolutionUnit"

    .line 39
    .line 40
    const-string v16, "FocalPlaneXResolution"

    .line 41
    .line 42
    const-string v17, "FocalPlaneYResolution"

    .line 43
    .line 44
    const-string v18, "GainControl"

    .line 45
    .line 46
    const-string v19, "Make"

    .line 47
    .line 48
    const-string v20, "MeteringMode"

    .line 49
    .line 50
    const-string v21, "ReferenceBlackWhite"

    .line 51
    .line 52
    const-string v22, "Saturation"

    .line 53
    .line 54
    const-string v23, "ShutterSpeedValue"

    .line 55
    .line 56
    const-string v24, "SpectralSensitivity"

    .line 57
    .line 58
    const-string v25, "WhiteBalance"

    .line 59
    .line 60
    const-string v26, "WhitePoint"

    .line 61
    .line 62
    const-string v27, "BrightnessValue"

    .line 63
    .line 64
    const-string v28, "ExposureTime"

    .line 65
    .line 66
    filled-new-array/range {v1 .. v30}, [Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    iput-object v1, v0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->b:[Ljava/lang/String;

    .line 71
    .line 72
    new-instance v1, Ljava/lang/Object;

    .line 73
    .line 74
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 75
    .line 76
    .line 77
    iput-object v1, v0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->c:Ljava/lang/Object;

    .line 78
    .line 79
    const/high16 v1, 0x3f800000    # 1.0f

    .line 80
    .line 81
    iput v1, v0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->k:F

    .line 82
    .line 83
    const/4 v1, 0x0

    .line 84
    iput v1, v0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->l:F

    .line 85
    .line 86
    sget-object v1, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;->INVALID:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 87
    .line 88
    iput-object v1, v0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->q:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 89
    .line 90
    new-instance v1, Ljava/util/ArrayList;

    .line 91
    .line 92
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 93
    .line 94
    .line 95
    iput-object v1, v0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->v:Ljava/util/ArrayList;

    .line 96
    .line 97
    new-instance v1, Ll/e7j;

    .line 98
    .line 99
    invoke-direct {v1}, Ll/e7j;-><init>()V

    .line 100
    .line 101
    .line 102
    iput-object v1, v0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->w:Ll/e7j;

    .line 103
    .line 104
    new-instance v1, Ljava/util/HashMap;

    .line 105
    .line 106
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 107
    .line 108
    .line 109
    iput-object v1, v0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->x:Ljava/util/HashMap;

    .line 110
    .line 111
    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 112
    .line 113
    const/4 v2, 0x0

    .line 114
    invoke-direct {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 115
    .line 116
    .line 117
    iput-object v1, v0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->A:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 118
    .line 119
    iput v2, v0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->B:I

    .line 120
    .line 121
    const/4 v1, 0x5

    .line 122
    iput v1, v0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->C:I

    .line 123
    .line 124
    new-instance v1, Landroid/os/Handler;

    .line 125
    .line 126
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 131
    .line 132
    .line 133
    iput-object v1, v0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->D:Landroid/os/Handler;

    .line 134
    .line 135
    new-instance v1, Lcom/idv/identity/face/photinus/PhotinusEmulator$a;

    .line 136
    .line 137
    invoke-direct {v1, v0}, Lcom/idv/identity/face/photinus/PhotinusEmulator$a;-><init>(Lcom/idv/identity/face/photinus/PhotinusEmulator;)V

    .line 138
    .line 139
    .line 140
    iput-object v1, v0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->E:Ljava/lang/Runnable;

    .line 141
    .line 142
    return-void
.end method

.method private A(Ljava/lang/String;III)Z
    .locals 1

    .line 1
    :try_start_0
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->a:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 16
    .line 17
    invoke-static {p0}, Ll/cd4;->a(Ljava/util/List;)Ljava/util/ArrayList;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {p0, v0, p2, p3, p4}, Ll/bqq0;->c(Ljava/util/ArrayList;Ljava/io/File;III)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :catch_0
    move-exception p0

    .line 27
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1, p0}, Lcom/idv/identity/platform/log/RecordService;->recordException(Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x0

    .line 35
    return p0
.end method

.method public static synthetic c(Lcom/idv/identity/face/photinus/PhotinusEmulator;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->c:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Lcom/idv/identity/face/photinus/PhotinusEmulator;)Lcom/idv/identity/face/photinus/PhotinusEmulator$State;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->q:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e(Lcom/idv/identity/face/photinus/PhotinusEmulator;Lcom/idv/identity/face/photinus/PhotinusEmulator$State;)Lcom/idv/identity/face/photinus/PhotinusEmulator$State;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->q:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic f(Lcom/idv/identity/face/photinus/PhotinusEmulator;)Ll/y270;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->u:Ll/y270;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic g(Lcom/idv/identity/face/photinus/PhotinusEmulator;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->A:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    return-object p0
.end method

.method private h(Ljava/util/List;Ljava/lang/String;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;",
            "Ljava/lang/String;",
            "I)V"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "photinusColorRgb"

    .line 7
    .line 8
    invoke-interface {p0, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    const-string p2, "photinusColorCnt"

    .line 12
    .line 13
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    invoke-interface {p0, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private k()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
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
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Ll/afm;->x()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    new-instance v2, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v3, "deleteDirectory: extProtocol "

    .line 17
    .line 18
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    const-string v3, "DTF"

    .line 29
    .line 30
    invoke-static {v3, v2}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    const-class v2, Ljava/util/Map;

    .line 34
    .line 35
    invoke-static {v1, v2}, Lcom/alibaba/fastjson/JSON;->parseObject(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Ljava/util/Map;

    .line 40
    .line 41
    new-instance v2, Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 44
    .line 45
    .line 46
    if-eqz v1, :cond_0

    .line 47
    .line 48
    const-string v3, "photinusColorConfig"

    .line 49
    .line 50
    invoke-interface {v1, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    if-eqz v4, :cond_0

    .line 55
    .line 56
    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    instance-of v3, v1, Ljava/util/List;

    .line 61
    .line 62
    if-eqz v3, :cond_0

    .line 63
    .line 64
    move-object v2, v1

    .line 65
    check-cast v2, Ljava/util/List;

    .line 66
    .line 67
    :cond_0
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-eqz v1, :cond_1

    .line 72
    .line 73
    const-string v1, "{0,0,255}"

    .line 74
    .line 75
    const/4 v3, 0x6

    .line 76
    invoke-direct {p0, v2, v1, v3}, Lcom/idv/identity/face/photinus/PhotinusEmulator;->h(Ljava/util/List;Ljava/lang/String;I)V

    .line 77
    .line 78
    .line 79
    const-string v1, "{255,0,0}"

    .line 80
    .line 81
    const/16 v3, 0x8

    .line 82
    .line 83
    invoke-direct {p0, v2, v1, v3}, Lcom/idv/identity/face/photinus/PhotinusEmulator;->h(Ljava/util/List;Ljava/lang/String;I)V

    .line 84
    .line 85
    .line 86
    const-string v1, "{0,255,0}"

    .line 87
    .line 88
    const/16 v3, 0x9

    .line 89
    .line 90
    invoke-direct {p0, v2, v1, v3}, Lcom/idv/identity/face/photinus/PhotinusEmulator;->h(Ljava/util/List;Ljava/lang/String;I)V

    .line 91
    .line 92
    .line 93
    const-string v1, "{255,255,0}"

    .line 94
    .line 95
    const/4 v3, 0x7

    .line 96
    invoke-direct {p0, v2, v1, v3}, Lcom/idv/identity/face/photinus/PhotinusEmulator;->h(Ljava/util/List;Ljava/lang/String;I)V

    .line 97
    .line 98
    .line 99
    :cond_1
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    if-eqz v2, :cond_3

    .line 108
    .line 109
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    check-cast v2, Ljava/util/Map;

    .line 114
    .line 115
    const-string v3, "photinusColorRgb"

    .line 116
    .line 117
    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    check-cast v3, Ljava/lang/String;

    .line 122
    .line 123
    const-string v4, "photinusColorCnt"

    .line 124
    .line 125
    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    check-cast v2, Ljava/lang/Integer;

    .line 130
    .line 131
    if-eqz v3, :cond_2

    .line 132
    .line 133
    if-eqz v2, :cond_2

    .line 134
    .line 135
    const/4 v4, 0x0

    .line 136
    :goto_0
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 137
    .line 138
    .line 139
    move-result v5

    .line 140
    if-ge v4, v5, :cond_2

    .line 141
    .line 142
    invoke-virtual {p0, v3}, Lcom/idv/identity/face/photinus/PhotinusEmulator;->m(Ljava/lang/String;)Ljava/lang/Integer;

    .line 143
    .line 144
    .line 145
    move-result-object v5

    .line 146
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    add-int/lit8 v4, v4, 0x1

    .line 150
    .line 151
    goto :goto_0

    .line 152
    :cond_3
    return-object v0
.end method

.method private n(I)Ljava/lang/String;
    .locals 4

    .line 1
    new-instance p0, Ljava/text/SimpleDateFormat;

    .line 2
    .line 3
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 4
    .line 5
    const-string v1, "yy.M.dd.HH.mm.ss.SSS"

    .line 6
    .line 7
    invoke-direct {p0, v1, v0}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    new-instance v2, Ljava/util/Date;

    .line 16
    .line 17
    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const/4 p0, 0x5

    .line 28
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const/4 v2, 0x2

    .line 33
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    const/4 v3, 0x3

    .line 38
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    filled-new-array {p0, v2, v3, v3, p1}, [Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    const-string p1, "_n%d_k%d_d%d_p%d_i%d"

    .line 51
    .line 52
    invoke-static {v0, p1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0
.end method

.method private q(Landroid/content/Context;)Landroid/net/Uri;
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string p1, "Phontinus"

    .line 10
    .line 11
    invoke-static {p0, p1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method private s(Ljava/lang/String;)V
    .locals 8

    .line 1
    :try_start_0
    invoke-static {p1}, Lcom/alibaba/fastjson/JSON;->parseObject(Ljava/lang/String;)Lcom/alibaba/fastjson/JSONObject;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    sget-object v0, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 12
    .line 13
    const-string v1, "sensorConfig"

    .line 14
    .line 15
    const-string v2, "SENSOR_INFO"

    .line 16
    .line 17
    const-string v3, "SENSOR_INFO"

    .line 18
    .line 19
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    const-string v4, "MAX_RANGE"

    .line 24
    .line 25
    const-string v5, "MAX_RANGE"

    .line 26
    .line 27
    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    const-string v6, "SENSOR_ACCURACY"

    .line 32
    .line 33
    const-string v7, "SENSOR_ACCURACY"

    .line 34
    .line 35
    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v7

    .line 39
    filled-new-array/range {v2 .. v7}, [Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p1, v0, v1, p0}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void

    .line 47
    :catchall_0
    move-exception v0

    .line 48
    move-object p0, v0

    .line 49
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p1, p0}, Lcom/idv/identity/platform/log/RecordService;->recordException(Ljava/lang/Throwable;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method private t(Ll/e7j;Ll/e7j;)Ljava/util/HashMap;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/e7j;",
            "Ll/e7j;",
            ")",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v0, p1, Ll/e7j;->a:F

    .line 7
    .line 8
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "light-sensor"

    .line 13
    .line 14
    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    iget v0, p2, Ll/e7j;->c:F

    .line 18
    .line 19
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "horizontal-view-angle"

    .line 24
    .line 25
    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    iget v0, p2, Ll/e7j;->d:F

    .line 29
    .line 30
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, "vertical-view-angle"

    .line 35
    .line 36
    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    const-string v0, "brightness-value"

    .line 40
    .line 41
    iget-object v1, p2, Ll/e7j;->h:Ljava/lang/Float;

    .line 42
    .line 43
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    const-string v0, "f-number"

    .line 47
    .line 48
    iget-object v1, p2, Ll/e7j;->g:Ljava/lang/Float;

    .line 49
    .line 50
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    const-string v0, "iso-speed"

    .line 54
    .line 55
    iget-object v1, p2, Ll/e7j;->f:Ljava/lang/Float;

    .line 56
    .line 57
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    const-string v0, "exposure-time"

    .line 61
    .line 62
    iget-object p2, p2, Ll/e7j;->e:Ljava/lang/Float;

    .line 63
    .line 64
    invoke-virtual {p0, v0, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    iget p1, p1, Ll/e7j;->b:I

    .line 68
    .line 69
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    const-string p2, "accuracy"

    .line 74
    .line 75
    invoke-virtual {p0, p2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    return-object p0
.end method

.method private u()Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->p:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->n:[I

    .line 4
    .line 5
    array-length p0, p0

    .line 6
    sub-int/2addr v0, p0

    .line 7
    if-ltz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method private x(Landroid/net/Uri;[B)V
    .locals 1

    .line 1
    :try_start_0
    new-instance v0, Ljava/io/FileOutputStream;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {v0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p2}, Ljava/io/FileOutputStream;->write([B)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p1

    .line 21
    iget-object p0, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->u:Ll/y270;

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    invoke-interface {p0, p1}, Ll/y270;->onException(Ljava/lang/Throwable;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method private y()V
    .locals 5

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->r:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    new-instance v2, Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v3, "sdk-version"

    .line 14
    .line 15
    const-string v4, "1.1.1"

    .line 16
    .line 17
    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    iget v3, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->f:I

    .line 21
    .line 22
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    const-string v4, "rotate-angle"

    .line 27
    .line 28
    invoke-virtual {v2, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    const-string v3, "data-source"

    .line 32
    .line 33
    const-string v4, "idv-production-android-2"

    .line 34
    .line 35
    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    const-string v3, "device-name"

    .line 39
    .line 40
    sget-object v4, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    const-string v3, "total-time-ms"

    .line 46
    .line 47
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    iget v0, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->g:I

    .line 55
    .line 56
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    const-string v1, "sequence-index"

    .line 61
    .line 62
    invoke-virtual {v2, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    const/4 v0, 0x5

    .line 66
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    const-string v1, "sequence-length"

    .line 71
    .line 72
    invoke-virtual {v2, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    const/4 v0, 0x3

    .line 76
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    const-string v1, "sequence-periods"

    .line 81
    .line 82
    invoke-virtual {v2, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    iget v1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->h:I

    .line 86
    .line 87
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    const-string v3, "sequence-repeat"

    .line 92
    .line 93
    invoke-virtual {v2, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    iget v1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->i:I

    .line 97
    .line 98
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    const-string v3, "sequence-margin"

    .line 103
    .line 104
    invoke-virtual {v2, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    const/4 v1, 0x0

    .line 108
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    const-string v3, "sequence-extra"

    .line 113
    .line 114
    invoke-virtual {v2, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    iget v1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->k:F

    .line 118
    .line 119
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    const-string v3, "color-magnitude"

    .line 124
    .line 125
    invoke-virtual {v2, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    iget v1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->l:F

    .line 129
    .line 130
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    const-string v3, "color-offset"

    .line 135
    .line 136
    invoke-virtual {v2, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    iget v1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->e:I

    .line 140
    .line 141
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    const-string v3, "video-width"

    .line 146
    .line 147
    invoke-virtual {v2, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    iget v1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->d:I

    .line 151
    .line 152
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    const-string v3, "video-height"

    .line 157
    .line 158
    invoke-virtual {v2, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    iget-boolean v1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->j:Z

    .line 162
    .line 163
    if-eqz v1, :cond_0

    .line 164
    .line 165
    const-string v1, "smooth-transition-length"

    .line 166
    .line 167
    invoke-virtual {v2, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 171
    .line 172
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 173
    .line 174
    .line 175
    iget-object v1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->v:Ljava/util/ArrayList;

    .line 176
    .line 177
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 178
    .line 179
    .line 180
    move-result-object v1

    .line 181
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 182
    .line 183
    .line 184
    move-result v3

    .line 185
    if-eqz v3, :cond_1

    .line 186
    .line 187
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 188
    .line 189
    .line 190
    move-result-object v3

    .line 191
    check-cast v3, Ll/e7j;

    .line 192
    .line 193
    iget-object v4, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->w:Ll/e7j;

    .line 194
    .line 195
    invoke-direct {p0, v3, v4}, Lcom/idv/identity/face/photinus/PhotinusEmulator;->t(Ll/e7j;Ll/e7j;)Ljava/util/HashMap;

    .line 196
    .line 197
    .line 198
    move-result-object v3

    .line 199
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    goto :goto_0

    .line 203
    :cond_1
    const-string v1, "frame-metadata"

    .line 204
    .line 205
    invoke-virtual {v2, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    .line 207
    .line 208
    const-string v0, "extra-exif"

    .line 209
    .line 210
    iget-object v1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->x:Ljava/util/HashMap;

    .line 211
    .line 212
    invoke-virtual {v2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    iget-object v0, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->z:Ll/qer;

    .line 216
    .line 217
    invoke-virtual {v0}, Ll/qer;->d()Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 222
    .line 223
    .line 224
    move-result v1

    .line 225
    if-nez v1, :cond_2

    .line 226
    .line 227
    invoke-direct {p0, v0}, Lcom/idv/identity/face/photinus/PhotinusEmulator;->s(Ljava/lang/String;)V

    .line 228
    .line 229
    .line 230
    :cond_2
    const-string v1, "light-sensor-config"

    .line 231
    .line 232
    invoke-virtual {v2, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 233
    .line 234
    .line 235
    invoke-static {v2}, Lcom/alibaba/fastjson/JSON;->toJSONString(Ljava/lang/Object;)Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    .line 240
    .line 241
    .line 242
    move-result-object v0

    .line 243
    iget-object v1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->t:Landroid/net/Uri;

    .line 244
    .line 245
    invoke-direct {p0, v1, v0}, Lcom/idv/identity/face/photinus/PhotinusEmulator;->x(Landroid/net/Uri;[B)V

    .line 246
    .line 247
    .line 248
    return-void
.end method


# virtual methods
.method public a(Lcom/idv/identity/face/photinus/VideoWriter;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->c:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->y:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 5
    .line 6
    if-eq p1, v1, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->q:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 9
    .line 10
    sget-object v1, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;->IN_COMPLETION:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 11
    .line 12
    if-eq p1, v1, :cond_0

    .line 13
    .line 14
    monitor-exit v0

    .line 15
    return-void

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object p1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->D:Landroid/os/Handler;

    .line 19
    .line 20
    iget-object v1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->E:Ljava/lang/Runnable;

    .line 21
    .line 22
    invoke-virtual {p1, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    invoke-direct {p0}, Lcom/idv/identity/face/photinus/PhotinusEmulator;->y()V

    .line 26
    .line 27
    .line 28
    sget-object p1, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;->COMPLETED:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 29
    .line 30
    iput-object p1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->q:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 31
    .line 32
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    iget-object p1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->u:Ll/y270;

    .line 34
    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    iget-object p1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->A:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    const/4 v1, 0x1

    .line 41
    invoke-virtual {p1, v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_1

    .line 46
    .line 47
    iget-object p1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->u:Ll/y270;

    .line 48
    .line 49
    iget-object v0, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->s:Landroid/net/Uri;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->t:Landroid/net/Uri;

    .line 52
    .line 53
    invoke-interface {p1, v0, p0}, Ll/y270;->a(Landroid/net/Uri;Landroid/net/Uri;)V

    .line 54
    .line 55
    .line 56
    :cond_1
    return-void

    .line 57
    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 58
    throw p0
.end method

.method public b()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->c:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->y:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {v1}, Lcom/idv/identity/face/photinus/VideoWriter;->v()V

    .line 9
    .line 10
    .line 11
    new-instance v1, Lcom/idv/identity/face/photinus/VideoWriter;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Lcom/idv/identity/face/photinus/VideoWriter;-><init>(Lcom/idv/identity/face/photinus/VideoWriter$c;)V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->y:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 17
    .line 18
    iget-object v2, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->s:Landroid/net/Uri;

    .line 19
    .line 20
    iget v3, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->d:I

    .line 21
    .line 22
    iget v4, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->e:I

    .line 23
    .line 24
    iget v5, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->f:I

    .line 25
    .line 26
    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/idv/identity/face/photinus/VideoWriter;->C(Landroid/net/Uri;III)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    goto :goto_1

    .line 32
    :cond_0
    :goto_0
    sget-object v1, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;->INVALID:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 33
    .line 34
    iput-object v1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->q:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 35
    .line 36
    monitor-exit v0

    .line 37
    return-void

    .line 38
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    throw p0
.end method

.method public i(Ll/z270;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->z:Ll/qer;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/qer;->e()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x5

    .line 8
    const/4 v2, 0x1

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget v0, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->B:I

    .line 12
    .line 13
    if-ge v0, v1, :cond_0

    .line 14
    .line 15
    add-int/2addr v0, v2

    .line 16
    iput v0, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->B:I

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object v0, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->c:Ljava/lang/Object;

    .line 20
    .line 21
    monitor-enter v0

    .line 22
    :try_start_0
    iget-object v3, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->q:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 23
    .line 24
    sget-object v4, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;->AWAITING_FRAMES:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 25
    .line 26
    const/4 v5, 0x0

    .line 27
    const/4 v6, 0x0

    .line 28
    if-ne v3, v4, :cond_4

    .line 29
    .line 30
    iget v3, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->p:I

    .line 31
    .line 32
    if-ltz v3, :cond_2

    .line 33
    .line 34
    iget-object v3, p1, Ll/z270;->c:Ll/e7j;

    .line 35
    .line 36
    iget-object v4, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->z:Ll/qer;

    .line 37
    .line 38
    invoke-virtual {v4}, Ll/qer;->b()F

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    iput v4, v3, Ll/e7j;->a:F

    .line 43
    .line 44
    iget-object v3, p1, Ll/z270;->c:Ll/e7j;

    .line 45
    .line 46
    iget-object v4, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->z:Ll/qer;

    .line 47
    .line 48
    invoke-virtual {v4}, Ll/qer;->c()I

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    iput v4, v3, Ll/e7j;->b:I

    .line 53
    .line 54
    iget-object v3, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->y:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 55
    .line 56
    invoke-virtual {v3, p1}, Lcom/idv/identity/face/photinus/VideoWriter;->u(Ll/f6j;)V

    .line 57
    .line 58
    .line 59
    iget-object v3, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->v:Ljava/util/ArrayList;

    .line 60
    .line 61
    iget-object v4, p1, Ll/z270;->c:Ll/e7j;

    .line 62
    .line 63
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    iget-object v3, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->a:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 67
    .line 68
    if-nez v3, :cond_1

    .line 69
    .line 70
    new-instance v3, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 71
    .line 72
    invoke-direct {v3}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 73
    .line 74
    .line 75
    iput-object v3, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->a:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :catchall_0
    move-exception p0

    .line 79
    goto :goto_2

    .line 80
    :cond_1
    :goto_0
    iget-object v3, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->a:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 81
    .line 82
    iget-object p1, p1, Ll/f6j;->a:[B

    .line 83
    .line 84
    invoke-virtual {v3, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    :cond_2
    iget p1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->o:I

    .line 88
    .line 89
    iget-object v3, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->n:[I

    .line 90
    .line 91
    array-length v4, v3

    .line 92
    if-ge p1, v4, :cond_3

    .line 93
    .line 94
    aget p1, v3, p1

    .line 95
    .line 96
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 97
    .line 98
    .line 99
    move-result-object v5

    .line 100
    :cond_3
    iget p1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->p:I

    .line 101
    .line 102
    add-int/2addr p1, v2

    .line 103
    iput p1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->p:I

    .line 104
    .line 105
    iget p1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->o:I

    .line 106
    .line 107
    add-int/2addr p1, v2

    .line 108
    iput p1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->o:I

    .line 109
    .line 110
    invoke-direct {p0}, Lcom/idv/identity/face/photinus/PhotinusEmulator;->u()Z

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    if-eqz p1, :cond_4

    .line 115
    .line 116
    sget-object p1, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;->AWAITING_COMPLETION:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 117
    .line 118
    iput-object p1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->q:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 119
    .line 120
    goto :goto_1

    .line 121
    :cond_4
    move v2, v6

    .line 122
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 123
    iget-object p1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->u:Ll/y270;

    .line 124
    .line 125
    if-eqz p1, :cond_6

    .line 126
    .line 127
    if-eqz v5, :cond_5

    .line 128
    .line 129
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    invoke-interface {p1, v0}, Ll/y270;->c(I)V

    .line 134
    .line 135
    .line 136
    :cond_5
    if-eqz v2, :cond_6

    .line 137
    .line 138
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    sget-object v0, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 143
    .line 144
    const-string v2, "photinusAbandonFrames"

    .line 145
    .line 146
    const-string v3, "abandonFramesCount"

    .line 147
    .line 148
    iget v4, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->B:I

    .line 149
    .line 150
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v4

    .line 154
    const-string v5, "abandonFramesMax"

    .line 155
    .line 156
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    filled-new-array {v3, v4, v5, v1}, [Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    invoke-virtual {p1, v0, v2, v1}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    iget-object p0, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->u:Ll/y270;

    .line 168
    .line 169
    invoke-interface {p0}, Ll/y270;->e()V

    .line 170
    .line 171
    .line 172
    :cond_6
    return-void

    .line 173
    :goto_2
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 174
    throw p0
.end method

.method public j()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->a:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->a:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->clear()V

    .line 14
    .line 15
    .line 16
    :goto_0
    iget-object v0, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->c:Ljava/lang/Object;

    .line 17
    .line 18
    monitor-enter v0

    .line 19
    :try_start_0
    iget-object v1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->q:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 20
    .line 21
    sget-object v2, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;->READY:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 22
    .line 23
    if-eq v1, v2, :cond_1

    .line 24
    .line 25
    monitor-exit v0

    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception p0

    .line 28
    goto :goto_1

    .line 29
    :cond_1
    const/4 v1, 0x0

    .line 30
    iput v1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->o:I

    .line 31
    .line 32
    const/4 v1, -0x3

    .line 33
    iput v1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->p:I

    .line 34
    .line 35
    iget-object v1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->v:Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 38
    .line 39
    .line 40
    sget-object v1, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;->AWAITING_FRAMES:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 41
    .line 42
    iput-object v1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->q:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 43
    .line 44
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 45
    .line 46
    .line 47
    move-result-wide v1

    .line 48
    iput-wide v1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->r:J

    .line 49
    .line 50
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    iget-object p0, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->u:Ll/y270;

    .line 52
    .line 53
    if-eqz p0, :cond_2

    .line 54
    .line 55
    invoke-interface {p0}, Ll/y270;->f()V

    .line 56
    .line 57
    .line 58
    :cond_2
    return-void

    .line 59
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 60
    throw p0
.end method

.method public l()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->y:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/idv/identity/face/photinus/VideoWriter;->B()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->c:Ljava/lang/Object;

    .line 8
    .line 9
    monitor-enter v1

    .line 10
    :try_start_0
    iget-object v2, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->q:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 11
    .line 12
    sget-object v3, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;->AWAITING_COMPLETION:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 13
    .line 14
    if-ne v2, v3, :cond_0

    .line 15
    .line 16
    sget-object v2, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;->IN_COMPLETION:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 17
    .line 18
    iput-object v2, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->q:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v2, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->y:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 23
    .line 24
    invoke-virtual {v2}, Lcom/idv/identity/face/photinus/VideoWriter;->v()V

    .line 25
    .line 26
    .line 27
    iget-object v2, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->D:Landroid/os/Handler;

    .line 28
    .line 29
    iget-object v3, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->E:Ljava/lang/Runnable;

    .line 30
    .line 31
    const-wide/16 v4, 0x1388

    .line 32
    .line 33
    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catchall_0
    move-exception p0

    .line 38
    goto :goto_1

    .line 39
    :cond_0
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    if-nez v0, :cond_1

    .line 41
    .line 42
    iget-object v0, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->u:Ll/y270;

    .line 43
    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    iget-object v0, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->A:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 47
    .line 48
    const/4 v1, 0x0

    .line 49
    const/4 v2, 0x1

    .line 50
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_1

    .line 55
    .line 56
    iget-object v0, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->u:Ll/y270;

    .line 57
    .line 58
    const-string v1, "AtFault"

    .line 59
    .line 60
    invoke-interface {v0, v1}, Ll/y270;->b(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->u:Ll/y270;

    .line 64
    .line 65
    const/4 v0, 0x0

    .line 66
    invoke-interface {p0, v0, v0}, Ll/y270;->a(Landroid/net/Uri;Landroid/net/Uri;)V

    .line 67
    .line 68
    .line 69
    :cond_1
    return-void

    .line 70
    :goto_1
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 71
    throw p0
.end method

.method public m(Ljava/lang/String;)Ljava/lang/Integer;
    .locals 2

    .line 1
    const-string p0, "{"

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    invoke-virtual {p1, p0, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string p1, "}"

    .line 10
    .line 11
    invoke-virtual {p0, p1, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string p1, ","

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    array-length p1, p0

    .line 22
    const/4 v0, 0x3

    .line 23
    if-ne p1, v0, :cond_1

    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    :try_start_0
    aget-object p1, p0, p1

    .line 27
    .line 28
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    const/4 v0, 0x1

    .line 33
    aget-object v0, p0, v0

    .line 34
    .line 35
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    const/4 v1, 0x2

    .line 40
    aget-object p0, p0, v1

    .line 41
    .line 42
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-ltz p1, :cond_0

    .line 47
    .line 48
    const/16 v1, 0xff

    .line 49
    .line 50
    if-gt p1, v1, :cond_0

    .line 51
    .line 52
    if-ltz v0, :cond_0

    .line 53
    .line 54
    if-gt v0, v1, :cond_0

    .line 55
    .line 56
    if-ltz p0, :cond_0

    .line 57
    .line 58
    if-gt p0, v1, :cond_0

    .line 59
    .line 60
    shl-int/lit8 p1, p1, 0x10

    .line 61
    .line 62
    const/high16 v1, -0x1000000

    .line 63
    .line 64
    or-int/2addr p1, v1

    .line 65
    shl-int/lit8 v0, v0, 0x8

    .line 66
    .line 67
    or-int/2addr p1, v0

    .line 68
    or-int/2addr p0, p1

    .line 69
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0

    .line 74
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 75
    .line 76
    const-string p1, "RGB values must be in the range 0-255"

    .line 77
    .line 78
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    throw p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 82
    :catch_0
    move-exception p0

    .line 83
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 84
    .line 85
    const-string v0, "Invalid RGB values"

    .line 86
    .line 87
    invoke-direct {p1, v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 88
    .line 89
    .line 90
    throw p1

    .line 91
    :cond_1
    const-string p0, "Invalid RGB format"

    .line 92
    .line 93
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    const/4 p0, 0x0

    .line 97
    return-object p0
.end method

.method public o(Ljava/io/File;)Z
    .locals 5

    .line 1
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    array-length v1, v0

    .line 14
    const/4 v2, 0x0

    .line 15
    :goto_0
    if-ge v2, v1, :cond_1

    .line 16
    .line 17
    aget-object v3, v0, v2

    .line 18
    .line 19
    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    if-eqz v4, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0, v3}, Lcom/idv/identity/face/photinus/PhotinusEmulator;->o(Ljava/io/File;)Z

    .line 26
    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_0
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 30
    .line 31
    .line 32
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    return p0
.end method

.method public onException(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->u:Ll/y270;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/y270;->onException(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public p()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->c:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->z:Ll/qer;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {v1}, Ll/qer;->a()V

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->y:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 15
    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/idv/identity/face/photinus/VideoWriter;->v()V

    .line 19
    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    iput-object v1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->y:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 23
    .line 24
    :cond_1
    iget-object v1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->a:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 25
    .line 26
    if-eqz v1, :cond_2

    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->clear()V

    .line 29
    .line 30
    .line 31
    :cond_2
    invoke-static {}, Ll/a370;->a()Ll/a370;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1}, Ll/a370;->b()V

    .line 36
    .line 37
    .line 38
    sget-object v1, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;->INVALID:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 39
    .line 40
    iput-object v1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->q:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 41
    .line 42
    monitor-exit v0

    .line 43
    return-void

    .line 44
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    throw p0
.end method

.method public r(Landroid/content/Context;IIIIIIZ)Z
    .locals 8

    .line 1
    const-string v0, "initialize: _colorSequence.length "

    .line 2
    .line 3
    const-string v1, "initialize: integers.size "

    .line 4
    .line 5
    iget-object v2, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->c:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v2

    .line 8
    :try_start_0
    iget-object v3, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->q:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 9
    .line 10
    iget-boolean v3, v3, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;->isTerminalState:Z

    .line 11
    .line 12
    const/4 v4, 0x0

    .line 13
    if-nez v3, :cond_0

    .line 14
    .line 15
    monitor-exit v2

    .line 16
    return v4

    .line 17
    :catchall_0
    move-exception v0

    .line 18
    move-object p0, v0

    .line 19
    goto/16 :goto_0

    .line 20
    .line 21
    :cond_0
    invoke-static {}, Ll/a370;->a()Ll/a370;

    .line 22
    .line 23
    .line 24
    invoke-direct/range {p0 .. p1}, Lcom/idv/identity/face/photinus/PhotinusEmulator;->q(Landroid/content/Context;)Landroid/net/Uri;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    new-instance v5, Ljava/io/File;

    .line 29
    .line 30
    invoke-virtual {v3}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v6

    .line 34
    invoke-direct {v5, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    .line 38
    .line 39
    .line 40
    move-result v6

    .line 41
    const/4 v7, 0x1

    .line 42
    if-eqz v6, :cond_1

    .line 43
    .line 44
    invoke-virtual {p0, v5}, Lcom/idv/identity/face/photinus/PhotinusEmulator;->o(Ljava/io/File;)Z

    .line 45
    .line 46
    .line 47
    move-result v6

    .line 48
    if-eqz v6, :cond_2

    .line 49
    .line 50
    :cond_1
    invoke-virtual {v5}, Ljava/io/File;->mkdir()Z

    .line 51
    .line 52
    .line 53
    move-result v5

    .line 54
    if-nez v5, :cond_2

    .line 55
    .line 56
    move v4, v7

    .line 57
    :cond_2
    iput p7, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->h:I

    .line 58
    .line 59
    iput p6, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->i:I

    .line 60
    .line 61
    iput p2, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->d:I

    .line 62
    .line 63
    iput p3, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->e:I

    .line 64
    .line 65
    iput p4, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->f:I

    .line 66
    .line 67
    iput p5, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->g:I

    .line 68
    .line 69
    move/from16 p2, p8

    .line 70
    .line 71
    iput-boolean p2, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->j:Z

    .line 72
    .line 73
    invoke-direct {p0}, Lcom/idv/identity/face/photinus/PhotinusEmulator;->k()Ljava/util/List;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    const-string p3, "DTF"

    .line 78
    .line 79
    new-instance p4, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    invoke-direct {p4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 85
    .line 86
    .line 87
    move-result p5

    .line 88
    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p4

    .line 95
    invoke-static {p3, p4}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    invoke-static {p2}, Lcom/idv/identity/face/photinus/a;->a(Ljava/util/List;)[I

    .line 99
    .line 100
    .line 101
    move-result-object p3

    .line 102
    iput-object p3, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->m:[I

    .line 103
    .line 104
    iget p3, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->i:I

    .line 105
    .line 106
    invoke-static {p2, p3}, Lcom/idv/identity/face/photinus/a;->c(Ljava/util/List;I)Ljava/util/List;

    .line 107
    .line 108
    .line 109
    move-result-object p2

    .line 110
    invoke-static {p2}, Lcom/idv/identity/face/photinus/a;->a(Ljava/util/List;)[I

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    iput-object p2, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->m:[I

    .line 115
    .line 116
    iput-object p2, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->n:[I

    .line 117
    .line 118
    const-string p2, "DTF"

    .line 119
    .line 120
    new-instance p3, Ljava/lang/StringBuilder;

    .line 121
    .line 122
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    iget-object p4, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->n:[I

    .line 126
    .line 127
    array-length p4, p4

    .line 128
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p3

    .line 135
    invoke-static {p2, p3}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    iget p2, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->g:I

    .line 139
    .line 140
    invoke-direct {p0, p2}, Lcom/idv/identity/face/photinus/PhotinusEmulator;->n(I)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p2

    .line 144
    new-instance p3, Ljava/lang/StringBuilder;

    .line 145
    .line 146
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 147
    .line 148
    .line 149
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    const-string p4, ".mp4"

    .line 153
    .line 154
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p3

    .line 161
    invoke-static {v3, p3}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    .line 162
    .line 163
    .line 164
    move-result-object p3

    .line 165
    iput-object p3, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->s:Landroid/net/Uri;

    .line 166
    .line 167
    new-instance p3, Ljava/lang/StringBuilder;

    .line 168
    .line 169
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 170
    .line 171
    .line 172
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    const-string p2, ".json"

    .line 176
    .line 177
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p2

    .line 184
    invoke-static {v3, p2}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    .line 185
    .line 186
    .line 187
    move-result-object p2

    .line 188
    iput-object p2, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->t:Landroid/net/Uri;

    .line 189
    .line 190
    new-instance p2, Lcom/idv/identity/face/photinus/VideoWriter;

    .line 191
    .line 192
    invoke-direct {p2, p0}, Lcom/idv/identity/face/photinus/VideoWriter;-><init>(Lcom/idv/identity/face/photinus/VideoWriter$c;)V

    .line 193
    .line 194
    .line 195
    iput-object p2, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->y:Lcom/idv/identity/face/photinus/VideoWriter;

    .line 196
    .line 197
    if-nez v4, :cond_3

    .line 198
    .line 199
    iget-object p3, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->s:Landroid/net/Uri;

    .line 200
    .line 201
    iget p4, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->d:I

    .line 202
    .line 203
    iget p5, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->e:I

    .line 204
    .line 205
    iget v0, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->f:I

    .line 206
    .line 207
    invoke-virtual {p2, p3, p4, p5, v0}, Lcom/idv/identity/face/photinus/VideoWriter;->C(Landroid/net/Uri;III)V

    .line 208
    .line 209
    .line 210
    :cond_3
    new-instance p2, Ll/qer;

    .line 211
    .line 212
    invoke-direct {p2, p1}, Ll/qer;-><init>(Landroid/content/Context;)V

    .line 213
    .line 214
    .line 215
    iput-object p2, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->z:Ll/qer;

    .line 216
    .line 217
    new-instance p1, Ll/e7j;

    .line 218
    .line 219
    invoke-direct {p1}, Ll/e7j;-><init>()V

    .line 220
    .line 221
    .line 222
    iput-object p1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->w:Ll/e7j;

    .line 223
    .line 224
    new-instance p1, Ljava/util/HashMap;

    .line 225
    .line 226
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 227
    .line 228
    .line 229
    iput-object p1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->x:Ljava/util/HashMap;

    .line 230
    .line 231
    sget-object p1, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;->READY:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 232
    .line 233
    iput-object p1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->q:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 234
    .line 235
    monitor-exit v2

    .line 236
    return v7

    .line 237
    :goto_0
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 238
    throw p0
.end method

.method public v(Ll/y270;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->u:Ll/y270;

    .line 2
    .line 3
    return-void
.end method

.method public w()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/idv/identity/face/photinus/PhotinusEmulator;->l()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator;->u:Ll/y270;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    const-string v0, "NoPhotoTake"

    .line 9
    .line 10
    invoke-interface {p0, v0}, Ll/y270;->d(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public z(Ljava/lang/String;III)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string v0, ".mp4"

    .line 8
    .line 9
    const-string v1, ".zip"

    .line 10
    .line 11
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    :cond_0
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/idv/identity/face/photinus/PhotinusEmulator;->A(Ljava/lang/String;III)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    return-object p1

    .line 22
    :cond_1
    const-string p0, ""

    .line 23
    .line 24
    return-object p0
.end method
