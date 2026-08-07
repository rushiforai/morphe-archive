.class public Lcom/idv/identity/ocr/ui/CardScanActivity;
.super Lcom/idv/identity/platform/IntlFaceBaseActivity;
.source "SourceFile"

# interfaces
.implements Ll/zpl;
.implements Ll/nsl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/idv/identity/ocr/ui/CardScanActivity$x;
    }
.end annotation


# static fields
.field public static H0:Ljava/lang/String; = "NONE"

.field public static I0:Ljava/lang/String; = "shoot"

.field public static J0:Ljava/lang/String; = "scan"


# instance fields
.field private A:Landroid/graphics/Bitmap;

.field private B:Landroid/widget/LinearLayout;

.field private C:Landroid/widget/ImageView;

.field private D:Landroid/widget/ImageView;

.field private E:Landroid/widget/ImageView;

.field private E0:Ll/xxb;

.field private F:Landroid/widget/ImageView;

.field F0:Landroidx/activity/result/contract/ActivityResultContracts$PickVisualMedia;

.field private G:Landroid/widget/TextView;

.field G0:Ll/c60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/c60<",
            "Landroidx/activity/result/PickVisualMediaRequest;",
            ">;"
        }
    .end annotation
.end field

.field protected H:I

.field private I:Ljava/util/concurrent/atomic/AtomicBoolean;

.field protected J:Z

.field private K:Z

.field private L:Z

.field private final M:I

.field private final N:I

.field private final O:I

.field private final P:I

.field private final Q:I

.field private final R:I

.field private final S:I

.field private final T:I

.field private final U:I

.field private final V:I

.field private final W:I

.field private final X:I

.field private final Y:I

.field private final Z:I

.field private c:J

.field private final d:Ljava/lang/String;

.field private final e:Ljava/lang/String;

.field private final f:Ljava/lang/String;

.field private final g:Ljava/lang/String;

.field private final h:Ljava/lang/String;

.field private final i:Ljava/lang/String;

.field private j:Lcom/idv/identity/platform/camera/CameraSurfaceView;

.field private k:Lcom/idv/identity/ocr/IdentityScanView;

.field private final k0:I

.field private l:Lcom/idv/identity/ocr/widget/RectMaskView;

.field private m:Lcom/idv/identity/ocr/widget/RectMaskTrapView;

.field n:Ll/bn2;

.field o:Lcom/idv/identity/platform/SystemLoadingOverlay;

.field p:Landroid/widget/FrameLayout;

.field public p0:Landroid/os/Handler;

.field private q:Lcom/idv/identity/ocr/OcrType;

.field private r:Ljava/lang/String;

.field private s:I

.field private t:[F

.field public u:Ljava/lang/String;

.field private v:Z

.field private w:I

.field private x:J

.field private y:Landroid/graphics/Bitmap;

.field private z:Landroid/graphics/Bitmap;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/platform/IntlFaceBaseActivity;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    iput-wide v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->c:J

    .line 9
    .line 10
    const-string v0, "ocridface"

    .line 11
    .line 12
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->d:Ljava/lang/String;

    .line 13
    .line 14
    const-string v0, "ocridface_3d"

    .line 15
    .line 16
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->e:Ljava/lang/String;

    .line 17
    .line 18
    const-string v0, "ocridorigin"

    .line 19
    .line 20
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->f:Ljava/lang/String;

    .line 21
    .line 22
    const-string v0, "ocridback"

    .line 23
    .line 24
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->g:Ljava/lang/String;

    .line 25
    .line 26
    const-string v0, "ocridthrid"

    .line 27
    .line 28
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->h:Ljava/lang/String;

    .line 29
    .line 30
    const-string v0, "ocridback_3d"

    .line 31
    .line 32
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->i:Ljava/lang/String;

    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->l:Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 36
    .line 37
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->m:Lcom/idv/identity/ocr/widget/RectMaskTrapView;

    .line 38
    .line 39
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->o:Lcom/idv/identity/platform/SystemLoadingOverlay;

    .line 40
    .line 41
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->p:Landroid/widget/FrameLayout;

    .line 42
    .line 43
    sget-object v1, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_FRONT:Lcom/idv/identity/ocr/OcrType;

    .line 44
    .line 45
    iput-object v1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->q:Lcom/idv/identity/ocr/OcrType;

    .line 46
    .line 47
    const-string v1, ""

    .line 48
    .line 49
    iput-object v1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->r:Ljava/lang/String;

    .line 50
    .line 51
    const/4 v1, 0x0

    .line 52
    iput v1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->s:I

    .line 53
    .line 54
    const/16 v2, 0x8

    .line 55
    .line 56
    new-array v2, v2, [F

    .line 57
    .line 58
    iput-object v2, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->t:[F

    .line 59
    .line 60
    sget-object v2, Lcom/idv/identity/ocr/ui/CardScanActivity;->H0:Ljava/lang/String;

    .line 61
    .line 62
    iput-object v2, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->u:Ljava/lang/String;

    .line 63
    .line 64
    iput-boolean v1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->v:Z

    .line 65
    .line 66
    iput v1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->w:I

    .line 67
    .line 68
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 69
    .line 70
    .line 71
    move-result-wide v2

    .line 72
    iput-wide v2, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->x:J

    .line 73
    .line 74
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->y:Landroid/graphics/Bitmap;

    .line 75
    .line 76
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->z:Landroid/graphics/Bitmap;

    .line 77
    .line 78
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->A:Landroid/graphics/Bitmap;

    .line 79
    .line 80
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->B:Landroid/widget/LinearLayout;

    .line 81
    .line 82
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->C:Landroid/widget/ImageView;

    .line 83
    .line 84
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->D:Landroid/widget/ImageView;

    .line 85
    .line 86
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->E:Landroid/widget/ImageView;

    .line 87
    .line 88
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->F:Landroid/widget/ImageView;

    .line 89
    .line 90
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->G:Landroid/widget/TextView;

    .line 91
    .line 92
    iput v1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->H:I

    .line 93
    .line 94
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 95
    .line 96
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 97
    .line 98
    .line 99
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->I:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 100
    .line 101
    iput-boolean v1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->J:Z

    .line 102
    .line 103
    iput-boolean v1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->K:Z

    .line 104
    .line 105
    iput-boolean v1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->L:Z

    .line 106
    .line 107
    const/16 v0, 0x3e8

    .line 108
    .line 109
    iput v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->M:I

    .line 110
    .line 111
    const/16 v0, 0x3ed

    .line 112
    .line 113
    iput v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->N:I

    .line 114
    .line 115
    const/16 v0, 0x3ef

    .line 116
    .line 117
    iput v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->O:I

    .line 118
    .line 119
    const/16 v0, 0x3f0

    .line 120
    .line 121
    iput v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->P:I

    .line 122
    .line 123
    const/16 v0, 0x3f1

    .line 124
    .line 125
    iput v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->Q:I

    .line 126
    .line 127
    const/16 v0, 0x3f2

    .line 128
    .line 129
    iput v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->R:I

    .line 130
    .line 131
    const/16 v0, 0x3f3

    .line 132
    .line 133
    iput v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->S:I

    .line 134
    .line 135
    const/16 v0, 0x3f4

    .line 136
    .line 137
    iput v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->T:I

    .line 138
    .line 139
    const/16 v0, 0x3f5

    .line 140
    .line 141
    iput v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->U:I

    .line 142
    .line 143
    const/16 v0, 0x3f7

    .line 144
    .line 145
    iput v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->V:I

    .line 146
    .line 147
    const/16 v0, 0x3f8

    .line 148
    .line 149
    iput v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->W:I

    .line 150
    .line 151
    const/16 v0, 0x3f9

    .line 152
    .line 153
    iput v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->X:I

    .line 154
    .line 155
    const/16 v0, 0x3fa

    .line 156
    .line 157
    iput v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->Y:I

    .line 158
    .line 159
    const/16 v0, 0x7d0

    .line 160
    .line 161
    iput v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->Z:I

    .line 162
    .line 163
    const/16 v0, 0xbb8

    .line 164
    .line 165
    iput v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->k0:I

    .line 166
    .line 167
    new-instance v0, Landroid/os/Handler;

    .line 168
    .line 169
    new-instance v1, Lcom/idv/identity/ocr/ui/CardScanActivity$k;

    .line 170
    .line 171
    invoke-direct {v1, p0}, Lcom/idv/identity/ocr/ui/CardScanActivity$k;-><init>(Lcom/idv/identity/ocr/ui/CardScanActivity;)V

    .line 172
    .line 173
    .line 174
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    .line 175
    .line 176
    .line 177
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->p0:Landroid/os/Handler;

    .line 178
    .line 179
    new-instance v0, Landroidx/activity/result/contract/ActivityResultContracts$PickVisualMedia;

    .line 180
    .line 181
    invoke-direct {v0}, Landroidx/activity/result/contract/ActivityResultContracts$PickVisualMedia;-><init>()V

    .line 182
    .line 183
    .line 184
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->F0:Landroidx/activity/result/contract/ActivityResultContracts$PickVisualMedia;

    .line 185
    .line 186
    new-instance v1, Lcom/idv/identity/ocr/ui/CardScanActivity$a;

    .line 187
    .line 188
    invoke-direct {v1, p0}, Lcom/idv/identity/ocr/ui/CardScanActivity$a;-><init>(Lcom/idv/identity/ocr/ui/CardScanActivity;)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {p0, v0, v1}, Landroidx/activity/ComponentActivity;->registerForActivityResult(Ll/x50;Ll/w50;)Ll/c60;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->G0:Ll/c60;

    .line 196
    .line 197
    return-void
.end method

.method private A2()V
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->g3(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Lcom/idv/identity/base/R$string;->S:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget v1, Lcom/idv/identity/base/R$string;->R:I

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v5

    .line 25
    new-instance v8, Lcom/idv/identity/ocr/ui/CardScanActivity$v;

    .line 26
    .line 27
    invoke-direct {v8, p0}, Lcom/idv/identity/ocr/ui/CardScanActivity$v;-><init>(Lcom/idv/identity/ocr/ui/CardScanActivity;)V

    .line 28
    .line 29
    .line 30
    const-string v4, ""

    .line 31
    .line 32
    const/4 v6, 0x0

    .line 33
    const-string v7, "ocr_msg_error_code"

    .line 34
    .line 35
    move-object v2, p0

    .line 36
    invoke-direct/range {v2 .. v8}, Lcom/idv/identity/ocr/ui/CardScanActivity;->h3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/idv/identity/ocr/ui/CardScanActivity$x;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static synthetic B1(Lcom/idv/identity/ocr/ui/CardScanActivity;Lcom/idv/identity/ocr/OcrType;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->m3(Lcom/idv/identity/ocr/OcrType;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private C1()Lcom/alibaba/fastjson/JSONObject;
    .locals 2

    .line 1
    new-instance v0, Lcom/alibaba/fastjson/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/alibaba/fastjson/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "points"

    .line 7
    .line 8
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->t:[F

    .line 9
    .line 10
    invoke-virtual {v0, v1, p0}, Lcom/alibaba/fastjson/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method private C2()V
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->g3(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Lcom/idv/identity/base/R$string;->g0:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget v1, Lcom/idv/identity/base/R$string;->h0:I

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sget v1, Lcom/idv/identity/base/R$string;->R:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    new-instance v8, Lcom/idv/identity/ocr/ui/CardScanActivity$o;

    .line 36
    .line 37
    invoke-direct {v8, p0}, Lcom/idv/identity/ocr/ui/CardScanActivity$o;-><init>(Lcom/idv/identity/ocr/ui/CardScanActivity;)V

    .line 38
    .line 39
    .line 40
    const/4 v6, 0x0

    .line 41
    const-string v7, "OCR_TYPE_ERROR_CODE"

    .line 42
    .line 43
    move-object v2, p0

    .line 44
    invoke-direct/range {v2 .. v8}, Lcom/idv/identity/ocr/ui/CardScanActivity;->h3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/idv/identity/ocr/ui/CardScanActivity$x;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method private F1(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->G1(Z)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->K1(Z)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->J1(Z)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, p1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->I1(Z)V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0, p1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->H1(Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private H1(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->Y1()Landroid/widget/ImageView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method private H2()V
    .locals 7

    .line 1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/afm;->V()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Ll/afm;->R()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-object v1, v1, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    iget-object v1, v1, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 24
    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object v2, v0, Lcom/idv/identity/platform/api/IdentityOcrInfo;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult;

    .line 30
    .line 31
    if-eqz v2, :cond_0

    .line 32
    .line 33
    iget-object v2, v2, Lcom/idv/identity/platform/model/IDCardOcrResult;->ocrResult:Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;

    .line 34
    .line 35
    if-eqz v2, :cond_0

    .line 36
    .line 37
    iget-object v3, v1, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->expiryDate:Ljava/lang/String;

    .line 38
    .line 39
    iput-object v3, v2, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->expiryDate:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v3, v1, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->originOfIssue:Ljava/lang/String;

    .line 42
    .line 43
    iput-object v3, v2, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->originOfIssue:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v1, v1, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->issueDate:Ljava/lang/String;

    .line 46
    .line 47
    iput-object v1, v2, Lcom/idv/identity/platform/model/IDCardOcrResult$OcrResult;->issueDate:Ljava/lang/String;

    .line 48
    .line 49
    :cond_0
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v1, v0}, Ll/afm;->H1(Lcom/idv/identity/platform/api/IdentityOcrInfo;)V

    .line 54
    .line 55
    .line 56
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Ll/afm;->v()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    if-nez v0, :cond_1

    .line 65
    .line 66
    return-void

    .line 67
    :cond_1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v1}, Ll/afm;->i0()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-virtual {v2}, Ll/afm;->L()Lcom/idv/identity/platform/model/NfcConfigRes;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    sget-object v3, Ll/ffm;->f:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    const-string v4, "onOcrIdentityFinish:  ENABLE_SHOW_OCR_RESULT="

    .line 90
    .line 91
    const-string v5, "CardScanActivity"

    .line 92
    .line 93
    const-string v6, "success"

    .line 94
    .line 95
    if-eqz v3, :cond_4

    .line 96
    .line 97
    new-instance v0, Ljava/lang/StringBuilder;

    .line 98
    .line 99
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    sget-boolean v1, Ll/hfm;->d:Z

    .line 103
    .line 104
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-static {v5, v0}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-virtual {v0}, Ll/afm;->Q()Ljava/util/Map;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    const-class v1, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;

    .line 123
    .line 124
    if-eqz v0, :cond_2

    .line 125
    .line 126
    invoke-virtual {p0, v1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->n2(Ljava/lang/Class;)V

    .line 127
    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_2
    sget-boolean v0, Ll/hfm;->d:Z

    .line 131
    .line 132
    if-eqz v0, :cond_3

    .line 133
    .line 134
    invoke-virtual {p0, v1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->n2(Ljava/lang/Class;)V

    .line 135
    .line 136
    .line 137
    goto :goto_0

    .line 138
    :cond_3
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->p3()V

    .line 139
    .line 140
    .line 141
    :goto_0
    invoke-direct {p0, v6}, Lcom/idv/identity/ocr/ui/CardScanActivity;->L1(Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    return-void

    .line 145
    :cond_4
    sget-object v3, Ll/cfm;->a:Ljava/lang/String;

    .line 146
    .line 147
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    move-result v3

    .line 151
    if-eqz v3, :cond_5

    .line 152
    .line 153
    sget-object v3, Ll/ffm;->g:Ljava/lang/String;

    .line 154
    .line 155
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result v3

    .line 159
    if-eqz v3, :cond_5

    .line 160
    .line 161
    invoke-static {p0}, Ll/lf20;->c(Landroid/content/Context;)Z

    .line 162
    .line 163
    .line 164
    invoke-direct {p0, v6}, Lcom/idv/identity/ocr/ui/CardScanActivity;->L1(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    return-void

    .line 168
    :cond_5
    sget-object v3, Ll/cfm;->a:Ljava/lang/String;

    .line 169
    .line 170
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    move-result v3

    .line 174
    if-eqz v3, :cond_6

    .line 175
    .line 176
    sget-object v3, Ll/ffm;->e:Ljava/lang/String;

    .line 177
    .line 178
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    move-result v1

    .line 182
    if-eqz v1, :cond_6

    .line 183
    .line 184
    if-eqz v2, :cond_6

    .line 185
    .line 186
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 187
    .line 188
    .line 189
    move-result-object v1

    .line 190
    const-string v2, "android.hardware.nfc"

    .line 191
    .line 192
    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    .line 193
    .line 194
    .line 195
    move-result v1

    .line 196
    if-eqz v1, :cond_6

    .line 197
    .line 198
    invoke-static {p0}, Ll/lf20;->c(Landroid/content/Context;)Z

    .line 199
    .line 200
    .line 201
    invoke-direct {p0, v6}, Lcom/idv/identity/ocr/ui/CardScanActivity;->L1(Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    return-void

    .line 205
    :cond_6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 206
    .line 207
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    sget-boolean v2, Ll/hfm;->d:Z

    .line 211
    .line 212
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v1

    .line 219
    invoke-static {v5, v1}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    .line 221
    .line 222
    sget-boolean v1, Ll/hfm;->d:Z

    .line 223
    .line 224
    if-eqz v1, :cond_e

    .line 225
    .line 226
    sget-object v1, Ll/cfm;->b:Ljava/lang/String;

    .line 227
    .line 228
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 229
    .line 230
    .line 231
    move-result v1

    .line 232
    if-nez v1, :cond_d

    .line 233
    .line 234
    sget-object v1, Ll/cfm;->c:Ljava/lang/String;

    .line 235
    .line 236
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 237
    .line 238
    .line 239
    move-result v1

    .line 240
    if-eqz v1, :cond_7

    .line 241
    .line 242
    goto :goto_2

    .line 243
    :cond_7
    sget-object v1, Ll/cfm;->d:Ljava/lang/String;

    .line 244
    .line 245
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 246
    .line 247
    .line 248
    move-result v1

    .line 249
    if-nez v1, :cond_c

    .line 250
    .line 251
    sget-object v1, Ll/cfm;->e:Ljava/lang/String;

    .line 252
    .line 253
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 254
    .line 255
    .line 256
    move-result v1

    .line 257
    if-eqz v1, :cond_8

    .line 258
    .line 259
    goto :goto_1

    .line 260
    :cond_8
    sget-object v1, Ll/cfm;->a:Ljava/lang/String;

    .line 261
    .line 262
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 263
    .line 264
    .line 265
    move-result v1

    .line 266
    if-eqz v1, :cond_9

    .line 267
    .line 268
    const-class v0, Lcom/idv/identity/ocr/ui/GlobalPassportIDCardResultActivity;

    .line 269
    .line 270
    invoke-virtual {p0, v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->n2(Ljava/lang/Class;)V

    .line 271
    .line 272
    .line 273
    goto :goto_3

    .line 274
    :cond_9
    sget-object v1, Ll/cfm;->f:Ljava/lang/String;

    .line 275
    .line 276
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 277
    .line 278
    .line 279
    move-result v1

    .line 280
    if-eqz v1, :cond_a

    .line 281
    .line 282
    const-class v0, Lcom/idv/identity/ocr/ui/MacaoIDCardResultActivity;

    .line 283
    .line 284
    invoke-virtual {p0, v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->n2(Ljava/lang/Class;)V

    .line 285
    .line 286
    .line 287
    goto :goto_3

    .line 288
    :cond_a
    sget-object v1, Ll/cfm;->g:Ljava/lang/String;

    .line 289
    .line 290
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 291
    .line 292
    .line 293
    move-result v1

    .line 294
    if-eqz v1, :cond_b

    .line 295
    .line 296
    const-class v0, Lcom/idv/identity/ocr/ui/TaiwanIDCardResultActivity;

    .line 297
    .line 298
    invoke-virtual {p0, v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->n2(Ljava/lang/Class;)V

    .line 299
    .line 300
    .line 301
    goto :goto_3

    .line 302
    :cond_b
    sget-object v1, Ll/cfm;->h:Ljava/lang/String;

    .line 303
    .line 304
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 305
    .line 306
    .line 307
    move-result v0

    .line 308
    if-eqz v0, :cond_f

    .line 309
    .line 310
    const-class v0, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;

    .line 311
    .line 312
    invoke-virtual {p0, v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->n2(Ljava/lang/Class;)V

    .line 313
    .line 314
    .line 315
    goto :goto_3

    .line 316
    :cond_c
    :goto_1
    const-class v0, Lcom/idv/identity/ocr/ui/HKGoThroughIDCardResultActivity;

    .line 317
    .line 318
    invoke-virtual {p0, v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->n2(Ljava/lang/Class;)V

    .line 319
    .line 320
    .line 321
    goto :goto_3

    .line 322
    :cond_d
    :goto_2
    const-class v0, Lcom/idv/identity/ocr/ui/HKIDCardResultActivity;

    .line 323
    .line 324
    invoke-virtual {p0, v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->n2(Ljava/lang/Class;)V

    .line 325
    .line 326
    .line 327
    goto :goto_3

    .line 328
    :cond_e
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->p3()V

    .line 329
    .line 330
    .line 331
    :cond_f
    :goto_3
    invoke-direct {p0, v6}, Lcom/idv/identity/ocr/ui/CardScanActivity;->L1(Ljava/lang/String;)V

    .line 332
    .line 333
    .line 334
    return-void
.end method

.method private I1(Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->e2()Landroid/widget/ImageView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    sget v0, Ll/rcc0;->G0:I

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Landroid/widget/TextView;

    .line 17
    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method private I2()V
    .locals 6

    .line 1
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 6
    .line 7
    const-string v2, "success"

    .line 8
    .line 9
    const-string v3, "status"

    .line 10
    .line 11
    filled-new-array {v3, v2}, [Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const-string v4, "enterPickImage"

    .line 16
    .line 17
    invoke-virtual {v0, v1, v4, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :try_start_0
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->G0:Ll/c60;

    .line 21
    .line 22
    new-instance v0, Landroidx/activity/result/PickVisualMediaRequest$Builder;

    .line 23
    .line 24
    invoke-direct {v0}, Landroidx/activity/result/PickVisualMediaRequest$Builder;-><init>()V

    .line 25
    .line 26
    .line 27
    sget-object v1, Landroidx/activity/result/contract/ActivityResultContracts$PickVisualMedia$ImageOnly;->INSTANCE:Landroidx/activity/result/contract/ActivityResultContracts$PickVisualMedia$ImageOnly;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroidx/activity/result/PickVisualMediaRequest$Builder;->setMediaType(Landroidx/activity/result/contract/ActivityResultContracts$PickVisualMedia$VisualMediaType;)Landroidx/activity/result/PickVisualMediaRequest$Builder;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Landroidx/activity/result/PickVisualMediaRequest$Builder;->build()Landroidx/activity/result/PickVisualMediaRequest;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p0, v0}, Ll/c60;->b(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :catch_0
    move-exception p0

    .line 42
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0, p0}, Lcom/idv/identity/platform/log/RecordService;->recordException(Ljava/lang/Throwable;)V

    .line 47
    .line 48
    .line 49
    :goto_0
    invoke-static {}, Landroidx/activity/result/contract/ActivityResultContracts$PickVisualMedia;->isPhotoPickerAvailable()Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-nez p0, :cond_0

    .line 54
    .line 55
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    sget-object v0, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 60
    .line 61
    const-string v1, "pickVisualMedia"

    .line 62
    .line 63
    const-string v2, "not support for the photo picker"

    .line 64
    .line 65
    const-string v5, "error"

    .line 66
    .line 67
    filled-new-array {v3, v5, v1, v2}, [Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {p0, v0, v4, v1}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    :cond_0
    return-void
.end method

.method private J1(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->h2()Landroid/widget/ImageView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method private K1(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->Z1()Landroid/widget/ImageView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method private K2(Landroid/graphics/Bitmap;ZLcom/idv/identity/base/algorithm/doc/Attr;)V
    .locals 13

    .line 1
    move v1, p2

    .line 2
    move-object/from16 v2, p3

    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->y:Landroid/graphics/Bitmap;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    int-to-float v3, v3

    .line 14
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 15
    .line 16
    .line 17
    move-result v4

    .line 18
    int-to-float v4, v4

    .line 19
    const/4 v7, 0x0

    .line 20
    if-nez v1, :cond_2

    .line 21
    .line 22
    sget v2, Ll/rcc0;->A:I

    .line 23
    .line 24
    invoke-virtual {p0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Landroid/widget/ImageView;

    .line 29
    .line 30
    if-eqz v2, :cond_1

    .line 31
    .line 32
    invoke-virtual {v2, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 33
    .line 34
    .line 35
    iget-object v5, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->y:Landroid/graphics/Bitmap;

    .line 36
    .line 37
    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->T1()Lcom/idv/identity/ocr/IdentityScanView;

    .line 41
    .line 42
    .line 43
    move-result-object v5

    .line 44
    invoke-virtual {v5}, Lcom/idv/identity/ocr/IdentityScanView;->getHoleLeft()F

    .line 45
    .line 46
    .line 47
    move-result v5

    .line 48
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->T1()Lcom/idv/identity/ocr/IdentityScanView;

    .line 49
    .line 50
    .line 51
    move-result-object v6

    .line 52
    invoke-virtual {v6}, Lcom/idv/identity/ocr/IdentityScanView;->getHoleTop()F

    .line 53
    .line 54
    .line 55
    move-result v6

    .line 56
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->T1()Lcom/idv/identity/ocr/IdentityScanView;

    .line 57
    .line 58
    .line 59
    move-result-object v8

    .line 60
    invoke-virtual {v8}, Lcom/idv/identity/ocr/IdentityScanView;->getHoleWidth()F

    .line 61
    .line 62
    .line 63
    move-result v8

    .line 64
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->T1()Lcom/idv/identity/ocr/IdentityScanView;

    .line 65
    .line 66
    .line 67
    move-result-object v9

    .line 68
    invoke-virtual {v9}, Lcom/idv/identity/ocr/IdentityScanView;->getHoleHeight()F

    .line 69
    .line 70
    .line 71
    move-result v9

    .line 72
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 73
    .line 74
    .line 75
    move-result v10

    .line 76
    int-to-float v10, v10

    .line 77
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    int-to-float v2, v2

    .line 82
    new-instance v11, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    const-string v12, "photoTakenBackground  bgHeight:"

    .line 85
    .line 86
    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    const-string v12, "  bgWidth:"

    .line 93
    .line 94
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v11

    .line 104
    const-string v12, "CardScanActivity"

    .line 105
    .line 106
    invoke-static {v12, v11}, Ll/o6r0;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    div-float/2addr v4, v10

    .line 110
    mul-float/2addr v5, v4

    .line 111
    div-float/2addr v3, v2

    .line 112
    mul-float/2addr v6, v3

    .line 113
    mul-float/2addr v4, v9

    .line 114
    mul-float/2addr v3, v8

    .line 115
    new-instance v2, Ljava/lang/StringBuilder;

    .line 116
    .line 117
    const-string v8, "onPictureTake:"

    .line 118
    .line 119
    invoke-direct {v2, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    const-string v1, "  cropLeft:"

    .line 126
    .line 127
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    const-string v1, " cropTop:"

    .line 134
    .line 135
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    const-string v1, "cropWidth:"

    .line 142
    .line 143
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    const-string v1, "cropHeight:"

    .line 150
    .line 151
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    invoke-static {v12, v1}, Ll/o6r0;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    float-to-int v1, v5

    .line 165
    float-to-int v2, v6

    .line 166
    float-to-int v3, v3

    .line 167
    float-to-int v4, v4

    .line 168
    const/4 v5, 0x0

    .line 169
    const/4 v6, 0x0

    .line 170
    move-object v0, p1

    .line 171
    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    invoke-direct {p0, v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->d3(Landroid/graphics/Bitmap;)V

    .line 176
    .line 177
    .line 178
    goto :goto_0

    .line 179
    :cond_2
    invoke-direct {p0, p1, v2}, Lcom/idv/identity/ocr/ui/CardScanActivity;->M1(Landroid/graphics/Bitmap;Lcom/idv/identity/base/algorithm/doc/Attr;)Landroid/graphics/Bitmap;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    invoke-direct {p0, v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->d3(Landroid/graphics/Bitmap;)V

    .line 184
    .line 185
    .line 186
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->z:Landroid/graphics/Bitmap;

    .line 187
    .line 188
    invoke-direct {p0, v0, v2}, Lcom/idv/identity/ocr/ui/CardScanActivity;->f3(Landroid/graphics/Bitmap;Lcom/idv/identity/base/algorithm/doc/Attr;)V

    .line 189
    .line 190
    .line 191
    :goto_0
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->g2()Landroid/widget/LinearLayout;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    const/16 v1, 0x8

    .line 196
    .line 197
    if-eqz v0, :cond_3

    .line 198
    .line 199
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 200
    .line 201
    .line 202
    :cond_3
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->h2()Landroid/widget/ImageView;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    if-eqz v0, :cond_4

    .line 207
    .line 208
    invoke-virtual {v0, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 209
    .line 210
    .line 211
    :cond_4
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->P1()Landroid/widget/LinearLayout;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 216
    .line 217
    .line 218
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->Z1()Landroid/widget/ImageView;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    if-eqz v0, :cond_5

    .line 223
    .line 224
    const/4 v1, 0x4

    .line 225
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 226
    .line 227
    .line 228
    :cond_5
    sget v0, Ll/rcc0;->m:I

    .line 229
    .line 230
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    check-cast v0, Landroid/widget/TextView;

    .line 235
    .line 236
    if-eqz v0, :cond_6

    .line 237
    .line 238
    const-string v1, ""

    .line 239
    .line 240
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 241
    .line 242
    .line 243
    :cond_6
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->X1()Landroid/widget/TextView;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    if-eqz v0, :cond_a

    .line 248
    .line 249
    sget-object v1, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_FRONT:Lcom/idv/identity/ocr/OcrType;

    .line 250
    .line 251
    iget-object v2, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->q:Lcom/idv/identity/ocr/OcrType;

    .line 252
    .line 253
    if-ne v1, v2, :cond_7

    .line 254
    .line 255
    sget v1, Lcom/idv/identity/base/R$string;->l0:I

    .line 256
    .line 257
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 258
    .line 259
    .line 260
    goto :goto_1

    .line 261
    :cond_7
    sget-object v1, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_BACK:Lcom/idv/identity/ocr/OcrType;

    .line 262
    .line 263
    if-ne v1, v2, :cond_8

    .line 264
    .line 265
    sget v1, Lcom/idv/identity/base/R$string;->k0:I

    .line 266
    .line 267
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 268
    .line 269
    .line 270
    goto :goto_1

    .line 271
    :cond_8
    sget-object v1, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_THIRD:Lcom/idv/identity/ocr/OcrType;

    .line 272
    .line 273
    if-ne v1, v2, :cond_9

    .line 274
    .line 275
    sget v1, Lcom/idv/identity/base/R$string;->k0:I

    .line 276
    .line 277
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 278
    .line 279
    .line 280
    goto :goto_1

    .line 281
    :cond_9
    sget v1, Lcom/idv/identity/base/R$string;->j0:I

    .line 282
    .line 283
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 284
    .line 285
    .line 286
    :goto_1
    invoke-virtual {v0, v7}, Landroid/view/View;->setVisibility(I)V

    .line 287
    .line 288
    .line 289
    :cond_a
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 290
    .line 291
    .line 292
    move-result-object v0

    .line 293
    invoke-virtual {v0}, Ll/afm;->c0()F

    .line 294
    .line 295
    .line 296
    move-result v0

    .line 297
    float-to-int v0, v0

    .line 298
    if-gtz v0, :cond_b

    .line 299
    .line 300
    const/16 v0, 0x280

    .line 301
    .line 302
    :cond_b
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->y:Landroid/graphics/Bitmap;

    .line 303
    .line 304
    invoke-static {v1, v0}, Ll/ac00;->m(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    .line 305
    .line 306
    .line 307
    move-result-object v0

    .line 308
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->A:Landroid/graphics/Bitmap;

    .line 309
    .line 310
    return-void
.end method

.method public static synthetic L0(Lcom/idv/identity/ocr/ui/CardScanActivity;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->w:I

    .line 2
    .line 3
    return p0
.end method

.method private L1(Ljava/lang/String;)V
    .locals 8

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    iget-wide v3, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->c:J

    .line 11
    .line 12
    sub-long/2addr v1, v3

    .line 13
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, "ms"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v6

    .line 25
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    sget-object v3, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 30
    .line 31
    const-string v4, "OCR_EXIT"

    .line 32
    .line 33
    const-string v5, "OCR_SCAN"

    .line 34
    .line 35
    move-object v7, p1

    .line 36
    invoke-virtual/range {v2 .. v7}, Lcom/idv/identity/platform/log/RecordService;->recordEventPage(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/idv/identity/platform/IntlFaceBaseActivity;->finish()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method private L2(Ljava/lang/String;Ljava/lang/String;)V
    .locals 13

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "originalPath: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, " compressPath: "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Ll/o6r0;->a(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const-string v1, "msg"

    .line 31
    .line 32
    const-string v2, "error"

    .line 33
    .line 34
    const-string v4, "status"

    .line 35
    .line 36
    const-string v10, "takeSuccess"

    .line 37
    .line 38
    if-nez v0, :cond_3

    .line 39
    .line 40
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_3

    .line 45
    .line 46
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    .line 47
    .line 48
    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 49
    .line 50
    .line 51
    const/4 v5, 0x0

    .line 52
    iput-boolean v5, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 53
    .line 54
    invoke-static {p2, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    if-eqz v0, :cond_2

    .line 59
    .line 60
    invoke-virtual/range {p0 .. p1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->R2(Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-eqz v1, :cond_0

    .line 65
    .line 66
    invoke-virtual {p0, v1, v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->X2(ILandroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    :cond_0
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->y:Landroid/graphics/Bitmap;

    .line 71
    .line 72
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->A:Landroid/graphics/Bitmap;

    .line 73
    .line 74
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->z:Landroid/graphics/Bitmap;

    .line 75
    .line 76
    sget v2, Ll/rcc0;->A:I

    .line 77
    .line 78
    invoke-virtual {p0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    check-cast v2, Landroid/widget/ImageView;

    .line 83
    .line 84
    if-eqz v2, :cond_1

    .line 85
    .line 86
    iget-object v4, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->y:Landroid/graphics/Bitmap;

    .line 87
    .line 88
    invoke-virtual {v2, v4}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 92
    .line 93
    .line 94
    new-instance v4, Ljava/lang/StringBuilder;

    .line 95
    .line 96
    const-string v5, "\u56fe\u7247\u5bbd\u5ea6:w="

    .line 97
    .line 98
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 102
    .line 103
    .line 104
    move-result v5

    .line 105
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    const-string v5, " h="

    .line 109
    .line 110
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 114
    .line 115
    .line 116
    move-result v6

    .line 117
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v4

    .line 124
    const-string v6, "CardScanActivity"

    .line 125
    .line 126
    invoke-static {v6, v4}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    new-instance v4, Ljava/lang/StringBuilder;

    .line 130
    .line 131
    const-string v7, "\u56fe\u7247\u6846\u5bbd\u5ea6:w="

    .line 132
    .line 133
    invoke-direct {v4, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 137
    .line 138
    .line 139
    move-result v7

    .line 140
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 147
    .line 148
    .line 149
    move-result v2

    .line 150
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    invoke-static {v6, v2}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    :cond_1
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 161
    .line 162
    .line 163
    move-result-object v11

    .line 164
    sget-object v12, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 165
    .line 166
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v5

    .line 170
    new-instance v1, Ljava/lang/StringBuilder;

    .line 171
    .line 172
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 173
    .line 174
    .line 175
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 176
    .line 177
    .line 178
    move-result v2

    .line 179
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    const-string v2, "*"

    .line 183
    .line 184
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 188
    .line 189
    .line 190
    move-result v0

    .line 191
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v7

    .line 198
    const-string v8, "status"

    .line 199
    .line 200
    const-string v9, "success"

    .line 201
    .line 202
    const-string v0, "originalPath"

    .line 203
    .line 204
    const-string v2, "compressPath"

    .line 205
    .line 206
    const-string v4, "degree"

    .line 207
    .line 208
    const-string v6, "w*h"

    .line 209
    .line 210
    move-object v1, p1

    .line 211
    move-object v3, p2

    .line 212
    filled-new-array/range {v0 .. v9}, [Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    invoke-virtual {v11, v12, v10, p1}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->q2()V

    .line 220
    .line 221
    .line 222
    return-void

    .line 223
    :cond_2
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 224
    .line 225
    .line 226
    move-result-object p0

    .line 227
    sget-object p1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 228
    .line 229
    const-string v0, "decodeFile error"

    .line 230
    .line 231
    filled-new-array {v4, v2, v1, v0}, [Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    invoke-virtual {p0, p1, v10, v0}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 236
    .line 237
    .line 238
    return-void

    .line 239
    :cond_3
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 240
    .line 241
    .line 242
    move-result-object p0

    .line 243
    sget-object p1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 244
    .line 245
    const-string v0, "image path error"

    .line 246
    .line 247
    filled-new-array {v4, v2, v1, v0}, [Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    invoke-virtual {p0, p1, v10, v0}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 252
    .line 253
    .line 254
    return-void
.end method

.method private M1(Landroid/graphics/Bitmap;Lcom/idv/identity/base/algorithm/doc/Attr;)Landroid/graphics/Bitmap;
    .locals 11

    .line 1
    iget-object p0, p2, Lcom/idv/identity/base/algorithm/doc/Attr;->points:[F

    .line 2
    .line 3
    if-eqz p0, :cond_8

    .line 4
    .line 5
    array-length p2, p0

    .line 6
    const/16 v0, 0x8

    .line 7
    .line 8
    if-ne p2, v0, :cond_8

    .line 9
    .line 10
    const/4 p2, 0x0

    .line 11
    aget p2, p0, p2

    .line 12
    .line 13
    const/4 v0, 0x6

    .line 14
    aget v0, p0, v0

    .line 15
    .line 16
    cmpg-float v1, p2, v0

    .line 17
    .line 18
    if-gez v1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move p2, v0

    .line 22
    :goto_0
    const/high16 v0, 0x42a00000    # 80.0f

    .line 23
    .line 24
    cmpg-float v1, p2, v0

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    if-gez v1, :cond_1

    .line 28
    .line 29
    move p2, v2

    .line 30
    goto :goto_1

    .line 31
    :cond_1
    sub-float/2addr p2, v0

    .line 32
    :goto_1
    const/4 v1, 0x1

    .line 33
    aget v1, p0, v1

    .line 34
    .line 35
    const/4 v3, 0x3

    .line 36
    aget v3, p0, v3

    .line 37
    .line 38
    cmpg-float v4, v1, v3

    .line 39
    .line 40
    if-gez v4, :cond_2

    .line 41
    .line 42
    goto :goto_2

    .line 43
    :cond_2
    move v1, v3

    .line 44
    :goto_2
    cmpg-float v3, v1, v0

    .line 45
    .line 46
    if-gez v3, :cond_3

    .line 47
    .line 48
    goto :goto_3

    .line 49
    :cond_3
    sub-float v2, v1, v0

    .line 50
    .line 51
    :goto_3
    const/4 v1, 0x2

    .line 52
    aget v1, p0, v1

    .line 53
    .line 54
    const/4 v3, 0x4

    .line 55
    aget v3, p0, v3

    .line 56
    .line 57
    cmpg-float v4, v1, v3

    .line 58
    .line 59
    if-gez v4, :cond_4

    .line 60
    .line 61
    move v1, v3

    .line 62
    :cond_4
    add-float/2addr v1, v0

    .line 63
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    int-to-float v3, v3

    .line 68
    cmpl-float v3, v1, v3

    .line 69
    .line 70
    if-lez v3, :cond_5

    .line 71
    .line 72
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    int-to-float v1, v1

    .line 77
    :cond_5
    const/4 v3, 0x5

    .line 78
    aget v3, p0, v3

    .line 79
    .line 80
    const/4 v4, 0x7

    .line 81
    aget p0, p0, v4

    .line 82
    .line 83
    cmpg-float v4, v3, p0

    .line 84
    .line 85
    if-gez v4, :cond_6

    .line 86
    .line 87
    move v3, p0

    .line 88
    :cond_6
    add-float/2addr v3, v0

    .line 89
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    int-to-float p0, p0

    .line 94
    cmpl-float p0, v3, p0

    .line 95
    .line 96
    if-lez p0, :cond_7

    .line 97
    .line 98
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    int-to-float v3, p0

    .line 103
    :cond_7
    sub-float/2addr v1, p2

    .line 104
    sub-float/2addr v3, v2

    .line 105
    new-instance p0, Ljava/lang/StringBuilder;

    .line 106
    .line 107
    const-string v0, "getAutoPicture cropLeft:"

    .line 108
    .line 109
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    const-string v0, " cropTop:"

    .line 116
    .line 117
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string v0, "cropWidth:"

    .line 124
    .line 125
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    const-string v0, "cropHeight:"

    .line 132
    .line 133
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    const-string v0, "CardScanActivity"

    .line 144
    .line 145
    invoke-static {v0, p0}, Ll/o6r0;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    float-to-int v5, p2

    .line 149
    float-to-int v6, v2

    .line 150
    float-to-int v7, v1

    .line 151
    float-to-int v8, v3

    .line 152
    const/4 v9, 0x0

    .line 153
    const/4 v10, 0x0

    .line 154
    move-object v4, p1

    .line 155
    :try_start_0
    invoke-static/range {v4 .. v10}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    .line 156
    .line 157
    .line 158
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 159
    return-object p0

    .line 160
    :catch_0
    move-exception v0

    .line 161
    move-object p0, v0

    .line 162
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    invoke-virtual {p1, p0}, Lcom/idv/identity/platform/log/RecordService;->recordException(Ljava/lang/Throwable;)V

    .line 167
    .line 168
    .line 169
    return-object v4

    .line 170
    :cond_8
    move-object v4, p1

    .line 171
    return-object v4
.end method

.method public static synthetic N0(Lcom/idv/identity/ocr/ui/CardScanActivity;)I
    .locals 2

    .line 1
    iget v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->w:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, -0x1

    .line 4
    .line 5
    iput v1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->w:I

    .line 6
    .line 7
    return v0
.end method

.method public static synthetic O0(Lcom/idv/identity/ocr/ui/CardScanActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->i3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic P0(Lcom/idv/identity/ocr/ui/CardScanActivity;)Lcom/idv/identity/ocr/IdentityScanView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->k:Lcom/idv/identity/ocr/IdentityScanView;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Q0(Lcom/idv/identity/ocr/ui/CardScanActivity;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->K:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic R0(Lcom/idv/identity/ocr/ui/CardScanActivity;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->K:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic S0(Lcom/idv/identity/ocr/ui/CardScanActivity;)Lcom/idv/identity/ocr/OcrType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->q:Lcom/idv/identity/ocr/OcrType;

    .line 2
    .line 3
    return-object p0
.end method

.method private S2()V
    .locals 2

    .line 1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/afm;->b0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "auto"

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    sget-object v0, Lcom/idv/identity/ocr/ui/CardScanActivity;->I0:Ljava/lang/String;

    .line 18
    .line 19
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->u:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->o3()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    sget-object v0, Lcom/idv/identity/ocr/ui/CardScanActivity;->J0:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->u:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_3

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->n3()V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Ll/afm;->b0()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const-string v1, "shoot"

    .line 54
    .line 55
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-eqz v0, :cond_2

    .line 60
    .line 61
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->U2()V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_2
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v0}, Ll/afm;->b0()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    const-string v1, "scan"

    .line 74
    .line 75
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_3

    .line 80
    .line 81
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->T2()V

    .line 82
    .line 83
    .line 84
    :cond_3
    return-void
.end method

.method public static synthetic T0(Lcom/idv/identity/ocr/ui/CardScanActivity;)Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->z:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-object p0
.end method

.method private T2()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->P1()Landroid/widget/LinearLayout;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/16 v1, 0x8

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->Z1()Landroid/widget/ImageView;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->T1()Lcom/idv/identity/ocr/IdentityScanView;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lcom/idv/identity/ocr/IdentityScanView;->j()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->T1()Lcom/idv/identity/ocr/IdentityScanView;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Lcom/idv/identity/ocr/IdentityScanView;->i()V

    .line 29
    .line 30
    .line 31
    sget-object v0, Lcom/idv/identity/ocr/ui/CardScanActivity;->J0:Ljava/lang/String;

    .line 32
    .line 33
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->u:Ljava/lang/String;

    .line 34
    .line 35
    return-void
.end method

.method public static synthetic U0(Lcom/idv/identity/ocr/ui/CardScanActivity;)Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->y:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-object p0
.end method

.method private U2()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->P1()Landroid/widget/LinearLayout;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/16 v1, 0x8

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->Z1()Landroid/widget/ImageView;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    sget-object v0, Lcom/idv/identity/ocr/ui/CardScanActivity;->I0:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->u:Ljava/lang/String;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->j:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 23
    .line 24
    const-string v0, "continuous-picture"

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Lcom/idv/identity/platform/camera/CameraSurfaceView;->setFocusModes(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static synthetic V0(Lcom/idv/identity/ocr/ui/CardScanActivity;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->a3(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private V2()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->p0:Landroid/os/Handler;

    .line 2
    .line 3
    const/16 v0, 0x3f8

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeMessages(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic W0(Lcom/idv/identity/ocr/ui/CardScanActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->S2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X0(Lcom/idv/identity/ocr/ui/CardScanActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->c3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Y0(Lcom/idv/identity/ocr/ui/CardScanActivity;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->v:Z

    .line 2
    .line 3
    return p0
.end method

.method private Z2(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->p0:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/16 v1, 0x3fa

    .line 10
    .line 11
    iput v1, v0, Landroid/os/Message;->what:I

    .line 12
    .line 13
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->p0:Landroid/os/Handler;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public static synthetic a1(Lcom/idv/identity/ocr/ui/CardScanActivity;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->v:Z

    .line 2
    .line 3
    return p1
.end method

.method private a2(Landroid/net/Uri;)Ljava/lang/String;
    .locals 6

    .line 1
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "file"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "content"

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_3

    .line 29
    .line 30
    new-instance v0, Ljava/io/File;

    .line 31
    .line 32
    new-instance v1, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v3, "take photo_cache"

    .line 54
    .line 55
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-nez v1, :cond_1

    .line 70
    .line 71
    invoke-virtual {v0}, Ljava/io/File;->mkdir()Z

    .line 72
    .line 73
    .line 74
    :cond_1
    :try_start_0
    new-instance v1, Ljava/io/File;

    .line 75
    .line 76
    new-instance v3, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 92
    .line 93
    .line 94
    move-result-wide v4

    .line 95
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    const-string v0, ".jpg"

    .line 99
    .line 100
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-virtual {p0, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    new-instance p1, Ljava/io/FileOutputStream;

    .line 119
    .line 120
    invoke-direct {p1, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 121
    .line 122
    .line 123
    const/16 v0, 0x400

    .line 124
    .line 125
    new-array v0, v0, [B

    .line 126
    .line 127
    :goto_0
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    .line 128
    .line 129
    .line 130
    move-result v2

    .line 131
    const/4 v3, -0x1

    .line 132
    if-eq v3, v2, :cond_2

    .line 133
    .line 134
    const/4 v3, 0x0

    .line 135
    invoke-virtual {p1, v0, v3, v2}, Ljava/io/FileOutputStream;->write([BII)V

    .line 136
    .line 137
    .line 138
    goto :goto_0

    .line 139
    :cond_2
    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 143
    .line 144
    .line 145
    invoke-virtual {p1}, Ljava/io/FileOutputStream;->close()V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 152
    return-object p0

    .line 153
    :catch_0
    move-exception p0

    .line 154
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 155
    .line 156
    .line 157
    :cond_3
    const/4 p0, 0x0

    .line 158
    return-object p0
.end method

.method private a3(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->p0:Landroid/os/Handler;

    .line 2
    .line 3
    const/16 v1, 0x3f5

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/16 v1, 0x3ef

    .line 13
    .line 14
    iput v1, v0, Landroid/os/Message;->what:I

    .line 15
    .line 16
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->p0:Landroid/os/Handler;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private b3(Ljava/lang/String;)V
    .locals 7

    .line 1
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v2, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 6
    .line 7
    const-string v1, "code"

    .line 8
    .line 9
    filled-new-array {v1, p1}, [Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v3, "sendResponseAndFinish"

    .line 14
    .line 15
    invoke-virtual {v0, v2, v3, v1}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0, p1}, Ll/afm;->e(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    new-instance v0, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 31
    .line 32
    .line 33
    move-result-wide v3

    .line 34
    iget-wide v5, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->c:J

    .line 35
    .line 36
    sub-long/2addr v3, v5

    .line 37
    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v1, "ms"

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    const-string v3, "OCR_EXIT"

    .line 54
    .line 55
    const-string v4, "OCR_SCAN"

    .line 56
    .line 57
    move-object v6, p1

    .line 58
    invoke-virtual/range {v1 .. v6}, Lcom/idv/identity/platform/log/RecordService;->recordEventPage(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/idv/identity/platform/IntlFaceBaseActivity;->finish()V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method private c3()V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->p0:Landroid/os/Handler;

    .line 2
    .line 3
    sget v0, Ll/hfm;->k:I

    .line 4
    .line 5
    sget v1, Ll/hfm;->n:I

    .line 6
    .line 7
    mul-int/2addr v0, v1

    .line 8
    int-to-long v0, v0

    .line 9
    const/16 v2, 0x3f8

    .line 10
    .line 11
    invoke-virtual {p0, v2, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic d1(Lcom/idv/identity/ocr/ui/CardScanActivity;Landroid/net/Uri;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->a2(Landroid/net/Uri;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private d3(Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/afm;->r()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/afm;->h0()F

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    float-to-int v0, v0

    .line 20
    if-gtz v0, :cond_0

    .line 21
    .line 22
    const/16 v0, 0x1e0

    .line 23
    .line 24
    :cond_0
    invoke-static {p1, v0}, Ll/ac00;->m(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->z:Landroid/graphics/Bitmap;

    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->z:Landroid/graphics/Bitmap;

    .line 32
    .line 33
    return-void
.end method

.method private e3(Z)V
    .locals 3

    .line 1
    sget v0, Ll/rcc0;->u:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/ImageView;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    sget v1, Ll/yac0;->d:I

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    sget v1, Ll/yac0;->c:I

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 22
    .line 23
    .line 24
    :goto_0
    const/4 v1, 0x0

    .line 25
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 26
    .line 27
    .line 28
    :cond_1
    sget v0, Ll/rcc0;->m:I

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Landroid/widget/TextView;

    .line 35
    .line 36
    if-eqz v0, :cond_5

    .line 37
    .line 38
    sget-object v1, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_FRONT:Lcom/idv/identity/ocr/OcrType;

    .line 39
    .line 40
    iget-object v2, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->q:Lcom/idv/identity/ocr/OcrType;

    .line 41
    .line 42
    if-ne v1, v2, :cond_3

    .line 43
    .line 44
    if-eqz p1, :cond_2

    .line 45
    .line 46
    sget v1, Lcom/idv/identity/base/R$string;->L0:I

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 49
    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_2
    sget v1, Lcom/idv/identity/base/R$string;->i0:I

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 55
    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_3
    sget-object v1, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_BACK:Lcom/idv/identity/ocr/OcrType;

    .line 59
    .line 60
    if-ne v1, v2, :cond_5

    .line 61
    .line 62
    if-eqz p1, :cond_4

    .line 63
    .line 64
    sget v1, Lcom/idv/identity/base/R$string;->L0:I

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 67
    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_4
    sget v1, Lcom/idv/identity/base/R$string;->i0:I

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 73
    .line 74
    .line 75
    :cond_5
    :goto_1
    if-eqz p1, :cond_7

    .line 76
    .line 77
    sget p1, Ll/rcc0;->z:I

    .line 78
    .line 79
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    const/4 v0, 0x4

    .line 84
    if-eqz p1, :cond_6

    .line 85
    .line 86
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 87
    .line 88
    .line 89
    :cond_6
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->X1()Landroid/widget/TextView;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    if-eqz p0, :cond_7

    .line 94
    .line 95
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 96
    .line 97
    .line 98
    :cond_7
    return-void
.end method

.method public static synthetic f1(Lcom/idv/identity/ocr/ui/CardScanActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->v2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private f3(Landroid/graphics/Bitmap;Lcom/idv/identity/base/algorithm/doc/Attr;)V
    .locals 4

    .line 1
    sget p2, Ll/rcc0;->g:I

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    check-cast p2, Landroid/widget/ImageView;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 18
    .line 19
    iget-object v2, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->l:Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 20
    .line 21
    invoke-virtual {v2}, Lcom/idv/identity/ocr/widget/RectMaskView;->getRectWidth()F

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    float-to-int v2, v2

    .line 26
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 27
    .line 28
    iget-object v2, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->l:Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 29
    .line 30
    invoke-virtual {v2}, Lcom/idv/identity/ocr/widget/RectMaskView;->getRectHeigth()F

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    float-to-int v2, v2

    .line 35
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    sget v3, Ll/vac0;->a:I

    .line 42
    .line 43
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    .line 44
    .line 45
    .line 46
    iget-object v2, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->l:Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 47
    .line 48
    invoke-virtual {v2}, Lcom/idv/identity/ocr/widget/RectMaskView;->getRectTop()F

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    float-to-int v2, v2

    .line 53
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 54
    .line 55
    invoke-virtual {p2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 56
    .line 57
    .line 58
    sget-object v2, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    .line 59
    .line 60
    invoke-virtual {p2, v2}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->l:Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 67
    .line 68
    invoke-virtual {p1}, Lcom/idv/identity/ocr/widget/RectMaskView;->getRectLeft()F

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    float-to-int p1, p1

    .line 73
    invoke-virtual {v1, p1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 74
    .line 75
    .line 76
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->l:Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 77
    .line 78
    invoke-virtual {p0}, Lcom/idv/identity/ocr/widget/RectMaskView;->getRectLeft()F

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    float-to-int p0, p0

    .line 83
    invoke-virtual {v1, p0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    .line 84
    .line 85
    .line 86
    invoke-static {p2, v0}, Ll/kkl0;->x0(Landroid/view/View;I)V

    .line 87
    .line 88
    .line 89
    sget-object p0, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 90
    .line 91
    const/4 p1, 0x2

    .line 92
    new-array p1, p1, [F

    .line 93
    .line 94
    fill-array-data p1, :array_0

    .line 95
    .line 96
    .line 97
    invoke-static {p0, p1}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    filled-new-array {p0}, [Landroid/animation/PropertyValuesHolder;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-static {p2, p0}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    new-instance p1, Landroid/animation/AnimatorSet;

    .line 110
    .line 111
    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 112
    .line 113
    .line 114
    const/4 p2, 0x1

    .line 115
    new-array p2, p2, [Landroid/animation/Animator;

    .line 116
    .line 117
    aput-object p0, p2, v0

    .line 118
    .line 119
    invoke-virtual {p1, p2}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 120
    .line 121
    .line 122
    const-wide/16 v0, 0x1f4

    .line 123
    .line 124
    invoke-virtual {p1, v0, v1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 125
    .line 126
    .line 127
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->start()V

    .line 128
    .line 129
    .line 130
    return-void

    .line 131
    :array_0
    .array-data 4
        0x437a0000    # 250.0f
        0x0
    .end array-data
.end method

.method public static synthetic h1(Lcom/idv/identity/ocr/ui/CardScanActivity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/idv/identity/ocr/ui/CardScanActivity;->L2(Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private h3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/idv/identity/ocr/ui/CardScanActivity$x;)V
    .locals 3

    .line 1
    invoke-static {p5}, Lcom/idv/identity/platform/log/RecordService;->recordOcrAlertAppear(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->L:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    goto :goto_1

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->p0:Landroid/os/Handler;

    .line 10
    .line 11
    new-instance v1, Lcom/idv/identity/ocr/ui/CardScanActivity$m;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Lcom/idv/identity/ocr/ui/CardScanActivity$m;-><init>(Lcom/idv/identity/ocr/ui/CardScanActivity;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->W2()V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x1

    .line 23
    iput-boolean v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->L:Z

    .line 24
    .line 25
    sget v1, Ll/rcc0;->b:I

    .line 26
    .line 27
    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Lcom/idv/identity/platform/IdentityAlertOverlay;

    .line 32
    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    const/4 v2, 0x0

    .line 36
    invoke-direct {p0, v2}, Lcom/idv/identity/ocr/ui/CardScanActivity;->F1(Z)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1, p1}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setTitleText(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1, p2}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setMessageText(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    if-eqz p4, :cond_1

    .line 46
    .line 47
    invoke-virtual {v1, p4}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setCancelText(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1, v0}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setButtonType(Z)V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    invoke-virtual {v1, v2}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setButtonType(Z)V

    .line 55
    .line 56
    .line 57
    :goto_0
    invoke-virtual {v1, p3}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setConfirmText(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    new-instance p3, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    const-string p4, " setVisibility showMessageBox >>>> : [title]:"

    .line 63
    .line 64
    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    const-string p1, "  [message]:"

    .line 71
    .line 72
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    const-string p2, "CardScanActivity"

    .line 83
    .line 84
    invoke-static {p2, p1}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 88
    .line 89
    .line 90
    invoke-static {p5}, Ll/azb;->t(Ljava/lang/String;)Ll/azb$a;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-static {v1, p1}, Ll/azb;->a(Lcom/idv/identity/platform/IdentityAlertOverlay;Ll/azb$a;)V

    .line 95
    .line 96
    .line 97
    new-instance p1, Lcom/idv/identity/ocr/ui/CardScanActivity$n;

    .line 98
    .line 99
    invoke-direct {p1, p0, p5, p6}, Lcom/idv/identity/ocr/ui/CardScanActivity$n;-><init>(Lcom/idv/identity/ocr/ui/CardScanActivity;Ljava/lang/String;Lcom/idv/identity/ocr/ui/CardScanActivity$x;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v1, p1}, Lcom/idv/identity/platform/IdentityAlertOverlay;->setCommAlertOverlayListener(Lcom/idv/identity/platform/IdentityAlertOverlay$d;)V

    .line 103
    .line 104
    .line 105
    :cond_2
    :goto_1
    return-void
.end method

.method private i3()V
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->g3(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Lcom/idv/identity/base/R$string;->W:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget v1, Lcom/idv/identity/base/R$string;->S:I

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sget v1, Lcom/idv/identity/base/R$string;->Q:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    new-instance v8, Lcom/idv/identity/ocr/ui/CardScanActivity$r;

    .line 36
    .line 37
    invoke-direct {v8, p0}, Lcom/idv/identity/ocr/ui/CardScanActivity$r;-><init>(Lcom/idv/identity/ocr/ui/CardScanActivity;)V

    .line 38
    .line 39
    .line 40
    const/4 v6, 0x0

    .line 41
    const-string v7, "ocr_over_time_code"

    .line 42
    .line 43
    move-object v2, p0

    .line 44
    invoke-direct/range {v2 .. v8}, Lcom/idv/identity/ocr/ui/CardScanActivity;->h3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/idv/identity/ocr/ui/CardScanActivity$x;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method private init()V
    .locals 13

    .line 1
    sget v0, Ll/rcc0;->c:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->j:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-virtual {v0, p0, v1, v1, v2}, Lcom/idv/identity/platform/camera/CameraSurfaceView;->b(Landroid/content/Context;ZZ[Lcom/idv/identity/platform/config/DeviceSetting;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->j:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Lcom/idv/identity/platform/camera/CameraSurfaceView;->setCameraCallback(Ll/zpl;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    sget v0, Ll/rcc0;->a1:I

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Landroid/widget/FrameLayout;

    .line 30
    .line 31
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->p:Landroid/widget/FrameLayout;

    .line 32
    .line 33
    sget v0, Ll/rcc0;->c1:I

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Lcom/idv/identity/platform/SystemLoadingOverlay;

    .line 40
    .line 41
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->o:Lcom/idv/identity/platform/SystemLoadingOverlay;

    .line 42
    .line 43
    sget v0, Ll/rcc0;->m:I

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Landroid/widget/TextView;

    .line 50
    .line 51
    if-eqz v0, :cond_1

    .line 52
    .line 53
    sget-object v2, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 54
    .line 55
    sget v3, Ll/y8c0;->l:I

    .line 56
    .line 57
    invoke-virtual {v2, v3}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrTitleColor(I)I

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->d2()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    :cond_1
    sget-object v0, Ll/hfm;->i:Ljava/lang/String;

    .line 72
    .line 73
    const/4 v2, 0x1

    .line 74
    if-eqz v0, :cond_2

    .line 75
    .line 76
    const-string v3, "Left"

    .line 77
    .line 78
    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_2

    .line 83
    .line 84
    move v0, v1

    .line 85
    goto :goto_0

    .line 86
    :cond_2
    move v0, v2

    .line 87
    :goto_0
    sget v3, Ll/rcc0;->s:I

    .line 88
    .line 89
    invoke-virtual {p0, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    check-cast v3, Landroid/widget/ImageView;

    .line 94
    .line 95
    sget v4, Ll/rcc0;->t:I

    .line 96
    .line 97
    invoke-virtual {p0, v4}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    check-cast v4, Landroid/widget/ImageView;

    .line 102
    .line 103
    if-eqz v3, :cond_4

    .line 104
    .line 105
    invoke-static {}, Ll/azb;->j()Landroid/graphics/Bitmap;

    .line 106
    .line 107
    .line 108
    move-result-object v5

    .line 109
    if-eqz v5, :cond_3

    .line 110
    .line 111
    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 112
    .line 113
    .line 114
    :cond_3
    new-instance v5, Lcom/idv/identity/ocr/ui/CardScanActivity$c;

    .line 115
    .line 116
    invoke-direct {v5, p0}, Lcom/idv/identity/ocr/ui/CardScanActivity$c;-><init>(Lcom/idv/identity/ocr/ui/CardScanActivity;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v3, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 120
    .line 121
    .line 122
    :cond_4
    sget v5, Ll/rcc0;->r:I

    .line 123
    .line 124
    invoke-virtual {p0, v5}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 125
    .line 126
    .line 127
    move-result-object v5

    .line 128
    check-cast v5, Landroid/widget/ImageView;

    .line 129
    .line 130
    sget v6, Ll/rcc0;->v:I

    .line 131
    .line 132
    invoke-virtual {p0, v6}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 133
    .line 134
    .line 135
    move-result-object v6

    .line 136
    check-cast v6, Landroid/widget/ImageView;

    .line 137
    .line 138
    invoke-static {}, Ll/azb;->q()Landroid/graphics/Bitmap;

    .line 139
    .line 140
    .line 141
    move-result-object v7

    .line 142
    if-eqz v7, :cond_5

    .line 143
    .line 144
    invoke-virtual {v6, v7}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 145
    .line 146
    .line 147
    :cond_5
    if-eqz v5, :cond_6

    .line 148
    .line 149
    new-instance v7, Lcom/idv/identity/ocr/ui/CardScanActivity$d;

    .line 150
    .line 151
    invoke-direct {v7, p0}, Lcom/idv/identity/ocr/ui/CardScanActivity$d;-><init>(Lcom/idv/identity/ocr/ui/CardScanActivity;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v5, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 155
    .line 156
    .line 157
    :cond_6
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 158
    .line 159
    .line 160
    move-result-object v7

    .line 161
    check-cast v7, Landroid/widget/LinearLayout$LayoutParams;

    .line 162
    .line 163
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 164
    .line 165
    .line 166
    move-result-object v8

    .line 167
    check-cast v8, Landroid/widget/LinearLayout$LayoutParams;

    .line 168
    .line 169
    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 170
    .line 171
    .line 172
    move-result-object v9

    .line 173
    check-cast v9, Landroid/widget/LinearLayout$LayoutParams;

    .line 174
    .line 175
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 176
    .line 177
    .line 178
    move-result-object v10

    .line 179
    check-cast v10, Landroid/widget/LinearLayout$LayoutParams;

    .line 180
    .line 181
    const v11, 0x800003

    .line 182
    .line 183
    .line 184
    const v12, 0x800005

    .line 185
    .line 186
    .line 187
    if-eqz v0, :cond_7

    .line 188
    .line 189
    const v0, 0x800013

    .line 190
    .line 191
    .line 192
    iput v0, v7, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 193
    .line 194
    iput v11, v8, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 195
    .line 196
    invoke-virtual {v3, v7}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {v4, v8}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 200
    .line 201
    .line 202
    iput v12, v9, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 203
    .line 204
    iput v12, v10, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 205
    .line 206
    invoke-virtual {v6, v9}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 207
    .line 208
    .line 209
    invoke-virtual {v5, v10}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 210
    .line 211
    .line 212
    goto :goto_1

    .line 213
    :cond_7
    iput v12, v7, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 214
    .line 215
    iput v12, v8, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 216
    .line 217
    invoke-virtual {v3, v7}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 218
    .line 219
    .line 220
    invoke-virtual {v4, v8}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 221
    .line 222
    .line 223
    iput v11, v9, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 224
    .line 225
    iput v11, v10, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 226
    .line 227
    invoke-virtual {v6, v9}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 228
    .line 229
    .line 230
    invoke-virtual {v5, v10}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 231
    .line 232
    .line 233
    :goto_1
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->Z1()Landroid/widget/ImageView;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    if-eqz v0, :cond_9

    .line 238
    .line 239
    invoke-static {}, Ll/azb;->o()Landroid/graphics/Bitmap;

    .line 240
    .line 241
    .line 242
    move-result-object v3

    .line 243
    if-eqz v3, :cond_8

    .line 244
    .line 245
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 246
    .line 247
    .line 248
    :cond_8
    new-instance v3, Lcom/idv/identity/ocr/ui/CardScanActivity$e;

    .line 249
    .line 250
    invoke-direct {v3, p0}, Lcom/idv/identity/ocr/ui/CardScanActivity$e;-><init>(Lcom/idv/identity/ocr/ui/CardScanActivity;)V

    .line 251
    .line 252
    .line 253
    invoke-virtual {v0, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 254
    .line 255
    .line 256
    :cond_9
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->X1()Landroid/widget/TextView;

    .line 257
    .line 258
    .line 259
    move-result-object v0

    .line 260
    if-eqz v0, :cond_a

    .line 261
    .line 262
    sget-object v3, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 263
    .line 264
    sget v4, Ll/y9c0;->j:I

    .line 265
    .line 266
    invoke-virtual {v3, v4}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrSubmitTitleColor(I)I

    .line 267
    .line 268
    .line 269
    move-result v3

    .line 270
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 271
    .line 272
    .line 273
    :cond_a
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->h2()Landroid/widget/ImageView;

    .line 274
    .line 275
    .line 276
    move-result-object v0

    .line 277
    if-eqz v0, :cond_c

    .line 278
    .line 279
    invoke-static {}, Ll/azb;->n()Landroid/graphics/Bitmap;

    .line 280
    .line 281
    .line 282
    move-result-object v3

    .line 283
    if-eqz v3, :cond_b

    .line 284
    .line 285
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 286
    .line 287
    .line 288
    :cond_b
    new-instance v3, Lcom/idv/identity/ocr/ui/CardScanActivity$f;

    .line 289
    .line 290
    invoke-direct {v3, p0}, Lcom/idv/identity/ocr/ui/CardScanActivity$f;-><init>(Lcom/idv/identity/ocr/ui/CardScanActivity;)V

    .line 291
    .line 292
    .line 293
    invoke-virtual {v0, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 294
    .line 295
    .line 296
    :cond_c
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->e2()Landroid/widget/ImageView;

    .line 297
    .line 298
    .line 299
    move-result-object v0

    .line 300
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->g2()Landroid/widget/LinearLayout;

    .line 301
    .line 302
    .line 303
    move-result-object v3

    .line 304
    if-eqz v3, :cond_d

    .line 305
    .line 306
    new-instance v4, Lcom/idv/identity/ocr/ui/CardScanActivity$g;

    .line 307
    .line 308
    invoke-direct {v4, p0}, Lcom/idv/identity/ocr/ui/CardScanActivity$g;-><init>(Lcom/idv/identity/ocr/ui/CardScanActivity;)V

    .line 309
    .line 310
    .line 311
    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 312
    .line 313
    .line 314
    :cond_d
    if-eqz v0, :cond_e

    .line 315
    .line 316
    invoke-static {}, Ll/azb;->g()Landroid/graphics/Bitmap;

    .line 317
    .line 318
    .line 319
    move-result-object v3

    .line 320
    if-eqz v3, :cond_e

    .line 321
    .line 322
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 323
    .line 324
    .line 325
    :cond_e
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->k:Lcom/idv/identity/ocr/IdentityScanView;

    .line 326
    .line 327
    if-eqz v0, :cond_10

    .line 328
    .line 329
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->c2()Landroid/graphics/drawable/Drawable;

    .line 330
    .line 331
    .line 332
    move-result-object v3

    .line 333
    iget-object v4, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->q:Lcom/idv/identity/ocr/OcrType;

    .line 334
    .line 335
    sget-object v5, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_FRONT:Lcom/idv/identity/ocr/OcrType;

    .line 336
    .line 337
    if-ne v4, v5, :cond_f

    .line 338
    .line 339
    move v1, v2

    .line 340
    :cond_f
    sget-object v4, Ll/cfm;->a:Ljava/lang/String;

    .line 341
    .line 342
    iget-object v5, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->r:Ljava/lang/String;

    .line 343
    .line 344
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 345
    .line 346
    .line 347
    move-result v4

    .line 348
    invoke-virtual {v0, v3, v1, v4}, Lcom/idv/identity/ocr/IdentityScanView;->h(Landroid/graphics/drawable/Drawable;ZZ)V

    .line 349
    .line 350
    .line 351
    :cond_10
    invoke-direct {p0, v2}, Lcom/idv/identity/ocr/ui/CardScanActivity;->F1(Z)V

    .line 352
    .line 353
    .line 354
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->q:Lcom/idv/identity/ocr/OcrType;

    .line 355
    .line 356
    invoke-direct {p0, v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->m3(Lcom/idv/identity/ocr/OcrType;)V

    .line 357
    .line 358
    .line 359
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->R1()Landroid/widget/TextView;

    .line 360
    .line 361
    .line 362
    move-result-object v0

    .line 363
    sget-object v1, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 364
    .line 365
    sget v2, Ll/y9c0;->j:I

    .line 366
    .line 367
    invoke-virtual {v1, v2}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrTakePhotoLabelColor(I)I

    .line 368
    .line 369
    .line 370
    move-result v1

    .line 371
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 372
    .line 373
    .line 374
    sget v0, Ll/rcc0;->G0:I

    .line 375
    .line 376
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 377
    .line 378
    .line 379
    move-result-object p0

    .line 380
    check-cast p0, Landroid/widget/TextView;

    .line 381
    .line 382
    sget-object v0, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 383
    .line 384
    sget v1, Ll/y9c0;->j:I

    .line 385
    .line 386
    invoke-virtual {v0, v1}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrAlbumLabelColor(I)I

    .line 387
    .line 388
    .line 389
    move-result v0

    .line 390
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 391
    .line 392
    .line 393
    return-void
.end method

.method public static synthetic j1(Lcom/idv/identity/ocr/ui/CardScanActivity;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->F1(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private j3(Z)Z
    .locals 4

    .line 1
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "com.idv.identity.face.IdentityFaceApi"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "start"

    .line 12
    .line 13
    const-class v2, Landroid/content/Context;

    .line 14
    .line 15
    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    .line 16
    .line 17
    filled-new-array {v2, v3}, [Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const/4 p1, 0x0

    .line 34
    invoke-virtual {v0, p1, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    check-cast p0, Ljava/lang/Boolean;

    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 41
    .line 42
    .line 43
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    return p0

    .line 45
    :catch_0
    move-exception p0

    .line 46
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 47
    .line 48
    .line 49
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    sget-object v0, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 54
    .line 55
    const-string v1, "exception"

    .line 56
    .line 57
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string v2, "status"

    .line 62
    .line 63
    const-string v3, "catchException"

    .line 64
    .line 65
    filled-new-array {v2, v3, v1, p0}, [Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    const-string v1, "startFace"

    .line 70
    .line 71
    invoke-virtual {p1, v0, v1, p0}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    const/4 p0, 0x0

    .line 75
    return p0
.end method

.method public static synthetic k1(Lcom/idv/identity/ocr/ui/CardScanActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->V2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private k2()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->P1()Landroid/widget/LinearLayout;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ll/afm;->b0()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "auto"

    .line 14
    .line 15
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_2

    .line 20
    .line 21
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->u:Ljava/lang/String;

    .line 22
    .line 23
    sget-object v2, Lcom/idv/identity/ocr/ui/CardScanActivity;->H0:Ljava/lang/String;

    .line 24
    .line 25
    if-ne v1, v2, :cond_0

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->n3()V

    .line 32
    .line 33
    .line 34
    new-instance v1, Lcom/idv/identity/ocr/ui/CardScanActivity$h;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Lcom/idv/identity/ocr/ui/CardScanActivity$h;-><init>(Lcom/idv/identity/ocr/ui/CardScanActivity;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    sget-object v0, Lcom/idv/identity/ocr/ui/CardScanActivity;->J0:Ljava/lang/String;

    .line 44
    .line 45
    if-ne v1, v0, :cond_1

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->n3()V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    sget-object v0, Lcom/idv/identity/ocr/ui/CardScanActivity;->I0:Ljava/lang/String;

    .line 52
    .line 53
    if-ne v1, v0, :cond_4

    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->o3()V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_2
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0}, Ll/afm;->b0()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    const-string v1, "scan"

    .line 68
    .line 69
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_3

    .line 74
    .line 75
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->T2()V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_3
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v0}, Ll/afm;->b0()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    const-string v1, "shoot"

    .line 88
    .line 89
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-eqz v0, :cond_4

    .line 94
    .line 95
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->U2()V

    .line 96
    .line 97
    .line 98
    :cond_4
    return-void
.end method

.method private k3(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->j:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->J:Z

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lcom/idv/identity/platform/camera/CameraSurfaceView;->a(Z)V

    .line 8
    .line 9
    .line 10
    sget p1, Ll/rcc0;->v:I

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Landroid/widget/ImageView;

    .line 17
    .line 18
    if-eqz p1, :cond_3

    .line 19
    .line 20
    iget-boolean p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->J:Z

    .line 21
    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    invoke-static {}, Ll/azb;->k()Landroid/graphics/Bitmap;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    if-eqz p0, :cond_0

    .line 29
    .line 30
    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    sget p0, Ll/yac0;->f:I

    .line 35
    .line 36
    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    invoke-static {}, Ll/azb;->q()Landroid/graphics/Bitmap;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-static {}, Ll/azb;->q()Landroid/graphics/Bitmap;

    .line 45
    .line 46
    .line 47
    if-eqz p0, :cond_2

    .line 48
    .line 49
    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_2
    sget p0, Ll/yac0;->e:I

    .line 54
    .line 55
    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 56
    .line 57
    .line 58
    :cond_3
    return-void
.end method

.method public static synthetic l1(Lcom/idv/identity/ocr/ui/CardScanActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->o2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic m1(Lcom/idv/identity/ocr/ui/CardScanActivity;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->K1(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private m2()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->I:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sget v1, Ll/vac0;->b:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    sget v1, Ll/rcc0;->f:I

    .line 21
    .line 22
    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Landroid/widget/LinearLayout;

    .line 27
    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    int-to-float v1, v1

    .line 35
    goto :goto_0

    .line 36
    :cond_1
    const/4 v1, 0x0

    .line 37
    :goto_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    sget v3, Ll/vac0;->e:I

    .line 42
    .line 43
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    sget v3, Ll/rcc0;->m:I

    .line 48
    .line 49
    invoke-virtual {p0, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    check-cast v3, Landroid/widget/TextView;

    .line 54
    .line 55
    if-eqz v3, :cond_2

    .line 56
    .line 57
    iget-object v4, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->k:Lcom/idv/identity/ocr/IdentityScanView;

    .line 58
    .line 59
    if-eqz v4, :cond_2

    .line 60
    .line 61
    new-instance v4, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    const-string v5, "identityScanView setTop:"

    .line 64
    .line 65
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v3}, Landroid/view/View;->getBottom()I

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    int-to-float v5, v5

    .line 73
    add-float/2addr v5, v0

    .line 74
    add-float/2addr v5, v1

    .line 75
    add-float/2addr v5, v2

    .line 76
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    const-string v5, "CardScanActivity"

    .line 84
    .line 85
    invoke-static {v5, v4}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    iget-object v4, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->k:Lcom/idv/identity/ocr/IdentityScanView;

    .line 89
    .line 90
    invoke-virtual {v3}, Landroid/view/View;->getBottom()I

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    int-to-float v3, v3

    .line 95
    add-float/2addr v3, v0

    .line 96
    add-float/2addr v3, v1

    .line 97
    add-float/2addr v3, v2

    .line 98
    invoke-virtual {v4, v3}, Lcom/idv/identity/ocr/IdentityScanView;->setHoleTop(F)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->k:Lcom/idv/identity/ocr/IdentityScanView;

    .line 102
    .line 103
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    sget v2, Ll/vac0;->a:I

    .line 108
    .line 109
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    invoke-virtual {v0, v1}, Lcom/idv/identity/ocr/IdentityScanView;->setHoleLeft(F)V

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->k:Lcom/idv/identity/ocr/IdentityScanView;

    .line 117
    .line 118
    invoke-virtual {v0}, Lcom/idv/identity/ocr/IdentityScanView;->b()V

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->k:Lcom/idv/identity/ocr/IdentityScanView;

    .line 122
    .line 123
    invoke-virtual {v0}, Lcom/idv/identity/ocr/IdentityScanView;->g()V

    .line 124
    .line 125
    .line 126
    :cond_2
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->E1()Landroid/graphics/RectF;

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->q:Lcom/idv/identity/ocr/OcrType;

    .line 130
    .line 131
    invoke-direct {p0, v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->m3(Lcom/idv/identity/ocr/OcrType;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->l2()V

    .line 135
    .line 136
    .line 137
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->k2()V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method private m3(Lcom/idv/identity/ocr/OcrType;)V
    .locals 5

    .line 1
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 6
    .line 7
    const-string v2, "ocrType"

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    filled-new-array {v2, v3}, [Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    const-string v3, "switchOCRType"

    .line 18
    .line 19
    invoke-virtual {v0, v1, v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->q:Lcom/idv/identity/ocr/OcrType;

    .line 23
    .line 24
    const/4 p1, 0x0

    .line 25
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->y:Landroid/graphics/Bitmap;

    .line 26
    .line 27
    const/4 p1, 0x1

    .line 28
    invoke-virtual {p0, p1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->G1(Z)V

    .line 29
    .line 30
    .line 31
    invoke-direct {p0, p1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->K1(Z)V

    .line 32
    .line 33
    .line 34
    invoke-direct {p0, p1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->I1(Z)V

    .line 35
    .line 36
    .line 37
    invoke-direct {p0, p1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->J1(Z)V

    .line 38
    .line 39
    .line 40
    sget v0, Ll/rcc0;->m:I

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Landroid/widget/TextView;

    .line 47
    .line 48
    if-eqz v0, :cond_0

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->d2()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    :cond_0
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->V1()Landroid/widget/ImageView;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    const/16 v1, 0x8

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 64
    .line 65
    .line 66
    sget v0, Ll/rcc0;->z:I

    .line 67
    .line 68
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    const/4 v2, 0x0

    .line 73
    if-eqz v0, :cond_1

    .line 74
    .line 75
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 76
    .line 77
    .line 78
    :cond_1
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->X1()Landroid/widget/TextView;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    const/4 v3, 0x4

    .line 83
    if-eqz v0, :cond_2

    .line 84
    .line 85
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 86
    .line 87
    .line 88
    :cond_2
    sget v0, Ll/rcc0;->b:I

    .line 89
    .line 90
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    check-cast v0, Lcom/idv/identity/platform/IdentityAlertOverlay;

    .line 95
    .line 96
    if-eqz v0, :cond_3

    .line 97
    .line 98
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 99
    .line 100
    .line 101
    iput-boolean v2, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->L:Z

    .line 102
    .line 103
    invoke-virtual {p0, p1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->G1(Z)V

    .line 104
    .line 105
    .line 106
    :cond_3
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->p:Landroid/widget/FrameLayout;

    .line 107
    .line 108
    if-eqz v0, :cond_4

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 111
    .line 112
    .line 113
    :cond_4
    sget v0, Ll/rcc0;->u:I

    .line 114
    .line 115
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    check-cast v0, Landroid/widget/ImageView;

    .line 120
    .line 121
    if-eqz v0, :cond_5

    .line 122
    .line 123
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 124
    .line 125
    .line 126
    :cond_5
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->h2()Landroid/widget/ImageView;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    if-eqz v0, :cond_6

    .line 131
    .line 132
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 133
    .line 134
    .line 135
    :cond_6
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->g2()Landroid/widget/LinearLayout;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    if-eqz v0, :cond_7

    .line 140
    .line 141
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 142
    .line 143
    .line 144
    :cond_7
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->g2()Landroid/widget/LinearLayout;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    if-eqz v0, :cond_9

    .line 149
    .line 150
    sget-boolean v4, Ll/hfm;->g:Z

    .line 151
    .line 152
    if-eqz v4, :cond_8

    .line 153
    .line 154
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 155
    .line 156
    .line 157
    goto :goto_0

    .line 158
    :cond_8
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 159
    .line 160
    .line 161
    :cond_9
    :goto_0
    sget v0, Ll/rcc0;->A:I

    .line 162
    .line 163
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    check-cast v0, Landroid/widget/ImageView;

    .line 168
    .line 169
    if-eqz v0, :cond_a

    .line 170
    .line 171
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 172
    .line 173
    .line 174
    :cond_a
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->T1()Lcom/idv/identity/ocr/IdentityScanView;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->c2()Landroid/graphics/drawable/Drawable;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    iget-object v3, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->q:Lcom/idv/identity/ocr/OcrType;

    .line 183
    .line 184
    sget-object v4, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_FRONT:Lcom/idv/identity/ocr/OcrType;

    .line 185
    .line 186
    if-ne v3, v4, :cond_b

    .line 187
    .line 188
    goto :goto_1

    .line 189
    :cond_b
    move p1, v2

    .line 190
    :goto_1
    sget-object v2, Ll/cfm;->a:Ljava/lang/String;

    .line 191
    .line 192
    iget-object v3, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->r:Ljava/lang/String;

    .line 193
    .line 194
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 195
    .line 196
    .line 197
    move-result v2

    .line 198
    invoke-virtual {v0, v1, p1, v2}, Lcom/idv/identity/ocr/IdentityScanView;->h(Landroid/graphics/drawable/Drawable;ZZ)V

    .line 199
    .line 200
    .line 201
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->T1()Lcom/idv/identity/ocr/IdentityScanView;

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->q:Lcom/idv/identity/ocr/OcrType;

    .line 206
    .line 207
    invoke-virtual {p1, p0}, Lcom/idv/identity/ocr/IdentityScanView;->d(Lcom/idv/identity/ocr/OcrType;)V

    .line 208
    .line 209
    .line 210
    return-void
.end method

.method public static synthetic n1(Lcom/idv/identity/ocr/ui/CardScanActivity;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->r2(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o1(Lcom/idv/identity/ocr/ui/CardScanActivity;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->J1(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private o2()V
    .locals 9

    .line 1
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 6
    .line 7
    const-string v2, "exitVerifyBtn"

    .line 8
    .line 9
    const-string v3, "OCR_SCAN"

    .line 10
    .line 11
    const-string v4, "PAGER_BEHAVIOR"

    .line 12
    .line 13
    invoke-virtual {v0, v1, v4, v2, v3}, Lcom/idv/identity/platform/log/RecordService;->recordEventBehavior(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget v1, Lcom/idv/identity/base/R$string;->T:I

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sget v1, Lcom/idv/identity/base/R$string;->Q:I

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    sget v1, Lcom/idv/identity/base/R$string;->N:I

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v6

    .line 46
    new-instance v8, Lcom/idv/identity/ocr/ui/CardScanActivity$b;

    .line 47
    .line 48
    invoke-direct {v8, p0}, Lcom/idv/identity/ocr/ui/CardScanActivity$b;-><init>(Lcom/idv/identity/ocr/ui/CardScanActivity;)V

    .line 49
    .line 50
    .line 51
    const-string v4, ""

    .line 52
    .line 53
    const-string v7, "ocr_exit_code"

    .line 54
    .line 55
    move-object v2, p0

    .line 56
    invoke-direct/range {v2 .. v8}, Lcom/idv/identity/ocr/ui/CardScanActivity;->h3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/idv/identity/ocr/ui/CardScanActivity$x;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public static synthetic p1(Lcom/idv/identity/ocr/ui/CardScanActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->q2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic q1(Lcom/idv/identity/ocr/ui/CardScanActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->I2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private q2()V
    .locals 25

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-static {}, Ll/hki;->d()Ll/hki;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ll/hki;->f()V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Ll/afm;->d0()Lcom/idv/identity/platform/config/OSSConfig;

    .line 15
    .line 16
    .line 17
    move-result-object v7

    .line 18
    const-string v1, "errMsg"

    .line 19
    .line 20
    const-string v2, "error"

    .line 21
    .line 22
    const-string v3, "status"

    .line 23
    .line 24
    const-string v8, "submitPhoto"

    .line 25
    .line 26
    if-eqz v7, :cond_8

    .line 27
    .line 28
    iget-object v4, v7, Lcom/idv/identity/platform/config/OSSConfig;->FileNamePrefix:Ljava/lang/String;

    .line 29
    .line 30
    if-eqz v4, :cond_8

    .line 31
    .line 32
    iget-object v4, v7, Lcom/idv/identity/platform/config/OSSConfig;->OssEndPoint:Ljava/lang/String;

    .line 33
    .line 34
    if-eqz v4, :cond_8

    .line 35
    .line 36
    iget-object v4, v7, Lcom/idv/identity/platform/config/OSSConfig;->AccessKeyId:Ljava/lang/String;

    .line 37
    .line 38
    if-eqz v4, :cond_8

    .line 39
    .line 40
    iget-object v4, v7, Lcom/idv/identity/platform/config/OSSConfig;->AccessKeySecret:Ljava/lang/String;

    .line 41
    .line 42
    if-nez v4, :cond_0

    .line 43
    .line 44
    goto/16 :goto_2

    .line 45
    .line 46
    :cond_0
    iget-object v4, v0, Lcom/idv/identity/ocr/ui/CardScanActivity;->z:Landroid/graphics/Bitmap;

    .line 47
    .line 48
    invoke-static {v4}, Ll/ac00;->b(Landroid/graphics/Bitmap;)[B

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    iget-object v5, v0, Lcom/idv/identity/ocr/ui/CardScanActivity;->E0:Ll/xxb;

    .line 53
    .line 54
    if-eqz v5, :cond_1

    .line 55
    .line 56
    invoke-virtual {v5}, Ll/xxb;->c()Z

    .line 57
    .line 58
    .line 59
    move-result v5

    .line 60
    if-eqz v5, :cond_1

    .line 61
    .line 62
    if-eqz v4, :cond_1

    .line 63
    .line 64
    iget-object v5, v0, Lcom/idv/identity/ocr/ui/CardScanActivity;->E0:Ll/xxb;

    .line 65
    .line 66
    invoke-virtual {v5, v4}, Ll/xxb;->a([B)[B

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    :cond_1
    move-object v6, v4

    .line 71
    if-nez v6, :cond_2

    .line 72
    .line 73
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    sget-object v4, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 78
    .line 79
    const-string v5, "ocrCropBitmap is null."

    .line 80
    .line 81
    filled-new-array {v3, v2, v1, v5}, [Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {v0, v4, v8, v1}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_2
    sget-object v4, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_FRONT:Lcom/idv/identity/ocr/OcrType;

    .line 90
    .line 91
    iget-object v5, v0, Lcom/idv/identity/ocr/ui/CardScanActivity;->q:Lcom/idv/identity/ocr/OcrType;

    .line 92
    .line 93
    const-string v9, "jpeg"

    .line 94
    .line 95
    if-ne v4, v5, :cond_3

    .line 96
    .line 97
    iget-object v1, v7, Lcom/idv/identity/platform/config/OSSConfig;->FileNamePrefix:Ljava/lang/String;

    .line 98
    .line 99
    const-string v2, "ocridface"

    .line 100
    .line 101
    invoke-static {v1, v2, v9}, Ll/ac00;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v5

    .line 105
    invoke-static {}, Ll/hki;->d()Ll/hki;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    const/4 v3, 0x1

    .line 110
    iget-object v4, v7, Lcom/idv/identity/platform/config/OSSConfig;->BucketName:Ljava/lang/String;

    .line 111
    .line 112
    invoke-virtual/range {v2 .. v7}, Ll/hki;->b(ILjava/lang/String;Ljava/lang/String;[BLcom/idv/identity/platform/config/OSSConfig;)V

    .line 113
    .line 114
    .line 115
    :goto_0
    move-object v14, v5

    .line 116
    goto :goto_1

    .line 117
    :cond_3
    sget-object v4, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_BACK:Lcom/idv/identity/ocr/OcrType;

    .line 118
    .line 119
    if-ne v4, v5, :cond_4

    .line 120
    .line 121
    iget-object v1, v7, Lcom/idv/identity/platform/config/OSSConfig;->FileNamePrefix:Ljava/lang/String;

    .line 122
    .line 123
    const-string v2, "ocridback"

    .line 124
    .line 125
    invoke-static {v1, v2, v9}, Ll/ac00;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v5

    .line 129
    invoke-static {}, Ll/hki;->d()Ll/hki;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    const/4 v3, 0x2

    .line 134
    iget-object v4, v7, Lcom/idv/identity/platform/config/OSSConfig;->BucketName:Ljava/lang/String;

    .line 135
    .line 136
    invoke-virtual/range {v2 .. v7}, Ll/hki;->b(ILjava/lang/String;Ljava/lang/String;[BLcom/idv/identity/platform/config/OSSConfig;)V

    .line 137
    .line 138
    .line 139
    goto :goto_0

    .line 140
    :cond_4
    sget-object v4, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_THIRD:Lcom/idv/identity/ocr/OcrType;

    .line 141
    .line 142
    if-ne v4, v5, :cond_5

    .line 143
    .line 144
    iget-object v1, v7, Lcom/idv/identity/platform/config/OSSConfig;->FileNamePrefix:Ljava/lang/String;

    .line 145
    .line 146
    const-string v2, "ocridthrid"

    .line 147
    .line 148
    invoke-static {v1, v2, v9}, Ll/ac00;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v5

    .line 152
    invoke-static {}, Ll/hki;->d()Ll/hki;

    .line 153
    .line 154
    .line 155
    move-result-object v2

    .line 156
    const/16 v3, 0xb

    .line 157
    .line 158
    iget-object v4, v7, Lcom/idv/identity/platform/config/OSSConfig;->BucketName:Ljava/lang/String;

    .line 159
    .line 160
    invoke-virtual/range {v2 .. v7}, Ll/hki;->b(ILjava/lang/String;Ljava/lang/String;[BLcom/idv/identity/platform/config/OSSConfig;)V

    .line 161
    .line 162
    .line 163
    goto :goto_0

    .line 164
    :cond_5
    sget-object v4, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_BACK_3D:Lcom/idv/identity/ocr/OcrType;

    .line 165
    .line 166
    if-ne v4, v5, :cond_6

    .line 167
    .line 168
    iget-object v1, v7, Lcom/idv/identity/platform/config/OSSConfig;->FileNamePrefix:Ljava/lang/String;

    .line 169
    .line 170
    const-string v2, "ocridback_3d"

    .line 171
    .line 172
    invoke-static {v1, v2, v9}, Ll/ac00;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v5

    .line 176
    invoke-static {}, Ll/hki;->d()Ll/hki;

    .line 177
    .line 178
    .line 179
    move-result-object v2

    .line 180
    const/16 v3, 0x14

    .line 181
    .line 182
    iget-object v4, v7, Lcom/idv/identity/platform/config/OSSConfig;->BucketName:Ljava/lang/String;

    .line 183
    .line 184
    invoke-virtual/range {v2 .. v7}, Ll/hki;->b(ILjava/lang/String;Ljava/lang/String;[BLcom/idv/identity/platform/config/OSSConfig;)V

    .line 185
    .line 186
    .line 187
    goto :goto_0

    .line 188
    :cond_6
    sget-object v4, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_FRONT_3D:Lcom/idv/identity/ocr/OcrType;

    .line 189
    .line 190
    if-ne v4, v5, :cond_7

    .line 191
    .line 192
    iget-object v1, v7, Lcom/idv/identity/platform/config/OSSConfig;->FileNamePrefix:Ljava/lang/String;

    .line 193
    .line 194
    const-string v2, "ocridface_3d"

    .line 195
    .line 196
    invoke-static {v1, v2, v9}, Ll/ac00;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v5

    .line 200
    invoke-static {}, Ll/hki;->d()Ll/hki;

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    const/16 v3, 0xa

    .line 205
    .line 206
    iget-object v4, v7, Lcom/idv/identity/platform/config/OSSConfig;->BucketName:Ljava/lang/String;

    .line 207
    .line 208
    invoke-virtual/range {v2 .. v7}, Ll/hki;->b(ILjava/lang/String;Ljava/lang/String;[BLcom/idv/identity/platform/config/OSSConfig;)V

    .line 209
    .line 210
    .line 211
    goto :goto_0

    .line 212
    :goto_1
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 213
    .line 214
    .line 215
    move-result-object v1

    .line 216
    sget-object v2, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 217
    .line 218
    iget-object v3, v0, Lcom/idv/identity/ocr/ui/CardScanActivity;->q:Lcom/idv/identity/ocr/OcrType;

    .line 219
    .line 220
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object v12

    .line 224
    iget-object v3, v0, Lcom/idv/identity/ocr/ui/CardScanActivity;->z:Landroid/graphics/Bitmap;

    .line 225
    .line 226
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    .line 227
    .line 228
    .line 229
    move-result v3

    .line 230
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object v18

    .line 234
    iget-object v3, v0, Lcom/idv/identity/ocr/ui/CardScanActivity;->z:Landroid/graphics/Bitmap;

    .line 235
    .line 236
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    .line 237
    .line 238
    .line 239
    move-result v3

    .line 240
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object v20

    .line 244
    iget-object v3, v0, Lcom/idv/identity/ocr/ui/CardScanActivity;->A:Landroid/graphics/Bitmap;

    .line 245
    .line 246
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    .line 247
    .line 248
    .line 249
    move-result v3

    .line 250
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object v22

    .line 254
    iget-object v3, v0, Lcom/idv/identity/ocr/ui/CardScanActivity;->A:Landroid/graphics/Bitmap;

    .line 255
    .line 256
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    .line 257
    .line 258
    .line 259
    move-result v3

    .line 260
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object v24

    .line 264
    const-string v9, "status"

    .line 265
    .line 266
    const-string v10, "success"

    .line 267
    .line 268
    const-string v11, "ocrType"

    .line 269
    .line 270
    const-string v13, "ossFileName"

    .line 271
    .line 272
    const-string v15, "ossOriginFileName"

    .line 273
    .line 274
    const-string v16, ""

    .line 275
    .line 276
    const-string v17, "w"

    .line 277
    .line 278
    const-string v19, "h"

    .line 279
    .line 280
    const-string v21, "oriW"

    .line 281
    .line 282
    const-string v23, "oriH"

    .line 283
    .line 284
    filled-new-array/range {v9 .. v24}, [Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object v3

    .line 288
    invoke-virtual {v1, v2, v8, v3}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 289
    .line 290
    .line 291
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 292
    .line 293
    .line 294
    move-result-wide v1

    .line 295
    invoke-static {}, Ll/hki;->d()Ll/hki;

    .line 296
    .line 297
    .line 298
    move-result-object v3

    .line 299
    new-instance v4, Lcom/idv/identity/ocr/ui/CardScanActivity$j;

    .line 300
    .line 301
    invoke-direct {v4, v0, v1, v2}, Lcom/idv/identity/ocr/ui/CardScanActivity$j;-><init>(Lcom/idv/identity/ocr/ui/CardScanActivity;J)V

    .line 302
    .line 303
    .line 304
    invoke-virtual {v3, v0, v4}, Ll/hki;->h(Landroid/content/Context;Ll/hki$d;)V

    .line 305
    .line 306
    .line 307
    return-void

    .line 308
    :cond_7
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 309
    .line 310
    .line 311
    move-result-object v4

    .line 312
    sget-object v5, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 313
    .line 314
    new-instance v6, Ljava/lang/StringBuilder;

    .line 315
    .line 316
    const-string v7, "ocrType is "

    .line 317
    .line 318
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 319
    .line 320
    .line 321
    iget-object v0, v0, Lcom/idv/identity/ocr/ui/CardScanActivity;->q:Lcom/idv/identity/ocr/OcrType;

    .line 322
    .line 323
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 324
    .line 325
    .line 326
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 327
    .line 328
    .line 329
    move-result-object v0

    .line 330
    filled-new-array {v3, v2, v1, v0}, [Ljava/lang/String;

    .line 331
    .line 332
    .line 333
    move-result-object v0

    .line 334
    invoke-virtual {v4, v5, v8, v0}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 335
    .line 336
    .line 337
    return-void

    .line 338
    :cond_8
    :goto_2
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 339
    .line 340
    .line 341
    move-result-object v0

    .line 342
    sget-object v4, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 343
    .line 344
    const-string v5, "ossConfig is null."

    .line 345
    .line 346
    filled-new-array {v3, v2, v1, v5}, [Ljava/lang/String;

    .line 347
    .line 348
    .line 349
    move-result-object v1

    .line 350
    invoke-virtual {v0, v4, v8, v1}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 351
    .line 352
    .line 353
    return-void
.end method

.method public static synthetic r1(Lcom/idv/identity/ocr/ui/CardScanActivity;Landroid/graphics/Bitmap;ZLcom/idv/identity/base/algorithm/doc/Attr;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/idv/identity/ocr/ui/CardScanActivity;->K2(Landroid/graphics/Bitmap;ZLcom/idv/identity/base/algorithm/doc/Attr;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private r2(Z)V
    .locals 6

    .line 1
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 6
    .line 7
    new-instance v2, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v3, ""

    .line 16
    .line 17
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    const-string v3, "status"

    .line 25
    .line 26
    const-string v4, "success"

    .line 27
    .line 28
    const-string v5, "isAuto"

    .line 29
    .line 30
    filled-new-array {v3, v4, v5, v2}, [Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    const-string v3, "clickTakePhoto"

    .line 35
    .line 36
    invoke-virtual {v0, v1, v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->j:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/idv/identity/platform/camera/CameraSurfaceView;->getCameraInterface()Ll/dql;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    new-instance v1, Lcom/idv/identity/ocr/ui/CardScanActivity$i;

    .line 48
    .line 49
    invoke-direct {v1, p0, p1}, Lcom/idv/identity/ocr/ui/CardScanActivity$i;-><init>(Lcom/idv/identity/ocr/ui/CardScanActivity;Z)V

    .line 50
    .line 51
    .line 52
    invoke-interface {v0, v1}, Ll/dql;->c(Ll/iql;)V

    .line 53
    .line 54
    .line 55
    :cond_0
    return-void
.end method

.method public static synthetic s1(Lcom/idv/identity/ocr/ui/CardScanActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->C2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private s2(Ljava/lang/String;)V
    .locals 9

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    sget-object v0, Ll/dfm;->i:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Ll/dfm;->j:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget v1, Lcom/idv/identity/base/R$string;->D:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sget v1, Lcom/idv/identity/base/R$string;->A:I

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    sget v1, Lcom/idv/identity/base/R$string;->t:I

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    new-instance v8, Lcom/idv/identity/ocr/ui/CardScanActivity$p;

    .line 50
    .line 51
    invoke-direct {v8, p0, p1}, Lcom/idv/identity/ocr/ui/CardScanActivity$p;-><init>(Lcom/idv/identity/ocr/ui/CardScanActivity;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    const/4 v6, 0x0

    .line 55
    move-object v2, p0

    .line 56
    move-object v7, p1

    .line 57
    invoke-direct/range {v2 .. v8}, Lcom/idv/identity/ocr/ui/CardScanActivity;->h3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/idv/identity/ocr/ui/CardScanActivity$x;)V

    .line 58
    .line 59
    .line 60
    :cond_1
    return-void
.end method

.method public static synthetic t1(Lcom/idv/identity/ocr/ui/CardScanActivity;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->L:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic u1(Lcom/idv/identity/ocr/ui/CardScanActivity;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->I:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic v1(Lcom/idv/identity/ocr/ui/CardScanActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->A2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private v2()V
    .locals 4

    .line 1
    iget v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->s:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->s:I

    .line 6
    .line 7
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/afm;->i0()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Ll/afm;->u()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    sget-object v2, Ll/ffm;->f:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-nez v2, :cond_0

    .line 30
    .line 31
    iget v2, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->s:I

    .line 32
    .line 33
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-virtual {v3}, Ll/afm;->t()Ljava/util/List;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    add-int/lit8 v3, v3, -0x1

    .line 46
    .line 47
    if-gt v2, v3, :cond_1

    .line 48
    .line 49
    :cond_0
    sget-object v2, Ll/ffm;->f:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_2

    .line 56
    .line 57
    iget v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->s:I

    .line 58
    .line 59
    if-lt v0, v1, :cond_2

    .line 60
    .line 61
    :cond_1
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-nez v0, :cond_3

    .line 66
    .line 67
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->H2()V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_2
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->I:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 72
    .line 73
    const/4 v1, 0x0

    .line 74
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 75
    .line 76
    .line 77
    sget v0, Ll/hfm;->j:I

    .line 78
    .line 79
    iput v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->w:I

    .line 80
    .line 81
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->V2()V

    .line 82
    .line 83
    .line 84
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->c3()V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->k:Lcom/idv/identity/ocr/IdentityScanView;

    .line 88
    .line 89
    if-eqz v0, :cond_3

    .line 90
    .line 91
    new-instance v1, Lcom/idv/identity/ocr/ui/CardScanActivity$q;

    .line 92
    .line 93
    invoke-direct {v1, p0}, Lcom/idv/identity/ocr/ui/CardScanActivity$q;-><init>(Lcom/idv/identity/ocr/ui/CardScanActivity;)V

    .line 94
    .line 95
    .line 96
    const/16 p0, 0x1f4

    .line 97
    .line 98
    invoke-virtual {v0, p0, v1}, Lcom/idv/identity/ocr/IdentityScanView;->c(ILandroid/animation/Animator$AnimatorListener;)V

    .line 99
    .line 100
    .line 101
    :cond_3
    return-void
.end method

.method public static synthetic w1(Lcom/idv/identity/ocr/ui/CardScanActivity;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->s2(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic y1(Lcom/idv/identity/ocr/ui/CardScanActivity;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->b3(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic z1(Lcom/idv/identity/ocr/ui/CardScanActivity;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->s:I

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public B2()V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->g3(Z)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-direct {p0, v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->e3(Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->p0:Landroid/os/Handler;

    .line 10
    .line 11
    const/16 v1, 0x3f5

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 21
    .line 22
    iget-object v2, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->q:Lcom/idv/identity/ocr/OcrType;

    .line 23
    .line 24
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    const-string v3, "status"

    .line 29
    .line 30
    const-string v4, "success"

    .line 31
    .line 32
    const-string v5, "ocrType"

    .line 33
    .line 34
    filled-new-array {v3, v4, v5, v2}, [Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    const-string v3, "ocrSuccess"

    .line 39
    .line 40
    invoke-virtual {v0, v1, v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->p0:Landroid/os/Handler;

    .line 44
    .line 45
    const/16 v0, 0x3ed

    .line 46
    .line 47
    const-wide/16 v1, 0x12c

    .line 48
    .line 49
    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public D2(Z)V
    .locals 10

    .line 1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/afm;->n()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget-object v0, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_FRONT:Lcom/idv/identity/ocr/OcrType;

    .line 10
    .line 11
    iget-object v2, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->q:Lcom/idv/identity/ocr/OcrType;

    .line 12
    .line 13
    const/4 v3, 0x1

    .line 14
    if-ne v0, v2, :cond_0

    .line 15
    .line 16
    invoke-static {}, Ll/hki;->d()Ll/hki;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0, v3}, Ll/hki;->e(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v2, "OCR_ID_FACE"

    .line 25
    .line 26
    :goto_0
    move-object v9, v2

    .line 27
    move-object v2, v0

    .line 28
    move v0, v3

    .line 29
    move-object v3, v9

    .line 30
    goto :goto_1

    .line 31
    :cond_0
    sget-object v0, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_BACK:Lcom/idv/identity/ocr/OcrType;

    .line 32
    .line 33
    if-ne v0, v2, :cond_1

    .line 34
    .line 35
    invoke-static {}, Ll/hki;->d()Ll/hki;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const/4 v2, 0x2

    .line 40
    invoke-virtual {v0, v2}, Ll/hki;->e(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const-string v2, "OCR_ID_BACK"

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    sget-object v0, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_THIRD:Lcom/idv/identity/ocr/OcrType;

    .line 48
    .line 49
    if-ne v0, v2, :cond_2

    .line 50
    .line 51
    invoke-static {}, Ll/hki;->d()Ll/hki;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    const/16 v2, 0xb

    .line 56
    .line 57
    invoke-virtual {v0, v2}, Ll/hki;->e(I)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    const-string v2, "OCR_ID_THIRD"

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    sget-object v0, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_FRONT_3D:Lcom/idv/identity/ocr/OcrType;

    .line 65
    .line 66
    if-ne v0, v2, :cond_3

    .line 67
    .line 68
    invoke-static {}, Ll/hki;->d()Ll/hki;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    const/16 v2, 0xa

    .line 73
    .line 74
    invoke-virtual {v0, v2}, Ll/hki;->e(I)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    const-string v2, "OCR_ID_FACE_3D"

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_3
    sget-object v0, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_BACK_3D:Lcom/idv/identity/ocr/OcrType;

    .line 82
    .line 83
    if-ne v0, v2, :cond_6

    .line 84
    .line 85
    invoke-static {}, Ll/hki;->d()Ll/hki;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    const/16 v2, 0x14

    .line 90
    .line 91
    invoke-virtual {v0, v2}, Ll/hki;->e(I)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    const-string v2, "OCR_ID_BACK_3D"

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :goto_1
    iget-boolean v4, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->K:Z

    .line 99
    .line 100
    if-eqz v4, :cond_4

    .line 101
    .line 102
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 103
    .line 104
    .line 105
    move-result-object v4

    .line 106
    invoke-virtual {v4, v0}, Ll/afm;->D0(Z)V

    .line 107
    .line 108
    .line 109
    goto :goto_2

    .line 110
    :cond_4
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    const/4 v4, 0x0

    .line 115
    invoke-virtual {v0, v4}, Ll/afm;->D0(Z)V

    .line 116
    .line 117
    .line 118
    :goto_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 119
    .line 120
    .line 121
    move-result-wide v4

    .line 122
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->z:Landroid/graphics/Bitmap;

    .line 123
    .line 124
    invoke-static {v0}, Ll/ac00;->b(Landroid/graphics/Bitmap;)[B

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    iget-object v6, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->E0:Ll/xxb;

    .line 129
    .line 130
    if-eqz v6, :cond_5

    .line 131
    .line 132
    invoke-virtual {v6}, Ll/xxb;->c()Z

    .line 133
    .line 134
    .line 135
    move-result v6

    .line 136
    if-eqz v6, :cond_5

    .line 137
    .line 138
    if-eqz v0, :cond_5

    .line 139
    .line 140
    iget-object v6, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->E0:Ll/xxb;

    .line 141
    .line 142
    invoke-virtual {v6}, Ll/xxb;->b()[B

    .line 143
    .line 144
    .line 145
    move-result-object v6

    .line 146
    invoke-static {v6}, Ll/ac00;->a([B)Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v6

    .line 150
    iget-object v7, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->E0:Ll/xxb;

    .line 151
    .line 152
    invoke-virtual {v7, v0}, Ll/xxb;->a([B)[B

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    goto :goto_3

    .line 157
    :cond_5
    const/4 v6, 0x0

    .line 158
    :goto_3
    new-instance v8, Lcom/idv/identity/ocr/ui/CardScanActivity$s;

    .line 159
    .line 160
    invoke-direct {v8, p0, v4, v5, v3}, Lcom/idv/identity/ocr/ui/CardScanActivity$s;-><init>(Lcom/idv/identity/ocr/ui/CardScanActivity;JLjava/lang/String;)V

    .line 161
    .line 162
    .line 163
    move-object v5, v6

    .line 164
    const/4 v6, 0x0

    .line 165
    move v7, p1

    .line 166
    move-object v4, v0

    .line 167
    invoke-static/range {v1 .. v8}, Ll/qk20;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[BLjava/lang/String;ZZLl/jfm;)V

    .line 168
    .line 169
    .line 170
    :cond_6
    return-void
.end method

.method public E1()Landroid/graphics/RectF;
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->b2()Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->k:Lcom/idv/identity/ocr/IdentityScanView;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/idv/identity/ocr/widget/RectMaskView;->getRectLeft()F

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {v0}, Lcom/idv/identity/ocr/widget/RectMaskView;->getRectTop()F

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    invoke-virtual {v0}, Lcom/idv/identity/ocr/widget/RectMaskView;->getRectWidth()F

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    invoke-virtual {v0}, Lcom/idv/identity/ocr/widget/RectMaskView;->getRectHeigth()F

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    new-instance v4, Landroid/graphics/RectF;

    .line 28
    .line 29
    add-float/2addr v3, v1

    .line 30
    add-float/2addr v0, v2

    .line 31
    invoke-direct {v4, v1, v2, v3, v0}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->j:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 35
    .line 36
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 41
    .line 42
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->j:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 43
    .line 44
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 49
    .line 50
    iget-object v2, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->t:[F

    .line 51
    .line 52
    iget v3, v4, Landroid/graphics/RectF;->left:F

    .line 53
    .line 54
    iget-object v5, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->j:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 55
    .line 56
    invoke-virtual {v5}, Landroid/view/View;->getX()F

    .line 57
    .line 58
    .line 59
    move-result v5

    .line 60
    sub-float/2addr v3, v5

    .line 61
    int-to-float v0, v0

    .line 62
    div-float/2addr v3, v0

    .line 63
    const/4 v5, 0x0

    .line 64
    aput v3, v2, v5

    .line 65
    .line 66
    iget-object v2, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->t:[F

    .line 67
    .line 68
    iget v3, v4, Landroid/graphics/RectF;->top:F

    .line 69
    .line 70
    iget-object v6, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->j:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 71
    .line 72
    invoke-virtual {v6}, Landroid/view/View;->getY()F

    .line 73
    .line 74
    .line 75
    move-result v6

    .line 76
    sub-float/2addr v3, v6

    .line 77
    int-to-float v1, v1

    .line 78
    div-float/2addr v3, v1

    .line 79
    const/4 v6, 0x1

    .line 80
    aput v3, v2, v6

    .line 81
    .line 82
    iget-object v2, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->t:[F

    .line 83
    .line 84
    iget v3, v4, Landroid/graphics/RectF;->right:F

    .line 85
    .line 86
    iget-object v7, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->j:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 87
    .line 88
    invoke-virtual {v7}, Landroid/view/View;->getX()F

    .line 89
    .line 90
    .line 91
    move-result v7

    .line 92
    sub-float/2addr v3, v7

    .line 93
    div-float/2addr v3, v0

    .line 94
    const/4 v7, 0x2

    .line 95
    aput v3, v2, v7

    .line 96
    .line 97
    iget-object v2, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->t:[F

    .line 98
    .line 99
    const/4 v3, 0x3

    .line 100
    aget v6, v2, v6

    .line 101
    .line 102
    aput v6, v2, v3

    .line 103
    .line 104
    const/4 v3, 0x6

    .line 105
    aget v5, v2, v5

    .line 106
    .line 107
    aput v5, v2, v3

    .line 108
    .line 109
    iget v3, v4, Landroid/graphics/RectF;->bottom:F

    .line 110
    .line 111
    iget-object v5, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->j:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 112
    .line 113
    invoke-virtual {v5}, Landroid/view/View;->getY()F

    .line 114
    .line 115
    .line 116
    move-result v5

    .line 117
    sub-float/2addr v3, v5

    .line 118
    div-float/2addr v3, v1

    .line 119
    const/4 v1, 0x7

    .line 120
    aput v3, v2, v1

    .line 121
    .line 122
    iget-object v2, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->t:[F

    .line 123
    .line 124
    iget v3, v4, Landroid/graphics/RectF;->right:F

    .line 125
    .line 126
    iget-object v5, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->j:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 127
    .line 128
    invoke-virtual {v5}, Landroid/view/View;->getX()F

    .line 129
    .line 130
    .line 131
    move-result v5

    .line 132
    sub-float/2addr v3, v5

    .line 133
    div-float/2addr v3, v0

    .line 134
    const/4 v0, 0x4

    .line 135
    aput v3, v2, v0

    .line 136
    .line 137
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->t:[F

    .line 138
    .line 139
    const/4 v0, 0x5

    .line 140
    aget v1, p0, v1

    .line 141
    .line 142
    aput v1, p0, v0

    .line 143
    .line 144
    return-object v4

    .line 145
    :cond_0
    const/4 p0, 0x0

    .line 146
    return-object p0
.end method

.method public E2()V
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/idv/identity/base/R$string;->J:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Lcom/idv/identity/base/R$string;->S:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sget v1, Lcom/idv/identity/base/R$string;->R:I

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    new-instance v8, Lcom/idv/identity/ocr/ui/CardScanActivity$w;

    .line 32
    .line 33
    invoke-direct {v8, p0}, Lcom/idv/identity/ocr/ui/CardScanActivity$w;-><init>(Lcom/idv/identity/ocr/ui/CardScanActivity;)V

    .line 34
    .line 35
    .line 36
    const/4 v6, 0x0

    .line 37
    const-string v7, "ocr_out_time_code"

    .line 38
    .line 39
    move-object v2, p0

    .line 40
    invoke-direct/range {v2 .. v8}, Lcom/idv/identity/ocr/ui/CardScanActivity;->h3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/idv/identity/ocr/ui/CardScanActivity$x;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public F2()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 6
    .line 7
    const-string v2, "status"

    .line 8
    .line 9
    const-string v3, "error"

    .line 10
    .line 11
    filled-new-array {v2, v3}, [Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const-string v3, "sdkMaxTimeout"

    .line 16
    .line 17
    invoke-virtual {v0, v1, v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    sget-object v0, Ll/dfm;->A:Ljava/lang/String;

    .line 21
    .line 22
    invoke-direct {p0, v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->a3(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public G1(Z)V
    .locals 2

    .line 1
    sget v0, Ll/rcc0;->s:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/ImageView;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->Y1()Landroid/widget/ImageView;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->P1()Landroid/widget/LinearLayout;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 21
    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public M2()V
    .locals 0

    .line 1
    return-void
.end method

.method public N2(Ll/p94;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->n:Ll/bn2;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->M2()V

    .line 6
    .line 7
    .line 8
    new-instance v1, Lcom/idv/identity/base/algorithm/doc/Frame;

    .line 9
    .line 10
    iget-object v2, p1, Ll/p94;->q:[B

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/p94;->d()I

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    invoke-virtual {p1}, Ll/p94;->c()I

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    invoke-virtual {p1}, Ll/p94;->g()I

    .line 21
    .line 22
    .line 23
    move-result v5

    .line 24
    const/4 v6, 0x0

    .line 25
    const/4 v7, 0x0

    .line 26
    invoke-direct/range {v1 .. v7}, Lcom/idv/identity/base/algorithm/doc/Frame;-><init>([BIIIII)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->Q2(Lcom/idv/identity/base/algorithm/doc/Frame;)Z

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public O1()Landroid/widget/ImageView;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->C:Landroid/widget/ImageView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget v0, Ll/rcc0;->k:I

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/widget/ImageView;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->C:Landroid/widget/ImageView;

    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->C:Landroid/widget/ImageView;

    .line 16
    .line 17
    return-object p0
.end method

.method public P1()Landroid/widget/LinearLayout;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->B:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget v0, Ll/rcc0;->T0:I

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/widget/LinearLayout;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->B:Landroid/widget/LinearLayout;

    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->B:Landroid/widget/LinearLayout;

    .line 16
    .line 17
    return-object p0
.end method

.method public Q2(Lcom/idv/identity/base/algorithm/doc/Frame;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->n:Ll/bn2;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/bn2;->processImage(Lcom/idv/identity/base/algorithm/doc/Frame;)Z

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public R1()Landroid/widget/TextView;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->G:Landroid/widget/TextView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget v0, Ll/rcc0;->h:I

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/widget/TextView;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->G:Landroid/widget/TextView;

    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->G:Landroid/widget/TextView;

    .line 16
    .line 17
    return-object p0
.end method

.method public R2(Ljava/lang/String;)I
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    :try_start_0
    new-instance v0, Landroid/media/ExifInterface;

    .line 3
    .line 4
    invoke-direct {v0, p1}, Landroid/media/ExifInterface;-><init>(Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    const-string p1, "Orientation"

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {v0, p1, v1}, Landroid/media/ExifInterface;->getAttributeInt(Ljava/lang/String;I)I

    .line 11
    .line 12
    .line 13
    move-result p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    const/4 v0, 0x3

    .line 15
    if-eq p1, v0, :cond_2

    .line 16
    .line 17
    const/4 v0, 0x6

    .line 18
    if-eq p1, v0, :cond_1

    .line 19
    .line 20
    const/16 v0, 0x8

    .line 21
    .line 22
    if-eq p1, v0, :cond_0

    .line 23
    .line 24
    return p0

    .line 25
    :cond_0
    const/16 p0, 0x10e

    .line 26
    .line 27
    return p0

    .line 28
    :cond_1
    const/16 p0, 0x5a

    .line 29
    .line 30
    return p0

    .line 31
    :cond_2
    const/16 p0, 0xb4

    .line 32
    .line 33
    return p0

    .line 34
    :catch_0
    move-exception p1

    .line 35
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 36
    .line 37
    .line 38
    return p0
.end method

.method public S1(I)Lcom/idv/identity/ocr/OcrType;
    .locals 3

    .line 1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/afm;->i0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Ll/ffm;->f:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    const/4 v0, 0x2

    .line 16
    const/4 v1, 0x1

    .line 17
    if-eqz p0, :cond_2

    .line 18
    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    sget-object p0, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_FRONT:Lcom/idv/identity/ocr/OcrType;

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    if-ne p1, v1, :cond_1

    .line 25
    .line 26
    sget-object p0, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_BACK:Lcom/idv/identity/ocr/OcrType;

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_1
    if-ne p1, v0, :cond_2

    .line 30
    .line 31
    sget-object p0, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_THIRD:Lcom/idv/identity/ocr/OcrType;

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_2
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Ll/afm;->t()Ljava/util/List;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    if-eqz p0, :cond_7

    .line 43
    .line 44
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Ll/afm;->t()Ljava/util/List;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-eqz p0, :cond_3

    .line 57
    .line 58
    goto :goto_2

    .line 59
    :cond_3
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p0}, Ll/afm;->t()Ljava/util/List;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    check-cast p0, Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    const/4 v2, -0x1

    .line 81
    sparse-switch p1, :sswitch_data_0

    .line 82
    .line 83
    .line 84
    :goto_0
    move v0, v2

    .line 85
    goto :goto_1

    .line 86
    :sswitch_0
    const-string p1, "OCR_ID_BACK"

    .line 87
    .line 88
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    if-nez p0, :cond_6

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :sswitch_1
    const-string p1, "OCR_ID_FACE_3D"

    .line 96
    .line 97
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    if-nez p0, :cond_4

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_4
    move v0, v1

    .line 105
    goto :goto_1

    .line 106
    :sswitch_2
    const-string p1, "OCR_ID_BACK_3D"

    .line 107
    .line 108
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result p0

    .line 112
    if-nez p0, :cond_5

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_5
    const/4 v0, 0x0

    .line 116
    :cond_6
    :goto_1
    packed-switch v0, :pswitch_data_0

    .line 117
    .line 118
    .line 119
    sget-object p0, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_FRONT:Lcom/idv/identity/ocr/OcrType;

    .line 120
    .line 121
    return-object p0

    .line 122
    :pswitch_0
    sget-object p0, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_BACK:Lcom/idv/identity/ocr/OcrType;

    .line 123
    .line 124
    return-object p0

    .line 125
    :pswitch_1
    sget-object p0, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_FRONT_3D:Lcom/idv/identity/ocr/OcrType;

    .line 126
    .line 127
    return-object p0

    .line 128
    :pswitch_2
    sget-object p0, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_BACK_3D:Lcom/idv/identity/ocr/OcrType;

    .line 129
    .line 130
    return-object p0

    .line 131
    :cond_7
    :goto_2
    sget-object p0, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_FRONT:Lcom/idv/identity/ocr/OcrType;

    .line 132
    .line 133
    return-object p0

    .line 134
    nop

    .line 135
    :sswitch_data_0
    .sparse-switch
        -0x7ab6707a -> :sswitch_2
        0x58dfc250 -> :sswitch_1
        0x7b511f4a -> :sswitch_0
    .end sparse-switch

    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public T(ILjava/lang/Throwable;)V
    .locals 6

    .line 1
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 6
    .line 7
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    const-string v3, "message"

    .line 12
    .line 13
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v4

    .line 17
    const-string v5, "code"

    .line 18
    .line 19
    filled-new-array {v5, v2, v3, v4}, [Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    const-string v3, "cameraError"

    .line 24
    .line 25
    invoke-virtual {v0, v1, v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    packed-switch p1, :pswitch_data_0

    .line 29
    .line 30
    .line 31
    new-instance p2, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v0, "unkown Camera Code =>"

    .line 34
    .line 35
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    goto :goto_0

    .line 46
    :pswitch_0
    sget-object p1, Ll/dfm;->j:Ljava/lang/String;

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :pswitch_1
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p1, p2}, Lcom/idv/identity/platform/log/RecordService;->recordException(Ljava/lang/Throwable;)V

    .line 54
    .line 55
    .line 56
    sget-object p1, Ll/dfm;->i:Ljava/lang/String;

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :pswitch_2
    sget-object p1, Ll/dfm;->g:Ljava/lang/String;

    .line 60
    .line 61
    :goto_0
    invoke-direct {p0, p1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->Z2(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :pswitch_data_0
    .packed-switch 0x64
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public T1()Lcom/idv/identity/ocr/IdentityScanView;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->k:Lcom/idv/identity/ocr/IdentityScanView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget v0, Ll/rcc0;->q:I

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/idv/identity/ocr/IdentityScanView;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->k:Lcom/idv/identity/ocr/IdentityScanView;

    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->k:Lcom/idv/identity/ocr/IdentityScanView;

    .line 16
    .line 17
    return-object p0
.end method

.method public U1()Lcom/idv/identity/platform/IdentityAlertOverlay;
    .locals 1

    .line 1
    sget v0, Ll/rcc0;->b:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/idv/identity/platform/IdentityAlertOverlay;

    .line 8
    .line 9
    return-object p0
.end method

.method public V1()Landroid/widget/ImageView;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->D:Landroid/widget/ImageView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget v0, Ll/rcc0;->g:I

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/widget/ImageView;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->D:Landroid/widget/ImageView;

    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->D:Landroid/widget/ImageView;

    .line 16
    .line 17
    return-object p0
.end method

.method public W2()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->n:Ll/bn2;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/bn2;->c()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public X1()Landroid/widget/TextView;
    .locals 1

    .line 1
    sget v0, Ll/rcc0;->B:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/widget/TextView;

    .line 8
    .line 9
    return-object p0
.end method

.method public X2(ILandroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 7

    .line 1
    new-instance v5, Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 4
    .line 5
    .line 6
    int-to-float p0, p1

    .line 7
    invoke-virtual {v5, p0}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 8
    .line 9
    .line 10
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 15
    .line 16
    .line 17
    move-result v4

    .line 18
    const/4 v6, 0x1

    .line 19
    const/4 v1, 0x0

    .line 20
    const/4 v2, 0x0

    .line 21
    move-object v0, p2

    .line 22
    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public Y1()Landroid/widget/ImageView;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->F:Landroid/widget/ImageView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget v0, Ll/rcc0;->r:I

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/widget/ImageView;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->F:Landroid/widget/ImageView;

    .line 14
    .line 15
    :cond_0
    sget v0, Ll/rcc0;->r:I

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Landroid/widget/ImageView;

    .line 22
    .line 23
    return-object p0
.end method

.method public Z1()Landroid/widget/ImageView;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->E:Landroid/widget/ImageView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget v0, Ll/rcc0;->l:I

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/widget/ImageView;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->E:Landroid/widget/ImageView;

    .line 14
    .line 15
    :cond_0
    sget v0, Ll/rcc0;->l:I

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Landroid/widget/ImageView;

    .line 22
    .line 23
    return-object p0
.end method

.method public b0()V
    .locals 0

    .line 1
    return-void
.end method

.method public b2()Lcom/idv/identity/ocr/widget/RectMaskView;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->l:Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget v0, Ll/rcc0;->M0:I

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->l:Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->l:Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 16
    .line 17
    return-object p0
.end method

.method public c2()Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/afm;->i0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Ll/ffm;->f:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    sget v0, Ll/yac0;->b:I

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_0
    sget-object v0, Ll/cfm;->h:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->r:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_3

    .line 37
    .line 38
    sget-object v0, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_FRONT:Lcom/idv/identity/ocr/OcrType;

    .line 39
    .line 40
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->q:Lcom/idv/identity/ocr/OcrType;

    .line 41
    .line 42
    if-ne v0, v1, :cond_1

    .line 43
    .line 44
    sget v0, Ll/yac0;->h:I

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    sget-object v0, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_BACK:Lcom/idv/identity/ocr/OcrType;

    .line 48
    .line 49
    if-ne v0, v1, :cond_2

    .line 50
    .line 51
    sget v0, Ll/yac0;->g:I

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    sget v0, Ll/yac0;->b:I

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_3
    sget-object v0, Ll/cfm;->a:Ljava/lang/String;

    .line 58
    .line 59
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->r:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_4

    .line 66
    .line 67
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->q:Lcom/idv/identity/ocr/OcrType;

    .line 68
    .line 69
    sget-object v1, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_FRONT:Lcom/idv/identity/ocr/OcrType;

    .line 70
    .line 71
    if-ne v0, v1, :cond_4

    .line 72
    .line 73
    sget v0, Ll/yac0;->h:I

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_4
    sget v0, Ll/yac0;->b:I

    .line 77
    .line 78
    :goto_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    return-object p0
.end method

.method public d2()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/afm;->v()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const-string p0, ""

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    sget-object v1, Ll/cfm;->a:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    sget v0, Lcom/idv/identity/base/R$string;->b0:I

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    sget-object v0, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_FRONT:Lcom/idv/identity/ocr/OcrType;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->q:Lcom/idv/identity/ocr/OcrType;

    .line 28
    .line 29
    if-ne v0, v1, :cond_2

    .line 30
    .line 31
    sget v0, Lcom/idv/identity/base/R$string;->c0:I

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    sget-object v0, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_BACK:Lcom/idv/identity/ocr/OcrType;

    .line 35
    .line 36
    if-ne v0, v1, :cond_3

    .line 37
    .line 38
    sget v0, Lcom/idv/identity/base/R$string;->Z:I

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_3
    sget-object v0, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_THIRD:Lcom/idv/identity/ocr/OcrType;

    .line 42
    .line 43
    if-ne v0, v1, :cond_4

    .line 44
    .line 45
    sget v0, Lcom/idv/identity/base/R$string;->e0:I

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_4
    sget-object v0, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_FRONT_3D:Lcom/idv/identity/ocr/OcrType;

    .line 49
    .line 50
    if-ne v0, v1, :cond_5

    .line 51
    .line 52
    sget v0, Lcom/idv/identity/base/R$string;->d0:I

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_5
    sget-object v0, Lcom/idv/identity/ocr/OcrType;->OT_PHOTO_BACK_3D:Lcom/idv/identity/ocr/OcrType;

    .line 56
    .line 57
    if-ne v0, v1, :cond_6

    .line 58
    .line 59
    sget v0, Lcom/idv/identity/base/R$string;->a0:I

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_6
    const/4 v0, 0x0

    .line 63
    :goto_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    return-object p0
.end method

.method public e0()V
    .locals 0

    .line 1
    return-void
.end method

.method public e2()Landroid/widget/ImageView;
    .locals 1

    .line 1
    sget v0, Ll/rcc0;->i:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/widget/ImageView;

    .line 8
    .line 9
    return-object p0
.end method

.method public g0(DD)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->j:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 11
    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    :goto_0
    return-void

    .line 15
    :cond_1
    cmpg-double v1, p1, p3

    .line 16
    .line 17
    iget-object v2, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->j:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    .line 21
    .line 22
    if-gtz v1, :cond_2

    .line 23
    .line 24
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 29
    .line 30
    int-to-double v1, v1

    .line 31
    mul-double/2addr v1, p3

    .line 32
    mul-double/2addr p1, v4

    .line 33
    div-double/2addr v1, p1

    .line 34
    double-to-int p1, v1

    .line 35
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 36
    .line 37
    iget-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->j:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->j:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 43
    .line 44
    invoke-virtual {p1, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 45
    .line 46
    .line 47
    sget p1, Ll/rcc0;->A:I

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    check-cast p0, Landroid/widget/ImageView;

    .line 54
    .line 55
    if-eqz p0, :cond_3

    .line 56
    .line 57
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_2
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 66
    .line 67
    int-to-double v1, v1

    .line 68
    mul-double/2addr p3, v4

    .line 69
    div-double/2addr v1, p3

    .line 70
    mul-double/2addr v1, p1

    .line 71
    double-to-int p1, v1

    .line 72
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 73
    .line 74
    iget-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->j:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 75
    .line 76
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->j:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 80
    .line 81
    invoke-virtual {p1, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 82
    .line 83
    .line 84
    sget p1, Ll/rcc0;->A:I

    .line 85
    .line 86
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    check-cast p0, Landroid/widget/ImageView;

    .line 91
    .line 92
    if-eqz p0, :cond_3

    .line 93
    .line 94
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 95
    .line 96
    .line 97
    :cond_3
    :goto_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 98
    .line 99
    const-string p1, "SurfaceView \u5bbd\u5ea6:w="

    .line 100
    .line 101
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    iget p1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 105
    .line 106
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    const-string p1, " h="

    .line 110
    .line 111
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    iget p1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 115
    .line 116
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-static {p0}, Ll/o6r0;->a(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method public g2()Landroid/widget/LinearLayout;
    .locals 1

    .line 1
    sget v0, Ll/rcc0;->Z0:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/widget/LinearLayout;

    .line 8
    .line 9
    return-object p0
.end method

.method public g3(Z)V
    .locals 1

    .line 1
    xor-int/lit8 v0, p1, 0x1

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->G1(Z)V

    .line 4
    .line 5
    .line 6
    xor-int/lit8 v0, p1, 0x1

    .line 7
    .line 8
    invoke-direct {p0, v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->F1(Z)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->p:Landroid/widget/FrameLayout;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/16 p1, 0x8

    .line 20
    .line 21
    :goto_0
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 22
    .line 23
    .line 24
    sget p1, Ll/scc0;->w:I

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Landroid/widget/TextView;

    .line 31
    .line 32
    if-eqz p0, :cond_1

    .line 33
    .line 34
    sget p1, Lcom/idv/identity/base/R$string;->O0:I

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 37
    .line 38
    .line 39
    sget-object p1, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 40
    .line 41
    sget v0, Ll/y9c0;->i:I

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrLoadingColor(I)I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 48
    .line 49
    .line 50
    :cond_1
    return-void
.end method

.method public h2()Landroid/widget/ImageView;
    .locals 1

    .line 1
    sget v0, Ll/rcc0;->j:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/widget/ImageView;

    .line 8
    .line 9
    return-object p0
.end method

.method public i2()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->U1()Lcom/idv/identity/platform/IdentityAlertOverlay;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    return v0
.end method

.method public l2()V
    .locals 7

    .line 1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/afm;->b0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "shoot"

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const-string v0, "com.idv.identity.service.ocr.IdentityDocService"

    .line 19
    .line 20
    const-class v1, Ll/bn2;

    .line 21
    .line 22
    invoke-static {v0, v1}, Ll/ofm;->a(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Ll/bn2;

    .line 27
    .line 28
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->n:Ll/bn2;

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->C1()Lcom/alibaba/fastjson/JSONObject;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->n:Ll/bn2;

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSON;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    new-instance v6, Ljava/util/HashMap;

    .line 43
    .line 44
    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 45
    .line 46
    .line 47
    const/4 v5, 0x0

    .line 48
    move-object v3, p0

    .line 49
    move-object v2, p0

    .line 50
    invoke-virtual/range {v1 .. v6}, Ll/bn2;->a(Landroid/content/Context;Ll/nsl;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Z

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_1
    const-string p0, "CardScanActivityinitScanOcr baseIdentityDocService is null"

    .line 55
    .line 56
    invoke-static {p0}, Ll/o6r0;->a(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public n2(Ljava/lang/Class;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    iget-wide v3, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->x:J

    .line 11
    .line 12
    sub-long/2addr v1, v3

    .line 13
    const-wide/32 v3, 0x1d4c0

    .line 14
    .line 15
    .line 16
    sub-long/2addr v3, v1

    .line 17
    const-string p1, "sdkMaxTimeout"

    .line 18
    .line 19
    invoke-virtual {v0, p1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    sget-object p1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 30
    .line 31
    const-string v0, "status"

    .line 32
    .line 33
    const-string v1, "success"

    .line 34
    .line 35
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const-string v1, "navigateResultPage"

    .line 40
    .line 41
    invoke-virtual {p0, p1, v1, v0}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public n3()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->n:Ll/bn2;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const-string v0, "No integrated automatic scanning module"

    .line 7
    .line 8
    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->P1()Landroid/widget/LinearLayout;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->O1()Landroid/widget/ImageView;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->R1()Landroid/widget/TextView;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    sget-object v2, Lcom/idv/identity/ocr/ui/CardScanActivity;->J0:Ljava/lang/String;

    .line 32
    .line 33
    iput-object v2, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->u:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {}, Ll/azb;->p()Landroid/graphics/Bitmap;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    if-eqz v2, :cond_1

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    sget v2, Ll/yac0;->i:I

    .line 46
    .line 47
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 48
    .line 49
    .line 50
    :goto_0
    sget v0, Lcom/idv/identity/base/R$string;->M0:I

    .line 51
    .line 52
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->k:Lcom/idv/identity/ocr/IdentityScanView;

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/idv/identity/ocr/IdentityScanView;->i()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->Z1()Landroid/widget/ImageView;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    const/16 v1, 0x8

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->j:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 70
    .line 71
    const-string v0, "continuous-video"

    .line 72
    .line 73
    invoke-virtual {p0, v0}, Lcom/idv/identity/platform/camera/CameraSurfaceView;->setFocusModes(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public o3()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->P1()Landroid/widget/LinearLayout;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->O1()Landroid/widget/ImageView;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->R1()Landroid/widget/TextView;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    sget-object v3, Lcom/idv/identity/ocr/ui/CardScanActivity;->I0:Ljava/lang/String;

    .line 18
    .line 19
    iput-object v3, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->u:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {}, Ll/azb;->h()Landroid/graphics/Bitmap;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    if-eqz v3, :cond_0

    .line 26
    .line 27
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    sget v3, Ll/yac0;->a:I

    .line 32
    .line 33
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 34
    .line 35
    .line 36
    :goto_0
    sget v0, Lcom/idv/identity/base/R$string;->K0:I

    .line 37
    .line 38
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(I)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->k:Lcom/idv/identity/ocr/IdentityScanView;

    .line 42
    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/idv/identity/ocr/IdentityScanView;->j()V

    .line 46
    .line 47
    .line 48
    :cond_1
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->Z1()Landroid/widget/ImageView;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->j:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 56
    .line 57
    const-string v0, "continuous-picture"

    .line 58
    .line 59
    invoke-virtual {p0, v0}, Lcom/idv/identity/platform/camera/CameraSurfaceView;->setFocusModes(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public onBackPressed()V
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/idv/identity/base/R$string;->T:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Lcom/idv/identity/base/R$string;->Q:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v5

    .line 21
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sget v1, Lcom/idv/identity/base/R$string;->N:I

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v6

    .line 31
    new-instance v8, Lcom/idv/identity/ocr/ui/CardScanActivity$l;

    .line 32
    .line 33
    invoke-direct {v8, p0}, Lcom/idv/identity/ocr/ui/CardScanActivity$l;-><init>(Lcom/idv/identity/ocr/ui/CardScanActivity;)V

    .line 34
    .line 35
    .line 36
    const-string v4, ""

    .line 37
    .line 38
    const-string v7, "ocr_exit_code"

    .line 39
    .line 40
    move-object v2, p0

    .line 41
    invoke-direct/range {v2 .. v8}, Lcom/idv/identity/ocr/ui/CardScanActivity;->h3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/idv/identity/ocr/ui/CardScanActivity$x;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Lcom/idv/identity/platform/IntlFaceBaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "CardScanActivity"

    .line 5
    .line 6
    const-string v0, "onCreate"

    .line 7
    .line 8
    invoke-static {p1, v0}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->s:I

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->S1(I)Lcom/idv/identity/ocr/OcrType;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->q:Lcom/idv/identity/ocr/OcrType;

    .line 18
    .line 19
    sget p1, Ll/dec0;->a:I

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Landroidx/activity/ComponentActivity;->setContentView(I)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    const/high16 v1, -0x1000000

    .line 31
    .line 32
    invoke-virtual {p1, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    const/16 v1, 0x500

    .line 40
    .line 41
    invoke-virtual {p1, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 42
    .line 43
    .line 44
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    const-string v1, "Build.VERSION.SDK_INT:"

    .line 47
    .line 48
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 52
    .line 53
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-static {v0, p1}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 64
    .line 65
    .line 66
    move-result-wide v0

    .line 67
    iput-wide v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->c:J

    .line 68
    .line 69
    const/4 p1, 0x0

    .line 70
    iput p1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->H:I

    .line 71
    .line 72
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 77
    .line 78
    const-string v2, "OCR_ENTER"

    .line 79
    .line 80
    const-string v3, "OCR_SCAN"

    .line 81
    .line 82
    invoke-virtual {v0, v1, v2, v3}, Lcom/idv/identity/platform/log/RecordService;->recordEventPage(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    sget v0, Ll/rcc0;->q:I

    .line 86
    .line 87
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    check-cast v0, Lcom/idv/identity/ocr/IdentityScanView;

    .line 92
    .line 93
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->k:Lcom/idv/identity/ocr/IdentityScanView;

    .line 94
    .line 95
    if-eqz v0, :cond_1

    .line 96
    .line 97
    sget-object v1, Ll/azb;->d:Lcom/idv/identity/platform/config/OCRConfig;

    .line 98
    .line 99
    sget v2, Ll/y9c0;->j:I

    .line 100
    .line 101
    invoke-virtual {v1, v2}, Lcom/idv/identity/platform/config/OCRConfig;->getOcrBorderColor(I)I

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    invoke-virtual {v0, v1}, Lcom/idv/identity/ocr/IdentityScanView;->setHoleColor(I)V

    .line 106
    .line 107
    .line 108
    :cond_1
    new-instance v0, Ll/xxb;

    .line 109
    .line 110
    const-string v1, "identity-key-public.key"

    .line 111
    .line 112
    invoke-static {p0, v1}, Ll/ac00;->i(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    const/4 v2, 0x1

    .line 117
    invoke-direct {v0, v1, v2}, Ll/xxb;-><init>(Ljava/lang/String;Z)V

    .line 118
    .line 119
    .line 120
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->E0:Ll/xxb;

    .line 121
    .line 122
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-virtual {v0}, Ll/afm;->v()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->r:Ljava/lang/String;

    .line 131
    .line 132
    if-nez v0, :cond_2

    .line 133
    .line 134
    const-string v0, ""

    .line 135
    .line 136
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->r:Ljava/lang/String;

    .line 137
    .line 138
    :cond_2
    sget v0, Ll/hfm;->j:I

    .line 139
    .line 140
    iput v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->w:I

    .line 141
    .line 142
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->g2()Landroid/widget/LinearLayout;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    sget v1, Ll/rcc0;->G0:I

    .line 147
    .line 148
    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    check-cast v1, Landroid/widget/TextView;

    .line 153
    .line 154
    if-eqz v0, :cond_4

    .line 155
    .line 156
    sget-boolean v1, Ll/hfm;->g:Z

    .line 157
    .line 158
    if-eqz v1, :cond_3

    .line 159
    .line 160
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 161
    .line 162
    .line 163
    goto :goto_0

    .line 164
    :cond_3
    const/16 p1, 0x8

    .line 165
    .line 166
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 167
    .line 168
    .line 169
    :cond_4
    :goto_0
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->init()V

    .line 170
    .line 171
    .line 172
    return-void
.end method

.method public onDestroy()V
    .locals 6

    .line 1
    invoke-super {p0}, Lcom/idv/identity/platform/IntlFaceBaseActivity;->onDestroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->j:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 v2, 0x4

    .line 10
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->j:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/idv/identity/platform/camera/CameraSurfaceView;->getSurfaceHolder()Landroid/view/SurfaceHolder;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v2, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->j:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 20
    .line 21
    invoke-interface {v0, v2}, Landroid/view/SurfaceHolder;->removeCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 22
    .line 23
    .line 24
    iput-object v1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->j:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 25
    .line 26
    :cond_0
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->V2()V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->p0:Landroid/os/Handler;

    .line 30
    .line 31
    const/16 v2, 0x3f5

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 34
    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    invoke-virtual {p0, v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->g3(Z)V

    .line 38
    .line 39
    .line 40
    iget-object v2, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->k:Lcom/idv/identity/ocr/IdentityScanView;

    .line 41
    .line 42
    if-eqz v2, :cond_1

    .line 43
    .line 44
    invoke-virtual {v2}, Lcom/idv/identity/ocr/IdentityScanView;->j()V

    .line 45
    .line 46
    .line 47
    iget-object v2, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->k:Lcom/idv/identity/ocr/IdentityScanView;

    .line 48
    .line 49
    const/4 v3, 0x1

    .line 50
    invoke-virtual {v2, v1, v3, v0}, Lcom/idv/identity/ocr/IdentityScanView;->h(Landroid/graphics/drawable/Drawable;ZZ)V

    .line 51
    .line 52
    .line 53
    iget-object v2, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->k:Lcom/idv/identity/ocr/IdentityScanView;

    .line 54
    .line 55
    invoke-virtual {v2}, Landroid/view/View;->clearAnimation()V

    .line 56
    .line 57
    .line 58
    iget-object v2, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->k:Lcom/idv/identity/ocr/IdentityScanView;

    .line 59
    .line 60
    invoke-virtual {v2}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 61
    .line 62
    .line 63
    iput-object v1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->k:Lcom/idv/identity/ocr/IdentityScanView;

    .line 64
    .line 65
    :cond_1
    iget-object v2, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->n:Ll/bn2;

    .line 66
    .line 67
    if-eqz v2, :cond_2

    .line 68
    .line 69
    invoke-virtual {v2}, Ll/bn2;->b()V

    .line 70
    .line 71
    .line 72
    :cond_2
    iput v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->s:I

    .line 73
    .line 74
    new-instance v0, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 77
    .line 78
    .line 79
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 80
    .line 81
    .line 82
    move-result-wide v2

    .line 83
    iget-wide v4, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->c:J

    .line 84
    .line 85
    sub-long/2addr v2, v4

    .line 86
    long-to-double v2, v2

    .line 87
    const-wide v4, 0x408f400000000000L    # 1000.0

    .line 88
    .line 89
    .line 90
    .line 91
    .line 92
    div-double/2addr v2, v4

    .line 93
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    const-string v2, "s"

    .line 101
    .line 102
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    sget-object v3, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 114
    .line 115
    const-string v4, "timeCost"

    .line 116
    .line 117
    filled-new-array {v4, v0}, [Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    const-string v4, "destroyCardScanActivity"

    .line 122
    .line 123
    invoke-virtual {v2, v3, v4, v0}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-virtual {v0}, Lcom/idv/identity/platform/log/RecordService;->flush()V

    .line 131
    .line 132
    .line 133
    iput-object v1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->E0:Ll/xxb;

    .line 134
    .line 135
    invoke-static {}, Ll/hki;->d()Ll/hki;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    invoke-virtual {p0}, Ll/hki;->g()V

    .line 140
    .line 141
    .line 142
    return-void
.end method

.method public onPause()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/idv/identity/platform/IntlFaceBaseActivity;->onPause()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->H:I

    .line 6
    .line 7
    return-void
.end method

.method public onResume()V
    .locals 4

    .line 1
    invoke-super {p0}, Lcom/idv/identity/platform/IntlFaceBaseActivity;->onResume()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->V2()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->c3()V

    .line 8
    .line 9
    .line 10
    iget v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->H:I

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 20
    .line 21
    const-string v2, "type"

    .line 22
    .line 23
    const-string v3, "pressBackClose "

    .line 24
    .line 25
    filled-new-array {v2, v3}, [Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    const-string v3, "userBack"

    .line 30
    .line 31
    invoke-virtual {v0, v1, v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const-string v0, "CODE_VERIFY_INTERRUPT"

    .line 35
    .line 36
    invoke-direct {p0, v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->b3(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public onStop()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/idv/identity/platform/IntlFaceBaseActivity;->onStop()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    iput v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->H:I

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->V2()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    const-string p1, "CardScanActivity"

    .line 7
    .line 8
    const-string v0, "onWindowFocusChanged"

    .line 9
    .line 10
    invoke-static {p1, v0}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->m2()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public p0(Ll/p94;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->I:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->i2()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->u:Ljava/lang/String;

    .line 16
    .line 17
    sget-object v1, Lcom/idv/identity/ocr/ui/CardScanActivity;->J0:Ljava/lang/String;

    .line 18
    .line 19
    if-eq v0, v1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {p0, p1}, Lcom/idv/identity/ocr/ui/CardScanActivity;->N2(Ll/p94;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    :goto_0
    return-void
.end method

.method public p2()V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->j3(Z)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    const-string v0, "status"

    .line 7
    .line 8
    const-string v1, "onClickStartFaceView"

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    sget-object v2, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 17
    .line 18
    const-string v3, "success"

    .line 19
    .line 20
    filled-new-array {v0, v3}, [Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0, v2, v1, v0}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    sget-object v2, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 33
    .line 34
    const-string v3, "error"

    .line 35
    .line 36
    filled-new-array {v0, v3}, [Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p0, v2, v1, v0}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public p3()V
    .locals 2

    .line 1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/afm;->i0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    sget-object v1, Ll/ffm;->d:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    const-class v0, Lcom/idv/identity/platform/FinalVerifyActivity;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->n2(Ljava/lang/Class;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    sget-object v1, Ll/ffm;->e:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-nez v1, :cond_3

    .line 33
    .line 34
    sget-object v1, Ll/ffm;->f:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_2
    :goto_0
    return-void

    .line 44
    :cond_3
    :goto_1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->j:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 45
    .line 46
    if-eqz v0, :cond_4

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/idv/identity/platform/camera/CameraSurfaceView;->c()V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->j:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/idv/identity/platform/camera/CameraSurfaceView;->getSurfaceHolder()Landroid/view/SurfaceHolder;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->j:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 58
    .line 59
    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->removeCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 60
    .line 61
    .line 62
    const/4 v0, 0x0

    .line 63
    iput-object v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->j:Lcom/idv/identity/platform/camera/CameraSurfaceView;

    .line 64
    .line 65
    :cond_4
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->p2()V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public u2()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->J:Z

    .line 2
    .line 3
    xor-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput-boolean v0, p0, Lcom/idv/identity/ocr/ui/CardScanActivity;->J:Z

    .line 6
    .line 7
    invoke-direct {p0, v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->k3(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public w2(Landroid/os/Message;)V
    .locals 2

    .line 1
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/String;

    .line 4
    .line 5
    iget p1, p1, Landroid/os/Message;->what:I

    .line 6
    .line 7
    const/16 v1, 0x3ef

    .line 8
    .line 9
    if-ne p1, v1, :cond_0

    .line 10
    .line 11
    const-string p1, "CODE_NETWORK_ERROR"

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    new-instance p1, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v0, "_1006"

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    :cond_0
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1, v0}, Ll/afm;->e(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-direct {p0, v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->L1(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public y2()V
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->g3(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Lcom/idv/identity/base/R$string;->U:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget v1, Lcom/idv/identity/base/R$string;->S:I

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sget v1, Lcom/idv/identity/base/R$string;->R:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    new-instance v8, Lcom/idv/identity/ocr/ui/CardScanActivity$u;

    .line 36
    .line 37
    invoke-direct {v8, p0}, Lcom/idv/identity/ocr/ui/CardScanActivity$u;-><init>(Lcom/idv/identity/ocr/ui/CardScanActivity;)V

    .line 38
    .line 39
    .line 40
    const/4 v6, 0x0

    .line 41
    const-string v7, "ocr_failed_code"

    .line 42
    .line 43
    move-object v2, p0

    .line 44
    invoke-direct/range {v2 .. v8}, Lcom/idv/identity/ocr/ui/CardScanActivity;->h3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/idv/identity/ocr/ui/CardScanActivity$x;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public z2()V
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/idv/identity/ocr/ui/CardScanActivity;->g3(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Lcom/idv/identity/base/R$string;->X:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget v1, Lcom/idv/identity/base/R$string;->P:I

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sget v1, Lcom/idv/identity/base/R$string;->R:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    sget v1, Lcom/idv/identity/base/R$string;->O:I

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    new-instance v8, Lcom/idv/identity/ocr/ui/CardScanActivity$t;

    .line 46
    .line 47
    invoke-direct {v8, p0}, Lcom/idv/identity/ocr/ui/CardScanActivity$t;-><init>(Lcom/idv/identity/ocr/ui/CardScanActivity;)V

    .line 48
    .line 49
    .line 50
    const-string v7, "ocr_network_error_code"

    .line 51
    .line 52
    move-object v2, p0

    .line 53
    invoke-direct/range {v2 .. v8}, Lcom/idv/identity/ocr/ui/CardScanActivity;->h3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/idv/identity/ocr/ui/CardScanActivity$x;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method
