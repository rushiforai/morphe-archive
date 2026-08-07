.class public Lcom/p1/mobile/putong/location/Location;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/location/Location$c;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/p1/mobile/putong/location/Location;",
            ">;"
        }
    .end annotation
.end field

.field public static final EXTRA_NO_GPS_LOCATION:Ljava/lang/String; = "noGPSLocation"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final FORMAT_DEGREES:I = 0x0

.field public static final FORMAT_MINUTES:I = 0x1

.field public static final FORMAT_SECONDS:I = 0x2

.field private static final HAS_ALTITUDE_MASK:I = 0x1

.field private static final HAS_BEARING_ACCURACY_MASK:I = 0x80

.field private static final HAS_BEARING_MASK:I = 0x4

.field private static final HAS_ELAPSED_REALTIME_UNCERTAINTY_MASK:I = 0x100

.field private static final HAS_HORIZONTAL_ACCURACY_MASK:I = 0x8

.field private static final HAS_MOCK_PROVIDER_MASK:I = 0x10

.field private static final HAS_SPEED_ACCURACY_MASK:I = 0x40

.field private static final HAS_SPEED_MASK:I = 0x2

.field private static final HAS_VERTICAL_ACCURACY_MASK:I = 0x20

.field public static final LOC_TYPE_CACHE:I = 0x4

.field public static final LOC_TYPE_CELL:I = 0x6

.field public static final LOC_TYPE_GPS:I = 0xa

.field public static final LOC_TYPE_INVALID:I = -0x1

.field public static final LOC_TYPE_OFFLINE:I = 0x2

.field public static final LOC_TYPE_UNKNOWN:I = 0x0

.field public static final LOC_TYPE_WIFI:I = 0x8

.field private static sBearingDistanceCache:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Lcom/p1/mobile/putong/location/Location$c;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mAltitude:D

.field private mBearing:F

.field private mBearingAccuracyDegrees:F

.field private mElapsedRealtimeNanos:J

.field private mElapsedRealtimeUncertaintyNanos:D

.field private mErrorCode:I

.field private mExtras:Landroid/os/Bundle;

.field private mFieldsMask:I

.field private mHorizontalAccuracyMeters:F

.field private mLatitude:D

.field private mLocType:I

.field private mLongitude:D

.field private mProvider:Ljava/lang/String;

.field private mSpeed:F

.field private mSpeedAccuracyMetersPerSecond:F

.field private mTime:J

.field private mVerticalAccuracyMeters:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/location/Location$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/location/Location$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/location/Location;->sBearingDistanceCache:Ljava/lang/ThreadLocal;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/location/Location$b;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/location/Location$b;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/location/Location;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Landroid/location/Location;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/p1/mobile/putong/location/Location;->mTime:J

    .line 7
    .line 8
    iput-wide v0, p0, Lcom/p1/mobile/putong/location/Location;->mElapsedRealtimeNanos:J

    .line 9
    .line 10
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    iput-wide v0, p0, Lcom/p1/mobile/putong/location/Location;->mElapsedRealtimeUncertaintyNanos:D

    .line 13
    .line 14
    iput-wide v0, p0, Lcom/p1/mobile/putong/location/Location;->mLatitude:D

    .line 15
    .line 16
    iput-wide v0, p0, Lcom/p1/mobile/putong/location/Location;->mLongitude:D

    .line 17
    .line 18
    iput-wide v0, p0, Lcom/p1/mobile/putong/location/Location;->mAltitude:D

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput v0, p0, Lcom/p1/mobile/putong/location/Location;->mSpeed:F

    .line 22
    .line 23
    iput v0, p0, Lcom/p1/mobile/putong/location/Location;->mBearing:F

    .line 24
    .line 25
    iput v0, p0, Lcom/p1/mobile/putong/location/Location;->mHorizontalAccuracyMeters:F

    .line 26
    .line 27
    iput v0, p0, Lcom/p1/mobile/putong/location/Location;->mVerticalAccuracyMeters:F

    .line 28
    .line 29
    iput v0, p0, Lcom/p1/mobile/putong/location/Location;->mSpeedAccuracyMetersPerSecond:F

    .line 30
    .line 31
    iput v0, p0, Lcom/p1/mobile/putong/location/Location;->mBearingAccuracyDegrees:F

    .line 32
    .line 33
    const/4 v0, 0x0

    .line 34
    iput-object v0, p0, Lcom/p1/mobile/putong/location/Location;->mExtras:Landroid/os/Bundle;

    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    iput v0, p0, Lcom/p1/mobile/putong/location/Location;->mFieldsMask:I

    .line 38
    .line 39
    iput v0, p0, Lcom/p1/mobile/putong/location/Location;->mLocType:I

    .line 40
    .line 41
    const/4 v0, -0x1

    .line 42
    iput v0, p0, Lcom/p1/mobile/putong/location/Location;->mErrorCode:I

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/location/Location;->I(Landroid/location/Location;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 49
    iput-wide v0, p0, Lcom/p1/mobile/putong/location/Location;->mTime:J

    .line 50
    iput-wide v0, p0, Lcom/p1/mobile/putong/location/Location;->mElapsedRealtimeNanos:J

    const-wide/16 v0, 0x0

    .line 51
    iput-wide v0, p0, Lcom/p1/mobile/putong/location/Location;->mElapsedRealtimeUncertaintyNanos:D

    .line 52
    iput-wide v0, p0, Lcom/p1/mobile/putong/location/Location;->mLatitude:D

    .line 53
    iput-wide v0, p0, Lcom/p1/mobile/putong/location/Location;->mLongitude:D

    .line 54
    iput-wide v0, p0, Lcom/p1/mobile/putong/location/Location;->mAltitude:D

    const/4 v0, 0x0

    .line 55
    iput v0, p0, Lcom/p1/mobile/putong/location/Location;->mSpeed:F

    .line 56
    iput v0, p0, Lcom/p1/mobile/putong/location/Location;->mBearing:F

    .line 57
    iput v0, p0, Lcom/p1/mobile/putong/location/Location;->mHorizontalAccuracyMeters:F

    .line 58
    iput v0, p0, Lcom/p1/mobile/putong/location/Location;->mVerticalAccuracyMeters:F

    .line 59
    iput v0, p0, Lcom/p1/mobile/putong/location/Location;->mSpeedAccuracyMetersPerSecond:F

    .line 60
    iput v0, p0, Lcom/p1/mobile/putong/location/Location;->mBearingAccuracyDegrees:F

    const/4 v0, 0x0

    .line 61
    iput-object v0, p0, Lcom/p1/mobile/putong/location/Location;->mExtras:Landroid/os/Bundle;

    const/4 v0, 0x0

    .line 62
    iput v0, p0, Lcom/p1/mobile/putong/location/Location;->mFieldsMask:I

    .line 63
    iput v0, p0, Lcom/p1/mobile/putong/location/Location;->mLocType:I

    const/4 v0, -0x1

    .line 64
    iput v0, p0, Lcom/p1/mobile/putong/location/Location;->mErrorCode:I

    .line 65
    iput-object p1, p0, Lcom/p1/mobile/putong/location/Location;->mProvider:Ljava/lang/String;

    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/location/Location;D)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/location/Location;->mAltitude:D

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/location/Location;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/location/Location;->mBearing:F

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/location/Location;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/location/Location;->mBearingAccuracyDegrees:F

    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/location/Location;J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/location/Location;->mElapsedRealtimeNanos:J

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/location/Location;D)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/location/Location;->mElapsedRealtimeUncertaintyNanos:D

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/location/Location;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/location/Location;->mErrorCode:I

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/location/Location;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/location/Location;->mExtras:Landroid/os/Bundle;

    return-void
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/putong/location/Location;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/location/Location;->mFieldsMask:I

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/location/Location;D)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/location/Location;->mLatitude:D

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/location/Location;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/location/Location;->mLocType:I

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/putong/location/Location;D)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/location/Location;->mLongitude:D

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/putong/location/Location;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/location/Location;->mSpeed:F

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/putong/location/Location;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/location/Location;->mSpeedAccuracyMetersPerSecond:F

    return-void
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/putong/location/Location;J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/location/Location;->mTime:J

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/putong/location/Location;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/location/Location;->mVerticalAccuracyMeters:F

    return-void
.end method

.method public static q(DDDDLcom/p1/mobile/putong/location/Location$c;)V
    .locals 66

    .line 1
    move-object/from16 v0, p8

    .line 2
    .line 3
    const-wide v1, 0x3f91df46a2529d39L    # 0.017453292519943295

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    mul-double v3, p0, v1

    .line 9
    .line 10
    mul-double v5, p4, v1

    .line 11
    .line 12
    mul-double v7, p2, v1

    .line 13
    .line 14
    mul-double v1, v1, p6

    .line 15
    .line 16
    sub-double v9, v1, v7

    .line 17
    .line 18
    invoke-static {v3, v4}, Ljava/lang/Math;->tan(D)D

    .line 19
    .line 20
    .line 21
    move-result-wide v11

    .line 22
    const-wide v13, 0x3fefe488a57a12e4L    # 0.996647189328169

    .line 23
    .line 24
    .line 25
    .line 26
    .line 27
    mul-double/2addr v11, v13

    .line 28
    invoke-static {v11, v12}, Ljava/lang/Math;->atan(D)D

    .line 29
    .line 30
    .line 31
    move-result-wide v11

    .line 32
    invoke-static {v5, v6}, Ljava/lang/Math;->tan(D)D

    .line 33
    .line 34
    .line 35
    move-result-wide v15

    .line 36
    mul-double/2addr v13, v15

    .line 37
    invoke-static {v13, v14}, Ljava/lang/Math;->atan(D)D

    .line 38
    .line 39
    .line 40
    move-result-wide v13

    .line 41
    invoke-static {v11, v12}, Ljava/lang/Math;->cos(D)D

    .line 42
    .line 43
    .line 44
    move-result-wide v15

    .line 45
    invoke-static {v13, v14}, Ljava/lang/Math;->cos(D)D

    .line 46
    .line 47
    .line 48
    move-result-wide v17

    .line 49
    invoke-static {v11, v12}, Ljava/lang/Math;->sin(D)D

    .line 50
    .line 51
    .line 52
    move-result-wide v11

    .line 53
    invoke-static {v13, v14}, Ljava/lang/Math;->sin(D)D

    .line 54
    .line 55
    .line 56
    move-result-wide v13

    .line 57
    mul-double v19, v15, v17

    .line 58
    .line 59
    mul-double v21, v11, v13

    .line 60
    .line 61
    const-wide/16 v23, 0x0

    .line 62
    .line 63
    const/16 v25, 0x0

    .line 64
    .line 65
    move-wide/from16 p0, v9

    .line 66
    .line 67
    move-wide/from16 v27, v23

    .line 68
    .line 69
    move-wide/from16 v29, v27

    .line 70
    .line 71
    move-wide/from16 v31, v29

    .line 72
    .line 73
    move-wide/from16 v33, v31

    .line 74
    .line 75
    move-wide/from16 v35, v33

    .line 76
    .line 77
    move/from16 v9, v25

    .line 78
    .line 79
    move-wide/from16 v25, p0

    .line 80
    .line 81
    :goto_0
    const/16 v10, 0x14

    .line 82
    .line 83
    if-ge v9, v10, :cond_3

    .line 84
    .line 85
    invoke-static/range {v25 .. v26}, Ljava/lang/Math;->cos(D)D

    .line 86
    .line 87
    .line 88
    move-result-wide v31

    .line 89
    invoke-static/range {v25 .. v26}, Ljava/lang/Math;->sin(D)D

    .line 90
    .line 91
    .line 92
    move-result-wide v35

    .line 93
    mul-double v27, v17, v35

    .line 94
    .line 95
    mul-double v29, v15, v13

    .line 96
    .line 97
    mul-double v33, v11, v17

    .line 98
    .line 99
    mul-double v33, v33, v31

    .line 100
    .line 101
    sub-double v29, v29, v33

    .line 102
    .line 103
    mul-double v27, v27, v27

    .line 104
    .line 105
    mul-double v29, v29, v29

    .line 106
    .line 107
    add-double v27, v27, v29

    .line 108
    .line 109
    move/from16 p2, v9

    .line 110
    .line 111
    invoke-static/range {v27 .. v28}, Ljava/lang/Math;->sqrt(D)D

    .line 112
    .line 113
    .line 114
    move-result-wide v9

    .line 115
    mul-double v27, v19, v31

    .line 116
    .line 117
    move-wide/from16 p3, v13

    .line 118
    .line 119
    add-double v13, v21, v27

    .line 120
    .line 121
    invoke-static {v9, v10, v13, v14}, Ljava/lang/Math;->atan2(DD)D

    .line 122
    .line 123
    .line 124
    move-result-wide v27

    .line 125
    cmpl-double v29, v9, v23

    .line 126
    .line 127
    if-nez v29, :cond_0

    .line 128
    .line 129
    move-wide/from16 v29, v23

    .line 130
    .line 131
    goto :goto_1

    .line 132
    :cond_0
    mul-double v29, v19, v35

    .line 133
    .line 134
    div-double v29, v29, v9

    .line 135
    .line 136
    :goto_1
    mul-double v33, v29, v29

    .line 137
    .line 138
    const-wide/high16 v37, 0x3ff0000000000000L    # 1.0

    .line 139
    .line 140
    sub-double v33, v37, v33

    .line 141
    .line 142
    cmpl-double v39, v33, v23

    .line 143
    .line 144
    const-wide/high16 v40, 0x4000000000000000L    # 2.0

    .line 145
    .line 146
    if-nez v39, :cond_1

    .line 147
    .line 148
    move-wide/from16 v42, v23

    .line 149
    .line 150
    goto :goto_2

    .line 151
    :cond_1
    mul-double v42, v21, v40

    .line 152
    .line 153
    div-double v42, v42, v33

    .line 154
    .line 155
    sub-double v42, v13, v42

    .line 156
    .line 157
    :goto_2
    const-wide v44, 0x3f7b9adfe2939d71L    # 0.006739496756586903

    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    mul-double v44, v44, v33

    .line 163
    .line 164
    const-wide/high16 v46, 0x40d0000000000000L    # 16384.0

    .line 165
    .line 166
    div-double v46, v44, v46

    .line 167
    .line 168
    const-wide v48, 0x4065e00000000000L    # 175.0

    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    mul-double v48, v48, v44

    .line 174
    .line 175
    const-wide/high16 v50, 0x4074000000000000L    # 320.0

    .line 176
    .line 177
    sub-double v50, v50, v48

    .line 178
    .line 179
    mul-double v50, v50, v44

    .line 180
    .line 181
    const-wide/high16 v48, -0x3f78000000000000L    # -768.0

    .line 182
    .line 183
    add-double v50, v50, v48

    .line 184
    .line 185
    mul-double v50, v50, v44

    .line 186
    .line 187
    const-wide/high16 v48, 0x40b0000000000000L    # 4096.0

    .line 188
    .line 189
    add-double v50, v50, v48

    .line 190
    .line 191
    mul-double v46, v46, v50

    .line 192
    .line 193
    add-double v46, v46, v37

    .line 194
    .line 195
    const-wide/high16 v48, 0x4090000000000000L    # 1024.0

    .line 196
    .line 197
    div-double v48, v44, v48

    .line 198
    .line 199
    const-wide v50, 0x4047800000000000L    # 47.0

    .line 200
    .line 201
    .line 202
    .line 203
    .line 204
    mul-double v50, v50, v44

    .line 205
    .line 206
    const-wide v52, 0x4052800000000000L    # 74.0

    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
    sub-double v52, v52, v50

    .line 212
    .line 213
    mul-double v52, v52, v44

    .line 214
    .line 215
    const-wide/high16 v50, -0x3fa0000000000000L    # -128.0

    .line 216
    .line 217
    add-double v52, v52, v50

    .line 218
    .line 219
    mul-double v44, v44, v52

    .line 220
    .line 221
    const-wide/high16 v50, 0x4070000000000000L    # 256.0

    .line 222
    .line 223
    add-double v44, v44, v50

    .line 224
    .line 225
    mul-double v48, v48, v44

    .line 226
    .line 227
    const-wide v44, 0x3f2b775a85ed1bbcL    # 2.0955066698943685E-4

    .line 228
    .line 229
    .line 230
    .line 231
    .line 232
    mul-double v44, v44, v33

    .line 233
    .line 234
    const-wide/high16 v50, 0x4008000000000000L    # 3.0

    .line 235
    .line 236
    mul-double v33, v33, v50

    .line 237
    .line 238
    const-wide/high16 v50, 0x4010000000000000L    # 4.0

    .line 239
    .line 240
    sub-double v33, v50, v33

    .line 241
    .line 242
    const-wide v52, 0x3f6b775a85ed1bbcL    # 0.0033528106718309896

    .line 243
    .line 244
    .line 245
    .line 246
    .line 247
    mul-double v33, v33, v52

    .line 248
    .line 249
    add-double v33, v33, v50

    .line 250
    .line 251
    mul-double v44, v44, v33

    .line 252
    .line 253
    mul-double v33, v42, v42

    .line 254
    .line 255
    mul-double v54, v48, v9

    .line 256
    .line 257
    div-double v56, v48, v50

    .line 258
    .line 259
    mul-double v58, v33, v40

    .line 260
    .line 261
    const-wide/high16 v60, -0x4010000000000000L    # -1.0

    .line 262
    .line 263
    add-double v58, v58, v60

    .line 264
    .line 265
    mul-double v58, v58, v13

    .line 266
    .line 267
    const-wide/high16 v62, 0x4018000000000000L    # 6.0

    .line 268
    .line 269
    div-double v48, v48, v62

    .line 270
    .line 271
    mul-double v48, v48, v42

    .line 272
    .line 273
    mul-double v62, v9, v50

    .line 274
    .line 275
    mul-double v62, v62, v9

    .line 276
    .line 277
    const-wide/high16 v64, -0x3ff8000000000000L    # -3.0

    .line 278
    .line 279
    add-double v62, v62, v64

    .line 280
    .line 281
    mul-double v48, v48, v62

    .line 282
    .line 283
    mul-double v33, v33, v50

    .line 284
    .line 285
    add-double v33, v33, v64

    .line 286
    .line 287
    mul-double v48, v48, v33

    .line 288
    .line 289
    sub-double v58, v58, v48

    .line 290
    .line 291
    mul-double v56, v56, v58

    .line 292
    .line 293
    add-double v56, v42, v56

    .line 294
    .line 295
    mul-double v33, v54, v56

    .line 296
    .line 297
    sub-double v37, v37, v44

    .line 298
    .line 299
    mul-double v37, v37, v52

    .line 300
    .line 301
    mul-double v37, v37, v29

    .line 302
    .line 303
    mul-double v9, v9, v44

    .line 304
    .line 305
    mul-double v44, v44, v13

    .line 306
    .line 307
    mul-double v40, v40, v42

    .line 308
    .line 309
    mul-double v40, v40, v42

    .line 310
    .line 311
    add-double v40, v40, v60

    .line 312
    .line 313
    mul-double v44, v44, v40

    .line 314
    .line 315
    add-double v42, v42, v44

    .line 316
    .line 317
    mul-double v9, v9, v42

    .line 318
    .line 319
    add-double v9, v27, v9

    .line 320
    .line 321
    mul-double v37, v37, v9

    .line 322
    .line 323
    add-double v9, p0, v37

    .line 324
    .line 325
    sub-double v13, v9, v25

    .line 326
    .line 327
    div-double/2addr v13, v9

    .line 328
    invoke-static {v13, v14}, Ljava/lang/Math;->abs(D)D

    .line 329
    .line 330
    .line 331
    move-result-wide v13

    .line 332
    const-wide v25, 0x3d719799812dea11L    # 1.0E-12

    .line 333
    .line 334
    .line 335
    .line 336
    .line 337
    cmpg-double v13, v13, v25

    .line 338
    .line 339
    if-gez v13, :cond_2

    .line 340
    .line 341
    move-wide/from16 v29, v33

    .line 342
    .line 343
    move-wide/from16 v33, v46

    .line 344
    .line 345
    goto :goto_3

    .line 346
    :cond_2
    add-int/lit8 v13, p2, 0x1

    .line 347
    .line 348
    move-wide/from16 v25, v9

    .line 349
    .line 350
    move v9, v13

    .line 351
    move-wide/from16 v29, v33

    .line 352
    .line 353
    move-wide/from16 v33, v46

    .line 354
    .line 355
    move-wide/from16 v13, p3

    .line 356
    .line 357
    goto/16 :goto_0

    .line 358
    .line 359
    :cond_3
    move-wide/from16 p3, v13

    .line 360
    .line 361
    :goto_3
    const-wide v9, 0x41583fc4141bda51L    # 6356752.3142

    .line 362
    .line 363
    .line 364
    .line 365
    .line 366
    mul-double v9, v9, v33

    .line 367
    .line 368
    sub-double v27, v27, v29

    .line 369
    .line 370
    mul-double v9, v9, v27

    .line 371
    .line 372
    double-to-float v9, v9

    .line 373
    invoke-static {v0, v9}, Lcom/p1/mobile/putong/location/Location$c;->f(Lcom/p1/mobile/putong/location/Location$c;F)V

    .line 374
    .line 375
    .line 376
    mul-double v9, v17, v35

    .line 377
    .line 378
    mul-double v13, v15, p3

    .line 379
    .line 380
    mul-double v19, v11, v17

    .line 381
    .line 382
    mul-double v19, v19, v31

    .line 383
    .line 384
    move-wide/from16 p0, v13

    .line 385
    .line 386
    sub-double v13, p0, v19

    .line 387
    .line 388
    invoke-static {v9, v10, v13, v14}, Ljava/lang/Math;->atan2(DD)D

    .line 389
    .line 390
    .line 391
    move-result-wide v9

    .line 392
    double-to-float v9, v9

    .line 393
    float-to-double v9, v9

    .line 394
    const-wide v13, 0x404ca5dc1a63c1f8L    # 57.29577951308232

    .line 395
    .line 396
    .line 397
    .line 398
    .line 399
    mul-double/2addr v9, v13

    .line 400
    double-to-float v9, v9

    .line 401
    invoke-static {v0, v9}, Lcom/p1/mobile/putong/location/Location$c;->h(Lcom/p1/mobile/putong/location/Location$c;F)V

    .line 402
    .line 403
    .line 404
    mul-double v9, v15, v35

    .line 405
    .line 406
    neg-double v11, v11

    .line 407
    mul-double v11, v11, v17

    .line 408
    .line 409
    mul-double v15, p0, v31

    .line 410
    .line 411
    add-double/2addr v11, v15

    .line 412
    invoke-static {v9, v10, v11, v12}, Ljava/lang/Math;->atan2(DD)D

    .line 413
    .line 414
    .line 415
    move-result-wide v9

    .line 416
    double-to-float v9, v9

    .line 417
    float-to-double v9, v9

    .line 418
    mul-double/2addr v9, v13

    .line 419
    double-to-float v9, v9

    .line 420
    invoke-static {v0, v9}, Lcom/p1/mobile/putong/location/Location$c;->g(Lcom/p1/mobile/putong/location/Location$c;F)V

    .line 421
    .line 422
    .line 423
    invoke-static {v0, v3, v4}, Lcom/p1/mobile/putong/location/Location$c;->i(Lcom/p1/mobile/putong/location/Location$c;D)V

    .line 424
    .line 425
    .line 426
    invoke-static {v0, v5, v6}, Lcom/p1/mobile/putong/location/Location$c;->j(Lcom/p1/mobile/putong/location/Location$c;D)V

    .line 427
    .line 428
    .line 429
    invoke-static {v0, v7, v8}, Lcom/p1/mobile/putong/location/Location$c;->k(Lcom/p1/mobile/putong/location/Location$c;D)V

    .line 430
    .line 431
    .line 432
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/location/Location$c;->l(Lcom/p1/mobile/putong/location/Location$c;D)V

    .line 433
    .line 434
    .line 435
    return-void
.end method


# virtual methods
.method public A()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/location/Location;->mFieldsMask:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    and-int/2addr p0, v0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return v0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public B()Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/location/Location;->mFieldsMask:I

    .line 2
    .line 3
    and-int/lit8 p0, p0, 0x4

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public C()Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/location/Location;->mFieldsMask:I

    .line 2
    .line 3
    and-int/lit16 p0, p0, 0x80

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public D()Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/location/Location;->mFieldsMask:I

    .line 2
    .line 3
    and-int/lit16 p0, p0, 0x100

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public E()Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/location/Location;->mFieldsMask:I

    .line 2
    .line 3
    and-int/lit8 p0, p0, 0x2

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public F()Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/location/Location;->mFieldsMask:I

    .line 2
    .line 3
    and-int/lit8 p0, p0, 0x40

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public G()Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/location/Location;->mFieldsMask:I

    .line 2
    .line 3
    and-int/lit8 p0, p0, 0x20

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public H()Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/location/Location;->mFieldsMask:I

    .line 2
    .line 3
    and-int/lit8 p0, p0, 0x10

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public I(Landroid/location/Location;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/location/Location;->getProvider()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/location/Location;->mProvider:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/location/Location;->getTime()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    iput-wide v0, p0, Lcom/p1/mobile/putong/location/Location;->mTime:J

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/location/Location;->getElapsedRealtimeNanos()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    iput-wide v0, p0, Lcom/p1/mobile/putong/location/Location;->mElapsedRealtimeNanos:J

    .line 18
    .line 19
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 20
    .line 21
    const/16 v1, 0x1d

    .line 22
    .line 23
    if-lt v0, v1, :cond_0

    .line 24
    .line 25
    invoke-static {p1}, Ll/ixv;->a(Landroid/location/Location;)D

    .line 26
    .line 27
    .line 28
    move-result-wide v1

    .line 29
    iput-wide v1, p0, Lcom/p1/mobile/putong/location/Location;->mElapsedRealtimeUncertaintyNanos:D

    .line 30
    .line 31
    :cond_0
    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    .line 32
    .line 33
    .line 34
    move-result-wide v1

    .line 35
    iput-wide v1, p0, Lcom/p1/mobile/putong/location/Location;->mLatitude:D

    .line 36
    .line 37
    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    .line 38
    .line 39
    .line 40
    move-result-wide v1

    .line 41
    iput-wide v1, p0, Lcom/p1/mobile/putong/location/Location;->mLongitude:D

    .line 42
    .line 43
    invoke-virtual {p1}, Landroid/location/Location;->getAltitude()D

    .line 44
    .line 45
    .line 46
    move-result-wide v1

    .line 47
    iput-wide v1, p0, Lcom/p1/mobile/putong/location/Location;->mAltitude:D

    .line 48
    .line 49
    invoke-virtual {p1}, Landroid/location/Location;->getSpeed()F

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    iput v1, p0, Lcom/p1/mobile/putong/location/Location;->mSpeed:F

    .line 54
    .line 55
    invoke-virtual {p1}, Landroid/location/Location;->getBearing()F

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    iput v1, p0, Lcom/p1/mobile/putong/location/Location;->mBearing:F

    .line 60
    .line 61
    invoke-virtual {p1}, Landroid/location/Location;->getAccuracy()F

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    iput v1, p0, Lcom/p1/mobile/putong/location/Location;->mHorizontalAccuracyMeters:F

    .line 66
    .line 67
    const/16 v1, 0x1a

    .line 68
    .line 69
    if-lt v0, v1, :cond_1

    .line 70
    .line 71
    invoke-static {p1}, Ll/jxv;->a(Landroid/location/Location;)F

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    iput v0, p0, Lcom/p1/mobile/putong/location/Location;->mVerticalAccuracyMeters:F

    .line 76
    .line 77
    invoke-static {p1}, Ll/kxv;->a(Landroid/location/Location;)F

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    iput v0, p0, Lcom/p1/mobile/putong/location/Location;->mSpeedAccuracyMetersPerSecond:F

    .line 82
    .line 83
    invoke-static {p1}, Ll/lxv;->a(Landroid/location/Location;)F

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    iput v0, p0, Lcom/p1/mobile/putong/location/Location;->mBearingAccuracyDegrees:F

    .line 88
    .line 89
    :cond_1
    const/4 v0, 0x0

    .line 90
    iput v0, p0, Lcom/p1/mobile/putong/location/Location;->mLocType:I

    .line 91
    .line 92
    const/4 v0, -0x1

    .line 93
    iput v0, p0, Lcom/p1/mobile/putong/location/Location;->mErrorCode:I

    .line 94
    .line 95
    invoke-virtual {p1}, Landroid/location/Location;->getExtras()Landroid/os/Bundle;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    if-nez v0, :cond_2

    .line 100
    .line 101
    const/4 p1, 0x0

    .line 102
    goto :goto_0

    .line 103
    :cond_2
    new-instance v0, Landroid/os/Bundle;

    .line 104
    .line 105
    invoke-virtual {p1}, Landroid/location/Location;->getExtras()Landroid/os/Bundle;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    invoke-direct {v0, p1}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    .line 110
    .line 111
    .line 112
    move-object p1, v0

    .line 113
    :goto_0
    iput-object p1, p0, Lcom/p1/mobile/putong/location/Location;->mExtras:Landroid/os/Bundle;

    .line 114
    .line 115
    return-void
.end method

.method public J(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/location/Location;->mHorizontalAccuracyMeters:F

    .line 2
    .line 3
    iget p1, p0, Lcom/p1/mobile/putong/location/Location;->mFieldsMask:I

    .line 4
    .line 5
    or-int/lit8 p1, p1, 0x8

    .line 6
    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/location/Location;->mFieldsMask:I

    .line 8
    .line 9
    return-void
.end method

.method public K(D)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/location/Location;->mLatitude:D

    .line 2
    .line 3
    return-void
.end method

.method public L(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/location/Location;->mLocType:I

    .line 2
    .line 3
    return-void
.end method

.method public M(D)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/location/Location;->mLongitude:D

    .line 2
    .line 3
    return-void
.end method

.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public r(Lcom/p1/mobile/putong/location/Location;)F
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/location/Location;->sBearingDistanceCache:Ljava/lang/ThreadLocal;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    move-object v9, v0

    .line 8
    check-cast v9, Lcom/p1/mobile/putong/location/Location$c;

    .line 9
    .line 10
    iget-wide v0, p0, Lcom/p1/mobile/putong/location/Location;->mLatitude:D

    .line 11
    .line 12
    invoke-static {v9}, Lcom/p1/mobile/putong/location/Location$c;->b(Lcom/p1/mobile/putong/location/Location$c;)D

    .line 13
    .line 14
    .line 15
    move-result-wide v2

    .line 16
    cmpl-double v0, v0, v2

    .line 17
    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    iget-wide v0, p0, Lcom/p1/mobile/putong/location/Location;->mLongitude:D

    .line 21
    .line 22
    invoke-static {v9}, Lcom/p1/mobile/putong/location/Location$c;->d(Lcom/p1/mobile/putong/location/Location$c;)D

    .line 23
    .line 24
    .line 25
    move-result-wide v2

    .line 26
    cmpl-double v0, v0, v2

    .line 27
    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    iget-wide v0, p1, Lcom/p1/mobile/putong/location/Location;->mLatitude:D

    .line 31
    .line 32
    invoke-static {v9}, Lcom/p1/mobile/putong/location/Location$c;->c(Lcom/p1/mobile/putong/location/Location$c;)D

    .line 33
    .line 34
    .line 35
    move-result-wide v2

    .line 36
    cmpl-double v0, v0, v2

    .line 37
    .line 38
    if-nez v0, :cond_0

    .line 39
    .line 40
    iget-wide v0, p1, Lcom/p1/mobile/putong/location/Location;->mLongitude:D

    .line 41
    .line 42
    invoke-static {v9}, Lcom/p1/mobile/putong/location/Location$c;->e(Lcom/p1/mobile/putong/location/Location$c;)D

    .line 43
    .line 44
    .line 45
    move-result-wide v2

    .line 46
    cmpl-double v0, v0, v2

    .line 47
    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    :cond_0
    iget-wide v1, p0, Lcom/p1/mobile/putong/location/Location;->mLatitude:D

    .line 51
    .line 52
    iget-wide v3, p0, Lcom/p1/mobile/putong/location/Location;->mLongitude:D

    .line 53
    .line 54
    iget-wide v5, p1, Lcom/p1/mobile/putong/location/Location;->mLatitude:D

    .line 55
    .line 56
    iget-wide v7, p1, Lcom/p1/mobile/putong/location/Location;->mLongitude:D

    .line 57
    .line 58
    invoke-static/range {v1 .. v9}, Lcom/p1/mobile/putong/location/Location;->q(DDDDLcom/p1/mobile/putong/location/Location$c;)V

    .line 59
    .line 60
    .line 61
    :cond_1
    invoke-static {v9}, Lcom/p1/mobile/putong/location/Location$c;->a(Lcom/p1/mobile/putong/location/Location$c;)F

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    return p0
.end method

.method public s()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/location/Location;->mHorizontalAccuracyMeters:F

    .line 2
    .line 3
    return p0
.end method

.method public t()D
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/location/Location;->mAltitude:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Location["

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/location/Location;->mProvider:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    iget-wide v1, p0, Lcom/p1/mobile/putong/location/Location;->mLatitude:D

    .line 14
    .line 15
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-wide v2, p0, Lcom/p1/mobile/putong/location/Location;->mLongitude:D

    .line 20
    .line 21
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const-string v2, " %.6f,%.6f"

    .line 30
    .line 31
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    new-instance v1, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    const-string v2, " Accuracy="

    .line 41
    .line 42
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iget v2, p0, Lcom/p1/mobile/putong/location/Location;->mHorizontalAccuracyMeters:F

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    new-instance v1, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    const-string v2, " LocType="

    .line 60
    .line 61
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    iget v2, p0, Lcom/p1/mobile/putong/location/Location;->mLocType:I

    .line 65
    .line 66
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    const-string v1, " hAcc=???"

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    iget-wide v1, p0, Lcom/p1/mobile/putong/location/Location;->mTime:J

    .line 82
    .line 83
    const-wide/16 v3, 0x0

    .line 84
    .line 85
    cmp-long v1, v1, v3

    .line 86
    .line 87
    if-nez v1, :cond_0

    .line 88
    .line 89
    const-string v1, " t=?!?"

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    :cond_0
    iget-wide v1, p0, Lcom/p1/mobile/putong/location/Location;->mElapsedRealtimeNanos:J

    .line 95
    .line 96
    cmp-long v1, v1, v3

    .line 97
    .line 98
    if-nez v1, :cond_1

    .line 99
    .line 100
    const-string v1, " et=?!?"

    .line 101
    .line 102
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/Location;->D()Z

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/Location;->A()Z

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    if-eqz v1, :cond_2

    .line 113
    .line 114
    const-string v1, " alt="

    .line 115
    .line 116
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    iget-wide v1, p0, Lcom/p1/mobile/putong/location/Location;->mAltitude:D

    .line 120
    .line 121
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/Location;->E()Z

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    if-eqz v1, :cond_3

    .line 129
    .line 130
    const-string v1, " vel="

    .line 131
    .line 132
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    iget v1, p0, Lcom/p1/mobile/putong/location/Location;->mSpeed:F

    .line 136
    .line 137
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/Location;->B()Z

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    if-eqz v1, :cond_4

    .line 145
    .line 146
    const-string v1, " bear="

    .line 147
    .line 148
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    iget v1, p0, Lcom/p1/mobile/putong/location/Location;->mBearing:F

    .line 152
    .line 153
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/Location;->G()Z

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    if-eqz v1, :cond_5

    .line 161
    .line 162
    iget v1, p0, Lcom/p1/mobile/putong/location/Location;->mVerticalAccuracyMeters:F

    .line 163
    .line 164
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    const-string v2, " vAcc=%.0f"

    .line 173
    .line 174
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    goto :goto_0

    .line 182
    :cond_5
    const-string v1, " vAcc=???"

    .line 183
    .line 184
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/Location;->F()Z

    .line 188
    .line 189
    .line 190
    move-result v1

    .line 191
    if-eqz v1, :cond_6

    .line 192
    .line 193
    iget v1, p0, Lcom/p1/mobile/putong/location/Location;->mSpeedAccuracyMetersPerSecond:F

    .line 194
    .line 195
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    move-result-object v1

    .line 203
    const-string v2, " sAcc=%.0f"

    .line 204
    .line 205
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    goto :goto_1

    .line 213
    :cond_6
    const-string v1, " sAcc=???"

    .line 214
    .line 215
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/Location;->C()Z

    .line 219
    .line 220
    .line 221
    move-result v1

    .line 222
    if-eqz v1, :cond_7

    .line 223
    .line 224
    iget v1, p0, Lcom/p1/mobile/putong/location/Location;->mBearingAccuracyDegrees:F

    .line 225
    .line 226
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 227
    .line 228
    .line 229
    move-result-object v1

    .line 230
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 231
    .line 232
    .line 233
    move-result-object v1

    .line 234
    const-string v2, " bAcc=%.0f"

    .line 235
    .line 236
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object v1

    .line 240
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 241
    .line 242
    .line 243
    goto :goto_2

    .line 244
    :cond_7
    const-string v1, " bAcc=???"

    .line 245
    .line 246
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    :goto_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/location/Location;->H()Z

    .line 250
    .line 251
    .line 252
    move-result v1

    .line 253
    if-eqz v1, :cond_8

    .line 254
    .line 255
    const-string v1, " mock"

    .line 256
    .line 257
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 258
    .line 259
    .line 260
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/location/Location;->mExtras:Landroid/os/Bundle;

    .line 261
    .line 262
    if-eqz v1, :cond_9

    .line 263
    .line 264
    const-string v1, " {"

    .line 265
    .line 266
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 267
    .line 268
    .line 269
    iget-object p0, p0, Lcom/p1/mobile/putong/location/Location;->mExtras:Landroid/os/Bundle;

    .line 270
    .line 271
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 272
    .line 273
    .line 274
    const/16 p0, 0x7d

    .line 275
    .line 276
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 277
    .line 278
    .line 279
    :cond_9
    const/16 p0, 0x5d

    .line 280
    .line 281
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 282
    .line 283
    .line 284
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object p0

    .line 288
    return-object p0
.end method

.method public u()D
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/location/Location;->mLatitude:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public w()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/location/Location;->mLocType:I

    .line 2
    .line 3
    return p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/location/Location;->mProvider:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-wide v0, p0, Lcom/p1/mobile/putong/location/Location;->mTime:J

    .line 7
    .line 8
    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 9
    .line 10
    .line 11
    iget-wide v0, p0, Lcom/p1/mobile/putong/location/Location;->mElapsedRealtimeNanos:J

    .line 12
    .line 13
    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 14
    .line 15
    .line 16
    iget-wide v0, p0, Lcom/p1/mobile/putong/location/Location;->mElapsedRealtimeUncertaintyNanos:D

    .line 17
    .line 18
    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeDouble(D)V

    .line 19
    .line 20
    .line 21
    iget p2, p0, Lcom/p1/mobile/putong/location/Location;->mFieldsMask:I

    .line 22
    .line 23
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 24
    .line 25
    .line 26
    iget-wide v0, p0, Lcom/p1/mobile/putong/location/Location;->mLatitude:D

    .line 27
    .line 28
    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeDouble(D)V

    .line 29
    .line 30
    .line 31
    iget-wide v0, p0, Lcom/p1/mobile/putong/location/Location;->mLongitude:D

    .line 32
    .line 33
    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeDouble(D)V

    .line 34
    .line 35
    .line 36
    iget-wide v0, p0, Lcom/p1/mobile/putong/location/Location;->mAltitude:D

    .line 37
    .line 38
    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeDouble(D)V

    .line 39
    .line 40
    .line 41
    iget p2, p0, Lcom/p1/mobile/putong/location/Location;->mSpeed:F

    .line 42
    .line 43
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    .line 44
    .line 45
    .line 46
    iget p2, p0, Lcom/p1/mobile/putong/location/Location;->mBearing:F

    .line 47
    .line 48
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    .line 49
    .line 50
    .line 51
    iget p2, p0, Lcom/p1/mobile/putong/location/Location;->mVerticalAccuracyMeters:F

    .line 52
    .line 53
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    .line 54
    .line 55
    .line 56
    iget p2, p0, Lcom/p1/mobile/putong/location/Location;->mSpeedAccuracyMetersPerSecond:F

    .line 57
    .line 58
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    .line 59
    .line 60
    .line 61
    iget p2, p0, Lcom/p1/mobile/putong/location/Location;->mBearingAccuracyDegrees:F

    .line 62
    .line 63
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    .line 64
    .line 65
    .line 66
    iget p2, p0, Lcom/p1/mobile/putong/location/Location;->mLocType:I

    .line 67
    .line 68
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 69
    .line 70
    .line 71
    iget p2, p0, Lcom/p1/mobile/putong/location/Location;->mErrorCode:I

    .line 72
    .line 73
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 74
    .line 75
    .line 76
    iget-object p0, p0, Lcom/p1/mobile/putong/location/Location;->mExtras:Landroid/os/Bundle;

    .line 77
    .line 78
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeBundle(Landroid/os/Bundle;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public x()D
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/location/Location;->mLongitude:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public y()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/location/Location;->mProvider:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public z()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/location/Location;->mTime:J

    .line 2
    .line 3
    return-wide v0
.end method
