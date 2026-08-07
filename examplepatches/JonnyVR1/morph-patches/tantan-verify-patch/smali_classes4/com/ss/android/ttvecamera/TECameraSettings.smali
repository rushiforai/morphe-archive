.class public Lcom/ss/android/ttvecamera/TECameraSettings;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig;,
        Lcom/ss/android/ttvecamera/TECameraSettings$f;,
        Lcom/ss/android/ttvecamera/TECameraSettings$j;,
        Lcom/ss/android/ttvecamera/TECameraSettings$k;,
        Lcom/ss/android/ttvecamera/TECameraSettings$l;,
        Lcom/ss/android/ttvecamera/TECameraSettings$c;,
        Lcom/ss/android/ttvecamera/TECameraSettings$i;,
        Lcom/ss/android/ttvecamera/TECameraSettings$a;,
        Lcom/ss/android/ttvecamera/TECameraSettings$o;,
        Lcom/ss/android/ttvecamera/TECameraSettings$h;,
        Lcom/ss/android/ttvecamera/TECameraSettings$g;,
        Lcom/ss/android/ttvecamera/TECameraSettings$b;,
        Lcom/ss/android/ttvecamera/TECameraSettings$e;,
        Lcom/ss/android/ttvecamera/TECameraSettings$n;,
        Lcom/ss/android/ttvecamera/TECameraSettings$m;,
        Lcom/ss/android/ttvecamera/TECameraSettings$p;,
        Lcom/ss/android/ttvecamera/TECameraSettings$d;
    }
.end annotation


# static fields
.field public static final A0:[I

.field public static final B0:[I

.field public static final z0:[Ljava/lang/String;


# instance fields
.field public A:Z

.field public B:I

.field public C:I

.field public D:I

.field public E:Landroid/os/Bundle;

.field public F:B

.field public G:Ljava/lang/String;

.field public H:Ljava/lang/String;

.field public I:Ljava/lang/String;

.field public J:Ljava/lang/String;

.field public K:Lcom/ss/android/ttvecamera/TECameraSettings$d;

.field public L:Z

.field public M:Z

.field public N:I

.field public O:I

.field public P:Z

.field public Q:Z

.field public R:Z

.field public S:Z

.field public T:I

.field public U:Z

.field public V:Z

.field public W:I

.field public X:I

.field public Y:I

.field public Z:Z

.field public a:Landroid/content/Context;

.field public a0:Z

.field public b:I

.field public b0:Z

.field public c:Lcom/ss/android/ttvecamera/TEFrameRateRange;

.field public c0:Ljava/lang/String;

.field public d:I

.field public d0:I

.field public e:I

.field public e0:Ljava/lang/String;

.field public f:I

.field public f0:I

.field public g:I

.field public g0:Z

.field public h:Z

.field public h0:Z

.field public i:Z

.field public i0:Z

.field public j:Z

.field public j0:Z

.field public k:Z

.field public final k0:I

.field public l:Z

.field public l0:Z

.field public m:Z

.field public m0:Z

.field public n:Z

.field public n0:Z

.field public o:Z

.field public o0:Z

.field public p:F

.field public p0:Z

.field public q:Lcom/ss/android/ttvecamera/TEFrameSizei;

.field public q0:Z

.field public r:Lcom/ss/android/ttvecamera/TEFrameSizei;

.field public r0:Z

.field public s:Lcom/ss/android/ttvecamera/TEFrameSizei;

.field public s0:Z

.field public t:I

.field public t0:F

.field public u:I

.field public u0:F

.field public v:I

.field public v0:Z

.field public w:I

.field public w0:Z

.field public x:I

.field public x0:F

.field public y:F

.field public y0:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig;

.field public z:Z


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 1
    const-string v8, "landscape"

    .line 2
    .line 3
    const-string v9, "snow"

    .line 4
    .line 5
    const-string v0, "auto"

    .line 6
    .line 7
    const-string v1, "portrait"

    .line 8
    .line 9
    const-string v2, "party"

    .line 10
    .line 11
    const-string v3, "sunset"

    .line 12
    .line 13
    const-string v4, "candlelight"

    .line 14
    .line 15
    const-string v5, "night"

    .line 16
    .line 17
    const-string v6, "hdr"

    .line 18
    .line 19
    const-string v7, "action"

    .line 20
    .line 21
    filled-new-array/range {v0 .. v9}, [Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sput-object v0, Lcom/ss/android/ttvecamera/TECameraSettings;->z0:[Ljava/lang/String;

    .line 26
    .line 27
    const/4 v0, 0x2

    .line 28
    const/4 v1, 0x0

    .line 29
    const/4 v2, 0x1

    .line 30
    const/4 v3, 0x3

    .line 31
    filled-new-array {v0, v1, v2, v3}, [I

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    sput-object v4, Lcom/ss/android/ttvecamera/TECameraSettings;->A0:[I

    .line 36
    .line 37
    filled-new-array {v2, v0, v1, v3}, [I

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sput-object v0, Lcom/ss/android/ttvecamera/TECameraSettings;->B0:[I

    .line 42
    .line 43
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 7
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 230
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 231
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 232
    new-instance v1, Lcom/ss/android/ttvecamera/TEFrameRateRange;

    const/4 v2, 0x7

    const/16 v3, 0x1e

    invoke-direct {v1, v2, v3}, Lcom/ss/android/ttvecamera/TEFrameRateRange;-><init>(II)V

    iput-object v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->c:Lcom/ss/android/ttvecamera/TEFrameRateRange;

    const/4 v1, 0x0

    .line 233
    iput v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 234
    iput v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->e:I

    const/4 v2, -0x1

    .line 235
    iput v2, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->f:I

    const/16 v2, 0x11

    .line 236
    iput v2, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->g:I

    .line 237
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->h:Z

    .line 238
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->i:Z

    .line 239
    iput-boolean v0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->j:Z

    .line 240
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->k:Z

    .line 241
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->l:Z

    .line 242
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->m:Z

    .line 243
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->n:Z

    .line 244
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->o:Z

    const/high16 v2, -0x40800000    # -1.0f

    .line 245
    iput v2, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->p:F

    .line 246
    new-instance v4, Lcom/ss/android/ttvecamera/TEFrameSizei;

    const/16 v5, 0x500

    const/16 v6, 0x2d0

    invoke-direct {v4, v5, v6}, Lcom/ss/android/ttvecamera/TEFrameSizei;-><init>(II)V

    iput-object v4, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->q:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 247
    new-instance v4, Lcom/ss/android/ttvecamera/TEFrameSizei;

    const/16 v5, 0x780

    const/16 v6, 0x438

    invoke-direct {v4, v5, v6}, Lcom/ss/android/ttvecamera/TEFrameSizei;-><init>(II)V

    iput-object v4, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->r:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 248
    new-instance v4, Lcom/ss/android/ttvecamera/TEFrameSizei;

    invoke-direct {v4, v5, v6}, Lcom/ss/android/ttvecamera/TEFrameSizei;-><init>(II)V

    iput-object v4, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->s:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 249
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->t:I

    .line 250
    iput v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->u:I

    .line 251
    iput v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->v:I

    .line 252
    iput v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->w:I

    .line 253
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->x:I

    const/4 v4, 0x0

    .line 254
    iput v4, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->y:F

    .line 255
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->z:Z

    .line 256
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->A:Z

    .line 257
    iput v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->B:I

    .line 258
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->C:I

    .line 259
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->D:I

    .line 260
    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    iput-object v4, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->E:Landroid/os/Bundle;

    .line 261
    iput-byte v0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->F:B

    .line 262
    const-string v4, "auto"

    iput-object v4, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->G:Ljava/lang/String;

    .line 263
    const-string v5, "0"

    iput-object v5, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->H:Ljava/lang/String;

    .line 264
    iput-object v5, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->I:Ljava/lang/String;

    .line 265
    const-string v5, "-1"

    iput-object v5, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->J:Ljava/lang/String;

    .line 266
    new-instance v5, Lcom/ss/android/ttvecamera/TECameraSettings$d;

    invoke-direct {v5}, Lcom/ss/android/ttvecamera/TECameraSettings$d;-><init>()V

    iput-object v5, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->K:Lcom/ss/android/ttvecamera/TECameraSettings$d;

    .line 267
    iput-boolean v0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->L:Z

    .line 268
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->M:Z

    .line 269
    iput v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->N:I

    .line 270
    iput v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->O:I

    .line 271
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->P:Z

    .line 272
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->Q:Z

    .line 273
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->R:Z

    .line 274
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->S:Z

    const/16 v5, 0x32

    .line 275
    iput v5, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->T:I

    .line 276
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->U:Z

    .line 277
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->V:Z

    const/16 v5, 0x9c4

    .line 278
    iput v5, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->W:I

    .line 279
    iput v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->X:I

    .line 280
    iput v3, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->Y:I

    .line 281
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->Z:Z

    .line 282
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->a0:Z

    .line 283
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->b0:Z

    .line 284
    const-string v3, ""

    iput-object v3, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->c0:Ljava/lang/String;

    .line 285
    iput v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->d0:I

    .line 286
    iput-object v4, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->e0:Ljava/lang/String;

    .line 287
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->f0:I

    .line 288
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->g0:Z

    .line 289
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->h0:Z

    .line 290
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->i0:Z

    .line 291
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->j0:Z

    const/4 v3, 0x5

    .line 292
    iput v3, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->k0:I

    .line 293
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->m0:Z

    .line 294
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->n0:Z

    .line 295
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->o0:Z

    .line 296
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->p0:Z

    .line 297
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->q0:Z

    .line 298
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->r0:Z

    .line 299
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->s0:Z

    .line 300
    iput v2, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->t0:F

    .line 301
    iput v2, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->u0:F

    .line 302
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->v0:Z

    .line 303
    iput-boolean v0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->w0:Z

    const/high16 v0, 0x3f800000    # 1.0f

    .line 304
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->x0:F

    const/4 v0, 0x0

    .line 305
    iput-object v0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->y0:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig;

    .line 306
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->a:Landroid/content/Context;

    .line 307
    iput p2, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;III)V
    .locals 7
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 6
    .line 7
    new-instance v1, Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 8
    .line 9
    const/4 v2, 0x7

    .line 10
    const/16 v3, 0x1e

    .line 11
    .line 12
    invoke-direct {v1, v2, v3}, Lcom/ss/android/ttvecamera/TEFrameRateRange;-><init>(II)V

    .line 13
    .line 14
    .line 15
    iput-object v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->c:Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    iput v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->d:I

    .line 19
    .line 20
    iput v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->e:I

    .line 21
    .line 22
    const/4 v2, -0x1

    .line 23
    iput v2, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->f:I

    .line 24
    .line 25
    const/16 v2, 0x11

    .line 26
    .line 27
    iput v2, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->g:I

    .line 28
    .line 29
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->h:Z

    .line 30
    .line 31
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->i:Z

    .line 32
    .line 33
    iput-boolean v0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->j:Z

    .line 34
    .line 35
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->k:Z

    .line 36
    .line 37
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->l:Z

    .line 38
    .line 39
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->m:Z

    .line 40
    .line 41
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->n:Z

    .line 42
    .line 43
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->o:Z

    .line 44
    .line 45
    const/high16 v2, -0x40800000    # -1.0f

    .line 46
    .line 47
    iput v2, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->p:F

    .line 48
    .line 49
    new-instance v4, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 50
    .line 51
    const/16 v5, 0x500

    .line 52
    .line 53
    const/16 v6, 0x2d0

    .line 54
    .line 55
    invoke-direct {v4, v5, v6}, Lcom/ss/android/ttvecamera/TEFrameSizei;-><init>(II)V

    .line 56
    .line 57
    .line 58
    iput-object v4, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->q:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 59
    .line 60
    new-instance v4, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 61
    .line 62
    const/16 v5, 0x780

    .line 63
    .line 64
    const/16 v6, 0x438

    .line 65
    .line 66
    invoke-direct {v4, v5, v6}, Lcom/ss/android/ttvecamera/TEFrameSizei;-><init>(II)V

    .line 67
    .line 68
    .line 69
    iput-object v4, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->r:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 70
    .line 71
    new-instance v4, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 72
    .line 73
    invoke-direct {v4, v5, v6}, Lcom/ss/android/ttvecamera/TEFrameSizei;-><init>(II)V

    .line 74
    .line 75
    .line 76
    iput-object v4, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->s:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 77
    .line 78
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->t:I

    .line 79
    .line 80
    iput v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->u:I

    .line 81
    .line 82
    iput v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->v:I

    .line 83
    .line 84
    iput v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->w:I

    .line 85
    .line 86
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->x:I

    .line 87
    .line 88
    const/4 v4, 0x0

    .line 89
    iput v4, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->y:F

    .line 90
    .line 91
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->z:Z

    .line 92
    .line 93
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->A:Z

    .line 94
    .line 95
    iput v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->B:I

    .line 96
    .line 97
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->C:I

    .line 98
    .line 99
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->D:I

    .line 100
    .line 101
    new-instance v4, Landroid/os/Bundle;

    .line 102
    .line 103
    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    .line 104
    .line 105
    .line 106
    iput-object v4, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->E:Landroid/os/Bundle;

    .line 107
    .line 108
    iput-byte v0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->F:B

    .line 109
    .line 110
    const-string v4, "auto"

    .line 111
    .line 112
    iput-object v4, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->G:Ljava/lang/String;

    .line 113
    .line 114
    const-string v5, "0"

    .line 115
    .line 116
    iput-object v5, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->H:Ljava/lang/String;

    .line 117
    .line 118
    iput-object v5, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->I:Ljava/lang/String;

    .line 119
    .line 120
    const-string v5, "-1"

    .line 121
    .line 122
    iput-object v5, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->J:Ljava/lang/String;

    .line 123
    .line 124
    new-instance v5, Lcom/ss/android/ttvecamera/TECameraSettings$d;

    .line 125
    .line 126
    invoke-direct {v5}, Lcom/ss/android/ttvecamera/TECameraSettings$d;-><init>()V

    .line 127
    .line 128
    .line 129
    iput-object v5, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->K:Lcom/ss/android/ttvecamera/TECameraSettings$d;

    .line 130
    .line 131
    iput-boolean v0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->L:Z

    .line 132
    .line 133
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->M:Z

    .line 134
    .line 135
    iput v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->N:I

    .line 136
    .line 137
    iput v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->O:I

    .line 138
    .line 139
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->P:Z

    .line 140
    .line 141
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->Q:Z

    .line 142
    .line 143
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->R:Z

    .line 144
    .line 145
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->S:Z

    .line 146
    .line 147
    const/16 v5, 0x32

    .line 148
    .line 149
    iput v5, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->T:I

    .line 150
    .line 151
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->U:Z

    .line 152
    .line 153
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->V:Z

    .line 154
    .line 155
    const/16 v5, 0x9c4

    .line 156
    .line 157
    iput v5, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->W:I

    .line 158
    .line 159
    iput v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->X:I

    .line 160
    .line 161
    iput v3, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->Y:I

    .line 162
    .line 163
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->Z:Z

    .line 164
    .line 165
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->a0:Z

    .line 166
    .line 167
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->b0:Z

    .line 168
    .line 169
    const-string v3, ""

    .line 170
    .line 171
    iput-object v3, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->c0:Ljava/lang/String;

    .line 172
    .line 173
    iput v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->d0:I

    .line 174
    .line 175
    iput-object v4, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->e0:Ljava/lang/String;

    .line 176
    .line 177
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->f0:I

    .line 178
    .line 179
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->g0:Z

    .line 180
    .line 181
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->h0:Z

    .line 182
    .line 183
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->i0:Z

    .line 184
    .line 185
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->j0:Z

    .line 186
    .line 187
    const/4 v3, 0x5

    .line 188
    iput v3, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->k0:I

    .line 189
    .line 190
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->m0:Z

    .line 191
    .line 192
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->n0:Z

    .line 193
    .line 194
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->o0:Z

    .line 195
    .line 196
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->p0:Z

    .line 197
    .line 198
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->q0:Z

    .line 199
    .line 200
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->r0:Z

    .line 201
    .line 202
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->s0:Z

    .line 203
    .line 204
    iput v2, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->t0:F

    .line 205
    .line 206
    iput v2, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->u0:F

    .line 207
    .line 208
    iput-boolean v1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->v0:Z

    .line 209
    .line 210
    iput-boolean v0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->w0:Z

    .line 211
    .line 212
    const/high16 v0, 0x3f800000    # 1.0f

    .line 213
    .line 214
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->x0:F

    .line 215
    .line 216
    const/4 v0, 0x0

    .line 217
    iput-object v0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->y0:Lcom/ss/android/ttvecamera/TECameraSettings$ARConfig;

    .line 218
    .line 219
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->a:Landroid/content/Context;

    .line 220
    .line 221
    iput p2, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->b:I

    .line 222
    .line 223
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->q:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 224
    .line 225
    iput p3, p0, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 226
    .line 227
    iput p4, p0, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 228
    .line 229
    return-void
.end method


# virtual methods
.method public a()Lcom/ss/android/ttvecamera/TEFrameSizei;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraSettings;->q:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 2
    .line 3
    return-object p0
.end method
