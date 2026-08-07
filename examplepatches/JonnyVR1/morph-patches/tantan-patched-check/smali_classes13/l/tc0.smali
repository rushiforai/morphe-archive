.class public Ll/tc0;
.super Lcom/momo/pipline/codec/MediaBaseCodecFilter;
.source "SourceFile"

# interfaces
.implements Lio/agora/rtc2/IAudioFrameObserver;
.implements Ll/dpl;
.implements Ll/wyl;
.implements Ll/o410$f;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/tc0$l;
    }
.end annotation


# static fields
.field private static final D3:[F


# instance fields
.field private volatile A1:Z

.field public final A2:I

.field private A3:Z

.field private B1:Ljava/lang/String;

.field public final B2:I

.field private B3:Lcom/immomo/mediacore/coninf/MRtcPusherHandler;

.field private C1:Ljava/lang/String;

.field public final C2:I

.field private C3:Z

.field public D1:Landroid/graphics/SurfaceTexture;

.field private D2:Z

.field private E0:I

.field private E1:Lcom/immomo/mediacore/sink/CongressUtil;

.field private E2:J

.field private F0:I

.field private F1:Lcom/immomo/mediacore/audio/pcmDataAvailableCallback;

.field private F2:J

.field private G0:Z

.field private G1:I

.field G2:Lcom/immomo/mediacore/coninf/MRtcReceiveSeiHandler;

.field private H0:Z

.field private H1:I

.field private H2:Lcom/immomo/mediacore/coninf/MRtcExitRoomHandler;

.field private I0:Ljava/lang/String;

.field private I1:I

.field private I2:Ll/kod0;

.field private J0:Ll/g510;

.field private J1:I

.field private J2:I

.field private K0:Ll/dc1;

.field private K1:Ljava/lang/String;

.field private K2:J

.field private L0:J

.field private L1:Z

.field private L2:Ljava/lang/Runnable;

.field private M0:I

.field M1:Lio/agora/rtc2/IRtcEngineEventHandler;

.field private M2:Z

.field private N0:J

.field N1:Ljava/lang/Runnable;

.field private N2:F

.field private O0:Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;

.field private O1:[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;

.field private O2:F

.field private P0:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;

.field private P1:Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

.field private P2:F

.field private Q0:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

.field private Q1:Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;

.field private Q2:F

.field private R0:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap<",
            "Ljava/lang/Long;",
            "Ll/iny;",
            ">;"
        }
    .end annotation
.end field

.field private R1:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

.field private R2:I

.field private final S:Ljava/lang/String;

.field private S0:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap<",
            "Ljava/lang/Long;",
            "Ll/xhy;",
            ">;"
        }
    .end annotation
.end field

.field private S1:Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

.field private S2:I

.field private T:Z

.field private T0:Z

.field private T1:Lcom/immomo/mediacore/coninf/MRtcTokenWillExpireHander;

.field private T2:I

.field private U:Lio/agora/rtc2/RtcEngine;

.field private U0:Z

.field private U1:Ll/wpw;

.field private U2:I

.field private V:I

.field private V0:I

.field private V1:Lcom/immomo/mediacore/coninf/MRtcQualityHandler;

.field private V2:Z

.field private W:Landroid/opengl/EGLContext;

.field private W0:I

.field private W1:Lcom/immomo/mediacore/coninf/MRtcConnectHandler;

.field private W2:Z

.field private volatile X:Z

.field private volatile X0:I

.field private X1:Lcom/immomo/mediacore/coninf/MRtcClientRoleChangedHandler;

.field public X2:I

.field private Y:Z

.field private Y0:Ljava/lang/String;

.field private Y1:Ll/xpw;

.field private Y2:Z

.field private Z:Z

.field private Z0:Ll/ebl0;

.field private Z1:Ll/xpw;

.field private Z2:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

.field private a1:Ll/fbl0;

.field private a2:Ll/imw;

.field private a3:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private b1:Ll/gkl0;

.field private b2:Ll/tpw;

.field private b3:Ljava/lang/String;

.field private c1:Ll/gbl0;

.field private c2:Ll/tc0$l;

.field private c3:Z

.field private d1:Ll/dpl$a;

.field private d2:Z

.field private d3:I

.field private e1:Z

.field private e2:Z

.field private e3:Z

.field private f1:Z

.field private f2:Z

.field private f3:Z

.field private g1:Ll/q210$a;

.field private g2:Z

.field private g3:J

.field private h1:F

.field private h2:Lio/agora/rtc2/live/LiveTranscoding;

.field private h3:J

.field private i1:F

.field private i2:Z

.field private i3:I

.field public j1:I

.field private j2:Ljava/lang/String;

.field private j3:I

.field private k0:I

.field private k1:I

.field private k2:J

.field private k3:I

.field private l1:I

.field private l2:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private l3:Landroid/os/Handler;

.field private m1:I

.field public final m2:I

.field private m3:Z

.field private n1:I

.field public final n2:I

.field private n3:Z

.field private o1:Ll/ror;

.field public final o2:I

.field private o3:I

.field private p0:I

.field protected p1:I

.field public final p2:I

.field private p3:I

.field private q1:Z

.field public final q2:I

.field private q3:I

.field private r1:Ljava/lang/String;

.field public final r2:I

.field private r3:Ljava/lang/String;

.field private s1:I

.field public final s2:I

.field private volatile s3:Z

.field private t1:Ljava/lang/Object;

.field private final t2:I

.field private t3:Z

.field private u1:I

.field private final u2:I

.field private u3:J

.field private v1:Z

.field private v2:Lcom/immomo/mediacore/coninf/MRtcRealLayoutNotifyHander;

.field private v3:Z

.field private w1:Z

.field public final w2:I

.field private w3:Z

.field private x1:Z

.field public final x2:I

.field private x3:I

.field private y1:Ljava/lang/Object;

.field public final y2:I

.field private y3:I

.field private z1:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

.field public final z2:I

.field private volatile z3:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    new-array v0, v0, [F

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Ll/tc0;->D3:[F

    .line 9
    .line 10
    return-void

    .line 11
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Ll/g510;Ll/q210$a;Ll/uow;)V
    .locals 9
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0xf
    .end annotation

    .line 435
    invoke-direct {p0, p1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;-><init>(Landroid/content/Context;)V

    .line 436
    const-string p1, "Pipeline_Normal_pip->PIPLINE->AGORA"

    iput-object p1, p0, Ll/tc0;->S:Ljava/lang/String;

    const/4 p1, 0x1

    .line 437
    iput-boolean p1, p0, Ll/tc0;->T:Z

    const/4 v0, -0x1

    .line 438
    iput v0, p0, Ll/tc0;->V:I

    const/4 v1, 0x0

    .line 439
    iput-boolean v1, p0, Ll/tc0;->X:Z

    .line 440
    iput-boolean v1, p0, Ll/tc0;->Y:Z

    .line 441
    iput-boolean v1, p0, Ll/tc0;->Z:Z

    const/4 v2, 0x2

    .line 442
    iput v2, p0, Ll/tc0;->k0:I

    const/4 v3, 0x3

    .line 443
    iput v3, p0, Ll/tc0;->p0:I

    .line 444
    iput v0, p0, Ll/tc0;->E0:I

    .line 445
    iput v0, p0, Ll/tc0;->F0:I

    .line 446
    iput-boolean v1, p0, Ll/tc0;->G0:Z

    .line 447
    iput-boolean p1, p0, Ll/tc0;->H0:Z

    const/4 v4, 0x0

    .line 448
    iput-object v4, p0, Ll/tc0;->I0:Ljava/lang/String;

    const-wide/16 v5, 0x0

    .line 449
    iput-wide v5, p0, Ll/tc0;->L0:J

    .line 450
    iput v1, p0, Ll/tc0;->M0:I

    .line 451
    iput-wide v5, p0, Ll/tc0;->N0:J

    .line 452
    new-instance v7, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    invoke-direct {v7}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;-><init>()V

    iput-object v7, p0, Ll/tc0;->R0:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 453
    new-instance v7, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    invoke-direct {v7}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;-><init>()V

    iput-object v7, p0, Ll/tc0;->S0:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 454
    iput-boolean v1, p0, Ll/tc0;->T0:Z

    .line 455
    iput-boolean p1, p0, Ll/tc0;->U0:Z

    .line 456
    iput v1, p0, Ll/tc0;->V0:I

    .line 457
    iput v1, p0, Ll/tc0;->W0:I

    .line 458
    iput v1, p0, Ll/tc0;->X0:I

    .line 459
    iput-object v4, p0, Ll/tc0;->Y0:Ljava/lang/String;

    .line 460
    iput-object v4, p0, Ll/tc0;->Z0:Ll/ebl0;

    .line 461
    iput-object v4, p0, Ll/tc0;->a1:Ll/fbl0;

    .line 462
    iput-object v4, p0, Ll/tc0;->b1:Ll/gkl0;

    .line 463
    iput-object v4, p0, Ll/tc0;->c1:Ll/gbl0;

    .line 464
    iput-boolean v1, p0, Ll/tc0;->e1:Z

    .line 465
    iput-boolean v1, p0, Ll/tc0;->f1:Z

    const/high16 v7, 0x3f800000    # 1.0f

    .line 466
    iput v7, p0, Ll/tc0;->h1:F

    .line 467
    iput v7, p0, Ll/tc0;->i1:F

    const v7, 0xac44

    .line 468
    iput v7, p0, Ll/tc0;->j1:I

    .line 469
    iput v1, p0, Ll/tc0;->k1:I

    .line 470
    iput v1, p0, Ll/tc0;->l1:I

    iput v1, p0, Ll/tc0;->m1:I

    iput v1, p0, Ll/tc0;->n1:I

    .line 471
    iput v0, p0, Ll/tc0;->p1:I

    .line 472
    iput-object v4, p0, Ll/tc0;->r1:Ljava/lang/String;

    .line 473
    iput p1, p0, Ll/tc0;->s1:I

    .line 474
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Ll/tc0;->t1:Ljava/lang/Object;

    .line 475
    iput v1, p0, Ll/tc0;->u1:I

    .line 476
    iput-boolean v1, p0, Ll/tc0;->v1:Z

    .line 477
    iput-boolean v1, p0, Ll/tc0;->w1:Z

    .line 478
    iput-boolean v1, p0, Ll/tc0;->x1:Z

    .line 479
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Ll/tc0;->y1:Ljava/lang/Object;

    .line 480
    new-instance v0, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    invoke-direct {v0}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;-><init>()V

    iput-object v0, p0, Ll/tc0;->z1:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 481
    iput-boolean v1, p0, Ll/tc0;->A1:Z

    .line 482
    iput-object v4, p0, Ll/tc0;->D1:Landroid/graphics/SurfaceTexture;

    .line 483
    iput-object v4, p0, Ll/tc0;->E1:Lcom/immomo/mediacore/sink/CongressUtil;

    .line 484
    iput v1, p0, Ll/tc0;->G1:I

    .line 485
    iput v2, p0, Ll/tc0;->H1:I

    const/16 v0, 0x2ee

    .line 486
    iput v0, p0, Ll/tc0;->I1:I

    .line 487
    iput v1, p0, Ll/tc0;->J1:I

    .line 488
    const-string v0, ""

    iput-object v0, p0, Ll/tc0;->K1:Ljava/lang/String;

    .line 489
    iput-boolean v1, p0, Ll/tc0;->L1:Z

    .line 490
    iput-object v4, p0, Ll/tc0;->N1:Ljava/lang/Runnable;

    .line 491
    iput-object v4, p0, Ll/tc0;->O1:[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;

    .line 492
    new-instance v7, Ll/xpw;

    invoke-direct {v7}, Ll/xpw;-><init>()V

    iput-object v7, p0, Ll/tc0;->Y1:Ll/xpw;

    .line 493
    new-instance v7, Ll/xpw;

    invoke-direct {v7}, Ll/xpw;-><init>()V

    iput-object v7, p0, Ll/tc0;->Z1:Ll/xpw;

    .line 494
    new-instance v7, Ll/imw;

    invoke-direct {v7}, Ll/imw;-><init>()V

    iput-object v7, p0, Ll/tc0;->a2:Ll/imw;

    .line 495
    new-instance v7, Ll/tpw;

    invoke-direct {v7}, Ll/tpw;-><init>()V

    iput-object v7, p0, Ll/tc0;->b2:Ll/tpw;

    .line 496
    iput-boolean v1, p0, Ll/tc0;->d2:Z

    .line 497
    iput-boolean v1, p0, Ll/tc0;->e2:Z

    .line 498
    iput-boolean p1, p0, Ll/tc0;->f2:Z

    .line 499
    iput-boolean v1, p0, Ll/tc0;->g2:Z

    .line 500
    iput-object v4, p0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 501
    iput-boolean v1, p0, Ll/tc0;->i2:Z

    .line 502
    iput-wide v5, p0, Ll/tc0;->k2:J

    .line 503
    new-instance v7, Ljava/util/ArrayList;

    const/16 v8, 0x14

    invoke-direct {v7, v8}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v7, p0, Ll/tc0;->l2:Ljava/util/ArrayList;

    .line 504
    iput v1, p0, Ll/tc0;->m2:I

    .line 505
    iput p1, p0, Ll/tc0;->n2:I

    .line 506
    iput v2, p0, Ll/tc0;->o2:I

    .line 507
    iput v3, p0, Ll/tc0;->p2:I

    const/4 v7, 0x4

    .line 508
    iput v7, p0, Ll/tc0;->q2:I

    const/4 v7, 0x5

    .line 509
    iput v7, p0, Ll/tc0;->r2:I

    const/4 v7, 0x6

    .line 510
    iput v7, p0, Ll/tc0;->s2:I

    const/4 v7, 0x7

    .line 511
    iput v7, p0, Ll/tc0;->t2:I

    const/16 v7, 0x8

    .line 512
    iput v7, p0, Ll/tc0;->u2:I

    .line 513
    iput-object v4, p0, Ll/tc0;->v2:Lcom/immomo/mediacore/coninf/MRtcRealLayoutNotifyHander;

    .line 514
    iput v1, p0, Ll/tc0;->w2:I

    .line 515
    iput p1, p0, Ll/tc0;->x2:I

    .line 516
    iput v2, p0, Ll/tc0;->y2:I

    .line 517
    iput v3, p0, Ll/tc0;->z2:I

    .line 518
    iput v1, p0, Ll/tc0;->A2:I

    .line 519
    iput p1, p0, Ll/tc0;->B2:I

    .line 520
    iput v2, p0, Ll/tc0;->C2:I

    .line 521
    iput-boolean v1, p0, Ll/tc0;->D2:Z

    const-wide/high16 v2, -0x8000000000000000L

    .line 522
    iput-wide v2, p0, Ll/tc0;->E2:J

    const-wide/16 v2, 0x3e8

    .line 523
    iput-wide v2, p0, Ll/tc0;->F2:J

    .line 524
    iput-object v4, p0, Ll/tc0;->G2:Lcom/immomo/mediacore/coninf/MRtcReceiveSeiHandler;

    .line 525
    iput p1, p0, Ll/tc0;->J2:I

    .line 526
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Ll/tc0;->K2:J

    .line 527
    iput-object v4, p0, Ll/tc0;->L2:Ljava/lang/Runnable;

    .line 528
    iput-boolean v1, p0, Ll/tc0;->M2:Z

    const/4 v2, 0x0

    .line 529
    iput v2, p0, Ll/tc0;->N2:F

    .line 530
    iput v2, p0, Ll/tc0;->O2:F

    .line 531
    iput v2, p0, Ll/tc0;->P2:F

    .line 532
    iput v2, p0, Ll/tc0;->Q2:F

    .line 533
    iput v1, p0, Ll/tc0;->R2:I

    .line 534
    iput v1, p0, Ll/tc0;->S2:I

    .line 535
    iput v1, p0, Ll/tc0;->T2:I

    .line 536
    iput v1, p0, Ll/tc0;->U2:I

    .line 537
    iput-boolean p1, p0, Ll/tc0;->V2:Z

    .line 538
    iput-boolean v1, p0, Ll/tc0;->W2:Z

    .line 539
    iput v1, p0, Ll/tc0;->X2:I

    .line 540
    iput-boolean v1, p0, Ll/tc0;->Y2:Z

    .line 541
    new-instance v2, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    invoke-direct {v2}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;-><init>()V

    iput-object v2, p0, Ll/tc0;->Z2:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 542
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v8}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v2, p0, Ll/tc0;->a3:Ljava/util/ArrayList;

    .line 543
    iput-object v0, p0, Ll/tc0;->b3:Ljava/lang/String;

    .line 544
    iput-boolean v1, p0, Ll/tc0;->c3:Z

    .line 545
    iput v1, p0, Ll/tc0;->d3:I

    .line 546
    iput-boolean v1, p0, Ll/tc0;->e3:Z

    .line 547
    iput-boolean v1, p0, Ll/tc0;->f3:Z

    const-wide/16 v2, -0x1

    .line 548
    iput-wide v2, p0, Ll/tc0;->g3:J

    .line 549
    iput-wide v2, p0, Ll/tc0;->h3:J

    .line 550
    iput v1, p0, Ll/tc0;->i3:I

    .line 551
    iput v1, p0, Ll/tc0;->j3:I

    .line 552
    iput v1, p0, Ll/tc0;->k3:I

    .line 553
    new-instance v2, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v2, p0, Ll/tc0;->l3:Landroid/os/Handler;

    .line 554
    iput-boolean v1, p0, Ll/tc0;->m3:Z

    .line 555
    iput-boolean v1, p0, Ll/tc0;->n3:Z

    .line 556
    iput v1, p0, Ll/tc0;->o3:I

    .line 557
    iput v1, p0, Ll/tc0;->p3:I

    .line 558
    iput v1, p0, Ll/tc0;->q3:I

    .line 559
    iput-object v0, p0, Ll/tc0;->r3:Ljava/lang/String;

    .line 560
    iput-boolean v1, p0, Ll/tc0;->s3:Z

    .line 561
    iput-boolean v1, p0, Ll/tc0;->t3:Z

    .line 562
    iput-wide v5, p0, Ll/tc0;->u3:J

    .line 563
    iput-boolean v1, p0, Ll/tc0;->v3:Z

    .line 564
    iput-boolean v1, p0, Ll/tc0;->w3:Z

    .line 565
    iput v1, p0, Ll/tc0;->x3:I

    .line 566
    iput v1, p0, Ll/tc0;->y3:I

    .line 567
    iput-boolean v1, p0, Ll/tc0;->z3:Z

    .line 568
    iput-boolean v1, p0, Ll/tc0;->A3:Z

    .line 569
    iput-boolean v1, p0, Ll/tc0;->C3:Z

    .line 570
    iput-object p2, p0, Ll/tc0;->J0:Ll/g510;

    .line 571
    move-object p2, p4

    check-cast p2, Ll/ror;

    iput-object p2, p0, Ll/tc0;->o1:Ll/ror;

    .line 572
    iput-boolean v1, p0, Ll/tc0;->T0:Z

    .line 573
    iput-boolean p1, p0, Ll/tc0;->U0:Z

    .line 574
    iput-object p3, p0, Ll/tc0;->g1:Ll/q210$a;

    .line 575
    new-instance p1, Lcom/immomo/mediacore/sink/CongressUtil;

    invoke-direct {p1}, Lcom/immomo/mediacore/sink/CongressUtil;-><init>()V

    iput-object p1, p0, Ll/tc0;->E1:Lcom/immomo/mediacore/sink/CongressUtil;

    .line 576
    invoke-direct {p0, p4}, Ll/tc0;->h6(Ll/uow;)Lio/agora/rtc2/RtcEngine;

    .line 577
    iget-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    const-wide/16 p2, 0x102

    iput-wide p2, p1, Ll/wvx;->d:J

    .line 578
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    iput-object p0, p1, Ll/wvx;->e1:Ljava/lang/String;

    .line 579
    new-instance p0, Landroid/content/IntentFilter;

    invoke-direct {p0}, Landroid/content/IntentFilter;-><init>()V

    .line 580
    const-string p1, "android.intent.action.HEADSET_PLUG"

    invoke-virtual {p0, p1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ll/g510;Ll/q210$a;Ll/uow;Ljava/lang/String;)V
    .locals 9

    .line 1
    invoke-direct {p0, p1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 5
    .line 6
    iput-object p1, p0, Ll/tc0;->S:Ljava/lang/String;

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    iput-boolean p1, p0, Ll/tc0;->T:Z

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    iput v0, p0, Ll/tc0;->V:I

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    iput-boolean v1, p0, Ll/tc0;->X:Z

    .line 16
    .line 17
    iput-boolean v1, p0, Ll/tc0;->Y:Z

    .line 18
    .line 19
    iput-boolean v1, p0, Ll/tc0;->Z:Z

    .line 20
    .line 21
    const/4 v2, 0x2

    .line 22
    iput v2, p0, Ll/tc0;->k0:I

    .line 23
    .line 24
    const/4 v3, 0x3

    .line 25
    iput v3, p0, Ll/tc0;->p0:I

    .line 26
    .line 27
    iput v0, p0, Ll/tc0;->E0:I

    .line 28
    .line 29
    iput v0, p0, Ll/tc0;->F0:I

    .line 30
    .line 31
    iput-boolean v1, p0, Ll/tc0;->G0:Z

    .line 32
    .line 33
    iput-boolean p1, p0, Ll/tc0;->H0:Z

    .line 34
    .line 35
    const/4 v4, 0x0

    .line 36
    iput-object v4, p0, Ll/tc0;->I0:Ljava/lang/String;

    .line 37
    .line 38
    const-wide/16 v5, 0x0

    .line 39
    .line 40
    iput-wide v5, p0, Ll/tc0;->L0:J

    .line 41
    .line 42
    iput v1, p0, Ll/tc0;->M0:I

    .line 43
    .line 44
    iput-wide v5, p0, Ll/tc0;->N0:J

    .line 45
    .line 46
    new-instance v7, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 47
    .line 48
    invoke-direct {v7}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object v7, p0, Ll/tc0;->R0:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 52
    .line 53
    new-instance v7, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 54
    .line 55
    invoke-direct {v7}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;-><init>()V

    .line 56
    .line 57
    .line 58
    iput-object v7, p0, Ll/tc0;->S0:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 59
    .line 60
    iput-boolean v1, p0, Ll/tc0;->T0:Z

    .line 61
    .line 62
    iput-boolean p1, p0, Ll/tc0;->U0:Z

    .line 63
    .line 64
    iput v1, p0, Ll/tc0;->V0:I

    .line 65
    .line 66
    iput v1, p0, Ll/tc0;->W0:I

    .line 67
    .line 68
    iput v1, p0, Ll/tc0;->X0:I

    .line 69
    .line 70
    iput-object v4, p0, Ll/tc0;->Y0:Ljava/lang/String;

    .line 71
    .line 72
    iput-object v4, p0, Ll/tc0;->Z0:Ll/ebl0;

    .line 73
    .line 74
    iput-object v4, p0, Ll/tc0;->a1:Ll/fbl0;

    .line 75
    .line 76
    iput-object v4, p0, Ll/tc0;->b1:Ll/gkl0;

    .line 77
    .line 78
    iput-object v4, p0, Ll/tc0;->c1:Ll/gbl0;

    .line 79
    .line 80
    iput-boolean v1, p0, Ll/tc0;->e1:Z

    .line 81
    .line 82
    iput-boolean v1, p0, Ll/tc0;->f1:Z

    .line 83
    .line 84
    const/high16 v7, 0x3f800000    # 1.0f

    .line 85
    .line 86
    iput v7, p0, Ll/tc0;->h1:F

    .line 87
    .line 88
    iput v7, p0, Ll/tc0;->i1:F

    .line 89
    .line 90
    const v7, 0xac44

    .line 91
    .line 92
    .line 93
    iput v7, p0, Ll/tc0;->j1:I

    .line 94
    .line 95
    iput v1, p0, Ll/tc0;->k1:I

    .line 96
    .line 97
    iput v1, p0, Ll/tc0;->l1:I

    .line 98
    .line 99
    iput v1, p0, Ll/tc0;->m1:I

    .line 100
    .line 101
    iput v1, p0, Ll/tc0;->n1:I

    .line 102
    .line 103
    iput v0, p0, Ll/tc0;->p1:I

    .line 104
    .line 105
    iput-object v4, p0, Ll/tc0;->r1:Ljava/lang/String;

    .line 106
    .line 107
    iput p1, p0, Ll/tc0;->s1:I

    .line 108
    .line 109
    new-instance v0, Ljava/lang/Object;

    .line 110
    .line 111
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 112
    .line 113
    .line 114
    iput-object v0, p0, Ll/tc0;->t1:Ljava/lang/Object;

    .line 115
    .line 116
    iput v1, p0, Ll/tc0;->u1:I

    .line 117
    .line 118
    iput-boolean v1, p0, Ll/tc0;->v1:Z

    .line 119
    .line 120
    iput-boolean v1, p0, Ll/tc0;->w1:Z

    .line 121
    .line 122
    iput-boolean v1, p0, Ll/tc0;->x1:Z

    .line 123
    .line 124
    new-instance v0, Ljava/lang/Object;

    .line 125
    .line 126
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 127
    .line 128
    .line 129
    iput-object v0, p0, Ll/tc0;->y1:Ljava/lang/Object;

    .line 130
    .line 131
    new-instance v0, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 132
    .line 133
    invoke-direct {v0}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;-><init>()V

    .line 134
    .line 135
    .line 136
    iput-object v0, p0, Ll/tc0;->z1:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 137
    .line 138
    iput-boolean v1, p0, Ll/tc0;->A1:Z

    .line 139
    .line 140
    iput-object v4, p0, Ll/tc0;->D1:Landroid/graphics/SurfaceTexture;

    .line 141
    .line 142
    iput-object v4, p0, Ll/tc0;->E1:Lcom/immomo/mediacore/sink/CongressUtil;

    .line 143
    .line 144
    iput v1, p0, Ll/tc0;->G1:I

    .line 145
    .line 146
    iput v2, p0, Ll/tc0;->H1:I

    .line 147
    .line 148
    const/16 v0, 0x2ee

    .line 149
    .line 150
    iput v0, p0, Ll/tc0;->I1:I

    .line 151
    .line 152
    iput v1, p0, Ll/tc0;->J1:I

    .line 153
    .line 154
    const-string v0, ""

    .line 155
    .line 156
    iput-object v0, p0, Ll/tc0;->K1:Ljava/lang/String;

    .line 157
    .line 158
    iput-boolean v1, p0, Ll/tc0;->L1:Z

    .line 159
    .line 160
    iput-object v4, p0, Ll/tc0;->N1:Ljava/lang/Runnable;

    .line 161
    .line 162
    iput-object v4, p0, Ll/tc0;->O1:[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;

    .line 163
    .line 164
    new-instance v7, Ll/xpw;

    .line 165
    .line 166
    invoke-direct {v7}, Ll/xpw;-><init>()V

    .line 167
    .line 168
    .line 169
    iput-object v7, p0, Ll/tc0;->Y1:Ll/xpw;

    .line 170
    .line 171
    new-instance v7, Ll/xpw;

    .line 172
    .line 173
    invoke-direct {v7}, Ll/xpw;-><init>()V

    .line 174
    .line 175
    .line 176
    iput-object v7, p0, Ll/tc0;->Z1:Ll/xpw;

    .line 177
    .line 178
    new-instance v7, Ll/imw;

    .line 179
    .line 180
    invoke-direct {v7}, Ll/imw;-><init>()V

    .line 181
    .line 182
    .line 183
    iput-object v7, p0, Ll/tc0;->a2:Ll/imw;

    .line 184
    .line 185
    new-instance v7, Ll/tpw;

    .line 186
    .line 187
    invoke-direct {v7}, Ll/tpw;-><init>()V

    .line 188
    .line 189
    .line 190
    iput-object v7, p0, Ll/tc0;->b2:Ll/tpw;

    .line 191
    .line 192
    iput-boolean v1, p0, Ll/tc0;->d2:Z

    .line 193
    .line 194
    iput-boolean v1, p0, Ll/tc0;->e2:Z

    .line 195
    .line 196
    iput-boolean p1, p0, Ll/tc0;->f2:Z

    .line 197
    .line 198
    iput-boolean v1, p0, Ll/tc0;->g2:Z

    .line 199
    .line 200
    iput-object v4, p0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 201
    .line 202
    iput-boolean v1, p0, Ll/tc0;->i2:Z

    .line 203
    .line 204
    iput-wide v5, p0, Ll/tc0;->k2:J

    .line 205
    .line 206
    new-instance v7, Ljava/util/ArrayList;

    .line 207
    .line 208
    const/16 v8, 0x14

    .line 209
    .line 210
    invoke-direct {v7, v8}, Ljava/util/ArrayList;-><init>(I)V

    .line 211
    .line 212
    .line 213
    iput-object v7, p0, Ll/tc0;->l2:Ljava/util/ArrayList;

    .line 214
    .line 215
    iput v1, p0, Ll/tc0;->m2:I

    .line 216
    .line 217
    iput p1, p0, Ll/tc0;->n2:I

    .line 218
    .line 219
    iput v2, p0, Ll/tc0;->o2:I

    .line 220
    .line 221
    iput v3, p0, Ll/tc0;->p2:I

    .line 222
    .line 223
    const/4 v7, 0x4

    .line 224
    iput v7, p0, Ll/tc0;->q2:I

    .line 225
    .line 226
    const/4 v7, 0x5

    .line 227
    iput v7, p0, Ll/tc0;->r2:I

    .line 228
    .line 229
    const/4 v7, 0x6

    .line 230
    iput v7, p0, Ll/tc0;->s2:I

    .line 231
    .line 232
    const/4 v7, 0x7

    .line 233
    iput v7, p0, Ll/tc0;->t2:I

    .line 234
    .line 235
    const/16 v7, 0x8

    .line 236
    .line 237
    iput v7, p0, Ll/tc0;->u2:I

    .line 238
    .line 239
    iput-object v4, p0, Ll/tc0;->v2:Lcom/immomo/mediacore/coninf/MRtcRealLayoutNotifyHander;

    .line 240
    .line 241
    iput v1, p0, Ll/tc0;->w2:I

    .line 242
    .line 243
    iput p1, p0, Ll/tc0;->x2:I

    .line 244
    .line 245
    iput v2, p0, Ll/tc0;->y2:I

    .line 246
    .line 247
    iput v3, p0, Ll/tc0;->z2:I

    .line 248
    .line 249
    iput v1, p0, Ll/tc0;->A2:I

    .line 250
    .line 251
    iput p1, p0, Ll/tc0;->B2:I

    .line 252
    .line 253
    iput v2, p0, Ll/tc0;->C2:I

    .line 254
    .line 255
    iput-boolean v1, p0, Ll/tc0;->D2:Z

    .line 256
    .line 257
    const-wide/high16 v2, -0x8000000000000000L

    .line 258
    .line 259
    iput-wide v2, p0, Ll/tc0;->E2:J

    .line 260
    .line 261
    const-wide/16 v2, 0x3e8

    .line 262
    .line 263
    iput-wide v2, p0, Ll/tc0;->F2:J

    .line 264
    .line 265
    iput-object v4, p0, Ll/tc0;->G2:Lcom/immomo/mediacore/coninf/MRtcReceiveSeiHandler;

    .line 266
    .line 267
    iput p1, p0, Ll/tc0;->J2:I

    .line 268
    .line 269
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 270
    .line 271
    .line 272
    move-result-wide v2

    .line 273
    iput-wide v2, p0, Ll/tc0;->K2:J

    .line 274
    .line 275
    iput-object v4, p0, Ll/tc0;->L2:Ljava/lang/Runnable;

    .line 276
    .line 277
    iput-boolean v1, p0, Ll/tc0;->M2:Z

    .line 278
    .line 279
    const/4 v2, 0x0

    .line 280
    iput v2, p0, Ll/tc0;->N2:F

    .line 281
    .line 282
    iput v2, p0, Ll/tc0;->O2:F

    .line 283
    .line 284
    iput v2, p0, Ll/tc0;->P2:F

    .line 285
    .line 286
    iput v2, p0, Ll/tc0;->Q2:F

    .line 287
    .line 288
    iput v1, p0, Ll/tc0;->R2:I

    .line 289
    .line 290
    iput v1, p0, Ll/tc0;->S2:I

    .line 291
    .line 292
    iput v1, p0, Ll/tc0;->T2:I

    .line 293
    .line 294
    iput v1, p0, Ll/tc0;->U2:I

    .line 295
    .line 296
    iput-boolean p1, p0, Ll/tc0;->V2:Z

    .line 297
    .line 298
    iput-boolean v1, p0, Ll/tc0;->W2:Z

    .line 299
    .line 300
    iput v1, p0, Ll/tc0;->X2:I

    .line 301
    .line 302
    iput-boolean v1, p0, Ll/tc0;->Y2:Z

    .line 303
    .line 304
    new-instance v2, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 305
    .line 306
    invoke-direct {v2}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;-><init>()V

    .line 307
    .line 308
    .line 309
    iput-object v2, p0, Ll/tc0;->Z2:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 310
    .line 311
    new-instance v2, Ljava/util/ArrayList;

    .line 312
    .line 313
    invoke-direct {v2, v8}, Ljava/util/ArrayList;-><init>(I)V

    .line 314
    .line 315
    .line 316
    iput-object v2, p0, Ll/tc0;->a3:Ljava/util/ArrayList;

    .line 317
    .line 318
    iput-object v0, p0, Ll/tc0;->b3:Ljava/lang/String;

    .line 319
    .line 320
    iput-boolean v1, p0, Ll/tc0;->c3:Z

    .line 321
    .line 322
    iput v1, p0, Ll/tc0;->d3:I

    .line 323
    .line 324
    iput-boolean v1, p0, Ll/tc0;->e3:Z

    .line 325
    .line 326
    iput-boolean v1, p0, Ll/tc0;->f3:Z

    .line 327
    .line 328
    const-wide/16 v2, -0x1

    .line 329
    .line 330
    iput-wide v2, p0, Ll/tc0;->g3:J

    .line 331
    .line 332
    iput-wide v2, p0, Ll/tc0;->h3:J

    .line 333
    .line 334
    iput v1, p0, Ll/tc0;->i3:I

    .line 335
    .line 336
    iput v1, p0, Ll/tc0;->j3:I

    .line 337
    .line 338
    iput v1, p0, Ll/tc0;->k3:I

    .line 339
    .line 340
    new-instance v2, Landroid/os/Handler;

    .line 341
    .line 342
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 343
    .line 344
    .line 345
    move-result-object v3

    .line 346
    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 347
    .line 348
    .line 349
    iput-object v2, p0, Ll/tc0;->l3:Landroid/os/Handler;

    .line 350
    .line 351
    iput-boolean v1, p0, Ll/tc0;->m3:Z

    .line 352
    .line 353
    iput-boolean v1, p0, Ll/tc0;->n3:Z

    .line 354
    .line 355
    iput v1, p0, Ll/tc0;->o3:I

    .line 356
    .line 357
    iput v1, p0, Ll/tc0;->p3:I

    .line 358
    .line 359
    iput v1, p0, Ll/tc0;->q3:I

    .line 360
    .line 361
    iput-object v0, p0, Ll/tc0;->r3:Ljava/lang/String;

    .line 362
    .line 363
    iput-boolean v1, p0, Ll/tc0;->s3:Z

    .line 364
    .line 365
    iput-boolean v1, p0, Ll/tc0;->t3:Z

    .line 366
    .line 367
    iput-wide v5, p0, Ll/tc0;->u3:J

    .line 368
    .line 369
    iput-boolean v1, p0, Ll/tc0;->v3:Z

    .line 370
    .line 371
    iput-boolean v1, p0, Ll/tc0;->w3:Z

    .line 372
    .line 373
    iput v1, p0, Ll/tc0;->x3:I

    .line 374
    .line 375
    iput v1, p0, Ll/tc0;->y3:I

    .line 376
    .line 377
    iput-boolean v1, p0, Ll/tc0;->z3:Z

    .line 378
    .line 379
    iput-boolean v1, p0, Ll/tc0;->A3:Z

    .line 380
    .line 381
    iput-boolean v1, p0, Ll/tc0;->C3:Z

    .line 382
    .line 383
    iput-object p5, p0, Ll/tc0;->Y0:Ljava/lang/String;

    .line 384
    .line 385
    iput-object p2, p0, Ll/tc0;->J0:Ll/g510;

    .line 386
    .line 387
    move-object p2, p4

    .line 388
    check-cast p2, Ll/ror;

    .line 389
    .line 390
    iput-object p2, p0, Ll/tc0;->o1:Ll/ror;

    .line 391
    .line 392
    iput-boolean v1, p0, Ll/tc0;->T0:Z

    .line 393
    .line 394
    iput-boolean p1, p0, Ll/tc0;->U0:Z

    .line 395
    .line 396
    iput-object p3, p0, Ll/tc0;->g1:Ll/q210$a;

    .line 397
    .line 398
    new-instance p1, Lcom/immomo/mediacore/sink/CongressUtil;

    .line 399
    .line 400
    invoke-direct {p1}, Lcom/immomo/mediacore/sink/CongressUtil;-><init>()V

    .line 401
    .line 402
    .line 403
    iput-object p1, p0, Ll/tc0;->E1:Lcom/immomo/mediacore/sink/CongressUtil;

    .line 404
    .line 405
    invoke-direct {p0, p4}, Ll/tc0;->h6(Ll/uow;)Lio/agora/rtc2/RtcEngine;

    .line 406
    .line 407
    .line 408
    iget-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 409
    .line 410
    const-wide/16 p2, 0x102

    .line 411
    .line 412
    iput-wide p2, p1, Ll/wvx;->d:J

    .line 413
    .line 414
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 415
    .line 416
    .line 417
    move-result p0

    .line 418
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 419
    .line 420
    .line 421
    move-result-object p0

    .line 422
    iput-object p0, p1, Ll/wvx;->e1:Ljava/lang/String;

    .line 423
    .line 424
    new-instance p0, Landroid/content/IntentFilter;

    .line 425
    .line 426
    invoke-direct {p0}, Landroid/content/IntentFilter;-><init>()V

    .line 427
    .line 428
    .line 429
    const-string p1, "android.intent.action.HEADSET_PLUG"

    .line 430
    .line 431
    invoke-virtual {p0, p1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 432
    .line 433
    .line 434
    return-void
.end method

.method public static synthetic A2(Ll/tc0;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/tc0;->x1:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic A3(Ll/tc0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/wej;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic A4(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcQualityHandler;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->V1:Lcom/immomo/mediacore/coninf/MRtcQualityHandler;

    .line 2
    .line 3
    return-object p0
.end method

.method private A6()I
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/tc0;->w1:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-boolean p0, p0, Ll/tc0;->m3:Z

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move v2, v1

    .line 13
    :cond_1
    :goto_0
    xor-int/lit8 p0, v2, 0x1

    .line 14
    .line 15
    return p0
.end method

.method public static synthetic B2(Ll/tc0;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic B3(Ll/tc0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/wej;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic B4(Ll/tc0;)Ll/kod0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->I2:Ll/kod0;

    .line 2
    .line 3
    return-object p0
.end method

.method private final B6(Ljava/lang/String;I)V
    .locals 11

    .line 1
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_11

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 6
    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "mmLiveAudioProfile:"

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget v2, p0, Ll/tc0;->E0:I

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v2, ",mmLiveAudioScenario:"

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget v2, p0, Ll/tc0;->F0:I

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v2, ",getAudioProfile() = "

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v2}, Ll/csx;->t()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v2, ",getAudioScenario()="

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v2}, Ll/csx;->u()I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    iget v0, p0, Ll/tc0;->E0:I

    .line 73
    .line 74
    const/4 v1, -0x1

    .line 75
    const/4 v2, 0x1

    .line 76
    if-eq v0, v1, :cond_0

    .line 77
    .line 78
    invoke-virtual {p0, v0}, Ll/tc0;->j6(I)I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    iput v0, p0, Ll/tc0;->k0:I

    .line 83
    .line 84
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 85
    .line 86
    iget v3, p0, Ll/tc0;->E0:I

    .line 87
    .line 88
    iput v3, v0, Ll/wvx;->o0:I

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_0
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {v0}, Ll/csx;->t()I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    iget-object v3, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 100
    .line 101
    if-eq v0, v1, :cond_1

    .line 102
    .line 103
    iput v0, v3, Ll/wvx;->o0:I

    .line 104
    .line 105
    invoke-virtual {p0, v0}, Ll/tc0;->j6(I)I

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    iput v0, p0, Ll/tc0;->k0:I

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_1
    iput v2, v3, Ll/wvx;->o0:I

    .line 113
    .line 114
    invoke-virtual {p0, v2}, Ll/tc0;->j6(I)I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    iput v0, p0, Ll/tc0;->k0:I

    .line 119
    .line 120
    :goto_0
    iget v0, p0, Ll/tc0;->F0:I

    .line 121
    .line 122
    const/4 v3, 0x0

    .line 123
    if-eq v0, v1, :cond_2

    .line 124
    .line 125
    invoke-virtual {p0, v0}, Ll/tc0;->l6(I)I

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    iput v0, p0, Ll/tc0;->p0:I

    .line 130
    .line 131
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 132
    .line 133
    iget v1, p0, Ll/tc0;->F0:I

    .line 134
    .line 135
    iput v1, v0, Ll/wvx;->p0:I

    .line 136
    .line 137
    goto :goto_1

    .line 138
    :cond_2
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    invoke-virtual {v0}, Ll/csx;->u()I

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    if-eq v0, v1, :cond_3

    .line 147
    .line 148
    invoke-virtual {p0, v0}, Ll/tc0;->l6(I)I

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    iput v1, p0, Ll/tc0;->p0:I

    .line 153
    .line 154
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 155
    .line 156
    iput v0, v1, Ll/wvx;->p0:I

    .line 157
    .line 158
    goto :goto_1

    .line 159
    :cond_3
    invoke-virtual {p0, v3}, Ll/tc0;->l6(I)I

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    iput v0, p0, Ll/tc0;->p0:I

    .line 164
    .line 165
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 166
    .line 167
    iput v3, v0, Ll/wvx;->p0:I

    .line 168
    .line 169
    :goto_1
    iget v0, p0, Ll/tc0;->k0:I

    .line 170
    .line 171
    iget v1, p0, Ll/tc0;->p0:I

    .line 172
    .line 173
    invoke-virtual {p0, v0, v1}, Ll/tc0;->g6(II)V

    .line 174
    .line 175
    .line 176
    iget-boolean v0, p0, Ll/tc0;->H0:Z

    .line 177
    .line 178
    invoke-virtual {p0, v0}, Ll/tc0;->e6(Z)V

    .line 179
    .line 180
    .line 181
    iput-boolean v3, p0, Ll/tc0;->e1:Z

    .line 182
    .line 183
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 184
    .line 185
    const/4 v1, 0x0

    .line 186
    invoke-virtual {v0, v1}, Lio/agora/rtc2/RtcEngine;->registerAudioFrameObserver(Lio/agora/rtc2/IAudioFrameObserver;)I

    .line 187
    .line 188
    .line 189
    iget-boolean v0, p0, Ll/tc0;->v1:Z

    .line 190
    .line 191
    if-nez v0, :cond_4

    .line 192
    .line 193
    iget-boolean v0, p0, Ll/tc0;->d2:Z

    .line 194
    .line 195
    if-nez v0, :cond_4

    .line 196
    .line 197
    iget-boolean v0, p0, Ll/tc0;->e2:Z

    .line 198
    .line 199
    if-nez v0, :cond_4

    .line 200
    .line 201
    iget-object v0, p0, Ll/tc0;->d1:Ll/dpl$a;

    .line 202
    .line 203
    if-eqz v0, :cond_5

    .line 204
    .line 205
    :cond_4
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 206
    .line 207
    const-string v4, "registerAudioFrameObserver 2458"

    .line 208
    .line 209
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 210
    .line 211
    .line 212
    move-result-object v4

    .line 213
    invoke-virtual {v0, v4}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 214
    .line 215
    .line 216
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 217
    .line 218
    invoke-virtual {v0, p0}, Lio/agora/rtc2/RtcEngine;->registerAudioFrameObserver(Lio/agora/rtc2/IAudioFrameObserver;)I

    .line 219
    .line 220
    .line 221
    iput-boolean v2, p0, Ll/tc0;->e1:Z

    .line 222
    .line 223
    :cond_5
    iget-boolean v0, p0, Ll/tc0;->q1:Z

    .line 224
    .line 225
    if-eqz v0, :cond_6

    .line 226
    .line 227
    const-string v0, "1"

    .line 228
    .line 229
    invoke-direct {p0, v0}, Ll/tc0;->C6(Ljava/lang/String;)V

    .line 230
    .line 231
    .line 232
    :cond_6
    invoke-direct {p0}, Ll/tc0;->P7()V

    .line 233
    .line 234
    .line 235
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 236
    .line 237
    if-eqz v0, :cond_7

    .line 238
    .line 239
    iget-boolean v4, p0, Ll/tc0;->f2:Z

    .line 240
    .line 241
    if-eqz v4, :cond_7

    .line 242
    .line 243
    invoke-virtual {v0, v2}, Lio/agora/rtc2/RtcEngine;->setDefaultAudioRoutetoSpeakerphone(Z)I

    .line 244
    .line 245
    .line 246
    :cond_7
    iget v0, p0, Ll/tc0;->J1:I

    .line 247
    .line 248
    if-lez v0, :cond_8

    .line 249
    .line 250
    :goto_2
    move v9, v0

    .line 251
    goto :goto_3

    .line 252
    :cond_8
    iget-object v0, p0, Ll/tc0;->o1:Ll/ror;

    .line 253
    .line 254
    iget v0, v0, Ll/uow;->S0:I

    .line 255
    .line 256
    if-eqz v0, :cond_9

    .line 257
    .line 258
    goto :goto_2

    .line 259
    :cond_9
    const/16 v0, 0xf

    .line 260
    .line 261
    goto :goto_2

    .line 262
    :goto_3
    iget-object v0, p0, Ll/tc0;->o1:Ll/ror;

    .line 263
    .line 264
    iget v6, v0, Ll/tow;->k:I

    .line 265
    .line 266
    if-lez v6, :cond_a

    .line 267
    .line 268
    iget-boolean v5, v0, Ll/ror;->h1:Z

    .line 269
    .line 270
    iget v7, v0, Ll/tow;->l:I

    .line 271
    .line 272
    iget v8, p0, Ll/tc0;->I1:I

    .line 273
    .line 274
    iget-object v10, v0, Ll/uow;->v0:Ljava/lang/String;

    .line 275
    .line 276
    move-object v4, p0

    .line 277
    invoke-direct/range {v4 .. v10}, Ll/tc0;->W5(ZIIIILjava/lang/String;)V

    .line 278
    .line 279
    .line 280
    goto :goto_4

    .line 281
    :cond_a
    move-object v4, p0

    .line 282
    iget-boolean v5, v0, Ll/ror;->h1:Z

    .line 283
    .line 284
    iget v6, v0, Ll/tow;->s:I

    .line 285
    .line 286
    iget v7, v0, Ll/tow;->t:I

    .line 287
    .line 288
    iget v8, v4, Ll/tc0;->I1:I

    .line 289
    .line 290
    iget-object v10, v0, Ll/uow;->v0:Ljava/lang/String;

    .line 291
    .line 292
    invoke-direct/range {v4 .. v10}, Ll/tc0;->W5(ZIIIILjava/lang/String;)V

    .line 293
    .line 294
    .line 295
    :goto_4
    iget-object p0, v4, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 296
    .line 297
    if-eqz p0, :cond_b

    .line 298
    .line 299
    invoke-virtual {p0, v3}, Lio/agora/rtc2/RtcEngine;->setRemoteSubscribeFallbackOption(I)I

    .line 300
    .line 301
    .line 302
    :cond_b
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 303
    .line 304
    .line 305
    move-result-object p0

    .line 306
    invoke-virtual {p0}, Ll/csx;->o()I

    .line 307
    .line 308
    .line 309
    move-result p0

    .line 310
    iput p0, v4, Ll/tc0;->J2:I

    .line 311
    .line 312
    new-instance p0, Ll/tc0$f;

    .line 313
    .line 314
    invoke-direct {p0, v4}, Ll/tc0$f;-><init>(Ll/tc0;)V

    .line 315
    .line 316
    .line 317
    iput-object p0, v4, Ll/tc0;->L2:Ljava/lang/Runnable;

    .line 318
    .line 319
    iget-object p0, v4, Ll/tc0;->o1:Ll/ror;

    .line 320
    .line 321
    iget p0, p0, Ll/uow;->b1:I

    .line 322
    .line 323
    if-ne p0, v2, :cond_c

    .line 324
    .line 325
    iget-object p0, v4, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 326
    .line 327
    const-string v0, "{\"che.audio.force_bluetooth_a2dp\":true}"

    .line 328
    .line 329
    invoke-virtual {p0, v0}, Lio/agora/rtc2/RtcEngine;->setParameters(Ljava/lang/String;)I

    .line 330
    .line 331
    .line 332
    iget-object p0, v4, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 333
    .line 334
    const-string v0, "force_bluetooth_a2dp"

    .line 335
    .line 336
    const-string v3, "true"

    .line 337
    .line 338
    filled-new-array {v0, v3}, [Ljava/lang/Object;

    .line 339
    .line 340
    .line 341
    move-result-object v0

    .line 342
    invoke-virtual {p0, v0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 343
    .line 344
    .line 345
    :cond_c
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 346
    .line 347
    .line 348
    move-result-object p0

    .line 349
    invoke-virtual {p0}, Ll/csx;->r()I

    .line 350
    .line 351
    .line 352
    move-result p0

    .line 353
    iget-object v0, v4, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 354
    .line 355
    if-ne p0, v2, :cond_d

    .line 356
    .line 357
    const-string p0, "{\"che.audio.aiaec.working_mode\":1}"

    .line 358
    .line 359
    invoke-virtual {v0, p0}, Lio/agora/rtc2/RtcEngine;->setParameters(Ljava/lang/String;)I

    .line 360
    .line 361
    .line 362
    goto :goto_5

    .line 363
    :cond_d
    const-string p0, "{\"che.audio.aiaec.working_mode\":0}"

    .line 364
    .line 365
    invoke-virtual {v0, p0}, Lio/agora/rtc2/RtcEngine;->setParameters(Ljava/lang/String;)I

    .line 366
    .line 367
    .line 368
    :goto_5
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 369
    .line 370
    .line 371
    move-result-object p0

    .line 372
    invoke-virtual {p0}, Ll/csx;->s()I

    .line 373
    .line 374
    .line 375
    move-result p0

    .line 376
    iget-object v0, v4, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 377
    .line 378
    if-ne p0, v2, :cond_e

    .line 379
    .line 380
    const-string p0, "{\"che.audio.ains_mode\":2}"

    .line 381
    .line 382
    invoke-virtual {v0, p0}, Lio/agora/rtc2/RtcEngine;->setParameters(Ljava/lang/String;)I

    .line 383
    .line 384
    .line 385
    iget-object p0, v4, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 386
    .line 387
    const-string v0, "{\"che.audio.nsng.lowerBound\":80}"

    .line 388
    .line 389
    invoke-virtual {p0, v0}, Lio/agora/rtc2/RtcEngine;->setParameters(Ljava/lang/String;)I

    .line 390
    .line 391
    .line 392
    iget-object p0, v4, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 393
    .line 394
    const-string v0, "{\"che.audio.nsng.lowerMask\":50}"

    .line 395
    .line 396
    invoke-virtual {p0, v0}, Lio/agora/rtc2/RtcEngine;->setParameters(Ljava/lang/String;)I

    .line 397
    .line 398
    .line 399
    iget-object p0, v4, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 400
    .line 401
    const-string v0, "{\"che.audio.nsng.statisticalbound\":5}"

    .line 402
    .line 403
    invoke-virtual {p0, v0}, Lio/agora/rtc2/RtcEngine;->setParameters(Ljava/lang/String;)I

    .line 404
    .line 405
    .line 406
    iget-object p0, v4, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 407
    .line 408
    const-string v0, "{\"che.audio.nsng.finallowermask\":30}"

    .line 409
    .line 410
    invoke-virtual {p0, v0}, Lio/agora/rtc2/RtcEngine;->setParameters(Ljava/lang/String;)I

    .line 411
    .line 412
    .line 413
    iget-object p0, v4, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 414
    .line 415
    const-string v0, "{\"che.audio.nsng.enhfactorstastical\":200}"

    .line 416
    .line 417
    invoke-virtual {p0, v0}, Lio/agora/rtc2/RtcEngine;->setParameters(Ljava/lang/String;)I

    .line 418
    .line 419
    .line 420
    goto :goto_6

    .line 421
    :cond_e
    const-string p0, "{\"che.audio.ains_mode\":0}"

    .line 422
    .line 423
    invoke-virtual {v0, p0}, Lio/agora/rtc2/RtcEngine;->setParameters(Ljava/lang/String;)I

    .line 424
    .line 425
    .line 426
    :goto_6
    iget-object p0, v4, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 427
    .line 428
    new-instance v0, Ljava/lang/StringBuilder;

    .line 429
    .line 430
    const-string v3, "channel:"

    .line 431
    .line 432
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 433
    .line 434
    .line 435
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 436
    .line 437
    .line 438
    const-string v5, ",uid:"

    .line 439
    .line 440
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 441
    .line 442
    .line 443
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 444
    .line 445
    .line 446
    const-string v6, ",token:"

    .line 447
    .line 448
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 449
    .line 450
    .line 451
    iget-object v6, v4, Ll/tc0;->r1:Ljava/lang/String;

    .line 452
    .line 453
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 454
    .line 455
    .line 456
    const-string v6, ", aec:"

    .line 457
    .line 458
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 459
    .line 460
    .line 461
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 462
    .line 463
    .line 464
    move-result-object v6

    .line 465
    invoke-virtual {v6}, Ll/csx;->r()I

    .line 466
    .line 467
    .line 468
    move-result v6

    .line 469
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 470
    .line 471
    .line 472
    const-string v6, ",ns:"

    .line 473
    .line 474
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 475
    .line 476
    .line 477
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 478
    .line 479
    .line 480
    move-result-object v6

    .line 481
    invoke-virtual {v6}, Ll/csx;->s()I

    .line 482
    .line 483
    .line 484
    move-result v6

    .line 485
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 486
    .line 487
    .line 488
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 489
    .line 490
    .line 491
    move-result-object v0

    .line 492
    const-string v6, "joinChannel"

    .line 493
    .line 494
    filled-new-array {v6, v0}, [Ljava/lang/Object;

    .line 495
    .line 496
    .line 497
    move-result-object v0

    .line 498
    invoke-virtual {p0, v0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 499
    .line 500
    .line 501
    iget-object p0, v4, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 502
    .line 503
    iget-object v0, v4, Ll/tc0;->r1:Ljava/lang/String;

    .line 504
    .line 505
    invoke-virtual {p0, v0, p1, v1, p2}, Lio/agora/rtc2/RtcEngine;->joinChannel(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)I

    .line 506
    .line 507
    .line 508
    move-result p0

    .line 509
    iget-object v0, v4, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 510
    .line 511
    new-instance v1, Ljava/lang/StringBuilder;

    .line 512
    .line 513
    const-string v7, " ret:"

    .line 514
    .line 515
    invoke-direct {v1, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 516
    .line 517
    .line 518
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 519
    .line 520
    .line 521
    const-string v8, ",channel:"

    .line 522
    .line 523
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 524
    .line 525
    .line 526
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 527
    .line 528
    .line 529
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 530
    .line 531
    .line 532
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 533
    .line 534
    .line 535
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 536
    .line 537
    .line 538
    move-result-object v1

    .line 539
    filled-new-array {v6, v1}, [Ljava/lang/Object;

    .line 540
    .line 541
    .line 542
    move-result-object v1

    .line 543
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 544
    .line 545
    .line 546
    if-gez p0, :cond_f

    .line 547
    .line 548
    iget-object v0, v4, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 549
    .line 550
    const-wide/16 v8, 0x32a

    .line 551
    .line 552
    iput-wide v8, v0, Ll/wvx;->y0:J

    .line 553
    .line 554
    iput p0, v0, Ll/wvx;->k0:I

    .line 555
    .line 556
    :cond_f
    iget-object v0, v4, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 557
    .line 558
    new-instance v1, Ljava/lang/StringBuilder;

    .line 559
    .line 560
    const-string v8, ""

    .line 561
    .line 562
    invoke-direct {v1, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 563
    .line 564
    .line 565
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 566
    .line 567
    .line 568
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 569
    .line 570
    .line 571
    move-result-object v1

    .line 572
    invoke-virtual {v0, v6, v1}, Ll/evx;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 573
    .line 574
    .line 575
    if-gez p0, :cond_10

    .line 576
    .line 577
    iget-object v0, v4, Ll/tc0;->R1:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 578
    .line 579
    if-eqz v0, :cond_10

    .line 580
    .line 581
    iget-object v0, v4, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 582
    .line 583
    new-instance v1, Ljava/lang/StringBuilder;

    .line 584
    .line 585
    invoke-direct {v1, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 586
    .line 587
    .line 588
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 589
    .line 590
    .line 591
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 592
    .line 593
    .line 594
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 595
    .line 596
    .line 597
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 598
    .line 599
    .line 600
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 601
    .line 602
    .line 603
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 604
    .line 605
    .line 606
    move-result-object v1

    .line 607
    const-string v3, "joinChannel failed"

    .line 608
    .line 609
    filled-new-array {v3, v1}, [Ljava/lang/Object;

    .line 610
    .line 611
    .line 612
    move-result-object v1

    .line 613
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 614
    .line 615
    .line 616
    iget-object v0, v4, Ll/tc0;->R1:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 617
    .line 618
    int-to-long v5, p2

    .line 619
    invoke-interface {v0, p1, v5, v6, p0}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onJoinChannelfail(Ljava/lang/String;JI)V

    .line 620
    .line 621
    .line 622
    :cond_10
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 623
    .line 624
    .line 625
    move-result-object p2

    .line 626
    new-instance v0, Ljava/lang/StringBuilder;

    .line 627
    .line 628
    const-string v1, "joinChannel#############"

    .line 629
    .line 630
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 631
    .line 632
    .line 633
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 634
    .line 635
    .line 636
    const-string p0, "xx channel"

    .line 637
    .line 638
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 639
    .line 640
    .line 641
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 642
    .line 643
    .line 644
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 645
    .line 646
    .line 647
    move-result-object p0

    .line 648
    const-string p1, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 649
    .line 650
    invoke-virtual {p2, p1, p0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 651
    .line 652
    .line 653
    iput-boolean v2, v4, Ll/tc0;->q1:Z

    .line 654
    .line 655
    const/high16 p0, 0x3f800000    # 1.0f

    .line 656
    .line 657
    invoke-virtual {v4, p0}, Ll/tc0;->B7(F)V

    .line 658
    .line 659
    .line 660
    :cond_11
    return-void
.end method

.method public static synthetic C2(Ll/tc0;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic C3(Ll/tc0;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic C4(Ll/tc0;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method private final C6(Ljava/lang/String;)V
    .locals 5

    .line 1
    const-string v0, "stopRtmpStream:"

    .line 2
    .line 3
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 8
    .line 9
    new-instance v3, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v4, "leaveChannel >>>>>"

    .line 12
    .line 13
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {v1, v2, p1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 27
    .line 28
    const-string v1, "leaveChannel"

    .line 29
    .line 30
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {p1, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/tc0;->t1:Ljava/lang/Object;

    .line 38
    .line 39
    monitor-enter p1

    .line 40
    :try_start_0
    iget-object v1, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 41
    .line 42
    const/4 v2, 0x0

    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 46
    .line 47
    iget-object v1, v1, Ll/uow;->v0:Ljava/lang/String;

    .line 48
    .line 49
    if-eqz v1, :cond_0

    .line 50
    .line 51
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 52
    .line 53
    new-instance v3, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 59
    .line 60
    iget-object v0, v0, Ll/uow;->v0:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {v1, v0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 77
    .line 78
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 79
    .line 80
    iget-object v1, v1, Ll/uow;->v0:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Lio/agora/rtc2/RtcEngine;->stopRtmpStream(Ljava/lang/String;)I

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :catchall_0
    move-exception p0

    .line 87
    goto :goto_1

    .line 88
    :cond_0
    :goto_0
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 89
    .line 90
    invoke-virtual {v0}, Lio/agora/rtc2/RtcEngine;->leaveChannel()I

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 94
    .line 95
    const/4 v1, 0x0

    .line 96
    invoke-virtual {v0, v1}, Lio/agora/rtc2/RtcEngine;->registerAudioFrameObserver(Lio/agora/rtc2/IAudioFrameObserver;)I

    .line 97
    .line 98
    .line 99
    iput-boolean v2, p0, Ll/tc0;->e1:Z

    .line 100
    .line 101
    :cond_1
    iput-boolean v2, p0, Ll/tc0;->q1:Z

    .line 102
    .line 103
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 104
    iget-object p0, p0, Ll/tc0;->o1:Ll/ror;

    .line 105
    .line 106
    iget p0, p0, Ll/ror;->e1:I

    .line 107
    .line 108
    return-void

    .line 109
    :goto_1
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 110
    throw p0
.end method

.method public static synthetic D2(Ll/tc0;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/tc0;->t3:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic D3(Ll/tc0;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic D4(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcTokenWillExpireHander;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->T1:Lcom/immomo/mediacore/coninf/MRtcTokenWillExpireHander;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic E2(Ll/tc0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/tc0;->n3:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic E3(Ll/tc0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/tc0;->g3:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic E4(Ll/tc0;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic F2(Ll/tc0;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic F3(Ll/tc0;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic F4(Ll/tc0;)Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->P0:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic G2(Ll/tc0;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/tc0;->e3:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic G3(Ll/tc0;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic G4(Ll/tc0;Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;)Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tc0;->P0:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic H2(Ll/tc0;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic H3(Ll/tc0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/tc0;->w1:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic H4(Ll/tc0;)Ll/wpw;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->U1:Ll/wpw;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic I2(Ll/tc0;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic I3(Ll/tc0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/tc0;->o3:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic I4(Ll/tc0;)Ll/tpw;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->b2:Ll/tpw;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic J2(Ll/tc0;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic J3(Ll/tc0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/tc0;->v1:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic J4(Ll/tc0;)Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->Q0:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    .line 2
    .line 3
    return-object p0
.end method

.method private J7(Ljava/lang/String;)V
    .locals 6

    .line 1
    const-string v0, "startRtmpStreamWithTranscoding enable:"

    .line 2
    .line 3
    const-string v1, "onStreamPublished addPublishStreamUrl:url="

    .line 4
    .line 5
    iget-object v2, p0, Ll/tc0;->y1:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v2

    .line 8
    :try_start_0
    iget-boolean v3, p0, Ll/tc0;->x1:Z

    .line 9
    .line 10
    if-nez v3, :cond_0

    .line 11
    .line 12
    iget-boolean v3, p0, Ll/tc0;->W2:Z

    .line 13
    .line 14
    if-nez v3, :cond_0

    .line 15
    .line 16
    iget-object v3, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 17
    .line 18
    if-eqz v3, :cond_0

    .line 19
    .line 20
    iget-object v4, p0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 21
    .line 22
    invoke-virtual {v3, p1, v4}, Lio/agora/rtc2/RtcEngine;->startRtmpStreamWithTranscoding(Ljava/lang/String;Lio/agora/rtc2/live/LiveTranscoding;)I

    .line 23
    .line 24
    .line 25
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    const-string v4, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 30
    .line 31
    new-instance v5, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    invoke-direct {v5, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v3, v4, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 47
    .line 48
    const-string v1, "setRtcEnginePublishStreamUrl"

    .line 49
    .line 50
    new-instance v3, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p0, v1, p1}, Ll/evx;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :catchall_0
    move-exception p0

    .line 67
    goto :goto_1

    .line 68
    :cond_0
    :goto_0
    monitor-exit v2

    .line 69
    return-void

    .line 70
    :goto_1
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 71
    throw p0
.end method

.method public static synthetic K2(Ll/tc0;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic K3(Ll/tc0;I)I
    .locals 0

    .line 1
    iput p1, p0, Ll/tc0;->o3:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic K4(Ll/tc0;Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;)Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tc0;->Q0:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic L2(Ll/tc0;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic L3(Ll/tc0;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic L4(Ll/tc0;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic M2(Ll/tc0;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic M3(Ll/tc0;)Ll/ebl0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->Z0:Ll/ebl0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic M4(Ll/tc0;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method private M6()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    iget-wide v0, v0, Ll/wvx;->c:J

    .line 4
    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 16
    .line 17
    const-string v2, "AGORA_PUBLISHING"

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/tc0;->g1:Ll/q210$a;

    .line 23
    .line 24
    const/16 v1, 0x1007

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    invoke-interface {v0, v1, v2, v2, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 31
    .line 32
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 33
    .line 34
    .line 35
    move-result-wide v0

    .line 36
    iput-wide v0, p0, Ll/wvx;->c:J

    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public static synthetic N2(Ll/tc0;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic N3(Ll/tc0;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->l3:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic N4(Ll/tc0;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method private N6([B[B)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/tc0;->o1:Ll/ror;

    .line 2
    .line 3
    iget v0, v0, Ll/uow;->B0:I

    .line 4
    .line 5
    int-to-long v5, v0

    .line 6
    iget-object v0, p0, Ll/tc0;->v2:Lcom/immomo/mediacore/coninf/MRtcRealLayoutNotifyHander;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/tc0;->l3:Landroid/os/Handler;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    new-instance v1, Ll/tc0$c;

    .line 15
    .line 16
    move-object v2, p0

    .line 17
    move-object v3, p1

    .line 18
    move-object v4, p2

    .line 19
    invoke-direct/range {v1 .. v6}, Ll/tc0$c;-><init>(Ll/tc0;[B[BJ)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public static synthetic O2(Ll/tc0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/tc0;->s1:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic O3(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->R1:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic O4(Ll/tc0;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/tc0;->T0:Z

    .line 2
    .line 3
    return p1
.end method

.method private O7(Ljava/lang/Object;II)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->K:Ll/l6m;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    check-cast p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->C2()Ll/gb1;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    invoke-interface {p0, p1, p2, p3}, Ll/gb1;->a(Ljava/lang/Object;II)V

    .line 15
    .line 16
    .line 17
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic P2(Ll/tc0;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic P3(Ll/tc0;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic P4(Ll/tc0;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/tc0;->U0:Z

    .line 2
    .line 3
    return p1
.end method

.method private P7()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/tc0;->o1:Ll/ror;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_2

    .line 6
    .line 7
    :cond_0
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v2, "setVideoProfileEx1 bitrate:"

    .line 14
    .line 15
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v2, p0, Ll/tc0;->o1:Ll/ror;

    .line 19
    .line 20
    iget v2, v2, Ll/tow;->m:I

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v2, "<>"

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget-object v3, p0, Ll/tc0;->o1:Ll/ror;

    .line 31
    .line 32
    iget v3, v3, Ll/tow;->n:I

    .line 33
    .line 34
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    iget-object v2, p0, Ll/tc0;->o1:Ll/ror;

    .line 41
    .line 42
    iget v2, v2, Ll/tow;->H:I

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v2, "<mergecanvasWidth>"

    .line 48
    .line 49
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    iget-object v2, p0, Ll/tc0;->o1:Ll/ror;

    .line 53
    .line 54
    iget v2, v2, Ll/tow;->k:I

    .line 55
    .line 56
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    const-string v2, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 64
    .line 65
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    iget-boolean v0, p0, Ll/tc0;->H0:Z

    .line 69
    .line 70
    invoke-virtual {p0, v0}, Ll/tc0;->e6(Z)V

    .line 71
    .line 72
    .line 73
    iget-boolean v0, p0, Ll/tc0;->w1:Z

    .line 74
    .line 75
    if-nez v0, :cond_3

    .line 76
    .line 77
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 78
    .line 79
    if-eqz v0, :cond_3

    .line 80
    .line 81
    const-string v1, "{\"che.video.keyFrameInterval\":1}"

    .line 82
    .line 83
    invoke-virtual {v0, v1}, Lio/agora/rtc2/RtcEngine;->setParameters(Ljava/lang/String;)I

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Ll/tc0;->o1:Ll/ror;

    .line 87
    .line 88
    iget v1, v0, Ll/uow;->S0:I

    .line 89
    .line 90
    if-eqz v1, :cond_1

    .line 91
    .line 92
    :goto_0
    move v5, v1

    .line 93
    goto :goto_1

    .line 94
    :cond_1
    const/16 v1, 0xf

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :goto_1
    iget-boolean v1, v0, Ll/uow;->F0:Z

    .line 98
    .line 99
    if-eqz v1, :cond_2

    .line 100
    .line 101
    invoke-virtual {v0}, Ll/uow;->d()I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    const/4 v1, 0x1

    .line 106
    if-ne v0, v1, :cond_2

    .line 107
    .line 108
    iget-object v0, p0, Ll/tc0;->o1:Ll/ror;

    .line 109
    .line 110
    iget v3, v0, Ll/tow;->n:I

    .line 111
    .line 112
    iget v4, v0, Ll/tow;->m:I

    .line 113
    .line 114
    iget v1, v0, Ll/tow;->H:I

    .line 115
    .line 116
    div-int/lit16 v6, v1, 0x3e8

    .line 117
    .line 118
    iget v7, v0, Ll/uow;->a1:I

    .line 119
    .line 120
    move-object v2, p0

    .line 121
    invoke-virtual/range {v2 .. v7}, Ll/tc0;->V7(IIIII)V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :cond_2
    move-object v2, p0

    .line 126
    iget-object p0, v2, Ll/tc0;->o1:Ll/ror;

    .line 127
    .line 128
    iget v3, p0, Ll/tow;->m:I

    .line 129
    .line 130
    iget v4, p0, Ll/tow;->n:I

    .line 131
    .line 132
    iget v0, p0, Ll/tow;->H:I

    .line 133
    .line 134
    div-int/lit16 v6, v0, 0x3e8

    .line 135
    .line 136
    iget v7, p0, Ll/uow;->a1:I

    .line 137
    .line 138
    invoke-virtual/range {v2 .. v7}, Ll/tc0;->V7(IIIII)V

    .line 139
    .line 140
    .line 141
    :cond_3
    :goto_2
    return-void
.end method

.method public static synthetic Q2(Ll/tc0;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Q3(Ll/tc0;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Q4(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcChannelHandler;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->S1:Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic R2(Ll/tc0;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic R3(Ll/tc0;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic R4(Ll/tc0;)I
    .locals 2

    .line 1
    iget v0, p0, Ll/tc0;->V0:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, 0x1

    .line 4
    .line 5
    iput v1, p0, Ll/tc0;->V0:I

    .line 6
    .line 7
    return v0
.end method

.method public static synthetic S2(Ll/tc0;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->L2:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic S3(Ll/tc0;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic S4(Ll/tc0;)Ll/imw;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->a2:Ll/imw;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic T2(Ll/tc0;I)I
    .locals 0

    .line 1
    iput p1, p0, Ll/tc0;->j3:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic T3(Ll/tc0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/tc0;->d2:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic T4(Ll/tc0;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method private final T5(II)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/tc0;->o1:Ll/ror;

    .line 2
    .line 3
    iput p1, v0, Ll/ror;->e1:I

    .line 4
    .line 5
    iput p2, v0, Ll/ror;->f1:I

    .line 6
    .line 7
    :try_start_0
    new-instance p2, Ljava/io/FileReader;

    .line 8
    .line 9
    const-string v0, "/proc/cpuinfo"

    .line 10
    .line 11
    invoke-direct {p2, v0}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Ljava/io/BufferedReader;

    .line 15
    .line 16
    invoke-direct {v0, p2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    :goto_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    const-string v2, "Qualcomm"

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-nez v2, :cond_0

    .line 32
    .line 33
    const-string v2, "qualcomm"

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-nez v2, :cond_0

    .line 40
    .line 41
    const-string v2, "MSM"

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-nez v2, :cond_0

    .line 48
    .line 49
    const-string v2, "msm"

    .line 50
    .line 51
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    goto :goto_0

    .line 56
    :cond_1
    invoke-virtual {p2}, Ljava/io/Reader;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    .line 58
    .line 59
    :catch_0
    invoke-direct {p0}, Ll/tc0;->n8()V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 63
    .line 64
    if-eqz p0, :cond_2

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Lio/agora/rtc2/RtcEngine;->setClientRole(I)I

    .line 67
    .line 68
    .line 69
    :cond_2
    return-void
.end method

.method public static synthetic U2(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcConnectHandler;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->W1:Lcom/immomo/mediacore/coninf/MRtcConnectHandler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic U3(Ll/tc0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/tc0;->p3:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic U4(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcExitRoomHandler;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->H2:Lcom/immomo/mediacore/coninf/MRtcExitRoomHandler;

    .line 2
    .line 3
    return-object p0
.end method

.method private U5(Ljava/lang/String;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v0, p0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 6
    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 10
    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v2, "configLiveTransCoding: user count"

    .line 14
    .line 15
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v2, p0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 19
    .line 20
    invoke-virtual {v2}, Lio/agora/rtc2/live/LiveTranscoding;->getUsers()Ljava/util/ArrayList;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v2, ",mHavaPublish"

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    iget-boolean v2, p0, Ll/tc0;->x1:Z

    .line 37
    .line 38
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    if-eqz p1, :cond_3

    .line 53
    .line 54
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    if-nez p1, :cond_3

    .line 59
    .line 60
    iget-object p1, p0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 61
    .line 62
    invoke-virtual {p1}, Lio/agora/rtc2/live/LiveTranscoding;->getUsers()Ljava/util/ArrayList;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-lez p1, :cond_3

    .line 71
    .line 72
    new-instance p1, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    const-string v0, "{ \"canvas\":{ \"w\":"

    .line 75
    .line 76
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 80
    .line 81
    iget v0, v0, Lio/agora/rtc2/live/LiveTranscoding;->width:I

    .line 82
    .line 83
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    const-string v0, ",\"h\":"

    .line 87
    .line 88
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 92
    .line 93
    iget v0, v0, Lio/agora/rtc2/live/LiveTranscoding;->height:I

    .line 94
    .line 95
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    const-string v0, ",\"conf\":["

    .line 99
    .line 100
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    iget-object v0, p0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 108
    .line 109
    invoke-virtual {v0}, Lio/agora/rtc2/live/LiveTranscoding;->getUsers()Ljava/util/ArrayList;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    if-eqz v1, :cond_0

    .line 122
    .line 123
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    check-cast v1, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;

    .line 128
    .line 129
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    const-string v3, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 134
    .line 135
    new-instance v4, Ljava/lang/StringBuilder;

    .line 136
    .line 137
    const-string v5, "llcqxl:<<<<<<<<<,uid:"

    .line 138
    .line 139
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    iget v5, v1, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->uid:I

    .line 143
    .line 144
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    const-string v5, ",x:"

    .line 148
    .line 149
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    iget v5, v1, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->x:I

    .line 153
    .line 154
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    const-string v5, ",y:"

    .line 158
    .line 159
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    iget v5, v1, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->y:I

    .line 163
    .line 164
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    const-string v5, ",width:"

    .line 168
    .line 169
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    iget v5, v1, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->width:I

    .line 173
    .line 174
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    const-string v5, ",height:"

    .line 178
    .line 179
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    iget v5, v1, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->height:I

    .line 183
    .line 184
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    const-string v5, ",alpha:"

    .line 188
    .line 189
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    iget v5, v1, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->alpha:F

    .line 193
    .line 194
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    const-string v5, ",zOrder:"

    .line 198
    .line 199
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    iget v5, v1, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->zOrder:I

    .line 203
    .line 204
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    const-string v5, ">>>>>>>>>>"

    .line 208
    .line 209
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object v4

    .line 216
    invoke-virtual {v2, v3, v4}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    new-instance v2, Ljava/lang/StringBuilder;

    .line 220
    .line 221
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 222
    .line 223
    .line 224
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 225
    .line 226
    .line 227
    const-string p1, "{\"id\":"

    .line 228
    .line 229
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 230
    .line 231
    .line 232
    iget p1, v1, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->uid:I

    .line 233
    .line 234
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 235
    .line 236
    .line 237
    const-string p1, ",\"x\":"

    .line 238
    .line 239
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 240
    .line 241
    .line 242
    iget p1, v1, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->x:I

    .line 243
    .line 244
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 245
    .line 246
    .line 247
    const-string p1, ",\"y\":"

    .line 248
    .line 249
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 250
    .line 251
    .line 252
    iget p1, v1, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->y:I

    .line 253
    .line 254
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 255
    .line 256
    .line 257
    const-string p1, ",\"width\":"

    .line 258
    .line 259
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 260
    .line 261
    .line 262
    iget p1, v1, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->width:I

    .line 263
    .line 264
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 265
    .line 266
    .line 267
    const-string p1, ",\"height\":"

    .line 268
    .line 269
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 270
    .line 271
    .line 272
    iget p1, v1, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->height:I

    .line 273
    .line 274
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 275
    .line 276
    .line 277
    const-string p1, "},"

    .line 278
    .line 279
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 280
    .line 281
    .line 282
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object p1

    .line 286
    goto/16 :goto_0

    .line 287
    .line 288
    :cond_0
    const-string v0, "]"

    .line 289
    .line 290
    invoke-virtual {p1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 291
    .line 292
    .line 293
    move-result-object p1

    .line 294
    iget-object v0, p0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 295
    .line 296
    const/4 v1, 0x1

    .line 297
    iput-boolean v1, v0, Lio/agora/rtc2/live/LiveTranscoding;->lowLatency:Z

    .line 298
    .line 299
    const/16 v1, 0xf

    .line 300
    .line 301
    iput v1, v0, Lio/agora/rtc2/live/LiveTranscoding;->videoGop:I

    .line 302
    .line 303
    iget-object v0, p0, Ll/tc0;->y1:Ljava/lang/Object;

    .line 304
    .line 305
    monitor-enter v0

    .line 306
    :try_start_0
    iget-boolean v1, p0, Ll/tc0;->x1:Z

    .line 307
    .line 308
    if-eqz v1, :cond_1

    .line 309
    .line 310
    const-string v1, "lqdebug"

    .line 311
    .line 312
    new-instance v2, Ljava/lang/StringBuilder;

    .line 313
    .line 314
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 315
    .line 316
    .line 317
    const-string v3, "publishConfig:w:"

    .line 318
    .line 319
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 320
    .line 321
    .line 322
    iget-object v3, p0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 323
    .line 324
    iget v3, v3, Lio/agora/rtc2/live/LiveTranscoding;->width:I

    .line 325
    .line 326
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 327
    .line 328
    .line 329
    const-string v3, ",height:"

    .line 330
    .line 331
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 332
    .line 333
    .line 334
    iget-object v3, p0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 335
    .line 336
    iget v3, v3, Lio/agora/rtc2/live/LiveTranscoding;->height:I

    .line 337
    .line 338
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 339
    .line 340
    .line 341
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 342
    .line 343
    .line 344
    move-result-object v2

    .line 345
    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 346
    .line 347
    .line 348
    iget-object v1, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 349
    .line 350
    iget-object v2, p0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 351
    .line 352
    invoke-virtual {v1, v2}, Lio/agora/rtc2/RtcEngine;->updateRtmpTranscoding(Lio/agora/rtc2/live/LiveTranscoding;)I

    .line 353
    .line 354
    .line 355
    invoke-virtual {p0}, Ll/tc0;->D6()V

    .line 356
    .line 357
    .line 358
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 359
    .line 360
    new-instance v2, Ljava/lang/StringBuilder;

    .line 361
    .line 362
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 363
    .line 364
    .line 365
    const-string v3, "publishConfig:"

    .line 366
    .line 367
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 368
    .line 369
    .line 370
    iget-object v3, p0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 371
    .line 372
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 373
    .line 374
    .line 375
    move-result-object v3

    .line 376
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 377
    .line 378
    .line 379
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 380
    .line 381
    .line 382
    move-result-object v2

    .line 383
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 384
    .line 385
    .line 386
    move-result-object v2

    .line 387
    invoke-virtual {v1, v2}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 388
    .line 389
    .line 390
    goto :goto_1

    .line 391
    :catchall_0
    move-exception p0

    .line 392
    goto :goto_2

    .line 393
    :cond_1
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 394
    iget-object v0, p0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 395
    .line 396
    iget-object v0, v0, Lio/agora/rtc2/live/LiveTranscoding;->userConfigExtraInfo:Ljava/lang/String;

    .line 397
    .line 398
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 399
    .line 400
    .line 401
    move-result v0

    .line 402
    if-nez v0, :cond_2

    .line 403
    .line 404
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 405
    .line 406
    .line 407
    move-result-object p1

    .line 408
    iget-object v0, p0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 409
    .line 410
    iget-object v0, v0, Lio/agora/rtc2/live/LiveTranscoding;->userConfigExtraInfo:Ljava/lang/String;

    .line 411
    .line 412
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    .line 413
    .line 414
    .line 415
    move-result-object v0

    .line 416
    invoke-direct {p0, p1, v0}, Ll/tc0;->N6([B[B)V

    .line 417
    .line 418
    .line 419
    :cond_2
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 420
    .line 421
    .line 422
    move-result-object p0

    .line 423
    const-string p1, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 424
    .line 425
    const-string v0, "addPublishStreamUrl configLiveTransCoding"

    .line 426
    .line 427
    invoke-virtual {p0, p1, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 428
    .line 429
    .line 430
    return-void

    .line 431
    :goto_2
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 432
    throw p0

    .line 433
    :cond_3
    return-void
.end method

.method public static synthetic V2(Ll/tc0;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic V3(Ll/tc0;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->a3:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic V4(Ll/tc0;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method private V5(J)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v1, Ll/tc0$g;

    .line 7
    .line 8
    invoke-direct {v1, p0, p1, p2}, Ll/tc0$g;-><init>(Ll/tc0;J)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    invoke-virtual {v0, v1, p0}, Lio/agora/rtc2/RtcEngine;->registerMediaMetadataObserver(Lio/agora/rtc2/IMetadataObserver;I)I

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic W2(Ll/tc0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/tc0;->f3:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic W3(Ll/tc0;I)I
    .locals 0

    .line 1
    iput p1, p0, Ll/tc0;->p3:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic W4(Ll/tc0;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method private W5(ZIIIILjava/lang/String;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const/4 p1, 0x1

    .line 5
    iput p1, p0, Ll/tc0;->H1:I

    .line 6
    .line 7
    iget-object p6, p0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 8
    .line 9
    if-nez p6, :cond_1

    .line 10
    .line 11
    new-instance p6, Lio/agora/rtc2/live/LiveTranscoding;

    .line 12
    .line 13
    invoke-direct {p6}, Lio/agora/rtc2/live/LiveTranscoding;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p6, p0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 17
    .line 18
    :cond_1
    iget-object p6, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 19
    .line 20
    new-instance v0, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v1, "width:"

    .line 23
    .line 24
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v1, ",height:"

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string v1, ",br:"

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v1, ",fps:"

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    const-string v1, "agoraTranscode"

    .line 59
    .line 60
    filled-new-array {v1, v0}, [Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p6, v0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 68
    .line 69
    .line 70
    move-result-object p6

    .line 71
    invoke-virtual {p6}, Ll/csx;->r0()I

    .line 72
    .line 73
    .line 74
    move-result p6

    .line 75
    iget-object v0, p0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 76
    .line 77
    iput p2, v0, Lio/agora/rtc2/live/LiveTranscoding;->width:I

    .line 78
    .line 79
    iput p3, v0, Lio/agora/rtc2/live/LiveTranscoding;->height:I

    .line 80
    .line 81
    if-nez p6, :cond_2

    .line 82
    .line 83
    const/16 p2, 0x80

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_2
    move p2, p6

    .line 87
    :goto_0
    iput p2, v0, Lio/agora/rtc2/live/LiveTranscoding;->audioBitrate:I

    .line 88
    .line 89
    const/4 p2, 0x2

    .line 90
    iput p2, v0, Lio/agora/rtc2/live/LiveTranscoding;->audioChannels:I

    .line 91
    .line 92
    sget-object p3, Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;->TYPE_44100:Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;

    .line 93
    .line 94
    iput-object p3, v0, Lio/agora/rtc2/live/LiveTranscoding;->audioSampleRate:Lio/agora/rtc2/live/LiveTranscoding$AudioSampleRateType;

    .line 95
    .line 96
    iput p4, v0, Lio/agora/rtc2/live/LiveTranscoding;->videoBitrate:I

    .line 97
    .line 98
    iput p5, v0, Lio/agora/rtc2/live/LiveTranscoding;->videoFramerate:I

    .line 99
    .line 100
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 101
    .line 102
    .line 103
    move-result-object p3

    .line 104
    invoke-virtual {p3}, Ll/csx;->K()I

    .line 105
    .line 106
    .line 107
    iget-object p3, p0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 108
    .line 109
    iget-object p4, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 110
    .line 111
    iget-boolean p4, p4, Ll/uow;->H0:Z

    .line 112
    .line 113
    if-eqz p4, :cond_3

    .line 114
    .line 115
    sget-object p4, Lio/agora/rtc2/live/LiveTranscoding$VideoCodecType;->H265:Lio/agora/rtc2/live/LiveTranscoding$VideoCodecType;

    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_3
    sget-object p4, Lio/agora/rtc2/live/LiveTranscoding$VideoCodecType;->H264:Lio/agora/rtc2/live/LiveTranscoding$VideoCodecType;

    .line 119
    .line 120
    :goto_1
    iput-object p4, p3, Lio/agora/rtc2/live/LiveTranscoding;->videoCodecType:Lio/agora/rtc2/live/LiveTranscoding$VideoCodecType;

    .line 121
    .line 122
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 123
    .line 124
    .line 125
    move-result-object p3

    .line 126
    invoke-virtual {p3}, Ll/csx;->d()I

    .line 127
    .line 128
    .line 129
    move-result p3

    .line 130
    if-ne p1, p3, :cond_4

    .line 131
    .line 132
    iget-object p1, p0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 133
    .line 134
    sget-object p2, Lio/agora/rtc2/live/LiveTranscoding$AudioCodecProfileType;->HE_AAC:Lio/agora/rtc2/live/LiveTranscoding$AudioCodecProfileType;

    .line 135
    .line 136
    iput-object p2, p1, Lio/agora/rtc2/live/LiveTranscoding;->audioCodecProfile:Lio/agora/rtc2/live/LiveTranscoding$AudioCodecProfileType;

    .line 137
    .line 138
    goto :goto_2

    .line 139
    :cond_4
    if-ne p2, p3, :cond_5

    .line 140
    .line 141
    iget-object p1, p0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 142
    .line 143
    sget-object p2, Lio/agora/rtc2/live/LiveTranscoding$AudioCodecProfileType;->HE_AAC_V2:Lio/agora/rtc2/live/LiveTranscoding$AudioCodecProfileType;

    .line 144
    .line 145
    iput-object p2, p1, Lio/agora/rtc2/live/LiveTranscoding;->audioCodecProfile:Lio/agora/rtc2/live/LiveTranscoding$AudioCodecProfileType;

    .line 146
    .line 147
    :cond_5
    :goto_2
    iget-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 148
    .line 149
    const-string p2, "tanscode_aBitrate"

    .line 150
    .line 151
    invoke-static {p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 152
    .line 153
    .line 154
    move-result-object p4

    .line 155
    filled-new-array {p2, p4}, [Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object p2

    .line 159
    invoke-virtual {p1, p2}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 160
    .line 161
    .line 162
    iget-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 163
    .line 164
    new-instance p2, Ljava/lang/StringBuilder;

    .line 165
    .line 166
    const-string p4, "[pub=Agora,profile="

    .line 167
    .line 168
    invoke-direct {p2, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    const-string p3, "]"

    .line 175
    .line 176
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object p2

    .line 183
    const-string p3, "audioProfile"

    .line 184
    .line 185
    invoke-virtual {p1, p3, p2}, Ll/evx;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    new-instance p2, Ljava/lang/StringBuilder;

    .line 193
    .line 194
    const-string p3, "config"

    .line 195
    .line 196
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    iget-object p0, p0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 200
    .line 201
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object p0

    .line 208
    const-string p2, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 209
    .line 210
    invoke-virtual {p1, p2, p0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 211
    .line 212
    .line 213
    return-void
.end method

.method public static synthetic X2(Ll/tc0;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic X3(Ll/tc0;)Lio/agora/rtc2/RtcEngine;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic X4(Ll/tc0;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/tc0;->A1:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic Y2(Ll/tc0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/tc0;->E2:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic Y3(Ll/tc0;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Y4(Ll/tc0;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/tc0;->O7(Ljava/lang/Object;II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Z2(Ll/tc0;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/tc0;->E2:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic Z3(Ll/tc0;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Z4(Ll/tc0;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic a3(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcAudioHandler;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->P1:Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic a4(Ll/tc0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->Z2:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic a5(Ll/tc0;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method private a8(Ljava/lang/String;)I
    .locals 11

    .line 1
    new-instance v0, Lio/agora/rtc2/video/ChannelMediaInfo;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v1, v2}, Lio/agora/rtc2/video/ChannelMediaInfo;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    new-instance v3, Lio/agora/rtc2/video/ChannelMediaInfo;

    .line 10
    .line 11
    iget-object v4, p0, Ll/tc0;->o1:Ll/ror;

    .line 12
    .line 13
    iget v4, v4, Ll/ror;->i1:I

    .line 14
    .line 15
    invoke-direct {v3, p1, v1, v4}, Lio/agora/rtc2/video/ChannelMediaInfo;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 16
    .line 17
    .line 18
    new-instance v4, Lio/agora/rtc2/video/ChannelMediaRelayConfiguration;

    .line 19
    .line 20
    invoke-direct {v4}, Lio/agora/rtc2/video/ChannelMediaRelayConfiguration;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v4, v0}, Lio/agora/rtc2/video/ChannelMediaRelayConfiguration;->setSrcChannelInfo(Lio/agora/rtc2/video/ChannelMediaInfo;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v4, p1, v3}, Lio/agora/rtc2/video/ChannelMediaRelayConfiguration;->setDestChannelInfo(Ljava/lang/String;Lio/agora/rtc2/video/ChannelMediaInfo;)V

    .line 27
    .line 28
    .line 29
    iget-boolean p1, p0, Ll/tc0;->e3:Z

    .line 30
    .line 31
    if-nez p1, :cond_1

    .line 32
    .line 33
    iget-object p1, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 34
    .line 35
    invoke-virtual {p1, v4}, Lio/agora/rtc2/RtcEngine;->startOrUpdateChannelMediaRelay(Lio/agora/rtc2/video/ChannelMediaRelayConfiguration;)I

    .line 36
    .line 37
    .line 38
    move-result v8

    .line 39
    iget-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 40
    .line 41
    new-instance v0, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    const-string v3, "startChannelMediaRelay ret:"

    .line 44
    .line 45
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {p1, v0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    if-gez v8, :cond_0

    .line 63
    .line 64
    iput-boolean v2, p0, Ll/tc0;->e3:Z

    .line 65
    .line 66
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 67
    .line 68
    .line 69
    move-result-object v5

    .line 70
    sget-object p1, Lcom/immomo/medialog/LogLevel;->FATAL:Lcom/immomo/medialog/LogLevel;

    .line 71
    .line 72
    invoke-virtual {p1}, Lcom/immomo/medialog/LogLevel;->value()I

    .line 73
    .line 74
    .line 75
    move-result v10

    .line 76
    const-string v6, "ConnectOtherRoom"

    .line 77
    .line 78
    const-string v7, "agora"

    .line 79
    .line 80
    const-string v9, "startChannelMediaRelay falied"

    .line 81
    .line 82
    invoke-virtual/range {v5 .. v10}, Ll/b7y;->e(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Ll/tc0;->I2:Ll/kod0;

    .line 86
    .line 87
    const-wide/16 v2, 0x0

    .line 88
    .line 89
    const/4 p1, 0x3

    .line 90
    invoke-virtual {p0, v2, v3, p1, v1}, Ll/kod0;->f(JILjava/lang/String;)V

    .line 91
    .line 92
    .line 93
    return v8

    .line 94
    :cond_0
    const/4 p1, 0x1

    .line 95
    iput-boolean p1, p0, Ll/tc0;->e3:Z

    .line 96
    .line 97
    return v8

    .line 98
    :cond_1
    return v2
.end method

.method public static synthetic b3(Ll/tc0;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->B1:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b4(Ll/tc0;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b5(Ll/tc0;)Ll/ror;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->o1:Ll/ror;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c3(Ll/tc0;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tc0;->v6(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c4(Ll/tc0;)Ll/gbl0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->c1:Ll/gbl0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c5(Ll/tc0;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d3(Ll/tc0;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->C1:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d4(Ll/tc0;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->l2:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d5(Ll/tc0;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e3(Ll/tc0;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e4(Ll/tc0;)Ll/gkl0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->b1:Ll/gkl0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e5(Ll/tc0;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f3(Ll/tc0;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f4(Ll/tc0;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f5(Ll/tc0;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic g3(Ll/tc0;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic g4(Ll/tc0;)Ll/q210$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->g1:Ll/q210$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic g5(Ll/tc0;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic h3(Ll/tc0;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic h4(Ll/tc0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->z1:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic h5(Ll/tc0;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method private h6(Ll/uow;)Lio/agora/rtc2/RtcEngine;
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const-string v2, "agora createEngine failed:"

    .line 6
    .line 7
    const-string v3, "agoraCreate"

    .line 8
    .line 9
    const-string v4, "isLoad "

    .line 10
    .line 11
    const-string v5, "mRtcKeepAlive:"

    .line 12
    .line 13
    iput-object v1, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 14
    .line 15
    iget v6, v1, Ll/tow;->P:I

    .line 16
    .line 17
    invoke-virtual {v0, v6}, Ll/tc0;->l7(I)V

    .line 18
    .line 19
    .line 20
    iget-boolean v1, v1, Ll/tow;->q:Z

    .line 21
    .line 22
    iput-boolean v1, v0, Ll/tc0;->G0:Z

    .line 23
    .line 24
    iget-object v1, v0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 25
    .line 26
    const/4 v6, 0x1

    .line 27
    const/4 v7, 0x0

    .line 28
    if-nez v1, :cond_9

    .line 29
    .line 30
    iget-object v1, v0, Ll/tc0;->E1:Lcom/immomo/mediacore/sink/CongressUtil;

    .line 31
    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    const/4 v8, 0x3

    .line 35
    new-array v8, v8, [B

    .line 36
    .line 37
    fill-array-data v8, :array_0

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1, v8}, Lcom/immomo/mediacore/sink/CongressUtil;->getPara([B)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    :cond_0
    iget-object v1, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 44
    .line 45
    new-instance v8, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    const-string v9, "mAppid:"

    .line 48
    .line 49
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-object v9, v0, Ll/tc0;->Y0:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v8

    .line 61
    const-string v9, "AgoraPusher"

    .line 62
    .line 63
    filled-new-array {v9, v8}, [Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v8

    .line 67
    invoke-virtual {v1, v8}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    new-instance v1, Ll/tc0$e;

    .line 71
    .line 72
    invoke-direct {v1, v0}, Ll/tc0$e;-><init>(Ll/tc0;)V

    .line 73
    .line 74
    .line 75
    iput-object v1, v0, Ll/tc0;->M1:Lio/agora/rtc2/IRtcEngineEventHandler;

    .line 76
    .line 77
    const/16 v8, 0x1100

    .line 78
    .line 79
    const/4 v9, 0x0

    .line 80
    :try_start_0
    iget-object v10, v0, Ll/tc0;->Y0:Ljava/lang/String;

    .line 81
    .line 82
    if-eqz v10, :cond_6

    .line 83
    .line 84
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 85
    .line 86
    .line 87
    move-result v10

    .line 88
    if-eqz v10, :cond_1

    .line 89
    .line 90
    goto/16 :goto_2

    .line 91
    .line 92
    :cond_1
    iput v7, v0, Ll/tc0;->k3:I

    .line 93
    .line 94
    iget-object v10, v0, Ll/tc0;->o1:Ll/ror;

    .line 95
    .line 96
    iget v10, v10, Ll/uow;->c1:I

    .line 97
    .line 98
    if-ltz v10, :cond_2

    .line 99
    .line 100
    iput v10, v0, Ll/tc0;->k3:I

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_2
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 104
    .line 105
    .line 106
    move-result-object v10

    .line 107
    invoke-virtual {v10}, Ll/csx;->I0()I

    .line 108
    .line 109
    .line 110
    move-result v10

    .line 111
    iput v10, v0, Ll/tc0;->k3:I

    .line 112
    .line 113
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 114
    .line 115
    .line 116
    move-result-wide v10

    .line 117
    invoke-static {}, Ll/x1f;->b()Ll/x1f;

    .line 118
    .line 119
    .line 120
    move-result-object v12

    .line 121
    invoke-virtual {v0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->W1()Landroid/content/Context;

    .line 122
    .line 123
    .line 124
    move-result-object v13

    .line 125
    iget-object v14, v0, Ll/tc0;->Y0:Ljava/lang/String;

    .line 126
    .line 127
    iget-object v15, v0, Ll/tc0;->M1:Lio/agora/rtc2/IRtcEngineEventHandler;

    .line 128
    .line 129
    iget v1, v0, Ll/tc0;->k3:I

    .line 130
    .line 131
    if-nez v1, :cond_3

    .line 132
    .line 133
    move v1, v6

    .line 134
    goto :goto_1

    .line 135
    :cond_3
    move v1, v7

    .line 136
    :goto_1
    invoke-virtual {v12, v13, v14, v15, v1}, Ll/x1f;->c(Landroid/content/Context;Ljava/lang/String;Lio/agora/rtc2/IRtcEngineEventHandler;Z)Lio/agora/rtc2/RtcEngine;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    iput-object v1, v0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 141
    .line 142
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 143
    .line 144
    .line 145
    move-result-wide v12

    .line 146
    sub-long/2addr v12, v10

    .line 147
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    new-instance v10, Ljava/lang/StringBuilder;

    .line 152
    .line 153
    invoke-direct {v10, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    iget v5, v0, Ll/tc0;->k3:I

    .line 157
    .line 158
    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    const-string v5, ",agoraHash:"

    .line 162
    .line 163
    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    iget-object v5, v0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 167
    .line 168
    invoke-virtual {v5}, Ljava/lang/Object;->hashCode()I

    .line 169
    .line 170
    .line 171
    move-result v5

    .line 172
    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    const-string v5, ",cost:"

    .line 176
    .line 177
    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {v10, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v5

    .line 187
    filled-new-array {v3, v5}, [Ljava/lang/Object;

    .line 188
    .line 189
    .line 190
    move-result-object v5

    .line 191
    invoke-virtual {v1, v5}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 192
    .line 193
    .line 194
    iget-object v1, v0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 195
    .line 196
    if-nez v1, :cond_4

    .line 197
    .line 198
    invoke-static {}, Lio/agora/rtc2/internal/RtcEngineImpl;->initializeNativeLibs()Z

    .line 199
    .line 200
    .line 201
    move-result v1

    .line 202
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 203
    .line 204
    .line 205
    move-result-object v5

    .line 206
    new-instance v6, Ljava/lang/StringBuilder;

    .line 207
    .line 208
    invoke-direct {v6, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 209
    .line 210
    .line 211
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    sget-object v4, Lcom/immomo/medialog/LogLevel;->FATAL:Lcom/immomo/medialog/LogLevel;

    .line 219
    .line 220
    invoke-virtual {v5, v3, v1, v4}, Ll/b7y;->a(Ljava/lang/String;Ljava/lang/String;Lcom/immomo/medialog/LogLevel;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 221
    .line 222
    .line 223
    return-object v9

    .line 224
    :cond_4
    const-string v2, "{\"rtc.stat_interval_ms\":1000}"

    .line 225
    .line 226
    invoke-virtual {v1, v2}, Lio/agora/rtc2/RtcEngine;->setParameters(Ljava/lang/String;)I

    .line 227
    .line 228
    .line 229
    iget-object v1, v0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 230
    .line 231
    const-string v2, "{\"rtc.video.max_metadata_size\":2048}"

    .line 232
    .line 233
    invoke-virtual {v1, v2}, Lio/agora/rtc2/RtcEngine;->setParameters(Ljava/lang/String;)I

    .line 234
    .line 235
    .line 236
    iput-boolean v7, v0, Ll/tc0;->e1:Z

    .line 237
    .line 238
    iget-object v1, v0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 239
    .line 240
    invoke-virtual {v1, v9}, Lio/agora/rtc2/RtcEngine;->registerAudioFrameObserver(Lio/agora/rtc2/IAudioFrameObserver;)I

    .line 241
    .line 242
    .line 243
    iget-object v1, v0, Ll/tc0;->o1:Ll/ror;

    .line 244
    .line 245
    iget v1, v1, Ll/tow;->R:I

    .line 246
    .line 247
    iget-object v2, v0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 248
    .line 249
    iget v3, v0, Ll/tc0;->j1:I

    .line 250
    .line 251
    const/4 v4, 0x2

    .line 252
    const/16 v5, 0x400

    .line 253
    .line 254
    invoke-virtual {v2, v3, v1, v4, v5}, Lio/agora/rtc2/RtcEngine;->setRecordingAudioFrameParameters(IIII)I

    .line 255
    .line 256
    .line 257
    iget-object v2, v0, Ll/tc0;->o1:Ll/ror;

    .line 258
    .line 259
    iget-boolean v2, v2, Ll/ror;->o1:Z

    .line 260
    .line 261
    if-eqz v2, :cond_5

    .line 262
    .line 263
    iget-object v2, v0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 264
    .line 265
    iget v3, v0, Ll/tc0;->j1:I

    .line 266
    .line 267
    invoke-virtual {v2, v3, v1, v7, v5}, Lio/agora/rtc2/RtcEngine;->setPlaybackAudioFrameParameters(IIII)I

    .line 268
    .line 269
    .line 270
    :cond_5
    iget-object v1, v0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 271
    .line 272
    invoke-virtual {v1, v6}, Lio/agora/rtc2/RtcEngine;->setChannelProfile(I)I

    .line 273
    .line 274
    .line 275
    iget-object v1, v0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 276
    .line 277
    iget-boolean v2, v0, Ll/tc0;->G0:Z

    .line 278
    .line 279
    invoke-virtual {v1, v2}, Lio/agora/rtc2/RtcEngine;->enableDualStreamMode(Z)I

    .line 280
    .line 281
    .line 282
    iget-boolean v1, v0, Ll/tc0;->H0:Z

    .line 283
    .line 284
    invoke-virtual {v0, v1}, Ll/tc0;->e6(Z)V

    .line 285
    .line 286
    .line 287
    goto :goto_3

    .line 288
    :cond_6
    :goto_2
    :try_start_1
    iget-object v1, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 289
    .line 290
    iget-object v3, v0, Ll/tc0;->Y0:Ljava/lang/String;

    .line 291
    .line 292
    filled-new-array {v2, v3}, [Ljava/lang/Object;

    .line 293
    .line 294
    .line 295
    move-result-object v3

    .line 296
    invoke-virtual {v1, v3}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 297
    .line 298
    .line 299
    iget-object v1, v0, Ll/tc0;->g1:Ll/q210$a;

    .line 300
    .line 301
    if-eqz v1, :cond_7

    .line 302
    .line 303
    const/16 v3, 0x326

    .line 304
    .line 305
    invoke-interface {v1, v8, v3, v7, v0}, Ll/q210$a;->g(IIILjava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 306
    .line 307
    .line 308
    :cond_7
    return-object v9

    .line 309
    :catch_0
    iget-object v1, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 310
    .line 311
    iget-object v3, v0, Ll/tc0;->Y0:Ljava/lang/String;

    .line 312
    .line 313
    filled-new-array {v2, v3}, [Ljava/lang/Object;

    .line 314
    .line 315
    .line 316
    move-result-object v2

    .line 317
    invoke-virtual {v1, v2}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 318
    .line 319
    .line 320
    iget-object v1, v0, Ll/tc0;->g1:Ll/q210$a;

    .line 321
    .line 322
    if-eqz v1, :cond_8

    .line 323
    .line 324
    const/16 v3, 0x326

    .line 325
    .line 326
    invoke-interface {v1, v8, v3, v7, v0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 327
    .line 328
    .line 329
    :cond_8
    return-object v9

    .line 330
    :cond_9
    :goto_3
    iget-object v1, v0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 331
    .line 332
    invoke-virtual {v1}, Lio/agora/rtc2/RtcEngine;->isTextureEncodeSupported()Z

    .line 333
    .line 334
    .line 335
    move-result v1

    .line 336
    iput-boolean v1, v0, Ll/tc0;->T:Z

    .line 337
    .line 338
    iget-object v1, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 339
    .line 340
    if-eqz v1, :cond_a

    .line 341
    .line 342
    iget-boolean v1, v1, Ll/tow;->b0:Z

    .line 343
    .line 344
    if-eqz v1, :cond_a

    .line 345
    .line 346
    iput-boolean v7, v0, Ll/tc0;->T:Z

    .line 347
    .line 348
    :cond_a
    iget-object v1, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 349
    .line 350
    iget-object v2, v0, Ll/tc0;->Y0:Ljava/lang/String;

    .line 351
    .line 352
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 353
    .line 354
    .line 355
    move-result v2

    .line 356
    xor-int/2addr v2, v6

    .line 357
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 358
    .line 359
    .line 360
    move-result-object v2

    .line 361
    iget-object v3, v0, Ll/tc0;->r1:Ljava/lang/String;

    .line 362
    .line 363
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 364
    .line 365
    .line 366
    move-result v3

    .line 367
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 368
    .line 369
    .line 370
    move-result-object v3

    .line 371
    const-string v4, "isDynamicKey"

    .line 372
    .line 373
    const-string v5, "channelkey"

    .line 374
    .line 375
    filled-new-array {v4, v2, v5, v3}, [Ljava/lang/Object;

    .line 376
    .line 377
    .line 378
    move-result-object v2

    .line 379
    invoke-virtual {v1, v2}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 380
    .line 381
    .line 382
    iget-object v0, v0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 383
    .line 384
    return-object v0

    .line 385
    :array_0
    .array-data 1
        0x1t
        0x1t
        0x1t
    .end array-data
.end method

.method public static synthetic i3(Ll/tc0;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic i4(Ll/tc0;)Ll/fbl0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->a1:Ll/fbl0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic i5(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcClientRoleChangedHandler;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->X1:Lcom/immomo/mediacore/coninf/MRtcClientRoleChangedHandler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic j3(Ll/tc0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/tc0;->V2:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic j4(Ll/tc0;)Lcom/immomo/mediacore/sink/CongressUtil;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->E1:Lcom/immomo/mediacore/sink/CongressUtil;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic j5(Ll/tc0;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic k3(Ll/tc0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/tc0;->c3:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic k4(Ll/tc0;)Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->O0:Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic k5(Ll/tc0;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method private k6(I)I
    .locals 1

    .line 1
    if-eqz p1, :cond_4

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p1, v0, :cond_3

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p1, v0, :cond_4

    .line 8
    .line 9
    const/4 v0, 0x3

    .line 10
    if-eq p1, v0, :cond_2

    .line 11
    .line 12
    const/4 v0, 0x4

    .line 13
    if-eq p1, v0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x5

    .line 16
    if-eq p1, v0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Ll/tc0;->o1:Ll/ror;

    .line 19
    .line 20
    iget p0, p0, Ll/tow;->S:I

    .line 21
    .line 22
    return p0

    .line 23
    :cond_0
    const p0, 0x1f400

    .line 24
    .line 25
    .line 26
    return p0

    .line 27
    :cond_1
    const p0, 0x17700

    .line 28
    .line 29
    .line 30
    return p0

    .line 31
    :cond_2
    const p0, 0x13880

    .line 32
    .line 33
    .line 34
    return p0

    .line 35
    :cond_3
    const/16 p0, 0x4650

    .line 36
    .line 37
    return p0

    .line 38
    :cond_4
    const p0, 0xfa00

    .line 39
    .line 40
    .line 41
    return p0
.end method

.method public static synthetic l3(Ll/tc0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/tc0;->h3:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic l4(Ll/tc0;Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;)Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tc0;->O0:Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic l5(Ll/tc0;Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->l2(Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic m3(Ll/tc0;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->b3:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic m4(Ll/tc0;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic m5(Ll/tc0;)[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->O1:[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic n3(Ll/tc0;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/tc0;->h3:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic n4(Ll/tc0;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic n5(Ll/tc0;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/tc0;->X:Z

    .line 2
    .line 3
    return p1
.end method

.method private n6()Ljava/lang/String;
    .locals 7

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "["

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/tc0;->R0:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/util/AbstractMap;->entrySet()Ljava/util/Set;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const/4 v1, 0x0

    .line 19
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_1

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Ljava/util/Map$Entry;

    .line 30
    .line 31
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    check-cast v2, Ll/iny;

    .line 36
    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    const-string v3, ","

    .line 40
    .line 41
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    :cond_0
    iget-wide v3, v2, Ll/iny;->f:J

    .line 45
    .line 46
    iget-wide v5, v2, Ll/iny;->e:J

    .line 47
    .line 48
    add-long/2addr v3, v5

    .line 49
    iput-wide v3, v2, Ll/iny;->d:J

    .line 50
    .line 51
    invoke-virtual {v2}, Ll/iny;->b()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    add-int/lit8 v1, v1, 0x1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    if-nez v1, :cond_2

    .line 62
    .line 63
    const-string p0, "(0)"

    .line 64
    .line 65
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    :cond_2
    const-string p0, "]"

    .line 69
    .line 70
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    return-object p0
.end method

.method private n8()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v1, Lio/agora/rtc2/Constants$ExternalVideoSourceType;->VIDEO_FRAME:Lio/agora/rtc2/Constants$ExternalVideoSourceType;

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    iget-boolean v3, p0, Ll/tc0;->T:Z

    .line 9
    .line 10
    invoke-virtual {v0, v2, v3, v1}, Lio/agora/rtc2/RtcEngine;->setExternalVideoSource(ZZLio/agora/rtc2/Constants$ExternalVideoSourceType;)I

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 14
    .line 15
    const-string v0, "writerTexturePrepare"

    .line 16
    .line 17
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public static synthetic o3(Ll/tc0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/tc0;->F2:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic o4(Ll/tc0;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic o5(Ll/tc0;[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;)[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tc0;->O1:[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic p3(Ll/tc0;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic p4(Ll/tc0;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic p5(Ll/tc0;Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;)Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->J:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 2
    .line 3
    return-object p1
.end method

.method private p6(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    const-string p0, "conf"

    .line 2
    .line 3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string p0, ""

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 13
    .line 14
    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catch_0
    move-exception p0

    .line 28
    goto :goto_1

    .line 29
    :cond_1
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    return-object p0

    .line 34
    :goto_1
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    const-string v2, "getFixSei error"

    .line 41
    .line 42
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {v0, p0}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    return-object p1
.end method

.method public static synthetic q3(Ll/tc0;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic q4(Ll/tc0;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic q5(Ll/tc0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->b2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic r2(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcRealLayoutNotifyHander;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->v2:Lcom/immomo/mediacore/coninf/MRtcRealLayoutNotifyHander;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic r3(Ll/tc0;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic r4(Ll/tc0;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic r5(Ll/tc0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/tc0;->G1:I

    .line 2
    .line 3
    return p0
.end method

.method private release()V
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const-string v1, "mRtcKeepAlive:"

    .line 4
    .line 5
    const-string v2, "stopRtmpStream line 2702 mrCoreParameters.mRtmpPath:"

    .line 6
    .line 7
    const-string v3, "server mix destory uid:"

    .line 8
    .line 9
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    const-string v5, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 14
    .line 15
    const-string v6, "AgoraPushFilter release"

    .line 16
    .line 17
    invoke-virtual {v4, v5, v6}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 v4, 0x1

    .line 21
    iput-boolean v4, v0, Ll/tc0;->s3:Z

    .line 22
    .line 23
    const/4 v5, 0x0

    .line 24
    iput-boolean v5, v0, Ll/tc0;->X:Z

    .line 25
    .line 26
    iget-object v6, v0, Ll/tc0;->t1:Ljava/lang/Object;

    .line 27
    .line 28
    monitor-enter v6

    .line 29
    :try_start_0
    iget-object v7, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 30
    .line 31
    const/4 v8, 0x0

    .line 32
    iput-object v8, v7, Ll/wvx;->a0:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v7, v0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 35
    .line 36
    if-eqz v7, :cond_3

    .line 37
    .line 38
    iget-boolean v7, v0, Ll/tc0;->v3:Z

    .line 39
    .line 40
    if-eqz v7, :cond_0

    .line 41
    .line 42
    invoke-static {}, Ll/arx;->d()Ll/arx;

    .line 43
    .line 44
    .line 45
    move-result-object v7

    .line 46
    iget-object v10, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->R:Ll/brx;

    .line 47
    .line 48
    invoke-virtual {v10}, Ll/brx;->b()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v10

    .line 52
    invoke-virtual {v7, v10}, Ll/arx;->h(Ljava/lang/String;)Ll/arx$d;

    .line 53
    .line 54
    .line 55
    move-result-object v7

    .line 56
    iget-object v10, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 57
    .line 58
    new-instance v11, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {v11, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    iget-object v3, v0, Ll/tc0;->o1:Ll/ror;

    .line 64
    .line 65
    iget v3, v3, Ll/uow;->B0:I

    .line 66
    .line 67
    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    const-string v3, ",momoid:"

    .line 71
    .line 72
    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    iget-object v3, v7, Ll/arx$d;->c:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    const-string v3, "roomid:"

    .line 81
    .line 82
    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    iget-object v3, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->R:Ll/brx;

    .line 86
    .line 87
    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    iget-object v3, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->R:Ll/brx;

    .line 91
    .line 92
    invoke-virtual {v3}, Ll/brx;->h()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    invoke-virtual {v10, v3}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    invoke-static {}, Lcom/momo/piplineext/http/HttpWrapper;->getInstance()Lcom/momo/piplineext/http/HttpWrapper;

    .line 104
    .line 105
    .line 106
    move-result-object v11

    .line 107
    iget-object v12, v7, Ll/arx$d;->a:Ljava/lang/String;

    .line 108
    .line 109
    iget-object v13, v7, Ll/arx$d;->b:Ljava/lang/String;

    .line 110
    .line 111
    iget-object v3, v0, Ll/tc0;->o1:Ll/ror;

    .line 112
    .line 113
    iget v14, v3, Ll/uow;->B0:I

    .line 114
    .line 115
    iget-object v3, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->R:Ll/brx;

    .line 116
    .line 117
    invoke-virtual {v3}, Ll/brx;->k()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v15

    .line 121
    iget-object v3, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->R:Ll/brx;

    .line 122
    .line 123
    invoke-virtual {v3}, Ll/brx;->h()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v16

    .line 127
    iget-object v3, v0, Ll/tc0;->o1:Ll/ror;

    .line 128
    .line 129
    iget-object v3, v3, Ll/ror;->g1:Ljava/lang/String;

    .line 130
    .line 131
    iget-object v7, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 132
    .line 133
    iget-object v10, v7, Ll/wvx;->A0:Ljava/lang/String;

    .line 134
    .line 135
    const-string v19, "agora"

    .line 136
    .line 137
    move-object/from16 v18, v10

    .line 138
    .line 139
    iget-wide v9, v7, Ll/wvx;->s:J

    .line 140
    .line 141
    long-to-int v7, v9

    .line 142
    move-object/from16 v17, v3

    .line 143
    .line 144
    move/from16 v20, v7

    .line 145
    .line 146
    invoke-virtual/range {v11 .. v20}, Lcom/momo/piplineext/http/HttpWrapper;->destoryChannel(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 147
    .line 148
    .line 149
    goto :goto_0

    .line 150
    :catchall_0
    move-exception v0

    .line 151
    goto/16 :goto_2

    .line 152
    .line 153
    :cond_0
    :goto_0
    invoke-virtual {v0}, Ll/tc0;->S5()V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v0, v5}, Ll/tc0;->Y7(I)V

    .line 157
    .line 158
    .line 159
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 160
    .line 161
    .line 162
    move-result-object v3

    .line 163
    const-string v7, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 164
    .line 165
    const-string v9, "release >>>>>"

    .line 166
    .line 167
    invoke-virtual {v3, v7, v9}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    iget-object v3, v0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 171
    .line 172
    invoke-virtual {v3, v8}, Lio/agora/rtc2/RtcEngine;->registerAudioFrameObserver(Lio/agora/rtc2/IAudioFrameObserver;)I

    .line 173
    .line 174
    .line 175
    iput-boolean v5, v0, Ll/tc0;->e1:Z

    .line 176
    .line 177
    iget-object v3, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 178
    .line 179
    iget-object v3, v3, Ll/uow;->v0:Ljava/lang/String;

    .line 180
    .line 181
    if-eqz v3, :cond_1

    .line 182
    .line 183
    iget-object v3, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 184
    .line 185
    new-instance v7, Ljava/lang/StringBuilder;

    .line 186
    .line 187
    invoke-direct {v7, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    iget-object v2, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 191
    .line 192
    iget-object v2, v2, Ll/wvx;->x:Ljava/lang/String;

    .line 193
    .line 194
    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v2

    .line 201
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 202
    .line 203
    .line 204
    move-result-object v2

    .line 205
    invoke-virtual {v3, v2}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 206
    .line 207
    .line 208
    iget-object v2, v0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 209
    .line 210
    iget-object v3, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 211
    .line 212
    iget-object v3, v3, Ll/wvx;->x:Ljava/lang/String;

    .line 213
    .line 214
    invoke-virtual {v2, v3}, Lio/agora/rtc2/RtcEngine;->stopRtmpStream(Ljava/lang/String;)I

    .line 215
    .line 216
    .line 217
    :cond_1
    iget-object v2, v0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 218
    .line 219
    invoke-virtual {v2}, Lio/agora/rtc2/RtcEngine;->leaveChannel()I

    .line 220
    .line 221
    .line 222
    iget-object v2, v0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 223
    .line 224
    invoke-virtual {v2, v8, v5}, Lio/agora/rtc2/RtcEngine;->registerMediaMetadataObserver(Lio/agora/rtc2/IMetadataObserver;I)I

    .line 225
    .line 226
    .line 227
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 228
    .line 229
    .line 230
    move-result-wide v2

    .line 231
    invoke-static {}, Ll/x1f;->b()Ll/x1f;

    .line 232
    .line 233
    .line 234
    move-result-object v7

    .line 235
    iget-object v9, v0, Ll/tc0;->M1:Lio/agora/rtc2/IRtcEngineEventHandler;

    .line 236
    .line 237
    iget v10, v0, Ll/tc0;->k3:I

    .line 238
    .line 239
    if-nez v10, :cond_2

    .line 240
    .line 241
    goto :goto_1

    .line 242
    :cond_2
    move v4, v5

    .line 243
    :goto_1
    invoke-virtual {v7, v9, v4}, Ll/x1f;->a(Lio/agora/rtc2/IRtcEngineEventHandler;Z)V

    .line 244
    .line 245
    .line 246
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 247
    .line 248
    .line 249
    move-result-wide v9

    .line 250
    sub-long/2addr v9, v2

    .line 251
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 252
    .line 253
    .line 254
    move-result-object v2

    .line 255
    const-string v3, "agoraDestroy"

    .line 256
    .line 257
    new-instance v4, Ljava/lang/StringBuilder;

    .line 258
    .line 259
    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 260
    .line 261
    .line 262
    iget v1, v0, Ll/tc0;->k3:I

    .line 263
    .line 264
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 265
    .line 266
    .line 267
    const-string v1, ",cost:"

    .line 268
    .line 269
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 270
    .line 271
    .line 272
    invoke-virtual {v4, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 273
    .line 274
    .line 275
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object v1

    .line 279
    filled-new-array {v3, v1}, [Ljava/lang/Object;

    .line 280
    .line 281
    .line 282
    move-result-object v1

    .line 283
    invoke-virtual {v2, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 284
    .line 285
    .line 286
    const-string v1, "lqdebug"

    .line 287
    .line 288
    const-string v2, "mRtcEngine.destroy() end"

    .line 289
    .line 290
    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 291
    .line 292
    .line 293
    iput-boolean v5, v0, Ll/tc0;->X:Z

    .line 294
    .line 295
    sget-object v1, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;->FILTER_IDLE:Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 296
    .line 297
    invoke-virtual {v0, v1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->l2(Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;)V

    .line 298
    .line 299
    .line 300
    sget-object v1, Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;->STOP:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 301
    .line 302
    iput-object v1, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->J:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 303
    .line 304
    iget-object v1, v0, Ll/tc0;->g1:Ll/q210$a;

    .line 305
    .line 306
    const/16 v2, 0x1001

    .line 307
    .line 308
    invoke-interface {v1, v2, v5, v5, v0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 309
    .line 310
    .line 311
    const/4 v1, -0x1

    .line 312
    iput v1, v0, Ll/tc0;->V:I

    .line 313
    .line 314
    iput-object v8, v0, Ll/tc0;->G2:Lcom/immomo/mediacore/coninf/MRtcReceiveSeiHandler;

    .line 315
    .line 316
    :cond_3
    iput-boolean v5, v0, Ll/tc0;->X:Z

    .line 317
    .line 318
    sget-object v1, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;->FILTER_IDLE:Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 319
    .line 320
    invoke-virtual {v0, v1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->l2(Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;)V

    .line 321
    .line 322
    .line 323
    sget-object v1, Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;->STOP:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 324
    .line 325
    iput-object v1, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->J:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 326
    .line 327
    invoke-virtual {v0}, Ll/tc0;->d2()V

    .line 328
    .line 329
    .line 330
    iget-object v1, v0, Ll/tc0;->g1:Ll/q210$a;

    .line 331
    .line 332
    const/16 v2, 0x1001

    .line 333
    .line 334
    invoke-interface {v1, v2, v5, v5, v0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 335
    .line 336
    .line 337
    monitor-exit v6

    .line 338
    return-void

    .line 339
    :goto_2
    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 340
    throw v0
.end method

.method public static synthetic s2(Ll/tc0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->R0:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic s3(Ll/tc0;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic s4(Ll/tc0;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic s5(Ll/tc0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/tc0;->M6()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic t2(Ll/tc0;)Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->Q1:Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic t3(Ll/tc0;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic t4(Ll/tc0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/tc0;->L0:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic t5(Ll/tc0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/tc0;->i2:Z

    .line 2
    .line 3
    return p0
.end method

.method private t6()Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->Q0:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic u2(Ll/tc0;ZIIIILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p6}, Ll/tc0;->W5(ZIIIILjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic u3(Ll/tc0;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic u4(Ll/tc0;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/tc0;->L0:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic u5(Ll/tc0;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/tc0;->i2:Z

    .line 2
    .line 3
    return p1
.end method

.method private u6()Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->P0:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic v2(Ll/tc0;)Lio/agora/rtc2/live/LiveTranscoding;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic v3(Ll/tc0;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic v4(Ll/tc0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/tc0;->N0:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic v5(Ll/tc0;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->j2:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method private v6(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .line 1
    const-string v0, "conf"

    .line 2
    .line 3
    const-string v1, "bType"

    .line 4
    .line 5
    const-string v2, "ts"

    .line 6
    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    if-eqz v3, :cond_0

    .line 12
    .line 13
    const-string p0, ""

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    .line 17
    .line 18
    invoke-direct {v3, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v3, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    if-eqz v4, :cond_1

    .line 26
    .line 27
    invoke-virtual {v3, v2}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    :cond_1
    invoke-virtual {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Y1()J

    .line 31
    .line 32
    .line 33
    move-result-wide v4

    .line 34
    invoke-virtual {v3, v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_2

    .line 42
    .line 43
    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    :cond_2
    iget-object v2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 47
    .line 48
    iget-wide v4, v2, Ll/wvx;->s:J

    .line 49
    .line 50
    invoke-virtual {v3, v1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_3

    .line 58
    .line 59
    iget-boolean p0, p0, Ll/tc0;->v1:Z

    .line 60
    .line 61
    const/4 v1, 0x1

    .line 62
    if-ne p0, v1, :cond_3

    .line 63
    .line 64
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    :cond_3
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    return-object p0

    .line 72
    :catch_0
    return-object p1
.end method

.method public static synthetic w2(Ll/tc0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/tc0;->v3:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic w3(Ll/tc0;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic w4(Ll/tc0;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/tc0;->N0:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic w5(Ll/tc0;Ljava/lang/String;)I
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tc0;->a8(Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic x2(Ll/tc0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tc0;->J7(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic x3(Ll/tc0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->S0:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic x4(Ll/tc0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/tc0;->M0:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic x5(Ll/tc0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/tc0;->J1:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic y2(Ll/tc0;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic y3(Ll/tc0;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic y4(Ll/tc0;I)I
    .locals 0

    .line 1
    iput p1, p0, Ll/tc0;->M0:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic y5(Ll/tc0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/tc0;->I1:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic z2(Ll/tc0;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic z3(Ll/tc0;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tc0;->z6(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic z4(Ll/tc0;)Ll/ypw;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0
.end method

.method private z6(I)V
    .locals 9

    .line 1
    iget-boolean v0, p0, Ll/tc0;->M2:Z

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget v0, p0, Ll/tc0;->N2:F

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    cmpl-float v2, v0, v1

    .line 9
    .line 10
    if-ltz v2, :cond_0

    .line 11
    .line 12
    iget v2, p0, Ll/tc0;->O2:F

    .line 13
    .line 14
    cmpl-float v3, v2, v1

    .line 15
    .line 16
    if-ltz v3, :cond_0

    .line 17
    .line 18
    iget v3, p0, Ll/tc0;->P2:F

    .line 19
    .line 20
    cmpl-float v4, v3, v1

    .line 21
    .line 22
    if-lez v4, :cond_0

    .line 23
    .line 24
    iget v4, p0, Ll/tc0;->Q2:F

    .line 25
    .line 26
    cmpl-float v1, v4, v1

    .line 27
    .line 28
    if-lez v1, :cond_0

    .line 29
    .line 30
    invoke-static {v0, v2, v3, v4}, Lcom/immomo/mediacore/sink/CongressUtil;->setCutPostion(FFFF)V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget v0, p0, Ll/tc0;->R2:I

    .line 34
    .line 35
    if-ltz v0, :cond_1

    .line 36
    .line 37
    iget v1, p0, Ll/tc0;->S2:I

    .line 38
    .line 39
    if-ltz v1, :cond_1

    .line 40
    .line 41
    iget v2, p0, Ll/tc0;->T2:I

    .line 42
    .line 43
    if-lez v2, :cond_1

    .line 44
    .line 45
    iget v3, p0, Ll/tc0;->U2:I

    .line 46
    .line 47
    if-lez v3, :cond_1

    .line 48
    .line 49
    invoke-static {v0, v1, v2, v3}, Lcom/immomo/mediacore/sink/CongressUtil;->setCutPostion(IIII)V

    .line 50
    .line 51
    .line 52
    :cond_1
    iget-object v0, p0, Ll/tc0;->z1:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 53
    .line 54
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v0, v1}, Ljava/util/AbstractMap;->containsKey(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-nez v0, :cond_2

    .line 63
    .line 64
    iget-object v0, p0, Ll/tc0;->z1:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 65
    .line 66
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-virtual {v0, v1, v2}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    :cond_2
    new-instance v6, Landroid/view/SurfaceView;

    .line 78
    .line 79
    invoke-virtual {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->W1()Landroid/content/Context;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-direct {v6, v0}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v6}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    new-instance v1, Ll/tc0$j;

    .line 91
    .line 92
    invoke-direct {v1, p0, p1}, Ll/tc0$j;-><init>(Ll/tc0;I)V

    .line 93
    .line 94
    .line 95
    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 96
    .line 97
    .line 98
    iget-object v3, p0, Ll/tc0;->Z0:Ll/ebl0;

    .line 99
    .line 100
    int-to-long v4, p1

    .line 101
    iget v7, p0, Ll/wej;->width:I

    .line 102
    .line 103
    iget v8, p0, Ll/wej;->height:I

    .line 104
    .line 105
    invoke-interface/range {v3 .. v8}, Ll/ebl0;->a(JLandroid/view/SurfaceView;II)V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_3
    iget-boolean v0, p0, Ll/tc0;->d2:Z

    .line 110
    .line 111
    const-string v1, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 112
    .line 113
    const/4 v2, 0x1

    .line 114
    if-nez v0, :cond_6

    .line 115
    .line 116
    iget-object v0, p0, Ll/tc0;->b1:Ll/gkl0;

    .line 117
    .line 118
    if-nez v0, :cond_6

    .line 119
    .line 120
    iget-object v0, p0, Ll/tc0;->o1:Ll/ror;

    .line 121
    .line 122
    iget-boolean v0, v0, Ll/uow;->Z0:Z

    .line 123
    .line 124
    if-nez v0, :cond_6

    .line 125
    .line 126
    new-instance v6, Landroid/view/SurfaceView;

    .line 127
    .line 128
    invoke-virtual {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->W1()Landroid/content/Context;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    invoke-direct {v6, v0}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 133
    .line 134
    .line 135
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 136
    .line 137
    if-eqz v0, :cond_4

    .line 138
    .line 139
    iget-object v0, p0, Ll/tc0;->a3:Ljava/util/ArrayList;

    .line 140
    .line 141
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 142
    .line 143
    .line 144
    move-result-object v3

    .line 145
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 149
    .line 150
    new-instance v3, Lio/agora/rtc2/video/VideoCanvas;

    .line 151
    .line 152
    invoke-direct {v3, v6, v2, p1}, Lio/agora/rtc2/video/VideoCanvas;-><init>(Landroid/view/View;II)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {v0, v3}, Lio/agora/rtc2/RtcEngine;->setupRemoteVideo(Lio/agora/rtc2/video/VideoCanvas;)I

    .line 156
    .line 157
    .line 158
    :cond_4
    iget-object v0, p0, Ll/tc0;->Z0:Ll/ebl0;

    .line 159
    .line 160
    if-eqz v0, :cond_5

    .line 161
    .line 162
    iget-boolean v0, p0, Ll/tc0;->w1:Z

    .line 163
    .line 164
    if-nez v0, :cond_5

    .line 165
    .line 166
    iget-boolean v0, p0, Ll/tc0;->v1:Z

    .line 167
    .line 168
    if-nez v0, :cond_5

    .line 169
    .line 170
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 171
    .line 172
    iget-object v3, p0, Ll/tc0;->o1:Ll/ror;

    .line 173
    .line 174
    iget-boolean v3, v3, Ll/uow;->Z0:Z

    .line 175
    .line 176
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 177
    .line 178
    .line 179
    move-result-object v3

    .line 180
    new-instance v4, Ljava/lang/StringBuilder;

    .line 181
    .line 182
    const-string v5, "mVideoTextureListener:"

    .line 183
    .line 184
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    iget-object v5, p0, Ll/tc0;->b1:Ll/gkl0;

    .line 188
    .line 189
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v4

    .line 196
    const-string v5, "onVideoChannelAdded"

    .line 197
    .line 198
    filled-new-array {v5, v3, v4}, [Ljava/lang/Object;

    .line 199
    .line 200
    .line 201
    move-result-object v3

    .line 202
    invoke-virtual {v0, v3}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 203
    .line 204
    .line 205
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    new-instance v3, Ljava/lang/StringBuilder;

    .line 210
    .line 211
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 212
    .line 213
    .line 214
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 215
    .line 216
    .line 217
    move-result-object v4

    .line 218
    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object v4

    .line 222
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 223
    .line 224
    .line 225
    const-string v4, "----onVideoChannelAdded: userID="

    .line 226
    .line 227
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 228
    .line 229
    .line 230
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 231
    .line 232
    .line 233
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object v3

    .line 237
    invoke-virtual {v0, v1, v3}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 238
    .line 239
    .line 240
    iget-object v3, p0, Ll/tc0;->Z0:Ll/ebl0;

    .line 241
    .line 242
    int-to-long v4, p1

    .line 243
    iget v7, p0, Ll/wej;->width:I

    .line 244
    .line 245
    iget v8, p0, Ll/wej;->height:I

    .line 246
    .line 247
    invoke-interface/range {v3 .. v8}, Ll/ebl0;->a(JLandroid/view/SurfaceView;II)V

    .line 248
    .line 249
    .line 250
    :cond_5
    iget-object p1, p0, Ll/tc0;->o1:Ll/ror;

    .line 251
    .line 252
    iget-boolean p1, p1, Ll/uow;->X0:Z

    .line 253
    .line 254
    if-eqz p1, :cond_a

    .line 255
    .line 256
    iget-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 257
    .line 258
    new-instance v0, Ljava/lang/StringBuilder;

    .line 259
    .line 260
    const-string v1, "isLocalMix:"

    .line 261
    .line 262
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 263
    .line 264
    .line 265
    iget-object v1, p0, Ll/tc0;->o1:Ll/ror;

    .line 266
    .line 267
    iget-boolean v1, v1, Ll/uow;->X0:Z

    .line 268
    .line 269
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 270
    .line 271
    .line 272
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object v0

    .line 276
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 277
    .line 278
    .line 279
    move-result-object v1

    .line 280
    new-instance v2, Ljava/lang/StringBuilder;

    .line 281
    .line 282
    const-string v3, "mergeCanvansWidth:"

    .line 283
    .line 284
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 285
    .line 286
    .line 287
    iget-object v3, p0, Ll/tc0;->o1:Ll/ror;

    .line 288
    .line 289
    iget v3, v3, Ll/tow;->k:I

    .line 290
    .line 291
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 292
    .line 293
    .line 294
    const-string v3, ", mergeHeight:"

    .line 295
    .line 296
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 297
    .line 298
    .line 299
    iget-object v3, p0, Ll/tc0;->o1:Ll/ror;

    .line 300
    .line 301
    iget v3, v3, Ll/tow;->l:I

    .line 302
    .line 303
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 304
    .line 305
    .line 306
    const-string v3, ", mix bitrate:"

    .line 307
    .line 308
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 309
    .line 310
    .line 311
    iget p0, p0, Ll/tc0;->I1:I

    .line 312
    .line 313
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 314
    .line 315
    .line 316
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 317
    .line 318
    .line 319
    move-result-object p0

    .line 320
    filled-new-array {v0, v1, p0}, [Ljava/lang/Object;

    .line 321
    .line 322
    .line 323
    move-result-object p0

    .line 324
    invoke-virtual {p1, p0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 325
    .line 326
    .line 327
    return-void

    .line 328
    :cond_6
    iget-object v0, p0, Ll/tc0;->o1:Ll/ror;

    .line 329
    .line 330
    iget-boolean v0, v0, Ll/uow;->Z0:Z

    .line 331
    .line 332
    if-eqz v0, :cond_8

    .line 333
    .line 334
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 335
    .line 336
    new-instance v1, Ljava/lang/StringBuilder;

    .line 337
    .line 338
    const-string v3, "width:"

    .line 339
    .line 340
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 341
    .line 342
    .line 343
    iget v3, p0, Ll/wej;->width:I

    .line 344
    .line 345
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 346
    .line 347
    .line 348
    const-string v3, ",height:"

    .line 349
    .line 350
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 351
    .line 352
    .line 353
    iget v3, p0, Ll/wej;->height:I

    .line 354
    .line 355
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 356
    .line 357
    .line 358
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 359
    .line 360
    .line 361
    move-result-object v1

    .line 362
    const-string v3, "useTextureView"

    .line 363
    .line 364
    filled-new-array {v3, v1}, [Ljava/lang/Object;

    .line 365
    .line 366
    .line 367
    move-result-object v1

    .line 368
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 369
    .line 370
    .line 371
    new-instance v6, Landroid/view/TextureView;

    .line 372
    .line 373
    invoke-virtual {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->W1()Landroid/content/Context;

    .line 374
    .line 375
    .line 376
    move-result-object v0

    .line 377
    invoke-direct {v6, v0}, Landroid/view/TextureView;-><init>(Landroid/content/Context;)V

    .line 378
    .line 379
    .line 380
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 381
    .line 382
    if-eqz v0, :cond_7

    .line 383
    .line 384
    new-instance v1, Lio/agora/rtc2/video/VideoCanvas;

    .line 385
    .line 386
    invoke-direct {v1, v6, v2, p1}, Lio/agora/rtc2/video/VideoCanvas;-><init>(Landroid/view/View;II)V

    .line 387
    .line 388
    .line 389
    invoke-virtual {v0, v1}, Lio/agora/rtc2/RtcEngine;->setupRemoteVideo(Lio/agora/rtc2/video/VideoCanvas;)I

    .line 390
    .line 391
    .line 392
    :cond_7
    iget-object v0, p0, Ll/tc0;->c1:Ll/gbl0;

    .line 393
    .line 394
    if-eqz v0, :cond_a

    .line 395
    .line 396
    iget-object v0, p0, Ll/tc0;->Z2:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 397
    .line 398
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 399
    .line 400
    .line 401
    move-result-object v1

    .line 402
    invoke-virtual {v0, v1, v6}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 403
    .line 404
    .line 405
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 406
    .line 407
    const-string v1, "onVideoChannelAdded use textureView"

    .line 408
    .line 409
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 410
    .line 411
    .line 412
    move-result-object v1

    .line 413
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 414
    .line 415
    .line 416
    iget-object v3, p0, Ll/tc0;->c1:Ll/gbl0;

    .line 417
    .line 418
    int-to-long v4, p1

    .line 419
    iget v7, p0, Ll/wej;->width:I

    .line 420
    .line 421
    iget v8, p0, Ll/wej;->height:I

    .line 422
    .line 423
    invoke-interface/range {v3 .. v8}, Ll/gbl0;->a(JLandroid/view/TextureView;II)V

    .line 424
    .line 425
    .line 426
    return-void

    .line 427
    :cond_8
    iget-object v0, p0, Ll/tc0;->z1:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 428
    .line 429
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 430
    .line 431
    .line 432
    move-result-object v2

    .line 433
    invoke-virtual {v0, v2}, Ljava/util/AbstractMap;->containsKey(Ljava/lang/Object;)Z

    .line 434
    .line 435
    .line 436
    move-result v0

    .line 437
    if-nez v0, :cond_a

    .line 438
    .line 439
    iget-object v0, p0, Ll/tc0;->z1:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 440
    .line 441
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 442
    .line 443
    .line 444
    move-result-object v2

    .line 445
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 446
    .line 447
    .line 448
    move-result-object v3

    .line 449
    invoke-virtual {v0, v2, v3}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 450
    .line 451
    .line 452
    iget-object v0, p0, Ll/tc0;->b1:Ll/gkl0;

    .line 453
    .line 454
    if-eqz v0, :cond_9

    .line 455
    .line 456
    iget v0, p0, Ll/wej;->width:I

    .line 457
    .line 458
    iget v2, p0, Ll/wej;->height:I

    .line 459
    .line 460
    invoke-virtual {p0, p1, v0, v2}, Ll/tc0;->i8(III)V

    .line 461
    .line 462
    .line 463
    :cond_9
    new-instance v3, Ll/sti0;

    .line 464
    .line 465
    int-to-long v4, p1

    .line 466
    iget v6, p0, Ll/wej;->width:I

    .line 467
    .line 468
    iget v7, p0, Ll/wej;->height:I

    .line 469
    .line 470
    iget-object v8, p0, Ll/tc0;->E1:Lcom/immomo/mediacore/sink/CongressUtil;

    .line 471
    .line 472
    invoke-direct/range {v3 .. v8}, Ll/sti0;-><init>(JIILcom/immomo/mediacore/sink/CongressUtil;)V

    .line 473
    .line 474
    .line 475
    iget-object v0, p0, Ll/tc0;->a1:Ll/fbl0;

    .line 476
    .line 477
    if-eqz v0, :cond_a

    .line 478
    .line 479
    iget-boolean v0, p0, Ll/tc0;->w1:Z

    .line 480
    .line 481
    if-nez v0, :cond_a

    .line 482
    .line 483
    iget-boolean v0, p0, Ll/tc0;->v1:Z

    .line 484
    .line 485
    if-nez v0, :cond_a

    .line 486
    .line 487
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 488
    .line 489
    .line 490
    move-result-object v0

    .line 491
    new-instance v2, Ljava/lang/StringBuilder;

    .line 492
    .line 493
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 494
    .line 495
    .line 496
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 497
    .line 498
    .line 499
    move-result-object v6

    .line 500
    invoke-virtual {v6}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 501
    .line 502
    .line 503
    move-result-object v6

    .line 504
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 505
    .line 506
    .line 507
    const-string v6, "----onVideoChannelAddedExt: userID="

    .line 508
    .line 509
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 510
    .line 511
    .line 512
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 513
    .line 514
    .line 515
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 516
    .line 517
    .line 518
    move-result-object p1

    .line 519
    invoke-virtual {v0, v1, p1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 520
    .line 521
    .line 522
    move-object v6, v3

    .line 523
    iget-object v3, p0, Ll/tc0;->a1:Ll/fbl0;

    .line 524
    .line 525
    iget v7, p0, Ll/wej;->width:I

    .line 526
    .line 527
    iget v8, p0, Ll/wej;->height:I

    .line 528
    .line 529
    invoke-interface/range {v3 .. v8}, Ll/fbl0;->a(JLl/sti0;II)V

    .line 530
    .line 531
    .line 532
    :cond_a
    return-void
.end method


# virtual methods
.method public A()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    const-string v1, "stopRecordWithNotLeaveRoom"

    .line 4
    .line 5
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const-string v1, "AgoraPushFilter stopRecord"

    .line 17
    .line 18
    const-string v2, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 19
    .line 20
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    iput-boolean v0, p0, Ll/tc0;->X:Z

    .line 25
    .line 26
    iget-object v1, p0, Ll/tc0;->K0:Ll/dc1;

    .line 27
    .line 28
    const/4 v3, 0x0

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    invoke-virtual {v1}, Ll/dc1;->f()V

    .line 32
    .line 33
    .line 34
    iput-object v3, p0, Ll/tc0;->K0:Ll/dc1;

    .line 35
    .line 36
    :cond_0
    iput v0, p0, Ll/tc0;->X0:I

    .line 37
    .line 38
    invoke-super {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->A()V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/tc0;->c2:Ll/tc0$l;

    .line 42
    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    invoke-virtual {v0}, Ll/tc0$l;->a()V

    .line 46
    .line 47
    .line 48
    iput-object v3, p0, Ll/tc0;->c2:Ll/tc0$l;

    .line 49
    .line 50
    :cond_1
    invoke-virtual {p0}, Ll/tc0;->stopSurroundMusic()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ll/tc0;->q2()V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->K:Ll/l6m;

    .line 57
    .line 58
    if-eqz v0, :cond_2

    .line 59
    .line 60
    check-cast v0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 61
    .line 62
    iget-object v1, p0, Ll/tc0;->o1:Ll/ror;

    .line 63
    .line 64
    iget v4, v1, Ll/tow;->P:I

    .line 65
    .line 66
    iget v1, v1, Ll/tow;->R:I

    .line 67
    .line 68
    const-string v5, "Momo"

    .line 69
    .line 70
    const/16 v6, 0x800

    .line 71
    .line 72
    invoke-virtual {v0, v6, v4, v1, v5}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->I2(IIILjava/lang/String;)V

    .line 73
    .line 74
    .line 75
    :cond_2
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->K:Ll/l6m;

    .line 76
    .line 77
    if-eqz v0, :cond_3

    .line 78
    .line 79
    invoke-interface {v0, v3}, Ll/l6m;->G1(Ll/gb1;)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->K:Ll/l6m;

    .line 83
    .line 84
    invoke-interface {v0, v3}, Ll/l6m;->V(Ll/hb1;)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->K:Ll/l6m;

    .line 88
    .line 89
    invoke-interface {v0, v3}, Ll/l6m;->R(Ll/fb1;)V

    .line 90
    .line 91
    .line 92
    iput-object v3, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->K:Ll/l6m;

    .line 93
    .line 94
    :cond_3
    invoke-super {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->p2()V

    .line 95
    .line 96
    .line 97
    invoke-static {}, Ll/yt0;->g()Ll/yt0;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    sget v1, Ll/yt0;->f:I

    .line 102
    .line 103
    invoke-virtual {v0, v1}, Ll/yt0;->q(I)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Ll/tc0;->S0:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 107
    .line 108
    if-eqz v0, :cond_4

    .line 109
    .line 110
    invoke-virtual {v0}, Ljava/util/AbstractMap;->isEmpty()Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-nez v0, :cond_4

    .line 115
    .line 116
    new-instance v0, Ljava/lang/StringBuilder;

    .line 117
    .line 118
    const-string v1, "stopRecord memberInfoMap "

    .line 119
    .line 120
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    iget-object v1, p0, Ll/tc0;->S0:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 124
    .line 125
    invoke-virtual {v1}, Ljava/util/AbstractMap;->size()I

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    const-string v1, "zhengjijian"

    .line 137
    .line 138
    invoke-static {v1, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    .line 140
    .line 141
    iget-object v0, p0, Ll/tc0;->S0:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 142
    .line 143
    invoke-virtual {v0}, Ljava/util/AbstractMap;->clear()V

    .line 144
    .line 145
    .line 146
    :cond_4
    iget-object v0, p0, Ll/tc0;->R0:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 147
    .line 148
    if-eqz v0, :cond_5

    .line 149
    .line 150
    invoke-virtual {v0}, Ljava/util/AbstractMap;->isEmpty()Z

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    if-nez v0, :cond_5

    .line 155
    .line 156
    iget-object p0, p0, Ll/tc0;->R0:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 157
    .line 158
    invoke-virtual {p0}, Ljava/util/AbstractMap;->clear()V

    .line 159
    .line 160
    .line 161
    :cond_5
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    const-string v0, "stopRecordOK!!!!!!!!!!!!!!!!!!!!"

    .line 166
    .line 167
    invoke-virtual {p0, v2, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    return-void
.end method

.method public A0()I
    .locals 1

    .line 1
    iget-object p0, p0, Ll/tc0;->o1:Ll/ror;

    .line 2
    .line 3
    iget v0, p0, Ll/tow;->k:I

    .line 4
    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    iget p0, p0, Ll/tow;->l:I

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    iget p0, p0, Ll/tow;->t:I

    .line 11
    .line 12
    return p0
.end method

.method public A5(Lcom/immomo/mediacore/coninf/MRtcExitRoomHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tc0;->H2:Lcom/immomo/mediacore/coninf/MRtcExitRoomHandler;

    .line 2
    .line 3
    return-void
.end method

.method public A7(Ljava/lang/String;Z)V
    .locals 29

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    const-string v2, "pkmu"

    .line 6
    .line 7
    const-string v3, "renderMode"

    .line 8
    .line 9
    const-string v4, "alpha"

    .line 10
    .line 11
    const-string v5, "z"

    .line 12
    .line 13
    const-string v6, "y"

    .line 14
    .line 15
    const-string v7, "x"

    .line 16
    .line 17
    const-string v8, "id"

    .line 18
    .line 19
    const-string v9, "has"

    .line 20
    .line 21
    const-string v10, "conf"

    .line 22
    .line 23
    const-string v11, "mid"

    .line 24
    .line 25
    iget-object v12, v1, Ll/tc0;->o1:Ll/ror;

    .line 26
    .line 27
    if-eqz v12, :cond_17

    .line 28
    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    goto/16 :goto_e

    .line 32
    .line 33
    :cond_0
    iget-object v12, v1, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 34
    .line 35
    if-nez v12, :cond_1

    .line 36
    .line 37
    new-instance v12, Lio/agora/rtc2/live/LiveTranscoding;

    .line 38
    .line 39
    invoke-direct {v12}, Lio/agora/rtc2/live/LiveTranscoding;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object v12, v1, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 43
    .line 44
    :cond_1
    iget-object v12, v1, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 45
    .line 46
    const/4 v13, 0x0

    .line 47
    iput v13, v12, Lio/agora/rtc2/live/LiveTranscoding;->backgroundColor:I

    .line 48
    .line 49
    iget-object v14, v1, Ll/tc0;->o1:Ll/ror;

    .line 50
    .line 51
    iget v15, v14, Ll/tow;->k:I

    .line 52
    .line 53
    iput v15, v12, Lio/agora/rtc2/live/LiveTranscoding;->width:I

    .line 54
    .line 55
    iget v14, v14, Ll/tow;->l:I

    .line 56
    .line 57
    iput v14, v12, Lio/agora/rtc2/live/LiveTranscoding;->height:I

    .line 58
    .line 59
    const/16 v13, 0xf

    .line 60
    .line 61
    iput v13, v12, Lio/agora/rtc2/live/LiveTranscoding;->videoGop:I

    .line 62
    .line 63
    if-lez v15, :cond_17

    .line 64
    .line 65
    if-gtz v14, :cond_2

    .line 66
    .line 67
    goto/16 :goto_e

    .line 68
    .line 69
    :cond_2
    iget-object v12, v1, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 70
    .line 71
    new-instance v13, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    const-string v14, "w:"

    .line 74
    .line 75
    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iget-object v14, v1, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 79
    .line 80
    iget v14, v14, Lio/agora/rtc2/live/LiveTranscoding;->width:I

    .line 81
    .line 82
    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v13

    .line 89
    new-instance v14, Ljava/lang/StringBuilder;

    .line 90
    .line 91
    const-string v15, "h:"

    .line 92
    .line 93
    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    iget-object v15, v1, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 97
    .line 98
    iget v15, v15, Lio/agora/rtc2/live/LiveTranscoding;->height:I

    .line 99
    .line 100
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v14

    .line 107
    const-string v15, "setJsonForWindowPostion publishConfig"

    .line 108
    .line 109
    filled-new-array {v15, v13, v14}, [Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v13

    .line 113
    invoke-virtual {v12, v13}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 114
    .line 115
    .line 116
    :try_start_0
    new-instance v12, Lorg/json/JSONObject;

    .line 117
    .line 118
    invoke-direct {v12, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v12, v11}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 122
    .line 123
    .line 124
    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 125
    const-string v13, ""

    .line 126
    .line 127
    if-eqz v0, :cond_3

    .line 128
    .line 129
    :try_start_1
    invoke-virtual {v12, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    goto :goto_0

    .line 134
    :cond_3
    move-object v0, v13

    .line 135
    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 136
    .line 137
    .line 138
    move-result v11

    .line 139
    if-eqz v11, :cond_4

    .line 140
    .line 141
    goto/16 :goto_e

    .line 142
    .line 143
    :cond_4
    iget-object v11, v1, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 144
    .line 145
    const/4 v14, 0x0

    .line 146
    invoke-virtual {v11, v14}, Lio/agora/rtc2/live/LiveTranscoding;->setUsers(Ljava/util/ArrayList;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v12, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 150
    .line 151
    .line 152
    move-result v11

    .line 153
    const/4 v14, 0x1

    .line 154
    if-nez v11, :cond_7

    .line 155
    .line 156
    invoke-virtual {v12, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 157
    .line 158
    .line 159
    move-result v10

    .line 160
    if-nez v10, :cond_5

    .line 161
    .line 162
    goto/16 :goto_e

    .line 163
    .line 164
    :cond_5
    invoke-virtual {v12, v9}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 165
    .line 166
    .line 167
    move-result-object v9

    .line 168
    if-eqz v9, :cond_6

    .line 169
    .line 170
    new-instance v10, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;

    .line 171
    .line 172
    invoke-direct {v10}, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;-><init>()V

    .line 173
    .line 174
    .line 175
    iput v14, v10, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->zOrder:I

    .line 176
    .line 177
    const/high16 v11, 0x3f800000    # 1.0f

    .line 178
    .line 179
    iput v11, v10, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->alpha:F

    .line 180
    .line 181
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 182
    .line 183
    .line 184
    move-result v0

    .line 185
    iput v0, v10, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->uid:I

    .line 186
    .line 187
    iget-object v0, v1, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 188
    .line 189
    iget v11, v0, Lio/agora/rtc2/live/LiveTranscoding;->width:I

    .line 190
    .line 191
    int-to-float v12, v11

    .line 192
    const v15, 0x3cbac711    # 0.0228f

    .line 193
    .line 194
    .line 195
    mul-float/2addr v12, v15

    .line 196
    float-to-int v12, v12

    .line 197
    iput v12, v10, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->x:I

    .line 198
    .line 199
    iget v12, v0, Lio/agora/rtc2/live/LiveTranscoding;->height:I

    .line 200
    .line 201
    const/4 v15, 0x0

    .line 202
    iput v15, v10, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->y:I

    .line 203
    .line 204
    int-to-float v11, v11

    .line 205
    const v16, 0x3e85d639    # 0.2614f

    .line 206
    .line 207
    .line 208
    mul-float v11, v11, v16

    .line 209
    .line 210
    float-to-int v11, v11

    .line 211
    iput v11, v10, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->width:I

    .line 212
    .line 213
    int-to-float v11, v12

    .line 214
    const v12, 0x3e80053e    # 0.25004f

    .line 215
    .line 216
    .line 217
    mul-float/2addr v11, v12

    .line 218
    float-to-int v11, v11

    .line 219
    iput v11, v10, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->height:I

    .line 220
    .line 221
    invoke-virtual {v0, v10}, Lio/agora/rtc2/live/LiveTranscoding;->addUser(Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;)I

    .line 222
    .line 223
    .line 224
    iget-object v0, v1, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 225
    .line 226
    iget-object v10, v1, Ll/tc0;->B1:Ljava/lang/String;

    .line 227
    .line 228
    invoke-direct {v1, v10}, Ll/tc0;->v6(Ljava/lang/String;)Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object v10

    .line 232
    iput-object v10, v0, Lio/agora/rtc2/live/LiveTranscoding;->userConfigExtraInfo:Ljava/lang/String;

    .line 233
    .line 234
    goto :goto_1

    .line 235
    :cond_6
    const/4 v15, 0x0

    .line 236
    goto :goto_1

    .line 237
    :cond_7
    const/4 v15, 0x0

    .line 238
    invoke-virtual {v12, v10}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 239
    .line 240
    .line 241
    move-result-object v9

    .line 242
    :goto_1
    if-nez v9, :cond_8

    .line 243
    .line 244
    goto/16 :goto_e

    .line 245
    .line 246
    :cond_8
    move v0, v15

    .line 247
    :goto_2
    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    .line 248
    .line 249
    .line 250
    move-result v10
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 251
    const/4 v11, 0x2

    .line 252
    const-string v12, "h"

    .line 253
    .line 254
    move/from16 p1, v14

    .line 255
    .line 256
    const-string v14, "w"

    .line 257
    .line 258
    if-ge v0, v10, :cond_12

    .line 259
    .line 260
    :try_start_2
    invoke-virtual {v9, v0}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    .line 261
    .line 262
    .line 263
    move-result-object v10

    .line 264
    check-cast v10, Lorg/json/JSONObject;

    .line 265
    .line 266
    if-eqz v10, :cond_9

    .line 267
    .line 268
    invoke-virtual {v10, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 269
    .line 270
    .line 271
    move-result v16

    .line 272
    if-eqz v16, :cond_9

    .line 273
    .line 274
    invoke-virtual {v10, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object v16

    .line 278
    goto :goto_3

    .line 279
    :cond_9
    move-object/from16 v16, v13

    .line 280
    .line 281
    :goto_3
    const-wide/16 v17, 0x0

    .line 282
    .line 283
    if-eqz v10, :cond_a

    .line 284
    .line 285
    invoke-virtual {v10, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 286
    .line 287
    .line 288
    move-result v19

    .line 289
    if-eqz v19, :cond_a

    .line 290
    .line 291
    invoke-virtual {v10, v7}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 292
    .line 293
    .line 294
    move-result-wide v19

    .line 295
    goto :goto_4

    .line 296
    :cond_a
    move-wide/from16 v19, v17

    .line 297
    .line 298
    :goto_4
    if-eqz v10, :cond_b

    .line 299
    .line 300
    invoke-virtual {v10, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 301
    .line 302
    .line 303
    move-result v21

    .line 304
    if-eqz v21, :cond_b

    .line 305
    .line 306
    invoke-virtual {v10, v6}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 307
    .line 308
    .line 309
    move-result-wide v17

    .line 310
    :cond_b
    const-wide/high16 v21, 0x3ff0000000000000L    # 1.0

    .line 311
    .line 312
    if-eqz v10, :cond_c

    .line 313
    .line 314
    invoke-virtual {v10, v14}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 315
    .line 316
    .line 317
    move-result v23

    .line 318
    if-eqz v23, :cond_c

    .line 319
    .line 320
    invoke-virtual {v10, v14}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 321
    .line 322
    .line 323
    move-result-wide v23

    .line 324
    goto :goto_5

    .line 325
    :cond_c
    move-wide/from16 v23, v21

    .line 326
    .line 327
    :goto_5
    if-eqz v10, :cond_d

    .line 328
    .line 329
    invoke-virtual {v10, v12}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 330
    .line 331
    .line 332
    move-result v14

    .line 333
    if-eqz v14, :cond_d

    .line 334
    .line 335
    invoke-virtual {v10, v12}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 336
    .line 337
    .line 338
    move-result-wide v25

    .line 339
    goto :goto_6

    .line 340
    :cond_d
    move-wide/from16 v25, v21

    .line 341
    .line 342
    :goto_6
    if-eqz v10, :cond_e

    .line 343
    .line 344
    invoke-virtual {v10, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 345
    .line 346
    .line 347
    move-result v12

    .line 348
    if-eqz v12, :cond_e

    .line 349
    .line 350
    invoke-virtual {v10, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 351
    .line 352
    .line 353
    move-result v12

    .line 354
    add-int/lit8 v12, v12, 0x1

    .line 355
    .line 356
    goto :goto_7

    .line 357
    :cond_e
    move/from16 v12, p1

    .line 358
    .line 359
    :goto_7
    if-eqz v10, :cond_f

    .line 360
    .line 361
    invoke-virtual {v10, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 362
    .line 363
    .line 364
    move-result v14

    .line 365
    if-eqz v14, :cond_f

    .line 366
    .line 367
    invoke-virtual {v10, v4}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 368
    .line 369
    .line 370
    move-result-wide v21

    .line 371
    :cond_f
    move-wide/from16 v27, v21

    .line 372
    .line 373
    if-eqz v10, :cond_10

    .line 374
    .line 375
    invoke-virtual {v10, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 376
    .line 377
    .line 378
    move-result v14

    .line 379
    if-eqz v14, :cond_10

    .line 380
    .line 381
    invoke-virtual {v10, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 382
    .line 383
    .line 384
    :cond_10
    if-eqz v10, :cond_11

    .line 385
    .line 386
    invoke-virtual {v10, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 387
    .line 388
    .line 389
    move-result v14

    .line 390
    if-eqz v14, :cond_11

    .line 391
    .line 392
    invoke-virtual {v10, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 393
    .line 394
    .line 395
    move-result v10

    .line 396
    if-ne v10, v11, :cond_11

    .line 397
    .line 398
    const/16 v10, 0xff

    .line 399
    .line 400
    goto :goto_8

    .line 401
    :cond_11
    move v10, v15

    .line 402
    :goto_8
    new-instance v11, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;

    .line 403
    .line 404
    invoke-direct {v11}, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;-><init>()V

    .line 405
    .line 406
    .line 407
    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 408
    .line 409
    .line 410
    move-result v14

    .line 411
    iput v14, v11, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->uid:I

    .line 412
    .line 413
    iput v12, v11, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->zOrder:I

    .line 414
    .line 415
    iget-object v12, v1, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 416
    .line 417
    iget v14, v12, Lio/agora/rtc2/live/LiveTranscoding;->width:I

    .line 418
    .line 419
    move-object/from16 v16, v2

    .line 420
    .line 421
    move-object/from16 v21, v3

    .line 422
    .line 423
    int-to-double v2, v14

    .line 424
    mul-double v2, v2, v19

    .line 425
    .line 426
    double-to-int v2, v2

    .line 427
    iput v2, v11, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->x:I

    .line 428
    .line 429
    iget v2, v12, Lio/agora/rtc2/live/LiveTranscoding;->height:I

    .line 430
    .line 431
    move-object/from16 v19, v4

    .line 432
    .line 433
    int-to-double v3, v2

    .line 434
    mul-double v3, v3, v17

    .line 435
    .line 436
    double-to-int v3, v3

    .line 437
    iput v3, v11, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->y:I

    .line 438
    .line 439
    int-to-double v3, v14

    .line 440
    mul-double v3, v3, v23

    .line 441
    .line 442
    double-to-int v3, v3

    .line 443
    iput v3, v11, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->width:I

    .line 444
    .line 445
    int-to-double v2, v2

    .line 446
    mul-double v2, v2, v25

    .line 447
    .line 448
    double-to-int v2, v2

    .line 449
    iput v2, v11, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->height:I

    .line 450
    .line 451
    move-wide/from16 v2, v27

    .line 452
    .line 453
    double-to-float v2, v2

    .line 454
    iput v2, v11, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->alpha:F

    .line 455
    .line 456
    iput v10, v11, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->audioChannel:I

    .line 457
    .line 458
    invoke-virtual {v12, v11}, Lio/agora/rtc2/live/LiveTranscoding;->addUser(Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 459
    .line 460
    .line 461
    add-int/lit8 v0, v0, 0x1

    .line 462
    .line 463
    move/from16 v14, p1

    .line 464
    .line 465
    move-object/from16 v2, v16

    .line 466
    .line 467
    move-object/from16 v4, v19

    .line 468
    .line 469
    move-object/from16 v3, v21

    .line 470
    .line 471
    goto/16 :goto_2

    .line 472
    .line 473
    :cond_12
    iget-object v0, v1, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 474
    .line 475
    iget-object v2, v1, Ll/tc0;->B1:Ljava/lang/String;

    .line 476
    .line 477
    invoke-direct {v1, v2}, Ll/tc0;->v6(Ljava/lang/String;)Ljava/lang/String;

    .line 478
    .line 479
    .line 480
    move-result-object v2

    .line 481
    iput-object v2, v0, Lio/agora/rtc2/live/LiveTranscoding;->userConfigExtraInfo:Ljava/lang/String;

    .line 482
    .line 483
    iget-boolean v0, v1, Ll/tc0;->v3:Z

    .line 484
    .line 485
    if-eqz v0, :cond_16

    .line 486
    .line 487
    iget-object v0, v1, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 488
    .line 489
    iget-boolean v0, v0, Ll/wvx;->b:Z

    .line 490
    .line 491
    if-eqz v0, :cond_17

    .line 492
    .line 493
    iget-object v0, v1, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->R:Ll/brx;

    .line 494
    .line 495
    if-eqz v0, :cond_17

    .line 496
    .line 497
    if-eqz p2, :cond_17

    .line 498
    .line 499
    new-instance v0, Ljava/lang/StringBuilder;

    .line 500
    .line 501
    invoke-direct {v0, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 502
    .line 503
    .line 504
    iget-object v2, v1, Ll/tc0;->B1:Ljava/lang/String;

    .line 505
    .line 506
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 507
    .line 508
    .line 509
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 510
    .line 511
    .line 512
    move-result-object v2

    .line 513
    :try_start_3
    new-instance v0, Lorg/json/JSONObject;

    .line 514
    .line 515
    invoke-direct {v0, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 516
    .line 517
    .line 518
    new-instance v3, Lorg/json/JSONObject;

    .line 519
    .line 520
    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 521
    .line 522
    .line 523
    const-string v4, "asr"

    .line 524
    .line 525
    const v5, 0xac44

    .line 526
    .line 527
    .line 528
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 529
    .line 530
    .line 531
    iget-object v4, v1, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 532
    .line 533
    iget v4, v4, Lio/agora/rtc2/live/LiveTranscoding;->audioBitrate:I

    .line 534
    .line 535
    const/16 v5, 0x3e8

    .line 536
    .line 537
    if-ge v4, v5, :cond_13

    .line 538
    .line 539
    mul-int/lit16 v4, v4, 0x3e8

    .line 540
    .line 541
    :cond_13
    const-string v5, "abr"

    .line 542
    .line 543
    invoke-virtual {v3, v5, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 544
    .line 545
    .line 546
    const-string v4, "achl"

    .line 547
    .line 548
    iget-object v5, v1, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 549
    .line 550
    iget v5, v5, Lio/agora/rtc2/live/LiveTranscoding;->audioChannels:I

    .line 551
    .line 552
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 553
    .line 554
    .line 555
    const-string v4, "acpf"

    .line 556
    .line 557
    iget-object v5, v1, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 558
    .line 559
    iget-object v5, v5, Lio/agora/rtc2/live/LiveTranscoding;->audioCodecProfile:Lio/agora/rtc2/live/LiveTranscoding$AudioCodecProfileType;

    .line 560
    .line 561
    invoke-static {v5}, Lio/agora/rtc2/live/LiveTranscoding$AudioCodecProfileType;->getValue(Lio/agora/rtc2/live/LiveTranscoding$AudioCodecProfileType;)I

    .line 562
    .line 563
    .line 564
    move-result v5

    .line 565
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 566
    .line 567
    .line 568
    iget-object v4, v1, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 569
    .line 570
    iget v4, v4, Ll/tow;->k:I

    .line 571
    .line 572
    invoke-virtual {v3, v14, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 573
    .line 574
    .line 575
    iget-object v4, v1, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 576
    .line 577
    iget v4, v4, Ll/tow;->l:I

    .line 578
    .line 579
    invoke-virtual {v3, v12, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 580
    .line 581
    .line 582
    const-string v4, "gop"

    .line 583
    .line 584
    iget-object v5, v1, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 585
    .line 586
    iget v5, v5, Ll/tow;->G:I

    .line 587
    .line 588
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 589
    .line 590
    .line 591
    const-string v4, "fps"

    .line 592
    .line 593
    iget-object v5, v1, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 594
    .line 595
    iget v5, v5, Ll/tow;->F:I

    .line 596
    .line 597
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 598
    .line 599
    .line 600
    const-string v4, "vbr"

    .line 601
    .line 602
    iget-object v5, v1, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 603
    .line 604
    iget v5, v5, Ll/tow;->H:I

    .line 605
    .line 606
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 607
    .line 608
    .line 609
    const-string v4, "vcpf"

    .line 610
    .line 611
    iget-object v5, v1, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 612
    .line 613
    iget-boolean v5, v5, Ll/uow;->H0:Z

    .line 614
    .line 615
    if-eqz v5, :cond_14

    .line 616
    .line 617
    goto :goto_9

    .line 618
    :cond_14
    move/from16 v11, p1

    .line 619
    .line 620
    :goto_9
    invoke-virtual {v3, v4, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 621
    .line 622
    .line 623
    const-string v4, "mixInfo"

    .line 624
    .line 625
    invoke-virtual {v0, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 626
    .line 627
    .line 628
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 629
    .line 630
    .line 631
    move-result-object v2
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 632
    :goto_a
    move-object v11, v2

    .line 633
    goto :goto_b

    .line 634
    :catch_0
    move-exception v0

    .line 635
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 636
    .line 637
    .line 638
    goto :goto_a

    .line 639
    :goto_b
    invoke-static {}, Ll/arx;->d()Ll/arx;

    .line 640
    .line 641
    .line 642
    move-result-object v0

    .line 643
    iget-object v2, v1, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->R:Ll/brx;

    .line 644
    .line 645
    invoke-virtual {v2}, Ll/brx;->b()Ljava/lang/String;

    .line 646
    .line 647
    .line 648
    move-result-object v2

    .line 649
    invoke-virtual {v0, v2}, Ll/arx;->h(Ljava/lang/String;)Ll/arx$d;

    .line 650
    .line 651
    .line 652
    move-result-object v0

    .line 653
    iget v2, v1, Ll/tc0;->q3:I

    .line 654
    .line 655
    add-int/lit8 v2, v2, 0x1

    .line 656
    .line 657
    iput v2, v1, Ll/tc0;->q3:I

    .line 658
    .line 659
    iget-object v2, v1, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 660
    .line 661
    new-instance v3, Ljava/lang/StringBuilder;

    .line 662
    .line 663
    const-string v4, "server mix update uid:"

    .line 664
    .line 665
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 666
    .line 667
    .line 668
    iget-object v4, v1, Ll/tc0;->o1:Ll/ror;

    .line 669
    .line 670
    iget v4, v4, Ll/uow;->B0:I

    .line 671
    .line 672
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 673
    .line 674
    .line 675
    const-string v4, ",momoid:"

    .line 676
    .line 677
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 678
    .line 679
    .line 680
    iget-object v4, v0, Ll/arx$d;->c:Ljava/lang/String;

    .line 681
    .line 682
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 683
    .line 684
    .line 685
    const-string v4, "roomid:"

    .line 686
    .line 687
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 688
    .line 689
    .line 690
    iget-object v4, v1, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->R:Ll/brx;

    .line 691
    .line 692
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 693
    .line 694
    .line 695
    iget-object v3, v1, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->R:Ll/brx;

    .line 696
    .line 697
    invoke-virtual {v3}, Ll/brx;->h()Ljava/lang/String;

    .line 698
    .line 699
    .line 700
    move-result-object v3

    .line 701
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 702
    .line 703
    .line 704
    move-result-object v3

    .line 705
    invoke-virtual {v2, v3}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 706
    .line 707
    .line 708
    invoke-static {}, Lcom/momo/piplineext/http/HttpWrapper;->getInstance()Lcom/momo/piplineext/http/HttpWrapper;

    .line 709
    .line 710
    .line 711
    move-result-object v3

    .line 712
    iget-object v4, v0, Ll/arx$d;->a:Ljava/lang/String;

    .line 713
    .line 714
    iget-object v5, v0, Ll/arx$d;->b:Ljava/lang/String;

    .line 715
    .line 716
    iget-object v2, v1, Ll/tc0;->o1:Ll/ror;

    .line 717
    .line 718
    iget v6, v2, Ll/uow;->B0:I

    .line 719
    .line 720
    iget-object v7, v0, Ll/arx$d;->c:Ljava/lang/String;

    .line 721
    .line 722
    iget-object v0, v1, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->R:Ll/brx;

    .line 723
    .line 724
    if-eqz v0, :cond_15

    .line 725
    .line 726
    invoke-virtual {v0}, Ll/brx;->h()Ljava/lang/String;

    .line 727
    .line 728
    .line 729
    move-result-object v0

    .line 730
    :goto_c
    move-object v8, v0

    .line 731
    goto :goto_d

    .line 732
    :cond_15
    iget-object v0, v2, Ll/ror;->g1:Ljava/lang/String;

    .line 733
    .line 734
    goto :goto_c

    .line 735
    :goto_d
    iget-object v0, v1, Ll/tc0;->o1:Ll/ror;

    .line 736
    .line 737
    iget-object v9, v0, Ll/ror;->g1:Ljava/lang/String;

    .line 738
    .line 739
    iget-object v0, v1, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 740
    .line 741
    iget-object v10, v0, Ll/wvx;->A0:Ljava/lang/String;

    .line 742
    .line 743
    iget-object v1, v1, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 744
    .line 745
    iget-object v13, v1, Ll/uow;->v0:Ljava/lang/String;

    .line 746
    .line 747
    iget-wide v0, v0, Ll/wvx;->s:J

    .line 748
    .line 749
    long-to-int v14, v0

    .line 750
    const-string v12, "agora"

    .line 751
    .line 752
    invoke-virtual/range {v3 .. v14}, Lcom/momo/piplineext/http/HttpWrapper;->updateChannel(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 753
    .line 754
    .line 755
    return-void

    .line 756
    :cond_16
    iget-object v0, v1, Ll/tc0;->o1:Ll/ror;

    .line 757
    .line 758
    iget-object v0, v0, Ll/uow;->v0:Ljava/lang/String;

    .line 759
    .line 760
    invoke-direct {v1, v0}, Ll/tc0;->U5(Ljava/lang/String;)V

    .line 761
    .line 762
    .line 763
    return-void

    .line 764
    :catch_1
    move-exception v0

    .line 765
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 766
    .line 767
    .line 768
    :cond_17
    :goto_e
    return-void
.end method

.method public B5(Ll/upw;)V
    .locals 0

    .line 1
    return-void
.end method

.method public B7(F)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v1, p1, v0

    .line 3
    .line 4
    if-gtz v1, :cond_0

    .line 5
    .line 6
    move p1, v0

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 8
    .line 9
    const-string v1, "agora setMasterAudioLevel"

    .line 10
    .line 11
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    const v0, 0x3fa66666    # 1.3f

    .line 23
    .line 24
    .line 25
    mul-float/2addr v0, p1

    .line 26
    iput v0, p0, Ll/tc0;->h1:F

    .line 27
    .line 28
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 29
    .line 30
    iput v0, v1, Ll/wvx;->H0:F

    .line 31
    .line 32
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 33
    .line 34
    if-eqz p0, :cond_1

    .line 35
    .line 36
    const/high16 v0, 0x42c80000    # 100.0f

    .line 37
    .line 38
    mul-float/2addr p1, v0

    .line 39
    float-to-int p1, p1

    .line 40
    invoke-virtual {p0, p1}, Lio/agora/rtc2/RtcEngine;->adjustRecordingSignalVolume(I)I

    .line 41
    .line 42
    .line 43
    :cond_1
    return-void
.end method

.method public C0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tc0;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public C1(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "zk"

    .line 2
    .line 3
    const-string v1, "setMergeSei"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 9
    .line 10
    const-string v1, "agora setMergeSei"

    .line 11
    .line 12
    filled-new-array {v1, p1}, [Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/tc0;->t1:Ljava/lang/Object;

    .line 20
    .line 21
    monitor-enter v0

    .line 22
    :try_start_0
    iput-object p1, p0, Ll/tc0;->C1:Ljava/lang/String;

    .line 23
    .line 24
    iget-object v1, p0, Ll/tc0;->o1:Ll/ror;

    .line 25
    .line 26
    iget-boolean v1, v1, Ll/uow;->X0:Z

    .line 27
    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const/4 v1, 0x1

    .line 32
    invoke-virtual {p0, p1, v1}, Ll/tc0;->A7(Ljava/lang/String;Z)V

    .line 33
    .line 34
    .line 35
    :goto_0
    monitor-exit v0

    .line 36
    return-void

    .line 37
    :catchall_0
    move-exception p0

    .line 38
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    throw p0
.end method

.method public C5(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tc0;->P1:Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

    .line 2
    .line 3
    return-void
.end method

.method public C7(ZI)V
    .locals 0

    .line 1
    return-void
.end method

.method public D0()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    return-wide v0
.end method

.method public D1()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    iget-object p0, p0, Ll/wvx;->x:Ljava/lang/String;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const-string p0, ""

    .line 9
    .line 10
    return-object p0
.end method

.method public D5(Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tc0;->Q1:Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;

    .line 2
    .line 3
    return-void
.end method

.method public D6()V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "{ \"canvas\":{ \"w\":"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 9
    .line 10
    iget v1, v1, Lio/agora/rtc2/live/LiveTranscoding;->width:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, ",\"h\":"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 21
    .line 22
    iget v1, v1, Lio/agora/rtc2/live/LiveTranscoding;->height:I

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v1, ",\"conf\":{"

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v1, p0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 37
    .line 38
    invoke-virtual {v1}, Lio/agora/rtc2/live/LiveTranscoding;->getUsers()Ljava/util/ArrayList;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-eqz v2, :cond_0

    .line 51
    .line 52
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    check-cast v2, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;

    .line 57
    .line 58
    new-instance v3, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string v0, "{\"id\":"

    .line 67
    .line 68
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    iget v0, v2, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->uid:I

    .line 72
    .line 73
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    const-string v0, ",\"x\":"

    .line 77
    .line 78
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    iget v0, v2, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->x:I

    .line 82
    .line 83
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    const-string v0, ",\"y\":"

    .line 87
    .line 88
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    iget v0, v2, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->y:I

    .line 92
    .line 93
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    const-string v0, ",\"width\":"

    .line 97
    .line 98
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    iget v0, v2, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->width:I

    .line 102
    .line 103
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    const-string v0, ",\"height\":"

    .line 107
    .line 108
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    iget v0, v2, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->height:I

    .line 112
    .line 113
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    const-string v0, "},"

    .line 117
    .line 118
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    goto :goto_0

    .line 126
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 127
    .line 128
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 129
    .line 130
    .line 131
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    const-string v0, "extraInfo:"

    .line 135
    .line 136
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    iget-object v0, p0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 140
    .line 141
    iget-object v0, v0, Lio/agora/rtc2/live/LiveTranscoding;->userConfigExtraInfo:Ljava/lang/String;

    .line 142
    .line 143
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    const-string v1, "}"

    .line 151
    .line 152
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 157
    .line 158
    const-string v1, "updateTranscoding"

    .line 159
    .line 160
    filled-new-array {v1, v0}, [Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-virtual {p0, v0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 165
    .line 166
    .line 167
    return-void
.end method

.method public D7(Lcom/immomo/mediacore/audio/pcmDataAvailableCallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tc0;->F1:Lcom/immomo/mediacore/audio/pcmDataAvailableCallback;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    invoke-virtual {p0, p1}, Ll/tc0;->W6(Z)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const/4 p1, 0x0

    .line 11
    invoke-virtual {p0, p1}, Ll/tc0;->W6(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public E0(Ll/wzl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->F:Ll/wzl;

    .line 2
    .line 3
    return-void
.end method

.method public E5(Ll/vpw;)V
    .locals 0

    .line 1
    return-void
.end method

.method public E6(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lio/agora/rtc2/RtcEngine;->muteAllRemoteAudioStreams(Z)I

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public E7(I)I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    const-string v1, "setRemoteDefaultVideoStreamType"

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 21
    .line 22
    int-to-long v1, p1

    .line 23
    iput-wide v1, p0, Ll/wvx;->n0:J

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Lio/agora/rtc2/RtcEngine;->setRemoteDefaultVideoStreamType(I)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0

    .line 30
    :cond_0
    const/4 p0, -0x1

    .line 31
    return p0
.end method

.method public F()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/tc0;->f1:Z

    .line 2
    .line 3
    return p0
.end method

.method public F0()I
    .locals 0

    .line 1
    iget p0, p0, Ll/tc0;->m1:I

    .line 2
    .line 3
    return p0
.end method

.method public F1()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/tc0;->O0:Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;->txBytes:I

    .line 6
    .line 7
    int-to-long v0, p0

    .line 8
    return-wide v0

    .line 9
    :cond_0
    const-wide/16 v0, 0x0

    .line 10
    .line 11
    return-wide v0
.end method

.method public F5(Lcom/immomo/mediacore/coninf/MRtcChannelHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tc0;->S1:Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

    .line 2
    .line 3
    return-void
.end method

.method public F6(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "mute:"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "muteAllRemoteVideoStream"

    .line 18
    .line 19
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 27
    .line 28
    if-eqz p0, :cond_0

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Lio/agora/rtc2/RtcEngine;->muteAllRemoteVideoStreams(Z)I

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public F7(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    const-string v1, "setRole"

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iput p1, p0, Ll/tc0;->s1:I

    .line 17
    .line 18
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 19
    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lio/agora/rtc2/RtcEngine;->setClientRole(I)I

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public G0()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    return-wide v0
.end method

.method public G5(Lcom/immomo/mediacore/coninf/MRtcConnectHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tc0;->W1:Lcom/immomo/mediacore/coninf/MRtcConnectHandler;

    .line 2
    .line 3
    return-void
.end method

.method public G6(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    const-string v1, "agoraFilter muteLocalAudioStream"

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iput-boolean p1, p0, Ll/tc0;->n3:Z

    .line 17
    .line 18
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 19
    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lio/agora/rtc2/RtcEngine;->muteLocalAudioStream(Z)I

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public G7(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Ll/tc0;->W2:Z

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 4
    .line 5
    const-string v0, "setRoom24hMode:"

    .line 6
    .line 7
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    filled-new-array {v0, p1}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public H0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/tc0;->v1:Z

    .line 2
    .line 3
    return-void
.end method

.method public H5(Ll/wpw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tc0;->U1:Ll/wpw;

    .line 2
    .line 3
    return-void
.end method

.method public H6(Z)V
    .locals 3

    .line 1
    iput-boolean p1, p0, Ll/tc0;->n3:Z

    .line 2
    .line 3
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 4
    .line 5
    const-string v1, "muteLocalAudioStreamForEx"

    .line 6
    .line 7
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 19
    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lio/agora/rtc2/RtcEngine;->muteLocalAudioStream(Z)I

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public H7(IZ)V
    .locals 0

    .line 1
    iput p1, p0, Ll/tc0;->G1:I

    .line 2
    .line 3
    return-void
.end method

.method public I1()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/tc0;->f1:Z

    .line 3
    .line 4
    return-void
.end method

.method public I5(Lcom/immomo/mediacore/coninf/MRtcClientRoleChangedHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tc0;->X1:Lcom/immomo/mediacore/coninf/MRtcClientRoleChangedHandler;

    .line 2
    .line 3
    return-void
.end method

.method public I6(Z)V
    .locals 3

    .line 1
    iput-boolean p1, p0, Ll/tc0;->m3:Z

    .line 2
    .line 3
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 4
    .line 5
    const-string v1, "muteLocalVideoStream"

    .line 6
    .line 7
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 19
    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lio/agora/rtc2/RtcEngine;->muteLocalVideoStream(Z)I

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public I7(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/tc0;->p1:I

    .line 2
    .line 3
    return-void
.end method

.method public J(Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "zk"

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "setSei"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v2, p0, Ll/tc0;->C1:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    const-string v2, "Agora setSei:"

    .line 29
    .line 30
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/tc0;->t1:Ljava/lang/Object;

    .line 48
    .line 49
    monitor-enter v0

    .line 50
    :try_start_0
    iput-object p1, p0, Ll/tc0;->B1:Ljava/lang/String;

    .line 51
    .line 52
    iget-object v1, p0, Ll/tc0;->o1:Ll/ror;

    .line 53
    .line 54
    iget-boolean v1, v1, Ll/uow;->X0:Z

    .line 55
    .line 56
    if-eqz v1, :cond_0

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    iget-object v1, p0, Ll/tc0;->C1:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-eqz v1, :cond_1

    .line 66
    .line 67
    invoke-virtual {p0, p1}, Ll/tc0;->z7(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :catchall_0
    move-exception p0

    .line 72
    goto :goto_1

    .line 73
    :cond_1
    iget-object p1, p0, Ll/tc0;->C1:Ljava/lang/String;

    .line 74
    .line 75
    const/4 v1, 0x0

    .line 76
    invoke-virtual {p0, p1, v1}, Ll/tc0;->A7(Ljava/lang/String;Z)V

    .line 77
    .line 78
    .line 79
    :goto_0
    monitor-exit v0

    .line 80
    return-void

    .line 81
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 82
    throw p0
.end method

.method public J0()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    return-wide v0
.end method

.method public J5(Lcom/immomo/mediacore/coninf/MRtcPusherHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tc0;->B3:Lcom/immomo/mediacore/coninf/MRtcPusherHandler;

    .line 2
    .line 3
    return-void
.end method

.method public J6(JZ)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "uid:"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, ",mute:"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-string v2, "muteRemoteAudioStream"

    .line 26
    .line 27
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/tc0;->o1:Ll/ror;

    .line 35
    .line 36
    iget v0, v0, Ll/uow;->B0:I

    .line 37
    .line 38
    int-to-long v0, v0

    .line 39
    cmp-long v0, p1, v0

    .line 40
    .line 41
    if-nez v0, :cond_0

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 45
    .line 46
    if-eqz p0, :cond_1

    .line 47
    .line 48
    long-to-int p1, p1

    .line 49
    invoke-virtual {p0, p1, p3}, Lio/agora/rtc2/RtcEngine;->muteRemoteAudioStream(IZ)I

    .line 50
    .line 51
    .line 52
    :cond_1
    :goto_0
    return-void
.end method

.method public K1(Ll/oxd0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public K5(Lcom/immomo/mediacore/coninf/MRtcQualityHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tc0;->V1:Lcom/immomo/mediacore/coninf/MRtcQualityHandler;

    .line 2
    .line 3
    return-void
.end method

.method public K6(JZ)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "uid:"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, ",mute:"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-string v2, "muteRemoteVideoStream"

    .line 26
    .line 27
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/tc0;->o1:Ll/ror;

    .line 35
    .line 36
    iget v0, v0, Ll/uow;->B0:I

    .line 37
    .line 38
    int-to-long v0, v0

    .line 39
    cmp-long v0, p1, v0

    .line 40
    .line 41
    if-nez v0, :cond_0

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 45
    .line 46
    if-eqz p0, :cond_1

    .line 47
    .line 48
    long-to-int p1, p1

    .line 49
    invoke-virtual {p0, p1, p3}, Lio/agora/rtc2/RtcEngine;->muteRemoteVideoStream(IZ)I

    .line 50
    .line 51
    .line 52
    :cond_1
    :goto_0
    return-void
.end method

.method public K7(Ll/kod0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tc0;->I2:Ll/kod0;

    .line 2
    .line 3
    return-void
.end method

.method public L(Ll/dpl$a;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "setOnFrameAvailabelCallback :"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Ll/tc0;->d1:Ll/dpl$a;

    .line 25
    .line 26
    return-void
.end method

.method public L0()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    return-wide v0
.end method

.method public L1()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    return-wide v0
.end method

.method public L5(Lcom/immomo/mediacore/coninf/MRtcReceiveSeiHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tc0;->G2:Lcom/immomo/mediacore/coninf/MRtcReceiveSeiHandler;

    .line 2
    .line 3
    return-void
.end method

.method public L6(Z)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "--ktv,muteSingerAudioStream:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v1, p0, Ll/tc0;->g2:Z

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "-->"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "zk"

    .line 26
    .line 27
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 31
    .line 32
    const-string v1, "muteSingerAudioStream"

    .line 33
    .line 34
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    iput-boolean p1, p0, Ll/tc0;->g2:Z

    .line 46
    .line 47
    return-void
.end method

.method public L7(F)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v1, p1, v0

    .line 3
    .line 4
    if-gtz v1, :cond_0

    .line 5
    .line 6
    move p1, v0

    .line 7
    :cond_0
    const v0, 0x3f4ccccd    # 0.8f

    .line 8
    .line 9
    .line 10
    mul-float/2addr v0, p1

    .line 11
    iput v0, p0, Ll/tc0;->i1:F

    .line 12
    .line 13
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    const/high16 v0, 0x42c80000    # 100.0f

    .line 18
    .line 19
    mul-float/2addr p1, v0

    .line 20
    float-to-int p1, p1

    .line 21
    invoke-virtual {p0, p1}, Lio/agora/rtc2/RtcEngine;->adjustAudioMixingVolume(I)I

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public M0()I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    iget-wide v0, p0, Ll/wvx;->i:J

    .line 4
    .line 5
    long-to-int p0, v0

    .line 6
    return p0
.end method

.method public M1()V
    .locals 15

    .line 1
    iget-object v0, p0, Ll/tc0;->W:Landroid/opengl/EGLContext;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/tc0;->J0:Ll/g510;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/g510;->l()Landroid/opengl/EGLContext;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/tc0;->W:Landroid/opengl/EGLContext;

    .line 14
    .line 15
    :cond_0
    iget-boolean v0, p0, Ll/tc0;->T:Z

    .line 16
    .line 17
    if-eqz v0, :cond_5

    .line 18
    .line 19
    iget v0, p0, Ll/wej;->texture_in:I

    .line 20
    .line 21
    if-eqz v0, :cond_5

    .line 22
    .line 23
    iget-boolean v0, p0, Ll/tc0;->X:Z

    .line 24
    .line 25
    if-eqz v0, :cond_5

    .line 26
    .line 27
    iget-boolean v0, p0, Ll/tc0;->m3:Z

    .line 28
    .line 29
    if-nez v0, :cond_5

    .line 30
    .line 31
    iget-wide v0, p0, Ll/tc0;->k2:J

    .line 32
    .line 33
    const-wide/16 v2, 0x2

    .line 34
    .line 35
    cmp-long v0, v0, v2

    .line 36
    .line 37
    if-lez v0, :cond_3

    .line 38
    .line 39
    iget-object v0, p0, Ll/tc0;->o1:Ll/ror;

    .line 40
    .line 41
    iget v1, v0, Ll/tow;->m:I

    .line 42
    .line 43
    iget v2, v0, Ll/tow;->n:I

    .line 44
    .line 45
    iget-boolean v3, v0, Ll/uow;->F0:Z

    .line 46
    .line 47
    if-eqz v3, :cond_1

    .line 48
    .line 49
    invoke-virtual {v0}, Ll/uow;->d()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    const/4 v3, 0x1

    .line 54
    if-ne v0, v3, :cond_1

    .line 55
    .line 56
    iget-object v0, p0, Ll/tc0;->o1:Ll/ror;

    .line 57
    .line 58
    iget v1, v0, Ll/tow;->n:I

    .line 59
    .line 60
    iget v2, v0, Ll/tow;->m:I

    .line 61
    .line 62
    :cond_1
    move v5, v1

    .line 63
    move v6, v2

    .line 64
    invoke-virtual {p0}, Ll/tc0;->q6()J

    .line 65
    .line 66
    .line 67
    move-result-wide v9

    .line 68
    new-instance v3, Lio/agora/base/TextureBuffer;

    .line 69
    .line 70
    iget-object v4, p0, Ll/tc0;->W:Landroid/opengl/EGLContext;

    .line 71
    .line 72
    sget-object v7, Lio/agora/base/VideoFrame$TextureBuffer$Type;->RGB:Lio/agora/base/VideoFrame$TextureBuffer$Type;

    .line 73
    .line 74
    iget v8, p0, Ll/wej;->texture_in:I

    .line 75
    .line 76
    sget-object v0, Ll/tc0;->D3:[F

    .line 77
    .line 78
    invoke-static {v0}, Lcom/momo/piplineext/RendererCommon;->a([F)Landroid/graphics/Matrix;

    .line 79
    .line 80
    .line 81
    move-result-object v11

    .line 82
    const/4 v13, 0x0

    .line 83
    const/4 v14, 0x0

    .line 84
    const/4 v12, 0x0

    .line 85
    invoke-direct/range {v3 .. v14}, Lio/agora/base/TextureBuffer;-><init>(Landroid/opengl/EGLContext;IILio/agora/base/VideoFrame$TextureBuffer$Type;IJLandroid/graphics/Matrix;Landroid/os/Handler;Lio/agora/base/internal/video/YuvConverter;Ljava/lang/Runnable;)V

    .line 86
    .line 87
    .line 88
    new-instance v0, Lio/agora/base/VideoFrame;

    .line 89
    .line 90
    const/4 v1, 0x0

    .line 91
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 92
    .line 93
    .line 94
    move-result-wide v4

    .line 95
    invoke-direct {v0, v3, v1, v4, v5}, Lio/agora/base/VideoFrame;-><init>(Lio/agora/base/VideoFrame$Buffer;IJ)V

    .line 96
    .line 97
    .line 98
    iget-object v1, p0, Ll/tc0;->t1:Ljava/lang/Object;

    .line 99
    .line 100
    monitor-enter v1

    .line 101
    :try_start_0
    iget-object v2, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 102
    .line 103
    if-eqz v2, :cond_2

    .line 104
    .line 105
    iget-boolean v2, p0, Ll/tc0;->s3:Z

    .line 106
    .line 107
    if-nez v2, :cond_2

    .line 108
    .line 109
    iget-object v2, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 110
    .line 111
    invoke-virtual {v2, v0}, Lio/agora/rtc2/RtcEngine;->pushExternalVideoFrame(Lio/agora/base/VideoFrame;)Z

    .line 112
    .line 113
    .line 114
    goto :goto_0

    .line 115
    :catchall_0
    move-exception v0

    .line 116
    move-object p0, v0

    .line 117
    goto :goto_1

    .line 118
    :cond_2
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 119
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {v0}, Ll/u6y;->M()V

    .line 124
    .line 125
    .line 126
    goto :goto_2

    .line 127
    :goto_1
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 128
    throw p0

    .line 129
    :cond_3
    :goto_2
    iget-wide v0, p0, Ll/tc0;->k2:J

    .line 130
    .line 131
    const-wide/16 v2, 0x1

    .line 132
    .line 133
    add-long/2addr v0, v2

    .line 134
    iput-wide v0, p0, Ll/tc0;->k2:J

    .line 135
    .line 136
    const-wide/16 v2, 0x1e

    .line 137
    .line 138
    cmp-long v0, v0, v2

    .line 139
    .line 140
    if-gez v0, :cond_4

    .line 141
    .line 142
    iget-boolean v0, p0, Ll/tc0;->v1:Z

    .line 143
    .line 144
    if-eqz v0, :cond_5

    .line 145
    .line 146
    :cond_4
    invoke-direct {p0}, Ll/tc0;->M6()V

    .line 147
    .line 148
    .line 149
    iget-wide v0, p0, Ll/tc0;->u3:J

    .line 150
    .line 151
    const-wide/16 v2, 0x0

    .line 152
    .line 153
    cmp-long v0, v0, v2

    .line 154
    .line 155
    if-gtz v0, :cond_5

    .line 156
    .line 157
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 158
    .line 159
    .line 160
    move-result-wide v0

    .line 161
    iput-wide v0, p0, Ll/tc0;->u3:J

    .line 162
    .line 163
    :cond_5
    return-void
.end method

.method public M5(Ll/ypw;)V
    .locals 0

    .line 1
    return-void
.end method

.method public M7(Z)V
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 8
    .line 9
    const-string v2, "set Stream ReplaceMode"

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 15
    .line 16
    new-instance v1, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v2, "setStreamReplaceMode:"

    .line 19
    .line 20
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    iput-boolean p1, p0, Ll/tc0;->e2:Z

    .line 38
    .line 39
    return-void
.end method

.method public N0()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/tc0;->O0:Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;->txBytes:I

    .line 6
    .line 7
    int-to-long v0, p0

    .line 8
    return-wide v0

    .line 9
    :cond_0
    const-wide/16 v0, 0x0

    .line 10
    .line 11
    return-wide v0
.end method

.method public N1()I
    .locals 0

    .line 1
    iget p0, p0, Ll/tc0;->M0:I

    .line 2
    .line 3
    return p0
.end method

.method public N5(Lcom/immomo/mediacore/coninf/MRtcTokenWillExpireHander;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tc0;->T1:Lcom/immomo/mediacore/coninf/MRtcTokenWillExpireHander;

    .line 2
    .line 3
    return-void
.end method

.method public N7(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lio/agora/rtc2/RtcEngine;->setAudioMixingPosition(I)I

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public O0()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/tc0;->N0:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public O5(I)V
    .locals 4

    .line 1
    int-to-float v0, p1

    .line 2
    const/high16 v1, 0x42c80000    # 100.0f

    .line 3
    .line 4
    div-float/2addr v0, v1

    .line 5
    const/4 v1, 0x0

    .line 6
    cmpg-float v2, v0, v1

    .line 7
    .line 8
    if-gtz v2, :cond_0

    .line 9
    .line 10
    move v0, v1

    .line 11
    :cond_0
    const v1, 0x3f4ccccd    # 0.8f

    .line 12
    .line 13
    .line 14
    mul-float/2addr v0, v1

    .line 15
    iput v0, p0, Ll/tc0;->i1:F

    .line 16
    .line 17
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 18
    .line 19
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget v2, p0, Ll/tc0;->i1:F

    .line 24
    .line 25
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    const-string v3, "adjustAudioMixingVolume"

    .line 30
    .line 31
    filled-new-array {v3, v1, v2}, [Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 39
    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lio/agora/rtc2/RtcEngine;->adjustAudioMixingVolume(I)I

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public O6(II)V
    .locals 12

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "onFirstRemoteVideoDecoded:uid"

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v2, "width"

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget v2, p0, Ll/wej;->width:I

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v2, "height"

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget v2, p0, Ll/wej;->height:I

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v2, "elapsed"

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    const-string v2, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 48
    .line 49
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->W1()Landroid/content/Context;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    if-nez v0, :cond_0

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_0
    iget-object v0, p0, Ll/tc0;->S0:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 60
    .line 61
    int-to-long v2, p1

    .line 62
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v0, v1}, Ljava/util/AbstractMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Ll/xhy;

    .line 71
    .line 72
    if-eqz v0, :cond_1

    .line 73
    .line 74
    invoke-virtual {v0}, Ll/xhy;->d()Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-nez v1, :cond_1

    .line 79
    .line 80
    const-string v1, "zhengjijian"

    .line 81
    .line 82
    const-string v4, "agora get first idr"

    .line 83
    .line 84
    invoke-static {v1, v4}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    .line 86
    .line 87
    const/4 v1, 0x1

    .line 88
    invoke-virtual {v0, v1}, Ll/xhy;->g(Z)V

    .line 89
    .line 90
    .line 91
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 92
    .line 93
    .line 94
    move-result-wide v4

    .line 95
    invoke-virtual {v0}, Ll/xhy;->b()J

    .line 96
    .line 97
    .line 98
    move-result-wide v6

    .line 99
    sub-long v10, v4, v6

    .line 100
    .line 101
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 102
    .line 103
    move-wide v4, v2

    .line 104
    invoke-virtual {v0}, Ll/xhy;->c()I

    .line 105
    .line 106
    .line 107
    move-result v3

    .line 108
    iget-wide v6, p0, Ll/tc0;->g3:J

    .line 109
    .line 110
    invoke-virtual {v0}, Ll/xhy;->a()J

    .line 111
    .line 112
    .line 113
    move-result-wide v8

    .line 114
    const/4 v2, 0x1

    .line 115
    invoke-virtual/range {v1 .. v11}, Ll/evx;->c(ZIJJJJ)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Ll/tc0;->g1:Ll/q210$a;

    .line 119
    .line 120
    const/16 v1, 0x2006

    .line 121
    .line 122
    const/4 v2, 0x0

    .line 123
    invoke-interface {v0, v1, p1, v2, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 124
    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_1
    move-wide v4, v2

    .line 128
    :goto_0
    iget-object v1, p0, Ll/tc0;->R1:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 129
    .line 130
    if-eqz v1, :cond_2

    .line 131
    .line 132
    move-wide v2, v4

    .line 133
    iget v4, p0, Ll/wej;->width:I

    .line 134
    .line 135
    iget v5, p0, Ll/wej;->height:I

    .line 136
    .line 137
    move v6, p2

    .line 138
    invoke-interface/range {v1 .. v6}, Lcom/immomo/mediacore/coninf/MRtcEventHandler;->onFirstRemoteVideoDecoded(JIII)V

    .line 139
    .line 140
    .line 141
    :cond_2
    iget-object p2, p0, Ll/tc0;->l3:Landroid/os/Handler;

    .line 142
    .line 143
    if-eqz p2, :cond_3

    .line 144
    .line 145
    new-instance v0, Ll/tc0$i;

    .line 146
    .line 147
    invoke-direct {v0, p0, p1}, Ll/tc0$i;-><init>(Ll/tc0;I)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {p2, v0}, Landroid/os/Handler;->postAtFrontOfQueue(Ljava/lang/Runnable;)Z

    .line 151
    .line 152
    .line 153
    :cond_3
    :goto_1
    return-void
.end method

.method public P0(Ll/g510;IIII)V
    .locals 0

    .line 1
    iput p5, p0, Ll/tc0;->l1:I

    .line 2
    .line 3
    iput p3, p0, Ll/tc0;->m1:I

    .line 4
    .line 5
    iput p4, p0, Ll/tc0;->n1:I

    .line 6
    .line 7
    return-void
.end method

.method public P5(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lio/agora/rtc2/RtcEngine;->adjustPlaybackSignalVolume(I)I

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public P6()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lio/agora/rtc2/internal/RtcEngineImpl;

    .line 6
    .line 7
    invoke-virtual {p0}, Lio/agora/rtc2/internal/RtcEngineImpl;->pauseAllEffects()I

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public Q0()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/tc0;->X:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/tc0;->r6()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/tc0;->s6()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public Q5(JF)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    long-to-int p1, p1

    .line 6
    float-to-int p2, p3

    .line 7
    invoke-virtual {p0, p1, p2}, Lio/agora/rtc2/RtcEngine;->adjustUserPlaybackSignalVolume(II)I

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public Q6(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lio/agora/rtc2/internal/RtcEngineImpl;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lio/agora/rtc2/internal/RtcEngineImpl;->pauseEffect(I)I

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public Q7(Ll/gbl0;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "listner:"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    new-instance v2, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v3, "useTexture:"

    .line 20
    .line 21
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v3, p0, Ll/tc0;->o1:Ll/ror;

    .line 25
    .line 26
    iget-boolean v3, v3, Ll/uow;->Z0:Z

    .line 27
    .line 28
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    const-string v3, "setVideoChannelTextureViewListener"

    .line 36
    .line 37
    filled-new-array {v3, v1, v2}, [Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    iput-object p1, p0, Ll/tc0;->c1:Ll/gbl0;

    .line 45
    .line 46
    return-void
.end method

.method public R0(Ll/uow;Landroid/opengl/EGLContext;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iget-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 7
    .line 8
    const-string p2, "startRecord"

    .line 9
    .line 10
    const-string v0, "engine == null, may be appid is null"

    .line 11
    .line 12
    filled-new-array {p2, v0}, [Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-virtual {p1, p2}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/tc0;->g1:Ll/q210$a;

    .line 20
    .line 21
    const/16 p2, 0x1100

    .line 22
    .line 23
    const/16 v0, 0x326

    .line 24
    .line 25
    invoke-interface {p1, p2, v0, v1, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    if-eqz p1, :cond_10

    .line 30
    .line 31
    iget v0, p0, Ll/tc0;->X0:I

    .line 32
    .line 33
    const/4 v2, 0x1

    .line 34
    if-ne v0, v2, :cond_1

    .line 35
    .line 36
    goto/16 :goto_5

    .line 37
    .line 38
    :cond_1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 39
    .line 40
    iget v3, p0, Ll/tc0;->s1:I

    .line 41
    .line 42
    int-to-long v3, v3

    .line 43
    iput-wide v3, v0, Ll/wvx;->c1:J

    .line 44
    .line 45
    const-wide/16 v5, 0x1

    .line 46
    .line 47
    cmp-long v3, v3, v5

    .line 48
    .line 49
    if-nez v3, :cond_3

    .line 50
    .line 51
    const-string v3, "M"

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/tc0;->w1()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    if-eqz v3, :cond_2

    .line 62
    .line 63
    const-string v3, "AgoraMaster"

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    const-string v3, "AgoraSlaver"

    .line 67
    .line 68
    :goto_0
    iput-object v3, v0, Ll/wvx;->B0:Ljava/lang/String;

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_3
    const-string v3, "AgoraAudience"

    .line 72
    .line 73
    iput-object v3, v0, Ll/wvx;->B0:Ljava/lang/String;

    .line 74
    .line 75
    :goto_1
    invoke-super {p0, p1, p2}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->R0(Ll/uow;Landroid/opengl/EGLContext;)V

    .line 76
    .line 77
    .line 78
    iget-boolean p2, p1, Ll/tow;->b0:Z

    .line 79
    .line 80
    if-eqz p2, :cond_4

    .line 81
    .line 82
    iget-boolean p2, p0, Ll/tc0;->m3:Z

    .line 83
    .line 84
    if-nez p2, :cond_4

    .line 85
    .line 86
    iget-boolean p2, p0, Ll/tc0;->w1:Z

    .line 87
    .line 88
    if-nez p2, :cond_4

    .line 89
    .line 90
    iget-object p2, p0, Ll/tc0;->c2:Ll/tc0$l;

    .line 91
    .line 92
    if-nez p2, :cond_4

    .line 93
    .line 94
    new-instance p2, Ll/tc0$l;

    .line 95
    .line 96
    const-string v0, "live-media-aFFrame"

    .line 97
    .line 98
    invoke-direct {p2, p0, v0}, Ll/tc0$l;-><init>(Ll/tc0;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    iput-object p2, p0, Ll/tc0;->c2:Ll/tc0$l;

    .line 102
    .line 103
    invoke-virtual {p2}, Ljava/lang/Thread;->start()V

    .line 104
    .line 105
    .line 106
    :cond_4
    instance-of p2, p1, Ll/ror;

    .line 107
    .line 108
    if-eqz p2, :cond_f

    .line 109
    .line 110
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    const-string v0, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 115
    .line 116
    const-string v3, "AgoraPushFilter startRecord"

    .line 117
    .line 118
    invoke-virtual {p2, v0, v3}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 122
    .line 123
    .line 124
    move-result-object p2

    .line 125
    const-string v0, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 126
    .line 127
    new-instance v3, Ljava/lang/StringBuilder;

    .line 128
    .line 129
    const-string v4, "videoWidth:"

    .line 130
    .line 131
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    iget v4, p1, Ll/tow;->s:I

    .line 135
    .line 136
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    const-string v4, ",videoHeight:"

    .line 140
    .line 141
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    iget v4, p1, Ll/tow;->t:I

    .line 145
    .line 146
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    const-string v4, ",visualWidth:"

    .line 150
    .line 151
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    iget v4, p1, Ll/tow;->u:I

    .line 155
    .line 156
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    const-string v4, ",visualHeight:"

    .line 160
    .line 161
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    iget v4, p1, Ll/tow;->v:I

    .line 165
    .line 166
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    const-string v4, ",encodeWidth:"

    .line 170
    .line 171
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    iget v4, p1, Ll/tow;->m:I

    .line 175
    .line 176
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    const-string v4, ",encodeHeight:"

    .line 180
    .line 181
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    iget v4, p1, Ll/tow;->n:I

    .line 185
    .line 186
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    const-string v4, ",videoBitrate:"

    .line 190
    .line 191
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    iget v4, p1, Ll/tow;->H:I

    .line 195
    .line 196
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    const-string v4, ",audioBitrate:"

    .line 200
    .line 201
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    iget v4, p1, Ll/tow;->S:I

    .line 205
    .line 206
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    const-string v4, ",videoFPS:"

    .line 210
    .line 211
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    iget v4, p1, Ll/tow;->F:I

    .line 215
    .line 216
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    const-string v4, ",codecFPS:"

    .line 220
    .line 221
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 222
    .line 223
    .line 224
    iget v4, p1, Ll/uow;->E0:I

    .line 225
    .line 226
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 227
    .line 228
    .line 229
    const-string v4, ",mergeCanvasWidth:"

    .line 230
    .line 231
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    move-object v4, p1

    .line 235
    check-cast v4, Ll/ror;

    .line 236
    .line 237
    iget v7, v4, Ll/tow;->k:I

    .line 238
    .line 239
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 240
    .line 241
    .line 242
    const-string v7, ",mergeCanvasHeight:"

    .line 243
    .line 244
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 245
    .line 246
    .line 247
    iget v7, v4, Ll/tow;->l:I

    .line 248
    .line 249
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 250
    .line 251
    .line 252
    const-string v7, ",codecFPS:"

    .line 253
    .line 254
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 255
    .line 256
    .line 257
    iget v7, p1, Ll/uow;->E0:I

    .line 258
    .line 259
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 260
    .line 261
    .line 262
    const-string v7, ",isHard:"

    .line 263
    .line 264
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 265
    .line 266
    .line 267
    iget-object v7, p1, Ll/uow;->A0:Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;

    .line 268
    .line 269
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 270
    .line 271
    .line 272
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object v3

    .line 276
    invoke-virtual {p2, v0, v3}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 277
    .line 278
    .line 279
    iput-object v4, p0, Ll/tc0;->o1:Ll/ror;

    .line 280
    .line 281
    iget-object p2, p1, Ll/uow;->v0:Ljava/lang/String;

    .line 282
    .line 283
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 284
    .line 285
    .line 286
    move-result p2

    .line 287
    if-nez p2, :cond_5

    .line 288
    .line 289
    iget-object p2, p1, Ll/uow;->v0:Ljava/lang/String;

    .line 290
    .line 291
    const-string v0, "mixprovider=1"

    .line 292
    .line 293
    invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 294
    .line 295
    .line 296
    move-result p2

    .line 297
    iput-boolean p2, p0, Ll/tc0;->v3:Z

    .line 298
    .line 299
    :cond_5
    iget-object p2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 300
    .line 301
    new-instance v0, Ljava/lang/StringBuilder;

    .line 302
    .line 303
    const-string v3, "serverMix:"

    .line 304
    .line 305
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 306
    .line 307
    .line 308
    iget-boolean v3, p0, Ll/tc0;->v3:Z

    .line 309
    .line 310
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 311
    .line 312
    .line 313
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object v0

    .line 317
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 318
    .line 319
    .line 320
    move-result-object v0

    .line 321
    invoke-virtual {p2, v0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 322
    .line 323
    .line 324
    iget-object p2, p1, Ll/uow;->A0:Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;

    .line 325
    .line 326
    sget-object v0, Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;->SOFT_DECODE:Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;

    .line 327
    .line 328
    if-eq p2, v0, :cond_6

    .line 329
    .line 330
    iget-boolean p2, v4, Ll/tow;->b0:Z

    .line 331
    .line 332
    if-eqz p2, :cond_7

    .line 333
    .line 334
    :cond_6
    iput-boolean v1, p0, Ll/tc0;->T:Z

    .line 335
    .line 336
    :cond_7
    new-instance p2, Ll/dc1;

    .line 337
    .line 338
    invoke-direct {p2}, Ll/dc1;-><init>()V

    .line 339
    .line 340
    .line 341
    iput-object p2, p0, Ll/tc0;->K0:Ll/dc1;

    .line 342
    .line 343
    iget-object p2, p0, Ll/tc0;->J0:Ll/g510;

    .line 344
    .line 345
    if-eqz p2, :cond_8

    .line 346
    .line 347
    invoke-virtual {p2}, Ll/g510;->l()Landroid/opengl/EGLContext;

    .line 348
    .line 349
    .line 350
    move-result-object p2

    .line 351
    iput-object p2, p0, Ll/tc0;->W:Landroid/opengl/EGLContext;

    .line 352
    .line 353
    :cond_8
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 354
    .line 355
    .line 356
    move-result-object p2

    .line 357
    invoke-virtual {p2}, Ll/csx;->p()Z

    .line 358
    .line 359
    .line 360
    move-result p2

    .line 361
    if-eqz p2, :cond_a

    .line 362
    .line 363
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 364
    .line 365
    .line 366
    move-result-object p2

    .line 367
    invoke-virtual {p2}, Ll/csx;->q()F

    .line 368
    .line 369
    .line 370
    move-result p2

    .line 371
    iget v0, p1, Ll/tow;->H:I

    .line 372
    .line 373
    div-int/lit16 v0, v0, 0x3e8

    .line 374
    .line 375
    int-to-float v0, v0

    .line 376
    mul-float/2addr p2, v0

    .line 377
    float-to-int p2, p2

    .line 378
    new-instance v0, Lio/agora/rtc2/video/VideoEncoderConfiguration;

    .line 379
    .line 380
    invoke-direct {v0}, Lio/agora/rtc2/video/VideoEncoderConfiguration;-><init>()V

    .line 381
    .line 382
    .line 383
    iput p2, v0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->minBitrate:I

    .line 384
    .line 385
    iget-object v3, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 386
    .line 387
    if-eqz v3, :cond_9

    .line 388
    .line 389
    invoke-virtual {v3, v0}, Lio/agora/rtc2/RtcEngine;->setVideoEncoderConfiguration(Lio/agora/rtc2/video/VideoEncoderConfiguration;)I

    .line 390
    .line 391
    .line 392
    :cond_9
    const-string v0, "agora_minkbs"

    .line 393
    .line 394
    new-instance v3, Ljava/lang/StringBuilder;

    .line 395
    .line 396
    const-string v4, "minBitrate parms = "

    .line 397
    .line 398
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 399
    .line 400
    .line 401
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 402
    .line 403
    .line 404
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 405
    .line 406
    .line 407
    move-result-object p2

    .line 408
    invoke-static {v0, p2}, Ll/t9c;->f(Ljava/lang/String;Ljava/lang/Object;)I

    .line 409
    .line 410
    .line 411
    :cond_a
    const/4 p2, 0x2

    .line 412
    iput p2, p0, Ll/tc0;->y3:I

    .line 413
    .line 414
    iput-boolean v1, p0, Ll/tc0;->s3:Z

    .line 415
    .line 416
    iput-boolean v1, p0, Ll/tc0;->x1:Z

    .line 417
    .line 418
    iput-boolean v1, p0, Ll/tc0;->t3:Z

    .line 419
    .line 420
    iget-object p2, p0, Ll/tc0;->t1:Ljava/lang/Object;

    .line 421
    .line 422
    monitor-enter p2

    .line 423
    :try_start_0
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 424
    .line 425
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 426
    .line 427
    .line 428
    move-result-wide v3

    .line 429
    iput-wide v3, v0, Ll/wvx;->e:J

    .line 430
    .line 431
    iget-object v0, p0, Ll/tc0;->o1:Ll/ror;

    .line 432
    .line 433
    iget v0, v0, Ll/uow;->B0:I

    .line 434
    .line 435
    int-to-long v3, v0

    .line 436
    invoke-direct {p0, v3, v4}, Ll/tc0;->V5(J)V

    .line 437
    .line 438
    .line 439
    iget v0, p0, Ll/tc0;->s1:I

    .line 440
    .line 441
    const/16 v3, 0x21

    .line 442
    .line 443
    invoke-direct {p0, v0, v3}, Ll/tc0;->T5(II)V

    .line 444
    .line 445
    .line 446
    iget-object v0, p0, Ll/tc0;->o1:Ll/ror;

    .line 447
    .line 448
    iget-object v3, v0, Ll/ror;->g1:Ljava/lang/String;

    .line 449
    .line 450
    iget v0, v0, Ll/uow;->B0:I

    .line 451
    .line 452
    invoke-direct {p0, v3, v0}, Ll/tc0;->B6(Ljava/lang/String;I)V

    .line 453
    .line 454
    .line 455
    iget-object v0, p0, Ll/tc0;->B1:Ljava/lang/String;

    .line 456
    .line 457
    if-eqz v0, :cond_b

    .line 458
    .line 459
    iget-object v0, p0, Ll/tc0;->o1:Ll/ror;

    .line 460
    .line 461
    iget-boolean v3, v0, Ll/ror;->h1:Z

    .line 462
    .line 463
    if-eqz v3, :cond_b

    .line 464
    .line 465
    iget-object v3, p0, Ll/tc0;->C1:Ljava/lang/String;

    .line 466
    .line 467
    if-nez v3, :cond_b

    .line 468
    .line 469
    iget-boolean v0, v0, Ll/uow;->X0:Z

    .line 470
    .line 471
    if-nez v0, :cond_b

    .line 472
    .line 473
    iget-object v0, p0, Ll/tc0;->B1:Ljava/lang/String;

    .line 474
    .line 475
    invoke-virtual {p0, v0}, Ll/tc0;->z7(Ljava/lang/String;)V

    .line 476
    .line 477
    .line 478
    goto :goto_2

    .line 479
    :catchall_0
    move-exception p0

    .line 480
    goto/16 :goto_4

    .line 481
    .line 482
    :cond_b
    :goto_2
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 483
    iget-boolean p2, p0, Ll/tc0;->d2:Z

    .line 484
    .line 485
    if-eqz p2, :cond_c

    .line 486
    .line 487
    invoke-virtual {p0, v1}, Ll/tc0;->Y7(I)V

    .line 488
    .line 489
    .line 490
    invoke-virtual {p0, v2}, Ll/tc0;->Y7(I)V

    .line 491
    .line 492
    .line 493
    :cond_c
    iput v2, p0, Ll/tc0;->X0:I

    .line 494
    .line 495
    invoke-static {}, Ll/yt0;->g()Ll/yt0;

    .line 496
    .line 497
    .line 498
    move-result-object p2

    .line 499
    invoke-virtual {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->W1()Landroid/content/Context;

    .line 500
    .line 501
    .line 502
    move-result-object v0

    .line 503
    sget v1, Ll/yt0;->f:I

    .line 504
    .line 505
    invoke-virtual {p2, v0, v1}, Ll/yt0;->p(Landroid/content/Context;I)V

    .line 506
    .line 507
    .line 508
    iget-object p2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 509
    .line 510
    invoke-virtual {p1}, Ll/uow;->d()I

    .line 511
    .line 512
    .line 513
    move-result v0

    .line 514
    int-to-long v0, v0

    .line 515
    iput-wide v0, p2, Ll/wvx;->d1:J

    .line 516
    .line 517
    iget-object p2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 518
    .line 519
    iget-boolean v0, p1, Ll/tow;->b0:Z

    .line 520
    .line 521
    if-eqz v0, :cond_d

    .line 522
    .line 523
    goto :goto_3

    .line 524
    :cond_d
    const-wide/16 v5, 0x0

    .line 525
    .line 526
    :goto_3
    iput-wide v5, p2, Ll/wvx;->b1:J

    .line 527
    .line 528
    iget-object v0, p1, Ll/uow;->v0:Ljava/lang/String;

    .line 529
    .line 530
    iput-object v0, p2, Ll/wvx;->x:Ljava/lang/String;

    .line 531
    .line 532
    iget v0, p1, Ll/tow;->H:I

    .line 533
    .line 534
    iput v0, p0, Ll/tc0;->o3:I

    .line 535
    .line 536
    iget v1, p1, Ll/uow;->E0:I

    .line 537
    .line 538
    iput v1, p0, Ll/tc0;->p3:I

    .line 539
    .line 540
    iget-object v1, p0, Ll/tc0;->o1:Ll/ror;

    .line 541
    .line 542
    iget v3, v1, Ll/uow;->B0:I

    .line 543
    .line 544
    int-to-long v3, v3

    .line 545
    iput-wide v3, p2, Ll/wvx;->W:J

    .line 546
    .line 547
    iget-object v1, v1, Ll/ror;->g1:Ljava/lang/String;

    .line 548
    .line 549
    iput-object v1, p2, Ll/wvx;->X:Ljava/lang/String;

    .line 550
    .line 551
    int-to-long v0, v0

    .line 552
    iput-wide v0, p2, Ll/wvx;->F0:J

    .line 553
    .line 554
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 555
    .line 556
    if-eqz v0, :cond_e

    .line 557
    .line 558
    invoke-static {}, Lio/agora/rtc2/RtcEngine;->getSdkVersion()Ljava/lang/String;

    .line 559
    .line 560
    .line 561
    move-result-object v0

    .line 562
    iput-object v0, p2, Ll/wvx;->p:Ljava/lang/String;

    .line 563
    .line 564
    :cond_e
    iget-object p2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 565
    .line 566
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 567
    .line 568
    .line 569
    move-result-wide v0

    .line 570
    iput-wide v0, p2, Ll/wvx;->f:J

    .line 571
    .line 572
    iget-object p2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 573
    .line 574
    iget v0, p1, Ll/tow;->H:I

    .line 575
    .line 576
    int-to-long v0, v0

    .line 577
    iput-wide v0, p2, Ll/wvx;->F0:J

    .line 578
    .line 579
    iget-object p2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 580
    .line 581
    const-string v0, "startRecord"

    .line 582
    .line 583
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 584
    .line 585
    .line 586
    move-result-object v0

    .line 587
    invoke-virtual {p2, v0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 588
    .line 589
    .line 590
    iget-wide v0, p1, Ll/uow;->W0:J

    .line 591
    .line 592
    iput-wide v0, p0, Ll/tc0;->F2:J

    .line 593
    .line 594
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 595
    .line 596
    .line 597
    move-result-object p2

    .line 598
    invoke-virtual {p2, v2}, Ll/csx;->C1(I)V

    .line 599
    .line 600
    .line 601
    iget-object p2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 602
    .line 603
    const-string v0, "mrCoreParameters ignoreSabin"

    .line 604
    .line 605
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 606
    .line 607
    .line 608
    move-result-object v1

    .line 609
    invoke-virtual {v1}, Ll/csx;->O0()Z

    .line 610
    .line 611
    .line 612
    move-result v1

    .line 613
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 614
    .line 615
    .line 616
    move-result-object v1

    .line 617
    const-string v2, "isLocalMix"

    .line 618
    .line 619
    iget-boolean p1, p1, Ll/uow;->X0:Z

    .line 620
    .line 621
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 622
    .line 623
    .line 624
    move-result-object p1

    .line 625
    filled-new-array {v0, v1, v2, p1}, [Ljava/lang/Object;

    .line 626
    .line 627
    .line 628
    move-result-object p1

    .line 629
    invoke-virtual {p2, p1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 630
    .line 631
    .line 632
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 633
    .line 634
    const-string p1, "agoraGlFlush"

    .line 635
    .line 636
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 637
    .line 638
    .line 639
    move-result-object p2

    .line 640
    invoke-virtual {p2}, Ll/csx;->a()Z

    .line 641
    .line 642
    .line 643
    move-result p2

    .line 644
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 645
    .line 646
    .line 647
    move-result-object p2

    .line 648
    filled-new-array {p1, p2}, [Ljava/lang/Object;

    .line 649
    .line 650
    .line 651
    move-result-object p1

    .line 652
    invoke-virtual {p0, p1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 653
    .line 654
    .line 655
    return-void

    .line 656
    :goto_4
    :try_start_1
    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 657
    throw p0

    .line 658
    :cond_f
    new-instance p0, Ljava/security/InvalidParameterException;

    .line 659
    .line 660
    const-string p1, "Parameters error"

    .line 661
    .line 662
    invoke-direct {p0, p1}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    .line 663
    .line 664
    .line 665
    throw p0

    .line 666
    :cond_10
    :goto_5
    return-void
.end method

.method public R5(I)I
    .locals 9

    .line 1
    const-string v0, "changeRole:"

    .line 2
    .line 3
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 8
    .line 9
    new-instance v3, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v4, "call changeRole:"

    .line 12
    .line 13
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-virtual {v1, v2, v3}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 27
    .line 28
    const-string v2, "changeRole"

    .line 29
    .line 30
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    filled-new-array {v2, v3}, [Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v1, v2}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    iget v1, p0, Ll/tc0;->s1:I

    .line 42
    .line 43
    const/4 v2, 0x1

    .line 44
    const/4 v3, 0x0

    .line 45
    if-eq p1, v1, :cond_0

    .line 46
    .line 47
    move v1, v2

    .line 48
    goto :goto_0

    .line 49
    :cond_0
    move v1, v3

    .line 50
    :goto_0
    iput p1, p0, Ll/tc0;->s1:I

    .line 51
    .line 52
    iget-object v4, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 53
    .line 54
    int-to-long v5, p1

    .line 55
    iput-wide v5, v4, Ll/wvx;->c1:J

    .line 56
    .line 57
    if-eqz v1, :cond_3

    .line 58
    .line 59
    const-wide/16 v7, 0x2

    .line 60
    .line 61
    cmp-long v1, v5, v7

    .line 62
    .line 63
    if-nez v1, :cond_1

    .line 64
    .line 65
    invoke-virtual {p0}, Ll/tc0;->i2()V

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 69
    .line 70
    const-string v4, "AgoraAudience"

    .line 71
    .line 72
    iput-object v4, v1, Ll/wvx;->B0:Ljava/lang/String;

    .line 73
    .line 74
    goto :goto_2

    .line 75
    :cond_1
    invoke-virtual {p0}, Ll/tc0;->g2()V

    .line 76
    .line 77
    .line 78
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 79
    .line 80
    const-string v4, "M"

    .line 81
    .line 82
    invoke-virtual {p0}, Ll/tc0;->w1()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v5

    .line 86
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v4

    .line 90
    if-eqz v4, :cond_2

    .line 91
    .line 92
    const-string v4, "AgoraMaster"

    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_2
    const-string v4, "AgoraSlaver"

    .line 96
    .line 97
    :goto_1
    iput-object v4, v1, Ll/wvx;->B0:Ljava/lang/String;

    .line 98
    .line 99
    :goto_2
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 100
    .line 101
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 102
    .line 103
    .line 104
    move-result-wide v4

    .line 105
    iput-wide v4, v1, Ll/wvx;->f:J

    .line 106
    .line 107
    :cond_3
    iget-object v1, p0, Ll/tc0;->t1:Ljava/lang/Object;

    .line 108
    .line 109
    monitor-enter v1

    .line 110
    if-ne v2, p1, :cond_4

    .line 111
    .line 112
    :try_start_0
    invoke-direct {p0}, Ll/tc0;->P7()V

    .line 113
    .line 114
    .line 115
    goto :goto_3

    .line 116
    :catchall_0
    move-exception p0

    .line 117
    goto :goto_4

    .line 118
    :cond_4
    :goto_3
    iget-object v2, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 119
    .line 120
    if-eqz v2, :cond_5

    .line 121
    .line 122
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    const-string v3, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 127
    .line 128
    new-instance v4, Ljava/lang/StringBuilder;

    .line 129
    .line 130
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-virtual {v2, v3, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 144
    .line 145
    invoke-virtual {p0, p1}, Lio/agora/rtc2/RtcEngine;->setClientRole(I)I

    .line 146
    .line 147
    .line 148
    move-result v3

    .line 149
    :cond_5
    monitor-exit v1

    .line 150
    return v3

    .line 151
    :goto_4
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 152
    throw p0
.end method

.method public R6()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    const-string v1, "pauseRecording"

    .line 4
    .line 5
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v0, v2}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const-string v2, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 17
    .line 18
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 26
    .line 27
    const-string v1, "pauseRecording muteLocalAudioStream"

    .line 28
    .line 29
    const-string v2, "true"

    .line 30
    .line 31
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 39
    .line 40
    const/4 v0, 0x1

    .line 41
    invoke-virtual {p0, v0}, Lio/agora/rtc2/RtcEngine;->muteLocalAudioStream(Z)I

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public R7(Ll/ebl0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tc0;->Z0:Ll/ebl0;

    .line 2
    .line 3
    return-void
.end method

.method public S5()V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/tc0;->E1:Lcom/immomo/mediacore/sink/CongressUtil;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/CongressUtil;->clearPcmCallback()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catch_1
    move-exception p0

    .line 15
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 16
    .line 17
    .line 18
    :cond_0
    :goto_0
    return-void
.end method

.method public S6()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lio/agora/rtc2/RtcEngine;->pauseAudioMixing()I

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public S7(Ll/fbl0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tc0;->a1:Ll/fbl0;

    .line 2
    .line 3
    return-void
.end method

.method public T0()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public T6(ILjava/lang/String;IDDZD)Z
    .locals 14

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "playEffect filename:"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    move-object/from16 v5, p2

    .line 11
    .line 12
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "playEffect"

    .line 20
    .line 21
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 29
    .line 30
    const/4 v0, 0x1

    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    move-object v3, p0

    .line 34
    check-cast v3, Lio/agora/rtc2/internal/RtcEngineImpl;

    .line 35
    .line 36
    const-wide/high16 v1, 0x4059000000000000L    # 100.0

    .line 37
    .line 38
    mul-double v11, p6, v1

    .line 39
    .line 40
    xor-int/lit8 v13, p8, 0x1

    .line 41
    .line 42
    move v4, p1

    .line 43
    move/from16 v6, p3

    .line 44
    .line 45
    move-wide/from16 v7, p4

    .line 46
    .line 47
    move-wide/from16 v9, p9

    .line 48
    .line 49
    invoke-virtual/range {v3 .. v13}, Lio/agora/rtc2/internal/RtcEngineImpl;->playEffect(ILjava/lang/String;IDDDZ)I

    .line 50
    .line 51
    .line 52
    :cond_0
    return v0
.end method

.method public T7(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "url is"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "agora setVideoMixerBackgroundImgUrl"

    .line 18
    .line 19
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Ll/tc0;->r3:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    iget-object v0, p0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 36
    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    new-instance v0, Lio/agora/rtc2/live/LiveTranscoding;

    .line 40
    .line 41
    invoke-direct {v0}, Lio/agora/rtc2/live/LiveTranscoding;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 45
    .line 46
    :cond_1
    new-instance v0, Lio/agora/rtc2/video/AgoraImage;

    .line 47
    .line 48
    invoke-direct {v0}, Lio/agora/rtc2/video/AgoraImage;-><init>()V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 52
    .line 53
    iget v2, v1, Ll/tow;->k:I

    .line 54
    .line 55
    if-lez v2, :cond_2

    .line 56
    .line 57
    iput v2, v0, Lio/agora/rtc2/video/AgoraImage;->width:I

    .line 58
    .line 59
    iget v1, v1, Ll/tow;->l:I

    .line 60
    .line 61
    iput v1, v0, Lio/agora/rtc2/video/AgoraImage;->height:I

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    iget v2, v1, Ll/tow;->s:I

    .line 65
    .line 66
    iput v2, v0, Lio/agora/rtc2/video/AgoraImage;->width:I

    .line 67
    .line 68
    iget v1, v1, Ll/tow;->t:I

    .line 69
    .line 70
    iput v1, v0, Lio/agora/rtc2/video/AgoraImage;->height:I

    .line 71
    .line 72
    :goto_0
    iput-object p1, v0, Lio/agora/rtc2/video/AgoraImage;->url:Ljava/lang/String;

    .line 73
    .line 74
    const/4 p1, 0x0

    .line 75
    iput p1, v0, Lio/agora/rtc2/video/AgoraImage;->x:I

    .line 76
    .line 77
    iput p1, v0, Lio/agora/rtc2/video/AgoraImage;->y:I

    .line 78
    .line 79
    iget-object p1, p0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 80
    .line 81
    invoke-virtual {p1}, Lio/agora/rtc2/live/LiveTranscoding;->getBackgroundImageList()Ljava/util/ArrayList;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    if-eqz p1, :cond_3

    .line 86
    .line 87
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 88
    .line 89
    .line 90
    :cond_3
    iget-object p1, p0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 91
    .line 92
    invoke-virtual {p1, v0}, Lio/agora/rtc2/live/LiveTranscoding;->addBackgroundImage(Lio/agora/rtc2/video/AgoraImage;)V

    .line 93
    .line 94
    .line 95
    iget-object p1, p0, Ll/tc0;->o1:Ll/ror;

    .line 96
    .line 97
    iget-object p1, p1, Ll/uow;->v0:Ljava/lang/String;

    .line 98
    .line 99
    invoke-direct {p0, p1}, Ll/tc0;->U5(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public U6()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/tc0;->n6()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iput-object v1, v0, Ll/wvx;->r:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/evx;->u()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public U7(IIII)V
    .locals 0

    .line 1
    div-int/lit16 p1, p1, 0x3e8

    .line 2
    .line 3
    iput p1, p0, Ll/tc0;->I1:I

    .line 4
    .line 5
    iput p2, p0, Ll/tc0;->J1:I

    .line 6
    .line 7
    iget-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 8
    .line 9
    new-instance p3, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string p4, "setVideoMixerBitrate:"

    .line 12
    .line 13
    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget p0, p0, Ll/tc0;->I1:I

    .line 17
    .line 18
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string p0, ", fps:"

    .line 22
    .line 23
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p1, p0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public V0()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    return-wide v0
.end method

.method public V6()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/tc0;->x1()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    iput-wide v1, v0, Ll/wvx;->D:J

    .line 8
    .line 9
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/tc0;->O0()J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    iput-wide v1, v0, Ll/wvx;->F:J

    .line 16
    .line 17
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/tc0;->q1()J

    .line 20
    .line 21
    .line 22
    move-result-wide v1

    .line 23
    iput-wide v1, v0, Ll/wvx;->G:J

    .line 24
    .line 25
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/tc0;->F1()J

    .line 28
    .line 29
    .line 30
    move-result-wide v1

    .line 31
    iput-wide v1, v0, Ll/wvx;->B:J

    .line 32
    .line 33
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/tc0;->w1()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iput-object v1, v0, Ll/wvx;->N:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/tc0;->h1()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    int-to-long v1, v1

    .line 48
    iput-wide v1, v0, Ll/wvx;->O:J

    .line 49
    .line 50
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/tc0;->Y0()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    int-to-long v1, v1

    .line 57
    iput-wide v1, v0, Ll/wvx;->P:J

    .line 58
    .line 59
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/tc0;->m0()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    int-to-long v1, v1

    .line 66
    iput-wide v1, v0, Ll/wvx;->Q:J

    .line 67
    .line 68
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 69
    .line 70
    invoke-virtual {p0}, Ll/tc0;->getVideoWidth()I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    int-to-long v1, v1

    .line 75
    iput-wide v1, v0, Ll/wvx;->v:J

    .line 76
    .line 77
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 78
    .line 79
    invoke-virtual {p0}, Ll/tc0;->k0()I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    int-to-long v1, v1

    .line 84
    iput-wide v1, v0, Ll/wvx;->w:J

    .line 85
    .line 86
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 87
    .line 88
    invoke-virtual {p0}, Ll/tc0;->h0()I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    int-to-long v1, v1

    .line 93
    iput-wide v1, v0, Ll/wvx;->j:J

    .line 94
    .line 95
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 96
    .line 97
    invoke-virtual {p0}, Ll/tc0;->N1()I

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    int-to-long v1, v1

    .line 102
    iput-wide v1, v0, Ll/wvx;->k:J

    .line 103
    .line 104
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 105
    .line 106
    invoke-virtual {p0}, Ll/tc0;->W0()I

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    int-to-long v1, v1

    .line 111
    iput-wide v1, v0, Ll/wvx;->l:J

    .line 112
    .line 113
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 114
    .line 115
    invoke-direct {p0}, Ll/tc0;->n6()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    iput-object v1, v0, Ll/wvx;->r:Ljava/lang/String;

    .line 120
    .line 121
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 122
    .line 123
    invoke-virtual {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Z1()Ll/uow;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    iget v1, v1, Ll/tow;->w:I

    .line 128
    .line 129
    int-to-long v1, v1

    .line 130
    iput-wide v1, v0, Ll/wvx;->S:J

    .line 131
    .line 132
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 133
    .line 134
    invoke-virtual {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Z1()Ll/uow;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    iget v1, v1, Ll/tow;->x:I

    .line 139
    .line 140
    int-to-long v1, v1

    .line 141
    iput-wide v1, v0, Ll/wvx;->T:J

    .line 142
    .line 143
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 144
    .line 145
    invoke-direct {p0}, Ll/tc0;->A6()I

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    int-to-long v1, v1

    .line 150
    iput-wide v1, v0, Ll/wvx;->U:J

    .line 151
    .line 152
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 153
    .line 154
    iget-boolean v1, p0, Ll/tc0;->n3:Z

    .line 155
    .line 156
    const-wide/16 v2, 0x0

    .line 157
    .line 158
    if-eqz v1, :cond_0

    .line 159
    .line 160
    const-wide/16 v4, 0x1

    .line 161
    .line 162
    goto :goto_0

    .line 163
    :cond_0
    move-wide v4, v2

    .line 164
    :goto_0
    iput-wide v4, v0, Ll/wvx;->V:J

    .line 165
    .line 166
    const-wide/16 v4, 0x3e8

    .line 167
    .line 168
    iput-wide v4, v0, Ll/wvx;->R:J

    .line 169
    .line 170
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 171
    .line 172
    iget v4, v1, Ll/tow;->H:I

    .line 173
    .line 174
    int-to-long v4, v4

    .line 175
    iput-wide v4, v0, Ll/wvx;->F0:J

    .line 176
    .line 177
    iget-boolean v4, v1, Ll/uow;->H0:Z

    .line 178
    .line 179
    if-eqz v4, :cond_1

    .line 180
    .line 181
    const-wide/16 v2, 0x2

    .line 182
    .line 183
    :cond_1
    iput-wide v2, v0, Ll/wvx;->g:J

    .line 184
    .line 185
    iget-boolean v1, v1, Ll/uow;->X0:Z

    .line 186
    .line 187
    iput v1, v0, Ll/wvx;->h1:I

    .line 188
    .line 189
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 190
    .line 191
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 192
    .line 193
    iget-boolean v1, v1, Ll/uow;->H0:Z

    .line 194
    .line 195
    iput v1, v0, Ll/wvx;->k1:I

    .line 196
    .line 197
    iget v1, p0, Ll/tc0;->I1:I

    .line 198
    .line 199
    int-to-long v1, v1

    .line 200
    iput-wide v1, v0, Ll/wvx;->a1:J

    .line 201
    .line 202
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 203
    .line 204
    .line 205
    move-result-object v1

    .line 206
    invoke-virtual {v1}, Ll/u6y;->a()Landroid/util/Size;

    .line 207
    .line 208
    .line 209
    move-result-object v1

    .line 210
    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    .line 211
    .line 212
    .line 213
    move-result v1

    .line 214
    iput v1, v0, Ll/wvx;->l1:I

    .line 215
    .line 216
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 217
    .line 218
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 219
    .line 220
    .line 221
    move-result-object v1

    .line 222
    invoke-virtual {v1}, Ll/u6y;->a()Landroid/util/Size;

    .line 223
    .line 224
    .line 225
    move-result-object v1

    .line 226
    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    .line 227
    .line 228
    .line 229
    move-result v1

    .line 230
    iput v1, v0, Ll/wvx;->m1:I

    .line 231
    .line 232
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 233
    .line 234
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 235
    .line 236
    .line 237
    move-result-object v1

    .line 238
    invoke-virtual {v1}, Ll/u6y;->w()Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object v1

    .line 242
    iput-object v1, v0, Ll/wvx;->n1:Ljava/lang/String;

    .line 243
    .line 244
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 245
    .line 246
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 247
    .line 248
    iget v1, v1, Ll/uow;->S0:I

    .line 249
    .line 250
    iput v1, v0, Ll/wvx;->o1:I

    .line 251
    .line 252
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 253
    .line 254
    invoke-virtual {p0}, Ll/evx;->H()V

    .line 255
    .line 256
    .line 257
    return-void
.end method

.method public V7(IIIII)V
    .locals 4

    .line 1
    new-instance v0, Lio/agora/rtc2/video/VideoEncoderConfiguration;

    .line 2
    .line 3
    invoke-direct {v0}, Lio/agora/rtc2/video/VideoEncoderConfiguration;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p3, v0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->frameRate:I

    .line 7
    .line 8
    new-instance v1, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    .line 9
    .line 10
    invoke-direct {v1}, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;-><init>()V

    .line 11
    .line 12
    .line 13
    iput p1, v1, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;->width:I

    .line 14
    .line 15
    iput p2, v1, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;->height:I

    .line 16
    .line 17
    iput p4, v0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->bitrate:I

    .line 18
    .line 19
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v2}, Ll/csx;->p()Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_0

    .line 28
    .line 29
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v2}, Ll/csx;->q()F

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    int-to-float v3, p4

    .line 38
    mul-float/2addr v2, v3

    .line 39
    float-to-int v2, v2

    .line 40
    iput v2, v0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->minBitrate:I

    .line 41
    .line 42
    :cond_0
    iput-object v1, v0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->dimensions:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    .line 43
    .line 44
    const/16 v1, 0x64

    .line 45
    .line 46
    if-ne p5, v1, :cond_1

    .line 47
    .line 48
    sget-object v1, Lio/agora/rtc2/video/VideoEncoderConfiguration$DEGRADATION_PREFERENCE;->DISABLED:Lio/agora/rtc2/video/VideoEncoderConfiguration$DEGRADATION_PREFERENCE;

    .line 49
    .line 50
    iput-object v1, v0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->degradationPrefer:Lio/agora/rtc2/video/VideoEncoderConfiguration$DEGRADATION_PREFERENCE;

    .line 51
    .line 52
    iput p5, p0, Ll/tc0;->d3:I

    .line 53
    .line 54
    :cond_1
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 55
    .line 56
    new-instance v2, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    const-string v3, "width:"

    .line 59
    .line 60
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string p1, ",height:"

    .line 67
    .line 68
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    const-string p1, ",fps:"

    .line 75
    .line 76
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    const-string p1, ", bitrate:"

    .line 83
    .line 84
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    const-string p1, ",min:"

    .line 91
    .line 92
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-virtual {p1}, Ll/csx;->p()Z

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    const-string p1, ",degradationPrefer:"

    .line 107
    .line 108
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v2, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    const-string p2, "setVideoProfile"

    .line 119
    .line 120
    filled-new-array {p2, p1}, [Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-virtual {v1, p1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 125
    .line 126
    .line 127
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 128
    .line 129
    if-eqz p0, :cond_2

    .line 130
    .line 131
    invoke-virtual {p0, v0}, Lio/agora/rtc2/RtcEngine;->setVideoEncoderConfiguration(Lio/agora/rtc2/video/VideoEncoderConfiguration;)I

    .line 132
    .line 133
    .line 134
    :cond_2
    return-void
.end method

.method public W0()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public W6(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_1

    .line 7
    .line 8
    iget-boolean p1, p0, Ll/tc0;->e1:Z

    .line 9
    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lio/agora/rtc2/RtcEngine;->registerAudioFrameObserver(Lio/agora/rtc2/IAudioFrameObserver;)I

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 16
    .line 17
    const-string v0, "registerAudioFrameObserver 2417"

    .line 18
    .line 19
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p1, v0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 27
    .line 28
    invoke-virtual {p1, p0}, Lio/agora/rtc2/RtcEngine;->registerAudioFrameObserver(Lio/agora/rtc2/IAudioFrameObserver;)I

    .line 29
    .line 30
    .line 31
    :cond_0
    const/4 p1, 0x1

    .line 32
    iput-boolean p1, p0, Ll/tc0;->e1:Z

    .line 33
    .line 34
    const-string p0, "lqdebug"

    .line 35
    .line 36
    const-string p1, "registerAudioFrameObserver this"

    .line 37
    .line 38
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    iget-boolean p1, p0, Ll/tc0;->A3:Z

    .line 43
    .line 44
    if-nez p1, :cond_2

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Lio/agora/rtc2/RtcEngine;->registerAudioFrameObserver(Lio/agora/rtc2/IAudioFrameObserver;)I

    .line 47
    .line 48
    .line 49
    const/4 p1, 0x0

    .line 50
    iput-boolean p1, p0, Ll/tc0;->e1:Z

    .line 51
    .line 52
    :cond_2
    return-void
.end method

.method public W7(Ll/gkl0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tc0;->b1:Ll/gkl0;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    invoke-virtual {p0, p1}, Ll/tc0;->Y7(I)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public X()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/tc0;->f1:Z

    .line 3
    .line 4
    return-void
.end method

.method public X0()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    return-wide v0
.end method

.method public X5(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lio/agora/rtc2/RtcEngine;->enableAudio()I

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Lio/agora/rtc2/RtcEngine;->disableAudio()I

    .line 12
    .line 13
    .line 14
    :cond_1
    return-void
.end method

.method public X6(II)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 6
    .line 7
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const-string v3, "enableDualStreamMode"

    .line 16
    .line 17
    filled-new-array {v3, v1, v2}, [Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 25
    .line 26
    if-nez p2, :cond_0

    .line 27
    .line 28
    const/4 p2, 0x0

    .line 29
    invoke-virtual {p0, p1, p2}, Lio/agora/rtc2/RtcEngine;->setRemoteVideoStreamType(II)I

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    const/4 p2, 0x1

    .line 34
    invoke-virtual {p0, p1, p2}, Lio/agora/rtc2/RtcEngine;->setRemoteVideoStreamType(II)I

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public X7(ID)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lio/agora/rtc2/internal/RtcEngineImpl;

    .line 6
    .line 7
    const-wide/high16 v0, 0x4059000000000000L    # 100.0

    .line 8
    .line 9
    mul-double/2addr p2, v0

    .line 10
    invoke-virtual {p0, p1, p2, p3}, Lio/agora/rtc2/internal/RtcEngineImpl;->setVolumeOfEffect(ID)I

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public Y(Ll/g510;Ll/uow;)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Y(Ll/g510;Ll/uow;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/tc0;->J0:Ll/g510;

    .line 5
    .line 6
    if-nez p2, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    move-object p1, p2

    .line 10
    check-cast p1, Ll/ror;

    .line 11
    .line 12
    iput-object p1, p0, Ll/tc0;->o1:Ll/ror;

    .line 13
    .line 14
    iget-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 15
    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v1, "resetCodec:width"

    .line 19
    .line 20
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget v1, p2, Ll/tow;->m:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v1, ",height:"

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    iget v1, p2, Ll/tow;->n:I

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string v1, ", videoBit:"

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    iget p2, p2, Ll/tow;->H:I

    .line 44
    .line 45
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    invoke-virtual {p1, p2}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    invoke-direct {p0}, Ll/tc0;->P7()V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Ll/tc0;->J0:Ll/g510;

    .line 63
    .line 64
    if-eqz p1, :cond_1

    .line 65
    .line 66
    invoke-virtual {p1}, Ll/g510;->l()Landroid/opengl/EGLContext;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    iput-object p1, p0, Ll/tc0;->W:Landroid/opengl/EGLContext;

    .line 71
    .line 72
    :cond_1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    new-instance p2, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    const-string v0, "videoWidth:"

    .line 79
    .line 80
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 84
    .line 85
    iget v0, v0, Ll/tow;->s:I

    .line 86
    .line 87
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    const-string v0, ",videoHeight:"

    .line 91
    .line 92
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 96
    .line 97
    iget v0, v0, Ll/tow;->t:I

    .line 98
    .line 99
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    const-string v0, ",visualWidth:"

    .line 103
    .line 104
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 108
    .line 109
    iget v0, v0, Ll/tow;->u:I

    .line 110
    .line 111
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    const-string v0, ",visualHeight:"

    .line 115
    .line 116
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 120
    .line 121
    iget v0, v0, Ll/tow;->v:I

    .line 122
    .line 123
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    const-string v0, ",encodeWidth:"

    .line 127
    .line 128
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 132
    .line 133
    iget v0, v0, Ll/tow;->m:I

    .line 134
    .line 135
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    const-string v0, ",encodeHeight:"

    .line 139
    .line 140
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 144
    .line 145
    iget v0, v0, Ll/tow;->n:I

    .line 146
    .line 147
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    const-string v0, ",videoBitrate:"

    .line 151
    .line 152
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 156
    .line 157
    iget v0, v0, Ll/tow;->H:I

    .line 158
    .line 159
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    const-string v0, ",audioBitrate:"

    .line 163
    .line 164
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 168
    .line 169
    iget v0, v0, Ll/tow;->S:I

    .line 170
    .line 171
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    const-string v0, ",videoFPS:"

    .line 175
    .line 176
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 180
    .line 181
    iget v0, v0, Ll/tow;->F:I

    .line 182
    .line 183
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    const-string v0, ",codecFPS:"

    .line 187
    .line 188
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 192
    .line 193
    iget v1, v1, Ll/uow;->E0:I

    .line 194
    .line 195
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    const-string v1, ",mergeCanvasWidth:"

    .line 199
    .line 200
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 204
    .line 205
    check-cast v1, Ll/ror;

    .line 206
    .line 207
    iget v1, v1, Ll/tow;->k:I

    .line 208
    .line 209
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    const-string v1, ",mergeCanvasHeight:"

    .line 213
    .line 214
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 218
    .line 219
    check-cast v1, Ll/ror;

    .line 220
    .line 221
    iget v1, v1, Ll/tow;->l:I

    .line 222
    .line 223
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 224
    .line 225
    .line 226
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 227
    .line 228
    .line 229
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 230
    .line 231
    iget v0, v0, Ll/uow;->E0:I

    .line 232
    .line 233
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 234
    .line 235
    .line 236
    const-string v0, ",isHard:"

    .line 237
    .line 238
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 239
    .line 240
    .line 241
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 242
    .line 243
    iget-object p0, p0, Ll/uow;->A0:Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;

    .line 244
    .line 245
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object p0

    .line 252
    const-string p2, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 253
    .line 254
    invoke-virtual {p1, p2, p0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 255
    .line 256
    .line 257
    return-void
.end method

.method public Y0()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->O0:Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;->txVideoKBitRate:I

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public Y5(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/tc0;->D2:Z

    .line 2
    .line 3
    return-void
.end method

.method public Y6()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lio/agora/rtc2/internal/RtcEngineImpl;

    .line 6
    .line 7
    invoke-virtual {p0}, Lio/agora/rtc2/internal/RtcEngineImpl;->resumeAllEffects()I

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public Y7(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    const-string v1, "setYuvCallback 0115fix"

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    :try_start_0
    iget-object v0, p0, Ll/tc0;->E1:Lcom/immomo/mediacore/sink/CongressUtil;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    if-ne p1, v1, :cond_0

    .line 22
    .line 23
    iget-object v1, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 24
    .line 25
    invoke-virtual {v1}, Lio/agora/rtc2/RtcEngine;->getNativeHandle()J

    .line 26
    .line 27
    .line 28
    move-result-wide v1

    .line 29
    invoke-virtual {v0, v1, v2}, Lcom/immomo/mediacore/sink/CongressUtil;->setRtcEngineHandler(J)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const-wide/16 v1, 0x0

    .line 34
    .line 35
    invoke-virtual {v0, v1, v2}, Lcom/immomo/mediacore/sink/CongressUtil;->setRtcEngineHandler(J)V

    .line 36
    .line 37
    .line 38
    :goto_0
    iget-object p0, p0, Ll/tc0;->E1:Lcom/immomo/mediacore/sink/CongressUtil;

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/CongressUtil;->setYuvCallback(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :catch_0
    move-exception p0

    .line 45
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 46
    .line 47
    .line 48
    goto :goto_1

    .line 49
    :catch_1
    move-exception p0

    .line 50
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 51
    .line 52
    .line 53
    :cond_1
    :goto_1
    return-void
.end method

.method public Z5(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public Z6(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lio/agora/rtc2/internal/RtcEngineImpl;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lio/agora/rtc2/internal/RtcEngineImpl;->resumeEffect(I)I

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public Z7(ILandroid/view/View;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/csx;->b()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/tc0;->l3:Landroid/os/Handler;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    new-instance v1, Ll/tc0$a;

    .line 16
    .line 17
    invoke-direct {v1, p0, p1, p2}, Ll/tc0$a;-><init>(Ll/tc0;ILandroid/view/View;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/os/Handler;->postAtFrontOfQueue(Ljava/lang/Runnable;)Z

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 25
    .line 26
    new-instance v1, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v2, ",view is "

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    const-string v2, "old setupRemoteVideo"

    .line 47
    .line 48
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 56
    .line 57
    if-eqz p0, :cond_1

    .line 58
    .line 59
    new-instance v0, Lio/agora/rtc2/video/VideoCanvas;

    .line 60
    .line 61
    const/4 v1, 0x1

    .line 62
    invoke-direct {v0, p2, v1, p1}, Lio/agora/rtc2/video/VideoCanvas;-><init>(Landroid/view/View;II)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, v0}, Lio/agora/rtc2/RtcEngine;->setupRemoteVideo(Lio/agora/rtc2/video/VideoCanvas;)I

    .line 66
    .line 67
    .line 68
    :cond_1
    return-void
.end method

.method public a0()J
    .locals 2

    .line 1
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/u6y;->l()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public a6(ZLjava/lang/String;)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/tc0;->L1:Z

    .line 2
    .line 3
    iput-object p2, p0, Ll/tc0;->K1:Ljava/lang/String;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-lez p1, :cond_0

    .line 18
    .line 19
    new-instance p1, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string p2, "agora_sdk_ver: "

    .line 22
    .line 23
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Lio/agora/rtc2/RtcEngine;->getSdkVersion()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    const-string p2, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 38
    .line 39
    invoke-static {p2, p1}, Ll/t9c;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 43
    .line 44
    const-string p2, "{\"rtc.log_filter\":34781}"

    .line 45
    .line 46
    invoke-virtual {p1, p2}, Lio/agora/rtc2/RtcEngine;->setParameters(Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 50
    .line 51
    iget-object p2, p0, Ll/tc0;->K1:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {p1, p2}, Lio/agora/rtc2/RtcEngine;->setLogFile(Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 57
    .line 58
    const/16 p1, 0xf

    .line 59
    .line 60
    invoke-virtual {p0, p1}, Lio/agora/rtc2/RtcEngine;->setLogFilter(I)I

    .line 61
    .line 62
    .line 63
    :cond_0
    return-void
.end method

.method public a7()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    const-string v1, "resumeRecording"

    .line 4
    .line 5
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v0, v2}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const-string v2, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 17
    .line 18
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-boolean v0, p0, Ll/tc0;->n3:Z

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/tc0;->G6(Z)V

    .line 28
    .line 29
    .line 30
    const/4 v0, 0x1

    .line 31
    iput-boolean v0, p0, Ll/tc0;->X:Z

    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public b0()V
    .locals 0

    .line 1
    return-void
.end method

.method public b1()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    return-wide v0
.end method

.method public b6(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    const-string v1, "enableDualStreamMode"

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v2, "call enableDualStreamMode:"

    .line 23
    .line 24
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const-string v2, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 35
    .line 36
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iput-boolean p1, p0, Ll/tc0;->G0:Z

    .line 40
    .line 41
    return-void
.end method

.method public b7()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lio/agora/rtc2/RtcEngine;->resumeAudioMixing()I

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public b8()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/tc0;->A3:Z

    .line 3
    .line 4
    iget-boolean v0, p0, Ll/tc0;->e1:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Lio/agora/rtc2/RtcEngine;->registerAudioFrameObserver(Lio/agora/rtc2/IAudioFrameObserver;)I

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 15
    .line 16
    const-string v1, "registerAudioFrameObserver 4416"

    .line 17
    .line 18
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 26
    .line 27
    invoke-virtual {v0, p0}, Lio/agora/rtc2/RtcEngine;->registerAudioFrameObserver(Lio/agora/rtc2/IAudioFrameObserver;)I

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public c0()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    return-wide v0
.end method

.method public c1()I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public c2()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    iget-wide v0, v0, Ll/wvx;->c1:J

    .line 4
    .line 5
    const-wide/16 v2, 0x1

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/tc0;->h2()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0}, Ll/tc0;->f2()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public c6(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const v1, 0x8000

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1, v1}, Lio/agora/rtc2/RtcEngine;->enableInEarMonitoring(ZI)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    :goto_0
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 15
    .line 16
    new-instance v1, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v2, "agora enableInEarMonitoring enable "

    .line 19
    .line 20
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const-string v1, "ret:"

    .line 31
    .line 32
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    filled-new-array {p1, v1, v0}, [Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0, p1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public c7(I)I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "selectAudioTrack:"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 25
    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Lio/agora/rtc2/RtcEngine;->selectAudioTrack(I)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0

    .line 33
    :cond_0
    const/4 p0, -0x1

    .line 34
    return p0
.end method

.method public c8(Ljava/lang/String;)V
    .locals 5

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 6
    .line 7
    const-string v2, "startSurroundMusic"

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-boolean v0, p0, Ll/tc0;->A1:Z

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    if-ne v0, v1, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 19
    .line 20
    new-instance v3, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v4, ""

    .line 23
    .line 24
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    filled-new-array {v2, v3}, [Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v0, v2}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 42
    .line 43
    const/4 v2, 0x0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    invoke-virtual {v0, p1, v2, v1, v2}, Lio/agora/rtc2/RtcEngine;->startAudioMixing(Ljava/lang/String;ZII)I

    .line 47
    .line 48
    .line 49
    iput-boolean v1, p0, Ll/tc0;->A1:Z

    .line 50
    .line 51
    :cond_1
    const/4 p1, 0x0

    .line 52
    invoke-direct {p0, p1, v1, v2}, Ll/tc0;->O7(Ljava/lang/Object;II)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public d1()V
    .locals 6

    .line 1
    iget-boolean v0, p0, Ll/tc0;->C3:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_2

    .line 6
    :cond_0
    iget v0, p0, Ll/tc0;->y3:I

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-lez v0, :cond_1

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_1
    move v0, v1

    .line 14
    :goto_0
    iget-object v2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 15
    .line 16
    iget-wide v2, v2, Ll/wvx;->c1:J

    .line 17
    .line 18
    const-wide/16 v4, 0x1

    .line 19
    .line 20
    cmp-long v2, v2, v4

    .line 21
    .line 22
    if-nez v2, :cond_2

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/tc0;->V6()V

    .line 25
    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_2
    invoke-virtual {p0}, Ll/tc0;->U6()V

    .line 29
    .line 30
    .line 31
    :goto_1
    if-eqz v0, :cond_4

    .line 32
    .line 33
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 34
    .line 35
    iget-wide v2, v0, Ll/wvx;->g1:J

    .line 36
    .line 37
    iget v4, p0, Ll/tc0;->y3:I

    .line 38
    .line 39
    int-to-long v4, v4

    .line 40
    cmp-long v2, v2, v4

    .line 41
    .line 42
    if-ltz v2, :cond_4

    .line 43
    .line 44
    iget-boolean v2, p0, Ll/tc0;->f3:Z

    .line 45
    .line 46
    if-nez v2, :cond_4

    .line 47
    .line 48
    const-wide/16 v2, 0xe

    .line 49
    .line 50
    iput-wide v2, v0, Ll/wvx;->y0:J

    .line 51
    .line 52
    const/16 v2, 0xe

    .line 53
    .line 54
    iput v2, v0, Ll/wvx;->k0:I

    .line 55
    .line 56
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 57
    .line 58
    const-string v3, "MediaError"

    .line 59
    .line 60
    const-string v4, "14"

    .line 61
    .line 62
    filled-new-array {v3, v4}, [Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-virtual {v0, v3}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Ll/tc0;->g1:Ll/q210$a;

    .line 70
    .line 71
    if-eqz v0, :cond_3

    .line 72
    .line 73
    const/16 v3, 0x1101

    .line 74
    .line 75
    invoke-interface {v0, v3, v2, v1, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    :cond_3
    iget-object v0, p0, Ll/tc0;->l3:Landroid/os/Handler;

    .line 79
    .line 80
    if-eqz v0, :cond_4

    .line 81
    .line 82
    new-instance v1, Ll/tc0$h;

    .line 83
    .line 84
    invoke-direct {v1, p0}, Ll/tc0$h;-><init>(Ll/tc0;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 88
    .line 89
    .line 90
    :cond_4
    :goto_2
    return-void
.end method

.method public d2()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    iget-wide v0, v0, Ll/wvx;->c1:J

    .line 4
    .line 5
    const-wide/16 v2, 0x1

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/tc0;->i2()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0}, Ll/tc0;->g2()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public d6(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    iput v0, p0, Ll/tc0;->H1:I

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    const/4 p1, 0x2

    .line 8
    iput p1, p0, Ll/tc0;->H1:I

    .line 9
    .line 10
    return-void
.end method

.method public d7(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget v2, p0, Ll/tc0;->V:I

    .line 7
    .line 8
    if-ne v2, v1, :cond_0

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    invoke-virtual {v0, v2, v2}, Lio/agora/rtc2/RtcEngine;->createDataStream(ZZ)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Ll/tc0;->V:I

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget p0, p0, Ll/tc0;->V:I

    .line 22
    .line 23
    if-eq p0, v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {v0, p0, p1}, Lio/agora/rtc2/RtcEngine;->sendStreamMessage(I[B)I

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method public d8(Ljava/lang/String;ZZI)V
    .locals 1

    .line 1
    iget-boolean p3, p0, Ll/tc0;->A1:Z

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p3, v0, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    iget-object p3, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 8
    .line 9
    if-eqz p3, :cond_1

    .line 10
    .line 11
    invoke-virtual {p3, p1, p2, p4}, Lio/agora/rtc2/RtcEngine;->startAudioMixing(Ljava/lang/String;ZI)I

    .line 12
    .line 13
    .line 14
    iput-boolean v0, p0, Ll/tc0;->A1:Z

    .line 15
    .line 16
    :cond_1
    const/4 p1, 0x0

    .line 17
    const/4 p2, 0x0

    .line 18
    invoke-direct {p0, p1, v0, p2}, Ll/tc0;->O7(Ljava/lang/Object;II)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public e0()Landroid/view/Surface;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public e1(Ll/l6m;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->e1(Ll/l6m;)V

    .line 2
    .line 3
    .line 4
    instance-of p1, p1, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 9
    .line 10
    const-string v0, "wrap is not ExtAudioWrapper"

    .line 11
    .line 12
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p1, v0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->K:Ll/l6m;

    .line 20
    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    check-cast p1, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/jc00;->r2()V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->K:Ll/l6m;

    .line 29
    .line 30
    check-cast p1, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 31
    .line 32
    new-instance v0, Ll/tc0$d;

    .line 33
    .line 34
    invoke-direct {v0, p0}, Ll/tc0$d;-><init>(Ll/tc0;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, v0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->J2(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$i;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->K:Ll/l6m;

    .line 41
    .line 42
    check-cast p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 43
    .line 44
    const/4 p1, 0x1

    .line 45
    invoke-virtual {p0, p1}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->s1(I)V

    .line 46
    .line 47
    .line 48
    :cond_1
    return-void
.end method

.method public e6(Z)V
    .locals 7

    .line 1
    iput-boolean p1, p0, Ll/tc0;->H0:Z

    .line 2
    .line 3
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 4
    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    if-eqz p1, :cond_2

    .line 8
    .line 9
    iget-object p1, p0, Ll/tc0;->o1:Ll/ror;

    .line 10
    .line 11
    if-eqz p1, :cond_2

    .line 12
    .line 13
    invoke-virtual {v0}, Lio/agora/rtc2/RtcEngine;->enableVideo()I

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    new-instance v0, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v1, "setVideoProfileEx1 bitrate:"

    .line 23
    .line 24
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Ll/tc0;->o1:Ll/ror;

    .line 28
    .line 29
    iget v1, v1, Ll/tow;->H:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v1, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 39
    .line 40
    invoke-virtual {p1, v1, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 44
    .line 45
    const-string v0, "{\"che.video.keyFrameInterval\":1}"

    .line 46
    .line 47
    invoke-virtual {p1, v0}, Lio/agora/rtc2/RtcEngine;->setParameters(Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Ll/tc0;->o1:Ll/ror;

    .line 51
    .line 52
    iget v0, p1, Ll/uow;->S0:I

    .line 53
    .line 54
    if-eqz v0, :cond_0

    .line 55
    .line 56
    :goto_0
    move v4, v0

    .line 57
    goto :goto_1

    .line 58
    :cond_0
    const/16 v0, 0xf

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :goto_1
    iget-boolean v0, p1, Ll/uow;->F0:Z

    .line 62
    .line 63
    if-eqz v0, :cond_1

    .line 64
    .line 65
    invoke-virtual {p1}, Ll/uow;->d()I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    const/4 v0, 0x1

    .line 70
    if-ne p1, v0, :cond_1

    .line 71
    .line 72
    iget-object p1, p0, Ll/tc0;->o1:Ll/ror;

    .line 73
    .line 74
    iget v2, p1, Ll/tow;->n:I

    .line 75
    .line 76
    iget v3, p1, Ll/tow;->m:I

    .line 77
    .line 78
    iget v0, p1, Ll/tow;->H:I

    .line 79
    .line 80
    div-int/lit16 v5, v0, 0x3e8

    .line 81
    .line 82
    iget v6, p1, Ll/uow;->a1:I

    .line 83
    .line 84
    move-object v1, p0

    .line 85
    invoke-virtual/range {v1 .. v6}, Ll/tc0;->V7(IIIII)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_1
    move-object v1, p0

    .line 90
    iget-object p0, v1, Ll/tc0;->o1:Ll/ror;

    .line 91
    .line 92
    iget v2, p0, Ll/tow;->m:I

    .line 93
    .line 94
    iget v3, p0, Ll/tow;->n:I

    .line 95
    .line 96
    iget p1, p0, Ll/tow;->H:I

    .line 97
    .line 98
    div-int/lit16 v5, p1, 0x3e8

    .line 99
    .line 100
    iget v6, p0, Ll/uow;->a1:I

    .line 101
    .line 102
    invoke-virtual/range {v1 .. v6}, Ll/tc0;->V7(IIIII)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_2
    invoke-virtual {v0}, Lio/agora/rtc2/RtcEngine;->disableVideo()I

    .line 107
    .line 108
    .line 109
    :cond_3
    return-void
.end method

.method public e7([B)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget v2, p0, Ll/tc0;->V:I

    .line 7
    .line 8
    if-ne v2, v1, :cond_0

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    invoke-virtual {v0, v2, v2}, Lio/agora/rtc2/RtcEngine;->createDataStream(ZZ)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Ll/tc0;->V:I

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget p0, p0, Ll/tc0;->V:I

    .line 22
    .line 23
    if-eq p0, v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v0, p0, p1}, Lio/agora/rtc2/RtcEngine;->sendStreamMessage(I[B)I

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public e8()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lio/agora/rtc2/internal/RtcEngineImpl;

    .line 6
    .line 7
    invoke-virtual {p0}, Lio/agora/rtc2/internal/RtcEngineImpl;->stopAllEffects()I

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public f()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    const-string v1, "stopRecord"

    .line 4
    .line 5
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const-string v1, "AgoraPushFilter stopRecord"

    .line 17
    .line 18
    const-string v2, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 19
    .line 20
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    iput-boolean v0, p0, Ll/tc0;->X:Z

    .line 25
    .line 26
    iget-object v1, p0, Ll/tc0;->K0:Ll/dc1;

    .line 27
    .line 28
    const/4 v3, 0x0

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    invoke-virtual {v1}, Ll/dc1;->f()V

    .line 32
    .line 33
    .line 34
    iput-object v3, p0, Ll/tc0;->K0:Ll/dc1;

    .line 35
    .line 36
    :cond_0
    iput v0, p0, Ll/tc0;->X0:I

    .line 37
    .line 38
    invoke-super {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->f()V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/tc0;->c2:Ll/tc0$l;

    .line 42
    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    invoke-virtual {v0}, Ll/tc0$l;->a()V

    .line 46
    .line 47
    .line 48
    iput-object v3, p0, Ll/tc0;->c2:Ll/tc0$l;

    .line 49
    .line 50
    :cond_1
    invoke-virtual {p0}, Ll/tc0;->stopSurroundMusic()V

    .line 51
    .line 52
    .line 53
    invoke-direct {p0}, Ll/tc0;->release()V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ll/tc0;->Z2:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 57
    .line 58
    if-eqz v0, :cond_2

    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/util/AbstractMap;->clear()V

    .line 61
    .line 62
    .line 63
    :cond_2
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->K:Ll/l6m;

    .line 64
    .line 65
    if-eqz v0, :cond_3

    .line 66
    .line 67
    check-cast v0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 68
    .line 69
    iget-object v1, p0, Ll/tc0;->o1:Ll/ror;

    .line 70
    .line 71
    iget v4, v1, Ll/tow;->P:I

    .line 72
    .line 73
    iget v1, v1, Ll/tow;->R:I

    .line 74
    .line 75
    const-string v5, "Momo"

    .line 76
    .line 77
    const/16 v6, 0x800

    .line 78
    .line 79
    invoke-virtual {v0, v6, v4, v1, v5}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->I2(IIILjava/lang/String;)V

    .line 80
    .line 81
    .line 82
    :cond_3
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->K:Ll/l6m;

    .line 83
    .line 84
    if-eqz v0, :cond_4

    .line 85
    .line 86
    invoke-interface {v0, v3}, Ll/l6m;->G1(Ll/gb1;)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->K:Ll/l6m;

    .line 90
    .line 91
    invoke-interface {v0, v3}, Ll/l6m;->V(Ll/hb1;)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->K:Ll/l6m;

    .line 95
    .line 96
    invoke-interface {v0, v3}, Ll/l6m;->R(Ll/fb1;)V

    .line 97
    .line 98
    .line 99
    iput-object v3, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->K:Ll/l6m;

    .line 100
    .line 101
    :cond_4
    invoke-super {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->p2()V

    .line 102
    .line 103
    .line 104
    invoke-static {}, Ll/yt0;->g()Ll/yt0;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    sget v1, Ll/yt0;->f:I

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Ll/yt0;->q(I)V

    .line 111
    .line 112
    .line 113
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    const/4 v1, 0x1

    .line 118
    invoke-virtual {v0, v1}, Ll/csx;->C1(I)V

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Ll/tc0;->S0:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 122
    .line 123
    if-eqz v0, :cond_5

    .line 124
    .line 125
    invoke-virtual {v0}, Ljava/util/AbstractMap;->isEmpty()Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-nez v0, :cond_5

    .line 130
    .line 131
    new-instance v0, Ljava/lang/StringBuilder;

    .line 132
    .line 133
    const-string v1, "stopRecord memberInfoMap "

    .line 134
    .line 135
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    iget-object v1, p0, Ll/tc0;->S0:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 139
    .line 140
    invoke-virtual {v1}, Ljava/util/AbstractMap;->size()I

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    const-string v1, "zhengjijian"

    .line 152
    .line 153
    invoke-static {v1, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    .line 155
    .line 156
    iget-object v0, p0, Ll/tc0;->S0:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 157
    .line 158
    invoke-virtual {v0}, Ljava/util/AbstractMap;->clear()V

    .line 159
    .line 160
    .line 161
    :cond_5
    iget-object v0, p0, Ll/tc0;->R0:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 162
    .line 163
    if-eqz v0, :cond_6

    .line 164
    .line 165
    invoke-virtual {v0}, Ljava/util/AbstractMap;->isEmpty()Z

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    if-nez v0, :cond_6

    .line 170
    .line 171
    iget-object p0, p0, Ll/tc0;->R0:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 172
    .line 173
    invoke-virtual {p0}, Ljava/util/AbstractMap;->clear()V

    .line 174
    .line 175
    .line 176
    :cond_6
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    const-string v0, "stopRecordOK!!!!!!!!!!!!!!!!!!!!"

    .line 181
    .line 182
    invoke-virtual {p0, v2, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    return-void
.end method

.method public f2()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    iget-boolean v1, p0, Ll/tc0;->z3:Z

    .line 4
    .line 5
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "pullStart_v3"

    .line 10
    .line 11
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    iget-boolean v0, p0, Ll/tc0;->z3:Z

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const/4 v0, 0x1

    .line 24
    iput-boolean v0, p0, Ll/tc0;->z3:Z

    .line 25
    .line 26
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 27
    .line 28
    iget-object v1, p0, Ll/tc0;->Y0:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    iget-object v1, p0, Ll/tc0;->r1:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-nez v1, :cond_1

    .line 43
    .line 44
    const-wide/16 v1, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    const-wide/16 v1, 0x0

    .line 48
    .line 49
    :goto_0
    iput-wide v1, v0, Ll/wvx;->f1:J

    .line 50
    .line 51
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 52
    .line 53
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 54
    .line 55
    .line 56
    move-result-wide v1

    .line 57
    iput-wide v1, v0, Ll/wvx;->a:J

    .line 58
    .line 59
    iget-wide v0, p0, Ll/tc0;->g3:J

    .line 60
    .line 61
    const-wide/16 v2, -0x1

    .line 62
    .line 63
    cmp-long v2, v0, v2

    .line 64
    .line 65
    iget-object v3, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 66
    .line 67
    if-nez v2, :cond_2

    .line 68
    .line 69
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 70
    .line 71
    .line 72
    move-result-wide v0

    .line 73
    iget-object v2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 74
    .line 75
    iget-wide v4, v2, Ll/wvx;->e:J

    .line 76
    .line 77
    sub-long/2addr v0, v4

    .line 78
    iput-wide v0, v3, Ll/wvx;->e:J

    .line 79
    .line 80
    iget-wide v0, v2, Ll/wvx;->e:J

    .line 81
    .line 82
    iput-wide v0, p0, Ll/tc0;->g3:J

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_2
    iput-wide v0, v3, Ll/wvx;->e:J

    .line 86
    .line 87
    :goto_1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 88
    .line 89
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 90
    .line 91
    .line 92
    move-result-wide v1

    .line 93
    iget-object v3, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 94
    .line 95
    iget-wide v3, v3, Ll/wvx;->f:J

    .line 96
    .line 97
    sub-long/2addr v1, v3

    .line 98
    iput-wide v1, v0, Ll/wvx;->f:J

    .line 99
    .line 100
    invoke-super {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->f2()V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public f6(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lio/agora/rtc2/RtcEngine;->enableWebSdkInteroperability(Z)I

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public f7(Z)V
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 8
    .line 9
    const-string v2, "set double push"

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iput-boolean p1, p0, Ll/tc0;->d2:Z

    .line 15
    .line 16
    iput-boolean p1, p0, Ll/tc0;->v1:Z

    .line 17
    .line 18
    return-void
.end method

.method public f8(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lio/agora/rtc2/internal/RtcEngineImpl;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lio/agora/rtc2/internal/RtcEngineImpl;->stopEffect(I)I

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public g0()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    return-wide v0
.end method

.method public g1(IILjava/lang/Object;)Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    return-object p0
.end method

.method public g2()V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/tc0;->z3:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 5
    .line 6
    const-string v1, "pullStop_v3"

    .line 7
    .line 8
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 16
    .line 17
    iget v1, p0, Ll/tc0;->j3:I

    .line 18
    .line 19
    iput v1, v0, Ll/wvx;->j0:I

    .line 20
    .line 21
    iget-boolean v1, v0, Ll/wvx;->b:Z

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 26
    .line 27
    .line 28
    move-result-wide v1

    .line 29
    iget-object v3, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 30
    .line 31
    iget-wide v3, v3, Ll/wvx;->a:J

    .line 32
    .line 33
    sub-long/2addr v1, v3

    .line 34
    iput-wide v1, v0, Ll/wvx;->h:J

    .line 35
    .line 36
    :cond_0
    invoke-super {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->g2()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public g6(II)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Lio/agora/rtc2/RtcEngine;->setAudioProfile(II)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    new-instance v1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v2, "profile:"

    .line 15
    .line 16
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v2, ",scenario:"

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    const-string v1, "setAudioProfile"

    .line 35
    .line 36
    filled-new-array {v1, p2}, [Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    invoke-virtual {v0, p2}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    iget-object p2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 44
    .line 45
    invoke-direct {p0, p1}, Ll/tc0;->k6(I)I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    int-to-long p0, p0

    .line 50
    iput-wide p0, p2, Ll/wvx;->C0:J

    .line 51
    .line 52
    :cond_1
    return-void
.end method

.method public g7(I)I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    const-string v1, "setAudioEffectPreset"

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ll/ma1;->b()Ll/ma1;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0, p1}, Ll/ma1;->a(I)I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    const/4 v0, -0x1

    .line 25
    if-eq p1, v0, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 28
    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Lio/agora/rtc2/RtcEngine;->setAudioEffectPreset(I)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0

    .line 36
    :cond_0
    return v0
.end method

.method public g8()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/tc0;->e1:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, v1}, Lio/agora/rtc2/RtcEngine;->registerAudioFrameObserver(Lio/agora/rtc2/IAudioFrameObserver;)I

    .line 9
    .line 10
    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Ll/tc0;->A3:Z

    .line 13
    .line 14
    return-void
.end method

.method public getEarMonitoringAudioParams()Lio/agora/rtc2/audio/AudioParams;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getFilter()Lcom/momo/pipline/codec/MediaBaseCodecFilter;
    .locals 0

    .line 1
    return-object p0
.end method

.method public getMixedAudioParams()Lio/agora/rtc2/audio/AudioParams;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getObservedAudioFramePosition()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getPlaybackAudioParams()Lio/agora/rtc2/audio/AudioParams;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getRecordAudioParams()Lio/agora/rtc2/audio/AudioParams;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getRoomType()I
    .locals 0

    .line 1
    iget p0, p0, Ll/tc0;->p1:I

    .line 2
    .line 3
    return p0
.end method

.method public getServerIpAddr()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "0.0.0.0"

    .line 2
    .line 3
    return-object p0
.end method

.method public getVideoWidth()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/tc0;->w1:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/tc0;->v1:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 11
    .line 12
    iget p0, p0, Ll/tow;->m:I

    .line 13
    .line 14
    return p0

    .line 15
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public h0()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->O0:Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;->rxBytes:I

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public h1()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->O0:Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;->txAudioKBitRate:I

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public h2()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    iget-boolean v1, p0, Ll/tc0;->z3:Z

    .line 4
    .line 5
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "pushStart_v3"

    .line 10
    .line 11
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    iget-boolean v0, p0, Ll/tc0;->z3:Z

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const/4 v0, 0x1

    .line 24
    iput-boolean v0, p0, Ll/tc0;->z3:Z

    .line 25
    .line 26
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 27
    .line 28
    iget-object v1, p0, Ll/tc0;->Y0:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    const-wide/16 v2, 0x0

    .line 35
    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    iget-object v1, p0, Ll/tc0;->r1:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-nez v1, :cond_1

    .line 45
    .line 46
    const-wide/16 v4, 0x1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    move-wide v4, v2

    .line 50
    :goto_0
    iput-wide v4, v0, Ll/wvx;->f1:J

    .line 51
    .line 52
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 53
    .line 54
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 55
    .line 56
    .line 57
    move-result-wide v4

    .line 58
    iput-wide v4, v0, Ll/wvx;->a:J

    .line 59
    .line 60
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 61
    .line 62
    invoke-virtual {p0}, Ll/tc0;->getVideoWidth()I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    int-to-long v4, v1

    .line 67
    iput-wide v4, v0, Ll/wvx;->v:J

    .line 68
    .line 69
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 70
    .line 71
    invoke-virtual {p0}, Ll/tc0;->k0()I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    int-to-long v4, v1

    .line 76
    iput-wide v4, v0, Ll/wvx;->w:J

    .line 77
    .line 78
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 79
    .line 80
    invoke-virtual {p0}, Ll/tc0;->p1()I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    int-to-long v4, v1

    .line 85
    iput-wide v4, v0, Ll/wvx;->z:J

    .line 86
    .line 87
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 88
    .line 89
    invoke-virtual {p0}, Ll/tc0;->A0()I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    int-to-long v4, v1

    .line 94
    iput-wide v4, v0, Ll/wvx;->A:J

    .line 95
    .line 96
    iget-wide v0, p0, Ll/tc0;->g3:J

    .line 97
    .line 98
    const-wide/16 v4, -0x1

    .line 99
    .line 100
    cmp-long v4, v0, v4

    .line 101
    .line 102
    iget-object v5, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 103
    .line 104
    if-nez v4, :cond_2

    .line 105
    .line 106
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 107
    .line 108
    .line 109
    move-result-wide v0

    .line 110
    iget-object v4, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 111
    .line 112
    iget-wide v6, v4, Ll/wvx;->e:J

    .line 113
    .line 114
    sub-long/2addr v0, v6

    .line 115
    iput-wide v0, v5, Ll/wvx;->e:J

    .line 116
    .line 117
    iget-wide v0, v4, Ll/wvx;->e:J

    .line 118
    .line 119
    iput-wide v0, p0, Ll/tc0;->g3:J

    .line 120
    .line 121
    goto :goto_1

    .line 122
    :cond_2
    iput-wide v0, v5, Ll/wvx;->e:J

    .line 123
    .line 124
    :goto_1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 125
    .line 126
    iget-object v1, p0, Ll/tc0;->o1:Ll/ror;

    .line 127
    .line 128
    iget-boolean v1, v1, Ll/uow;->X0:Z

    .line 129
    .line 130
    iput v1, v0, Ll/wvx;->h1:I

    .line 131
    .line 132
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 133
    .line 134
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 135
    .line 136
    iget-boolean v1, v1, Ll/uow;->H0:Z

    .line 137
    .line 138
    if-eqz v1, :cond_3

    .line 139
    .line 140
    const-wide/16 v2, 0x2

    .line 141
    .line 142
    :cond_3
    iput-wide v2, v0, Ll/wvx;->g:J

    .line 143
    .line 144
    iput v1, v0, Ll/wvx;->k1:I

    .line 145
    .line 146
    invoke-super {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->h2()V

    .line 147
    .line 148
    .line 149
    return-void
.end method

.method public h7(I)I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "setAudioMixingDualMonoMode:"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    invoke-static {}, Lio/agora/rtc2/Constants$AudioMixingDualMonoMode;->values()[Lio/agora/rtc2/Constants$AudioMixingDualMonoMode;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    aget-object p1, v0, p1

    .line 29
    .line 30
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 31
    .line 32
    if-eqz p0, :cond_0

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Lio/agora/rtc2/RtcEngine;->setAudioMixingDualMonoMode(Lio/agora/rtc2/Constants$AudioMixingDualMonoMode;)I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0

    .line 39
    :cond_0
    const/4 p0, -0x1

    .line 40
    return p0
.end method

.method public h8(Ljava/lang/String;Ljava/lang/String;)I
    .locals 4

    .line 1
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, -0x4

    .line 6
    return p0

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 8
    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v2, "isStartMediaRelay:"

    .line 12
    .line 13
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-boolean v2, p0, Ll/tc0;->e3:Z

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v2, ",my:"

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    iget-object v2, p0, Ll/tc0;->o1:Ll/ror;

    .line 27
    .line 28
    iget v2, v2, Ll/ror;->i1:I

    .line 29
    .line 30
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const-string v2, "subscribeOhterRoom"

    .line 38
    .line 39
    filled-new-array {v2, p1, p2, v1}, [Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 47
    .line 48
    iget-boolean v0, v0, Ll/wvx;->b:Z

    .line 49
    .line 50
    const-string v1, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 51
    .line 52
    const/4 v2, 0x1

    .line 53
    if-ne v0, v2, :cond_1

    .line 54
    .line 55
    iget-object v0, p0, Ll/tc0;->o1:Ll/ror;

    .line 56
    .line 57
    if-eqz v0, :cond_1

    .line 58
    .line 59
    invoke-direct {p0, p1}, Ll/tc0;->a8(Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v2, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    const-string v3, "lqdebug startChannelMediaRelay ret "

    .line 70
    .line 71
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const-string v3, "channelid ="

    .line 78
    .line 79
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    const-string v3, "myUid ="

    .line 86
    .line 87
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    invoke-virtual {v0, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_1
    iput-boolean v2, p0, Ll/tc0;->i2:Z

    .line 102
    .line 103
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    iput-object v0, p0, Ll/tc0;->j2:Ljava/lang/String;

    .line 108
    .line 109
    const/4 p0, 0x0

    .line 110
    :goto_0
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    new-instance v2, Ljava/lang/StringBuilder;

    .line 115
    .line 116
    const-string v3, "lqdebug startChannelMediaRelay channelid ="

    .line 117
    .line 118
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    const-string p1, "dstUid ="

    .line 125
    .line 126
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    invoke-virtual {v0, v1, p1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    return p0
.end method

.method public i2()V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/tc0;->z3:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 5
    .line 6
    const-string v1, "pushStop_v3"

    .line 7
    .line 8
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 16
    .line 17
    iget v1, p0, Ll/tc0;->j3:I

    .line 18
    .line 19
    iput v1, v0, Ll/wvx;->j0:I

    .line 20
    .line 21
    iget-boolean v1, v0, Ll/wvx;->b:Z

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 26
    .line 27
    .line 28
    move-result-wide v1

    .line 29
    iget-object v3, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 30
    .line 31
    iget-wide v3, v3, Ll/wvx;->a:J

    .line 32
    .line 33
    sub-long/2addr v1, v3

    .line 34
    iput-wide v1, v0, Ll/wvx;->h:J

    .line 35
    .line 36
    :cond_0
    invoke-super {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->i2()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public i6(JZ)V
    .locals 0

    .line 1
    return-void
.end method

.method public i7(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lio/agora/rtc2/RtcEngine;->setAudioMixingPitch(I)I

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public i8(III)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/tc0;->b1:Ll/gkl0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    int-to-long v1, p1

    .line 6
    new-instance v3, Ll/tc0$b;

    .line 7
    .line 8
    invoke-direct {v3, p0, p2, p3, p1}, Ll/tc0$b;-><init>(Ll/tc0;III)V

    .line 9
    .line 10
    .line 11
    move v4, p2

    .line 12
    move v5, p3

    .line 13
    invoke-interface/range {v0 .. v5}, Ll/gkl0;->c(JLl/gkl0$b;II)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public j1(IILjava/lang/Object;)J
    .locals 0

    .line 1
    const-wide/16 p0, 0x0

    .line 2
    .line 3
    return-wide p0
.end method

.method public j6(I)I
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    const/4 p0, 0x2

    .line 4
    if-eq p1, p0, :cond_0

    .line 5
    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x5

    .line 8
    return p0

    .line 9
    :cond_1
    const/4 p0, 0x1

    .line 10
    return p0
.end method

.method public j7(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/tc0;->w1:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    iput-boolean p1, p0, Ll/tc0;->H0:Z

    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public j8(I)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/tc0;->b1:Ll/gkl0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    int-to-long v1, p1

    .line 6
    new-instance v3, Ll/tc0$k;

    .line 7
    .line 8
    invoke-direct {v3, p0, p1}, Ll/tc0$k;-><init>(Ll/tc0;I)V

    .line 9
    .line 10
    .line 11
    iget v4, p0, Ll/wej;->width:I

    .line 12
    .line 13
    iget v5, p0, Ll/wej;->height:I

    .line 14
    .line 15
    invoke-interface/range {v0 .. v5}, Ll/gkl0;->a(JLl/gkl0$c;II)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public k0()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/tc0;->w1:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/tc0;->v1:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 11
    .line 12
    iget p0, p0, Ll/tow;->n:I

    .line 13
    .line 14
    return p0

    .line 15
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public k7(II)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "profile:"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, ",scenario:"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-string v2, "setmmLiveAudioProfile"

    .line 26
    .line 27
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    iput p1, p0, Ll/tc0;->E0:I

    .line 35
    .line 36
    iput p2, p0, Ll/tc0;->F0:I

    .line 37
    .line 38
    return-void
.end method

.method public k8(Ljava/lang/String;)I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    const-string v1, "unSubscribeOtherRoom"

    .line 4
    .line 5
    filled-new-array {v1, p1}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {v0, p1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p1}, Lio/agora/rtc2/RtcEngine;->stopChannelMediaRelay()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 21
    .line 22
    new-instance v1, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    const-string v2, "stopChannelMediaRelay ret:"

    .line 25
    .line 26
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const-string v1, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 48
    .line 49
    const-string v2, "lqdebug stopChannelMediaRelay "

    .line 50
    .line 51
    invoke-virtual {v0, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    const/4 v0, 0x0

    .line 55
    iput-boolean v0, p0, Ll/tc0;->e3:Z

    .line 56
    .line 57
    return p1

    .line 58
    :cond_0
    const/4 p0, -0x4

    .line 59
    return p0
.end method

.method public l0(Ll/uow;Landroid/opengl/EGLContext;)V
    .locals 6

    .line 1
    if-eqz p1, :cond_d

    .line 2
    .line 3
    iget v0, p0, Ll/tc0;->X0:I

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    goto/16 :goto_3

    .line 9
    .line 10
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->R0(Ll/uow;Landroid/opengl/EGLContext;)V

    .line 11
    .line 12
    .line 13
    iget-boolean p2, p1, Ll/tow;->b0:Z

    .line 14
    .line 15
    if-eqz p2, :cond_1

    .line 16
    .line 17
    iget-boolean p2, p0, Ll/tc0;->m3:Z

    .line 18
    .line 19
    if-nez p2, :cond_1

    .line 20
    .line 21
    iget-boolean p2, p0, Ll/tc0;->w1:Z

    .line 22
    .line 23
    if-nez p2, :cond_1

    .line 24
    .line 25
    iget-object p2, p0, Ll/tc0;->c2:Ll/tc0$l;

    .line 26
    .line 27
    if-nez p2, :cond_1

    .line 28
    .line 29
    new-instance p2, Ll/tc0$l;

    .line 30
    .line 31
    const-string v0, "live-media-aFFrame"

    .line 32
    .line 33
    invoke-direct {p2, p0, v0}, Ll/tc0$l;-><init>(Ll/tc0;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iput-object p2, p0, Ll/tc0;->c2:Ll/tc0$l;

    .line 37
    .line 38
    invoke-virtual {p2}, Ljava/lang/Thread;->start()V

    .line 39
    .line 40
    .line 41
    :cond_1
    instance-of p2, p1, Ll/ror;

    .line 42
    .line 43
    if-eqz p2, :cond_c

    .line 44
    .line 45
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    const-string v0, "AgoraPushFilter startRecord"

    .line 50
    .line 51
    const-string v2, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 52
    .line 53
    invoke-virtual {p2, v2, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    new-instance v0, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    const-string v3, "videoWidth:"

    .line 63
    .line 64
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    iget v3, p1, Ll/tow;->s:I

    .line 68
    .line 69
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string v3, ",videoHeight:"

    .line 73
    .line 74
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    iget v3, p1, Ll/tow;->t:I

    .line 78
    .line 79
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    const-string v3, ",visualWidth:"

    .line 83
    .line 84
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    iget v3, p1, Ll/tow;->u:I

    .line 88
    .line 89
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    const-string v3, ",visualHeight:"

    .line 93
    .line 94
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    iget v3, p1, Ll/tow;->v:I

    .line 98
    .line 99
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    const-string v3, ",encodeWidth:"

    .line 103
    .line 104
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    iget v3, p1, Ll/tow;->m:I

    .line 108
    .line 109
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    const-string v3, ",encodeHeight:"

    .line 113
    .line 114
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    iget v3, p1, Ll/tow;->n:I

    .line 118
    .line 119
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    const-string v3, ",videoBitrate:"

    .line 123
    .line 124
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    iget v3, p1, Ll/tow;->H:I

    .line 128
    .line 129
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    const-string v3, ",audioBitrate:"

    .line 133
    .line 134
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    iget v3, p1, Ll/tow;->S:I

    .line 138
    .line 139
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    const-string v3, ",videoFPS:"

    .line 143
    .line 144
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    iget v3, p1, Ll/tow;->F:I

    .line 148
    .line 149
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    const-string v3, ",codecFPS:"

    .line 153
    .line 154
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    iget v4, p1, Ll/uow;->E0:I

    .line 158
    .line 159
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    const-string v4, ",mergeCanvasWidth:"

    .line 163
    .line 164
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    move-object v4, p1

    .line 168
    check-cast v4, Ll/ror;

    .line 169
    .line 170
    iget v5, v4, Ll/tow;->k:I

    .line 171
    .line 172
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    const-string v5, ",mergeCanvasHeight:"

    .line 176
    .line 177
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    iget v5, v4, Ll/tow;->l:I

    .line 181
    .line 182
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    iget v3, p1, Ll/uow;->E0:I

    .line 189
    .line 190
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    const-string v3, ",isHard:"

    .line 194
    .line 195
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    iget-object v3, p1, Ll/uow;->A0:Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;

    .line 199
    .line 200
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    invoke-virtual {p2, v2, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    iput-object v4, p0, Ll/tc0;->o1:Ll/ror;

    .line 211
    .line 212
    iget-object p2, p1, Ll/uow;->A0:Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;

    .line 213
    .line 214
    sget-object v0, Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;->SOFT_DECODE:Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;

    .line 215
    .line 216
    const/4 v2, 0x0

    .line 217
    if-eq p2, v0, :cond_2

    .line 218
    .line 219
    iget-boolean p2, v4, Ll/tow;->b0:Z

    .line 220
    .line 221
    if-eqz p2, :cond_3

    .line 222
    .line 223
    :cond_2
    iput-boolean v2, p0, Ll/tc0;->T:Z

    .line 224
    .line 225
    :cond_3
    new-instance p2, Ll/dc1;

    .line 226
    .line 227
    invoke-direct {p2}, Ll/dc1;-><init>()V

    .line 228
    .line 229
    .line 230
    iput-object p2, p0, Ll/tc0;->K0:Ll/dc1;

    .line 231
    .line 232
    iget-object p2, p0, Ll/tc0;->J0:Ll/g510;

    .line 233
    .line 234
    if-eqz p2, :cond_4

    .line 235
    .line 236
    invoke-virtual {p2}, Ll/g510;->l()Landroid/opengl/EGLContext;

    .line 237
    .line 238
    .line 239
    move-result-object p2

    .line 240
    iput-object p2, p0, Ll/tc0;->W:Landroid/opengl/EGLContext;

    .line 241
    .line 242
    :cond_4
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 243
    .line 244
    .line 245
    move-result-object p2

    .line 246
    invoke-virtual {p2}, Ll/csx;->p()Z

    .line 247
    .line 248
    .line 249
    move-result p2

    .line 250
    if-eqz p2, :cond_6

    .line 251
    .line 252
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 253
    .line 254
    .line 255
    move-result-object p2

    .line 256
    invoke-virtual {p2}, Ll/csx;->q()F

    .line 257
    .line 258
    .line 259
    move-result p2

    .line 260
    iget v0, p1, Ll/tow;->H:I

    .line 261
    .line 262
    div-int/lit16 v0, v0, 0x3e8

    .line 263
    .line 264
    int-to-float v0, v0

    .line 265
    mul-float/2addr p2, v0

    .line 266
    float-to-int p2, p2

    .line 267
    new-instance v0, Lio/agora/rtc2/video/VideoEncoderConfiguration;

    .line 268
    .line 269
    invoke-direct {v0}, Lio/agora/rtc2/video/VideoEncoderConfiguration;-><init>()V

    .line 270
    .line 271
    .line 272
    iput p2, v0, Lio/agora/rtc2/video/VideoEncoderConfiguration;->minBitrate:I

    .line 273
    .line 274
    iget-object v3, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 275
    .line 276
    if-eqz v3, :cond_5

    .line 277
    .line 278
    invoke-virtual {v3, v0}, Lio/agora/rtc2/RtcEngine;->setVideoEncoderConfiguration(Lio/agora/rtc2/video/VideoEncoderConfiguration;)I

    .line 279
    .line 280
    .line 281
    :cond_5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 282
    .line 283
    const-string v3, "minBitrate parms = "

    .line 284
    .line 285
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 286
    .line 287
    .line 288
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 289
    .line 290
    .line 291
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object p2

    .line 295
    const-string v0, "agora_minkbs"

    .line 296
    .line 297
    invoke-static {v0, p2}, Ll/t9c;->f(Ljava/lang/String;Ljava/lang/Object;)I

    .line 298
    .line 299
    .line 300
    :cond_6
    iput-boolean v2, p0, Ll/tc0;->s3:Z

    .line 301
    .line 302
    iput-boolean v2, p0, Ll/tc0;->x1:Z

    .line 303
    .line 304
    iput-boolean v2, p0, Ll/tc0;->t3:Z

    .line 305
    .line 306
    iget-boolean p2, p0, Ll/tc0;->d2:Z

    .line 307
    .line 308
    if-eqz p2, :cond_7

    .line 309
    .line 310
    invoke-virtual {p0, v2}, Ll/tc0;->Y7(I)V

    .line 311
    .line 312
    .line 313
    invoke-virtual {p0, v1}, Ll/tc0;->Y7(I)V

    .line 314
    .line 315
    .line 316
    :cond_7
    iput v1, p0, Ll/tc0;->X0:I

    .line 317
    .line 318
    iget-object p2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 319
    .line 320
    iget v0, p0, Ll/tc0;->s1:I

    .line 321
    .line 322
    int-to-long v0, v0

    .line 323
    iput-wide v0, p2, Ll/wvx;->c1:J

    .line 324
    .line 325
    invoke-static {}, Ll/yt0;->g()Ll/yt0;

    .line 326
    .line 327
    .line 328
    move-result-object p2

    .line 329
    invoke-virtual {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->W1()Landroid/content/Context;

    .line 330
    .line 331
    .line 332
    move-result-object v0

    .line 333
    sget v1, Ll/yt0;->f:I

    .line 334
    .line 335
    invoke-virtual {p2, v0, v1}, Ll/yt0;->p(Landroid/content/Context;I)V

    .line 336
    .line 337
    .line 338
    iget-object p2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 339
    .line 340
    iget-wide v0, p2, Ll/wvx;->c1:J

    .line 341
    .line 342
    const-wide/16 v2, 0x1

    .line 343
    .line 344
    cmp-long v0, v0, v2

    .line 345
    .line 346
    if-nez v0, :cond_9

    .line 347
    .line 348
    const-string v0, "M"

    .line 349
    .line 350
    invoke-virtual {p0}, Ll/tc0;->w1()Ljava/lang/String;

    .line 351
    .line 352
    .line 353
    move-result-object v1

    .line 354
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 355
    .line 356
    .line 357
    move-result v0

    .line 358
    if-eqz v0, :cond_8

    .line 359
    .line 360
    const-string v0, "AgoraMaster"

    .line 361
    .line 362
    goto :goto_0

    .line 363
    :cond_8
    const-string v0, "AgoraSlaver"

    .line 364
    .line 365
    :goto_0
    iput-object v0, p2, Ll/wvx;->B0:Ljava/lang/String;

    .line 366
    .line 367
    goto :goto_1

    .line 368
    :cond_9
    const-string v0, "AgoraAudience"

    .line 369
    .line 370
    iput-object v0, p2, Ll/wvx;->B0:Ljava/lang/String;

    .line 371
    .line 372
    :goto_1
    iget-object p2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 373
    .line 374
    invoke-virtual {p1}, Ll/uow;->d()I

    .line 375
    .line 376
    .line 377
    move-result v0

    .line 378
    int-to-long v0, v0

    .line 379
    iput-wide v0, p2, Ll/wvx;->d1:J

    .line 380
    .line 381
    iget-object p2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 382
    .line 383
    iget-boolean v0, p1, Ll/tow;->b0:Z

    .line 384
    .line 385
    if-eqz v0, :cond_a

    .line 386
    .line 387
    goto :goto_2

    .line 388
    :cond_a
    const-wide/16 v2, 0x0

    .line 389
    .line 390
    :goto_2
    iput-wide v2, p2, Ll/wvx;->b1:J

    .line 391
    .line 392
    iget-object v0, p1, Ll/uow;->v0:Ljava/lang/String;

    .line 393
    .line 394
    iput-object v0, p2, Ll/wvx;->x:Ljava/lang/String;

    .line 395
    .line 396
    iget v0, p1, Ll/tow;->H:I

    .line 397
    .line 398
    iput v0, p0, Ll/tc0;->o3:I

    .line 399
    .line 400
    iget v1, p1, Ll/uow;->E0:I

    .line 401
    .line 402
    iput v1, p0, Ll/tc0;->p3:I

    .line 403
    .line 404
    iget-object v1, p0, Ll/tc0;->o1:Ll/ror;

    .line 405
    .line 406
    iget v2, v1, Ll/uow;->B0:I

    .line 407
    .line 408
    int-to-long v2, v2

    .line 409
    iput-wide v2, p2, Ll/wvx;->W:J

    .line 410
    .line 411
    iget-object v1, v1, Ll/ror;->g1:Ljava/lang/String;

    .line 412
    .line 413
    iput-object v1, p2, Ll/wvx;->X:Ljava/lang/String;

    .line 414
    .line 415
    int-to-long v0, v0

    .line 416
    iput-wide v0, p2, Ll/wvx;->F0:J

    .line 417
    .line 418
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 419
    .line 420
    if-eqz v0, :cond_b

    .line 421
    .line 422
    invoke-static {}, Lio/agora/rtc2/RtcEngine;->getSdkVersion()Ljava/lang/String;

    .line 423
    .line 424
    .line 425
    move-result-object v0

    .line 426
    iput-object v0, p2, Ll/wvx;->p:Ljava/lang/String;

    .line 427
    .line 428
    :cond_b
    iget-object p2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 429
    .line 430
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 431
    .line 432
    .line 433
    move-result-wide v0

    .line 434
    iput-wide v0, p2, Ll/wvx;->f:J

    .line 435
    .line 436
    iget-object p2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 437
    .line 438
    iget p1, p1, Ll/tow;->H:I

    .line 439
    .line 440
    int-to-long v0, p1

    .line 441
    iput-wide v0, p2, Ll/wvx;->F0:J

    .line 442
    .line 443
    iget-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 444
    .line 445
    const-string p2, "startRecordWithNotJoinRoom"

    .line 446
    .line 447
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 448
    .line 449
    .line 450
    move-result-object p2

    .line 451
    invoke-virtual {p1, p2}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 452
    .line 453
    .line 454
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 455
    .line 456
    .line 457
    move-result-object p1

    .line 458
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 459
    .line 460
    .line 461
    move-result-object p2

    .line 462
    invoke-virtual {p2}, Ll/csx;->O0()Z

    .line 463
    .line 464
    .line 465
    move-result p2

    .line 466
    invoke-virtual {p1, p2}, Ll/csx;->C1(I)V

    .line 467
    .line 468
    .line 469
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 470
    .line 471
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 472
    .line 473
    .line 474
    move-result-object p1

    .line 475
    invoke-virtual {p1}, Ll/csx;->O0()Z

    .line 476
    .line 477
    .line 478
    move-result p1

    .line 479
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 480
    .line 481
    .line 482
    move-result-object p1

    .line 483
    const-string p2, "mrCoreParameters"

    .line 484
    .line 485
    filled-new-array {p2, p1}, [Ljava/lang/Object;

    .line 486
    .line 487
    .line 488
    move-result-object p1

    .line 489
    invoke-virtual {p0, p1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 490
    .line 491
    .line 492
    return-void

    .line 493
    :cond_c
    new-instance p0, Ljava/security/InvalidParameterException;

    .line 494
    .line 495
    const-string p1, "Parameters error"

    .line 496
    .line 497
    invoke-direct {p0, p1}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    .line 498
    .line 499
    .line 500
    throw p0

    .line 501
    :cond_d
    :goto_3
    return-void
.end method

.method public l1()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    return-wide v0
.end method

.method public l6(I)I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    if-eq p1, p0, :cond_0

    .line 3
    .line 4
    const/4 p0, 0x3

    .line 5
    return p0

    .line 6
    :cond_0
    const/4 p0, 0x0

    .line 7
    return p0
.end method

.method public l7(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/tc0;->j1:I

    .line 2
    .line 3
    return-void
.end method

.method public l8(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tc0;->r1:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lio/agora/rtc2/RtcEngine;->renewToken(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public m0()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/tc0;->X:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Ll/tc0;->t6()Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    iget p0, p0, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->sentFrameRate:I

    .line 12
    .line 13
    return p0

    .line 14
    :cond_0
    invoke-direct {p0}, Ll/tc0;->u6()Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    iget p0, p0, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;->rendererOutputFrameRate:I

    .line 21
    .line 22
    return p0

    .line 23
    :cond_1
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public m1(Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 1
    return-void
.end method

.method public m6()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    const-string v1, "getAudioTrackCount"

    .line 4
    .line 5
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Lio/agora/rtc2/RtcEngine;->getAudioTrackCount()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, -0x1

    .line 22
    return p0
.end method

.method public m7(I)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    int-to-long v0, p1

    .line 4
    iput-wide v0, p0, Ll/wvx;->i:J

    .line 5
    .line 6
    return-void
.end method

.method public m8(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    const-string v1, "updateRtmpUrl"

    .line 4
    .line 5
    filled-new-array {v1, p1}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v0, v2}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 13
    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_2

    .line 21
    .line 22
    iget-object v0, p0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 27
    .line 28
    iget-object v0, v0, Ll/wvx;->x:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 37
    .line 38
    iput-object p1, v0, Ll/wvx;->x:Ljava/lang/String;

    .line 39
    .line 40
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 41
    .line 42
    iget-object v1, p0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 43
    .line 44
    invoke-virtual {v0, p1, v1}, Lio/agora/rtc2/RtcEngine;->startRtmpStreamWithTranscoding(Ljava/lang/String;Lio/agora/rtc2/live/LiveTranscoding;)I

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Ll/tc0;->B3:Lcom/immomo/mediacore/coninf/MRtcPusherHandler;

    .line 48
    .line 49
    if-eqz p0, :cond_0

    .line 50
    .line 51
    invoke-interface {p0, p1}, Lcom/immomo/mediacore/coninf/MRtcPusherHandler;->onPushChangeStreamUrl(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    const-string v0, "updateRtmpUrl:url="

    .line 59
    .line 60
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    const-string v0, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 65
    .line 66
    invoke-virtual {p0, v0, p1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 71
    .line 72
    new-instance v2, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    const-string v3, "url  is no difference: newUrl:"

    .line 75
    .line 76
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    const-string p1, ",old is:"

    .line 83
    .line 84
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 88
    .line 89
    iget-object p0, p0, Ll/wvx;->x:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {v0, v1, p0}, Ll/evx;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_2
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 103
    .line 104
    new-instance v2, Ljava/lang/StringBuilder;

    .line 105
    .line 106
    const-string v3, "updateRtmpUrl error : engine"

    .line 107
    .line 108
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    iget-object v3, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 112
    .line 113
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    const-string v3, ", publishConfig:"

    .line 117
    .line 118
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    iget-object p0, p0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 122
    .line 123
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    const-string p0, ",path:"

    .line 127
    .line 128
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    invoke-virtual {v0, v1, p0}, Ll/evx;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    return-void
.end method

.method public n0()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    return-wide v0
.end method

.method public n1()I
    .locals 0

    .line 1
    iget p0, p0, Ll/tc0;->n1:I

    .line 2
    .line 3
    return p0
.end method

.method public n2(Ll/uow;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->n2(Ll/uow;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 5
    .line 6
    move-object v0, p1

    .line 7
    check-cast v0, Ll/ror;

    .line 8
    .line 9
    iput-object v0, p0, Ll/tc0;->o1:Ll/ror;

    .line 10
    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    iget-boolean p0, p0, Ll/tc0;->T:Z

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    iget-object p0, p1, Ll/uow;->A0:Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;

    .line 18
    .line 19
    sget-object v0, Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;->SOFT_DECODE:Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;

    .line 20
    .line 21
    if-eq p0, v0, :cond_1

    .line 22
    .line 23
    move-object p0, p1

    .line 24
    check-cast p0, Ll/ror;

    .line 25
    .line 26
    iget-boolean p0, p0, Ll/tow;->b0:Z

    .line 27
    .line 28
    if-eqz p0, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    sget-object p0, Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;->HARD_DECODE:Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;

    .line 32
    .line 33
    iput-object p0, p1, Ll/uow;->A0:Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;

    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    :goto_0
    sget-object p0, Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;->SOFT_DECODE:Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;

    .line 37
    .line 38
    iput-object p0, p1, Ll/uow;->A0:Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;

    .line 39
    .line 40
    :cond_2
    return-void
.end method

.method public n7(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    int-to-long v1, p1

    .line 4
    iput-wide v1, v0, Ll/wvx;->s:J

    .line 5
    .line 6
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 7
    .line 8
    const-string v0, "setBusinessType agora"

    .line 9
    .line 10
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    new-instance p0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string v0, "setBusinessType : "

    .line 24
    .line 25
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string p1, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 36
    .line 37
    invoke-static {p1, p0}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 0

    .line 1
    iput p1, p0, Ll/wej;->texture_in:I

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/tc0;->M1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    const-string v1, "LeaveRoom"

    .line 4
    .line 5
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/tc0;->S5()V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-virtual {p0, v0}, Ll/tc0;->Y7(I)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const-string v2, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 28
    .line 29
    const-string v3, "LeaveRoom >>>>>"

    .line 30
    .line 31
    invoke-virtual {v1, v2, v3}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 35
    .line 36
    const/4 v2, 0x0

    .line 37
    invoke-virtual {v1, v2}, Lio/agora/rtc2/RtcEngine;->registerAudioFrameObserver(Lio/agora/rtc2/IAudioFrameObserver;)I

    .line 38
    .line 39
    .line 40
    iput-boolean v0, p0, Ll/tc0;->e1:Z

    .line 41
    .line 42
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 43
    .line 44
    iget-object v0, v0, Ll/uow;->v0:Ljava/lang/String;

    .line 45
    .line 46
    if-eqz v0, :cond_0

    .line 47
    .line 48
    iget-object v1, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 49
    .line 50
    invoke-virtual {v1, v0}, Lio/agora/rtc2/RtcEngine;->stopRtmpStream(Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    :cond_0
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 54
    .line 55
    invoke-virtual {v0}, Lio/agora/rtc2/RtcEngine;->leaveChannel()I

    .line 56
    .line 57
    .line 58
    iget-boolean v0, p0, Ll/tc0;->C3:Z

    .line 59
    .line 60
    if-nez v0, :cond_1

    .line 61
    .line 62
    const/4 v0, 0x1

    .line 63
    iput-boolean v0, p0, Ll/tc0;->C3:Z

    .line 64
    .line 65
    invoke-virtual {p0}, Ll/tc0;->d2()V

    .line 66
    .line 67
    .line 68
    :cond_1
    return-void
.end method

.method public o0()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    return-wide v0
.end method

.method public o1(Ljava/nio/ByteBuffer;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tc0;->v0(Ljava/nio/ByteBuffer;)V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    return p0
.end method

.method public o6()D
    .locals 4

    .line 1
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lio/agora/rtc2/internal/RtcEngineImpl;

    .line 6
    .line 7
    invoke-virtual {p0}, Lio/agora/rtc2/internal/RtcEngineImpl;->getEffectsVolume()D

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    const-wide/high16 v2, 0x4059000000000000L    # 100.0

    .line 12
    .line 13
    div-double/2addr v0, v2

    .line 14
    return-wide v0

    .line 15
    :cond_0
    const-wide/16 v0, 0x0

    .line 16
    .line 17
    return-wide v0
.end method

.method public o7(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tc0;->r1:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public onEarMonitoringAudioFrame(IIIIILjava/nio/ByteBuffer;JI)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public onMixedAudioFrame(Ljava/lang/String;IIIIILjava/nio/ByteBuffer;JI)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public onPlaybackAudioFrame(Ljava/lang/String;IIIIILjava/nio/ByteBuffer;JI)Z
    .locals 0

    .line 1
    iget-object p1, p0, Ll/tc0;->K0:Ll/dc1;

    .line 2
    .line 3
    const/4 p2, 0x1

    .line 4
    if-eqz p1, :cond_3

    .line 5
    .line 6
    iget-object p1, p0, Ll/tc0;->d1:Ll/dpl$a;

    .line 7
    .line 8
    if-eqz p1, :cond_3

    .line 9
    .line 10
    mul-int/2addr p3, p4

    .line 11
    mul-int/2addr p3, p5

    .line 12
    new-array p1, p3, [B

    .line 13
    .line 14
    const/4 p4, 0x0

    .line 15
    invoke-virtual {p7, p1, p4, p3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 16
    .line 17
    .line 18
    iget p4, p0, Ll/tc0;->s1:I

    .line 19
    .line 20
    const/4 p7, 0x2

    .line 21
    if-ne p4, p7, :cond_1

    .line 22
    .line 23
    iget-object p4, p0, Ll/tc0;->o1:Ll/ror;

    .line 24
    .line 25
    iget p4, p4, Ll/tow;->R:I

    .line 26
    .line 27
    if-eq p4, p2, :cond_0

    .line 28
    .line 29
    if-ne p5, p2, :cond_0

    .line 30
    .line 31
    invoke-static {p1, p3}, Ll/jc00;->o2([BI)[B

    .line 32
    .line 33
    .line 34
    move-result-object p3

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    move-object p3, p1

    .line 37
    :goto_0
    iget-object p4, p0, Ll/tc0;->d1:Ll/dpl$a;

    .line 38
    .line 39
    new-instance p8, Ll/oxd0;

    .line 40
    .line 41
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 42
    .line 43
    .line 44
    move-result-wide p9

    .line 45
    invoke-direct {p8, p3, p9, p10, p7}, Ll/oxd0;-><init>([BJI)V

    .line 46
    .line 47
    .line 48
    invoke-interface {p4, p8}, Ll/dpl$a;->C(Ll/oxd0;)Ll/oxd0;

    .line 49
    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_1
    iget-object p3, p0, Ll/tc0;->K0:Ll/dc1;

    .line 53
    .line 54
    if-eqz p3, :cond_2

    .line 55
    .line 56
    new-instance p4, Ll/oxd0;

    .line 57
    .line 58
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 59
    .line 60
    .line 61
    move-result-wide p7

    .line 62
    invoke-direct {p4, p1, p7, p8, p5}, Ll/oxd0;-><init>([BJI)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p3, p4}, Ll/dc1;->i(Ll/oxd0;)V

    .line 66
    .line 67
    .line 68
    :cond_2
    :goto_1
    iget-object p0, p0, Ll/tc0;->I2:Ll/kod0;

    .line 69
    .line 70
    if-eqz p0, :cond_3

    .line 71
    .line 72
    invoke-virtual {p0, p1, p6, p5}, Ll/kod0;->m([BII)V

    .line 73
    .line 74
    .line 75
    :cond_3
    return p2
.end method

.method public onPlaybackAudioFrameBeforeMixing(Ljava/lang/String;IIIIIILjava/nio/ByteBuffer;JIIJ)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public onRecordAudioFrame(Ljava/lang/String;IIIIILjava/nio/ByteBuffer;JI)Z
    .locals 10

    .line 1
    move/from16 p2, p6

    .line 2
    .line 3
    move-object/from16 v0, p7

    .line 4
    .line 5
    iget v1, p0, Ll/tc0;->k1:I

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    add-int/2addr v1, v2

    .line 9
    iput v1, p0, Ll/tc0;->k1:I

    .line 10
    .line 11
    mul-int v1, p3, p5

    .line 12
    .line 13
    mul-int/2addr v1, p4

    .line 14
    new-array v6, v1, [B

    .line 15
    .line 16
    iget-boolean v3, p0, Ll/tc0;->g2:Z

    .line 17
    .line 18
    const/4 v9, 0x0

    .line 19
    if-eqz v3, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {v0, v6, v9, v1}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object v3, p0, Ll/tc0;->F1:Lcom/immomo/mediacore/audio/pcmDataAvailableCallback;

    .line 26
    .line 27
    if-eqz v3, :cond_2

    .line 28
    .line 29
    iget-object v4, p0, Ll/tc0;->o1:Ll/ror;

    .line 30
    .line 31
    iget v4, v4, Ll/uow;->B0:I

    .line 32
    .line 33
    int-to-long v4, v4

    .line 34
    if-ne p5, v2, :cond_1

    .line 35
    .line 36
    move v8, v9

    .line 37
    goto :goto_1

    .line 38
    :cond_1
    move v8, v2

    .line 39
    :goto_1
    const v7, 0xac44

    .line 40
    .line 41
    .line 42
    invoke-interface/range {v3 .. v8}, Lcom/immomo/mediacore/audio/pcmDataAvailableCallback;->onPcmDateCallback(J[BIZ)V

    .line 43
    .line 44
    .line 45
    :cond_2
    iget-object v3, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->K:Ll/l6m;

    .line 46
    .line 47
    const/4 v4, 0x0

    .line 48
    if-eqz v3, :cond_3

    .line 49
    .line 50
    check-cast v3, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 51
    .line 52
    iget v5, p0, Ll/tc0;->i1:F

    .line 53
    .line 54
    invoke-virtual {v3, v5}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->W1(F)V

    .line 55
    .line 56
    .line 57
    iget-object v3, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->K:Ll/l6m;

    .line 58
    .line 59
    check-cast v3, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 60
    .line 61
    iget-object v5, p0, Ll/tc0;->o1:Ll/ror;

    .line 62
    .line 63
    iget v5, v5, Ll/tow;->P:I

    .line 64
    .line 65
    const-string v7, "Agora"

    .line 66
    .line 67
    const/16 v8, 0x800

    .line 68
    .line 69
    invoke-virtual {v3, v8, v5, p5, v7}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->I2(IIILjava/lang/String;)V

    .line 70
    .line 71
    .line 72
    iget-object v3, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->K:Ll/l6m;

    .line 73
    .line 74
    check-cast v3, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 75
    .line 76
    new-instance v5, Ll/oxd0;

    .line 77
    .line 78
    iget v7, p0, Ll/tc0;->j1:I

    .line 79
    .line 80
    int-to-long v7, v7

    .line 81
    invoke-direct {v5, v6, v7, v8, p5}, Ll/oxd0;-><init>([BJI)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v3, v5}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->C(Ll/oxd0;)Ll/oxd0;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    if-eqz v3, :cond_4

    .line 89
    .line 90
    iget-object v5, v3, Ll/oxd0;->b:Ljava/nio/ByteBuffer;

    .line 91
    .line 92
    if-eqz v5, :cond_4

    .line 93
    .line 94
    invoke-virtual {v5, v6, v9, v1}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0, v6}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 104
    .line 105
    .line 106
    goto :goto_2

    .line 107
    :cond_3
    move-object v3, v4

    .line 108
    :cond_4
    :goto_2
    iget-object v0, p0, Ll/tc0;->I2:Ll/kod0;

    .line 109
    .line 110
    if-eqz v0, :cond_5

    .line 111
    .line 112
    invoke-virtual {v0, v6, p2, p5}, Ll/kod0;->o([BII)V

    .line 113
    .line 114
    .line 115
    :cond_5
    iget-object v0, p0, Ll/tc0;->d1:Ll/dpl$a;

    .line 116
    .line 117
    if-eqz v0, :cond_f

    .line 118
    .line 119
    iget-boolean v0, p0, Ll/tc0;->f1:Z

    .line 120
    .line 121
    if-eqz v0, :cond_f

    .line 122
    .line 123
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->K:Ll/l6m;

    .line 124
    .line 125
    if-eqz v0, :cond_9

    .line 126
    .line 127
    iget-object v0, p0, Ll/tc0;->K0:Ll/dc1;

    .line 128
    .line 129
    if-eqz v0, :cond_7

    .line 130
    .line 131
    const/high16 v4, 0x3f800000    # 1.0f

    .line 132
    .line 133
    invoke-virtual {v0, v4}, Ll/dc1;->j(F)V

    .line 134
    .line 135
    .line 136
    iget-object v0, p0, Ll/tc0;->o1:Ll/ror;

    .line 137
    .line 138
    iget-boolean v0, v0, Ll/uow;->X0:Z

    .line 139
    .line 140
    if-eqz v0, :cond_6

    .line 141
    .line 142
    iget-object v0, p0, Ll/tc0;->K0:Ll/dc1;

    .line 143
    .line 144
    invoke-virtual {v0, v4}, Ll/dc1;->k(F)V

    .line 145
    .line 146
    .line 147
    :cond_6
    iget-object v0, p0, Ll/tc0;->K0:Ll/dc1;

    .line 148
    .line 149
    invoke-virtual {v0}, Ll/dc1;->g()Ll/oxd0;

    .line 150
    .line 151
    .line 152
    move-result-object v4

    .line 153
    :cond_7
    if-eqz v4, :cond_9

    .line 154
    .line 155
    iget-object v0, p0, Ll/tc0;->K0:Ll/dc1;

    .line 156
    .line 157
    if-eqz v3, :cond_8

    .line 158
    .line 159
    invoke-virtual {v3}, Ll/oxd0;->c()[B

    .line 160
    .line 161
    .line 162
    move-result-object v3

    .line 163
    invoke-virtual {v4}, Ll/oxd0;->c()[B

    .line 164
    .line 165
    .line 166
    move-result-object v5

    .line 167
    invoke-virtual {v4}, Ll/oxd0;->e()I

    .line 168
    .line 169
    .line 170
    move-result v7

    .line 171
    invoke-virtual {v0, v3, v5, v7}, Ll/dc1;->h([B[BI)Ljava/nio/ByteBuffer;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    goto :goto_3

    .line 176
    :cond_8
    invoke-virtual {v4}, Ll/oxd0;->c()[B

    .line 177
    .line 178
    .line 179
    move-result-object v3

    .line 180
    invoke-virtual {v4}, Ll/oxd0;->e()I

    .line 181
    .line 182
    .line 183
    move-result v5

    .line 184
    invoke-virtual {v0, v6, v3, v5}, Ll/dc1;->h([B[BI)Ljava/nio/ByteBuffer;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    :goto_3
    if-eqz v0, :cond_9

    .line 189
    .line 190
    new-instance v3, Ll/oxd0;

    .line 191
    .line 192
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    invoke-virtual {v4}, Ll/oxd0;->d()J

    .line 197
    .line 198
    .line 199
    move-result-wide v4

    .line 200
    invoke-direct {v3, v0, v4, v5, p5}, Ll/oxd0;-><init>([BJI)V

    .line 201
    .line 202
    .line 203
    move-object v4, v3

    .line 204
    :cond_9
    const-string v0, "=====replace======:Agora send pcm to IJK "

    .line 205
    .line 206
    const-string v3, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 207
    .line 208
    const/4 v5, 0x2

    .line 209
    if-eqz v4, :cond_c

    .line 210
    .line 211
    if-ne p5, v2, :cond_a

    .line 212
    .line 213
    invoke-virtual {v4}, Ll/oxd0;->c()[B

    .line 214
    .line 215
    .line 216
    move-result-object v1

    .line 217
    invoke-virtual {v4}, Ll/oxd0;->e()I

    .line 218
    .line 219
    .line 220
    move-result v4

    .line 221
    invoke-static {v1, v4}, Ll/jc00;->o2([BI)[B

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    goto :goto_4

    .line 226
    :cond_a
    invoke-virtual {v4}, Ll/oxd0;->c()[B

    .line 227
    .line 228
    .line 229
    move-result-object v1

    .line 230
    :goto_4
    new-instance v4, Ll/oxd0;

    .line 231
    .line 232
    iget v6, p0, Ll/tc0;->j1:I

    .line 233
    .line 234
    int-to-long v6, v6

    .line 235
    invoke-direct {v4, v1, v6, v7, v5}, Ll/oxd0;-><init>([BJI)V

    .line 236
    .line 237
    .line 238
    invoke-virtual {v4, v9}, Ll/oxd0;->g(Z)V

    .line 239
    .line 240
    .line 241
    iget-object v5, p0, Ll/tc0;->d1:Ll/dpl$a;

    .line 242
    .line 243
    if-eqz v5, :cond_b

    .line 244
    .line 245
    invoke-interface {v5, v4}, Ll/dpl$a;->C(Ll/oxd0;)Ll/oxd0;

    .line 246
    .line 247
    .line 248
    iget v4, p0, Ll/tc0;->x3:I

    .line 249
    .line 250
    add-int/lit8 v5, v4, 0x1

    .line 251
    .line 252
    iput v5, p0, Ll/tc0;->x3:I

    .line 253
    .line 254
    rem-int/lit8 v4, v4, 0x32

    .line 255
    .line 256
    if-nez v4, :cond_b

    .line 257
    .line 258
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 259
    .line 260
    .line 261
    move-result-object v4

    .line 262
    invoke-virtual {v4, v3, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 263
    .line 264
    .line 265
    :cond_b
    iget-object p0, p0, Ll/tc0;->I2:Ll/kod0;

    .line 266
    .line 267
    if-eqz p0, :cond_f

    .line 268
    .line 269
    invoke-virtual {p0, v1, p2, p5}, Ll/kod0;->n([BII)V

    .line 270
    .line 271
    .line 272
    goto :goto_5

    .line 273
    :cond_c
    iget v4, p0, Ll/tc0;->s1:I

    .line 274
    .line 275
    if-eq v4, v5, :cond_f

    .line 276
    .line 277
    if-ne p5, v2, :cond_d

    .line 278
    .line 279
    invoke-static {v6, v1}, Ll/jc00;->o2([BI)[B

    .line 280
    .line 281
    .line 282
    move-result-object v6

    .line 283
    :cond_d
    new-instance v1, Ll/oxd0;

    .line 284
    .line 285
    iget v4, p0, Ll/tc0;->j1:I

    .line 286
    .line 287
    int-to-long v7, v4

    .line 288
    invoke-direct {v1, v6, v7, v8, v5}, Ll/oxd0;-><init>([BJI)V

    .line 289
    .line 290
    .line 291
    invoke-virtual {v1, v9}, Ll/oxd0;->g(Z)V

    .line 292
    .line 293
    .line 294
    iget-object v4, p0, Ll/tc0;->d1:Ll/dpl$a;

    .line 295
    .line 296
    if-eqz v4, :cond_e

    .line 297
    .line 298
    invoke-interface {v4, v1}, Ll/dpl$a;->C(Ll/oxd0;)Ll/oxd0;

    .line 299
    .line 300
    .line 301
    iget v1, p0, Ll/tc0;->x3:I

    .line 302
    .line 303
    add-int/lit8 v4, v1, 0x1

    .line 304
    .line 305
    iput v4, p0, Ll/tc0;->x3:I

    .line 306
    .line 307
    rem-int/lit8 v1, v1, 0x32

    .line 308
    .line 309
    if-nez v1, :cond_e

    .line 310
    .line 311
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 312
    .line 313
    .line 314
    move-result-object v1

    .line 315
    invoke-virtual {v1, v3, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 316
    .line 317
    .line 318
    :cond_e
    iget-object p0, p0, Ll/tc0;->I2:Ll/kod0;

    .line 319
    .line 320
    if-eqz p0, :cond_f

    .line 321
    .line 322
    invoke-virtual {p0, v6, p2, p5}, Ll/kod0;->n([BII)V

    .line 323
    .line 324
    .line 325
    :cond_f
    :goto_5
    return v2
.end method

.method public p(Ljava/lang/String;I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    const-string v1, "JoinRoom"

    .line 4
    .line 5
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    filled-new-array {v1, p1, p2}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-virtual {v0, p2}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    const/4 p2, 0x0

    .line 17
    iput-boolean p2, p0, Ll/tc0;->C3:Z

    .line 18
    .line 19
    iget-object p2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 20
    .line 21
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 22
    .line 23
    .line 24
    move-result-wide v0

    .line 25
    iput-wide v0, p2, Ll/wvx;->e:J

    .line 26
    .line 27
    iget p2, p0, Ll/tc0;->s1:I

    .line 28
    .line 29
    const/16 v0, 0x21

    .line 30
    .line 31
    invoke-direct {p0, p2, v0}, Ll/tc0;->T5(II)V

    .line 32
    .line 33
    .line 34
    iget-object p2, p0, Ll/tc0;->o1:Ll/ror;

    .line 35
    .line 36
    iget p2, p2, Ll/uow;->B0:I

    .line 37
    .line 38
    invoke-direct {p0, p1, p2}, Ll/tc0;->B6(Ljava/lang/String;I)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Ll/tc0;->B1:Ljava/lang/String;

    .line 42
    .line 43
    if-eqz p1, :cond_0

    .line 44
    .line 45
    iget-object p2, p0, Ll/tc0;->o1:Ll/ror;

    .line 46
    .line 47
    iget-boolean p2, p2, Ll/ror;->h1:Z

    .line 48
    .line 49
    if-eqz p2, :cond_0

    .line 50
    .line 51
    iget-object p2, p0, Ll/tc0;->C1:Ljava/lang/String;

    .line 52
    .line 53
    if-nez p2, :cond_0

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Ll/tc0;->z7(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    return-void
.end method

.method public p1()I
    .locals 1

    .line 1
    iget-object p0, p0, Ll/tc0;->o1:Ll/ror;

    .line 2
    .line 3
    iget v0, p0, Ll/tow;->k:I

    .line 4
    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    return v0

    .line 8
    :cond_0
    iget p0, p0, Ll/tow;->s:I

    .line 9
    .line 10
    return p0
.end method

.method public p7(Z)V
    .locals 2

    .line 1
    iput-boolean p1, p0, Ll/tc0;->M2:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, v0}, Ll/tc0;->Y7(I)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    new-instance v0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v1, "["

    .line 16
    .line 17
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string p1, "]"

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const-string v0, "setCustomPreview"

    .line 33
    .line 34
    invoke-virtual {p0, v0, p1}, Ll/evx;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public q1()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/tc0;->L0:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public q2()V
    .locals 7

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 6
    .line 7
    const-string v2, "AgoraPushFilter release"

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 13
    .line 14
    const-string v1, "ReleaseNotLeave"

    .line 15
    .line 16
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    iput-boolean v0, p0, Ll/tc0;->s3:Z

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    iput-boolean v1, p0, Ll/tc0;->X:Z

    .line 28
    .line 29
    iget-object v2, p0, Ll/tc0;->t1:Ljava/lang/Object;

    .line 30
    .line 31
    monitor-enter v2

    .line 32
    :try_start_0
    iget-object v3, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 33
    .line 34
    const/4 v4, 0x0

    .line 35
    iput-object v4, v3, Ll/wvx;->a0:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v3, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 38
    .line 39
    const/16 v4, 0x1001

    .line 40
    .line 41
    if-eqz v3, :cond_1

    .line 42
    .line 43
    invoke-static {}, Ll/x1f;->b()Ll/x1f;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    iget-object v5, p0, Ll/tc0;->M1:Lio/agora/rtc2/IRtcEngineEventHandler;

    .line 48
    .line 49
    iget v6, p0, Ll/tc0;->k3:I

    .line 50
    .line 51
    if-nez v6, :cond_0

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    move v0, v1

    .line 55
    :goto_0
    invoke-virtual {v3, v5, v0}, Ll/x1f;->a(Lio/agora/rtc2/IRtcEngineEventHandler;Z)V

    .line 56
    .line 57
    .line 58
    iput-boolean v1, p0, Ll/tc0;->X:Z

    .line 59
    .line 60
    sget-object v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;->FILTER_IDLE:Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 61
    .line 62
    invoke-virtual {p0, v0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->l2(Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;)V

    .line 63
    .line 64
    .line 65
    sget-object v0, Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;->STOP:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 66
    .line 67
    iput-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->J:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 68
    .line 69
    iget-object v0, p0, Ll/tc0;->g1:Ll/q210$a;

    .line 70
    .line 71
    invoke-interface {v0, v4, v1, v1, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    const/4 v0, -0x1

    .line 75
    iput v0, p0, Ll/tc0;->V:I

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :catchall_0
    move-exception p0

    .line 79
    goto :goto_2

    .line 80
    :cond_1
    :goto_1
    iput-boolean v1, p0, Ll/tc0;->X:Z

    .line 81
    .line 82
    sget-object v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;->FILTER_IDLE:Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 83
    .line 84
    invoke-virtual {p0, v0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->l2(Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;)V

    .line 85
    .line 86
    .line 87
    sget-object v0, Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;->STOP:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 88
    .line 89
    iput-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->J:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 90
    .line 91
    iget-object v0, p0, Ll/tc0;->g1:Ll/q210$a;

    .line 92
    .line 93
    invoke-interface {v0, v4, v1, v1, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 94
    .line 95
    .line 96
    monitor-exit v2

    .line 97
    return-void

    .line 98
    :goto_2
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 99
    throw p0
.end method

.method public q6()J
    .locals 2

    .line 1
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/csx;->a()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const p0, 0x9117

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-static {p0, v0}, Landroid/opengl/GLES30;->glFenceSync(II)J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    invoke-static {}, Landroid/opengl/GLES20;->glFlush()V

    .line 20
    .line 21
    .line 22
    return-wide v0

    .line 23
    :cond_0
    const-wide/16 v0, 0x0

    .line 24
    .line 25
    return-wide v0
.end method

.method public q7(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/tc0;->f2:Z

    .line 2
    .line 3
    return-void
.end method

.method public r0()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    return-wide v0
.end method

.method public r1()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/tc0;->d2:Z

    .line 2
    .line 3
    return p0
.end method

.method public r6()I
    .locals 0

    .line 1
    iget p0, p0, Ll/tc0;->V0:I

    .line 2
    .line 3
    return p0
.end method

.method public r7(ILl/hnw;)I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "mode:"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, ",config:"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p2}, Ll/hnw;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const-string v2, "setDualStreamMode"

    .line 30
    .line 31
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    new-instance v0, Lio/agora/rtc2/SimulcastStreamConfig;

    .line 39
    .line 40
    invoke-direct {v0}, Lio/agora/rtc2/SimulcastStreamConfig;-><init>()V

    .line 41
    .line 42
    .line 43
    iget v1, p2, Ll/hnw;->b:I

    .line 44
    .line 45
    iput v1, v0, Lio/agora/rtc2/SimulcastStreamConfig;->bitrate:I

    .line 46
    .line 47
    iget v2, p2, Ll/hnw;->c:I

    .line 48
    .line 49
    iput v2, v0, Lio/agora/rtc2/SimulcastStreamConfig;->framerate:I

    .line 50
    .line 51
    iget-object v2, v0, Lio/agora/rtc2/SimulcastStreamConfig;->dimensions:Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;

    .line 52
    .line 53
    iget-object p2, p2, Ll/hnw;->a:Ll/knw;

    .line 54
    .line 55
    iget v3, p2, Ll/knw;->b:I

    .line 56
    .line 57
    iput v3, v2, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;->height:I

    .line 58
    .line 59
    iget p2, p2, Ll/knw;->a:I

    .line 60
    .line 61
    iput p2, v2, Lio/agora/rtc2/video/VideoEncoderConfiguration$VideoDimensions;->width:I

    .line 62
    .line 63
    iget-object p2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 64
    .line 65
    int-to-long v1, v1

    .line 66
    iput-wide v1, p2, Ll/wvx;->m0:J

    .line 67
    .line 68
    const/4 v1, 0x1

    .line 69
    if-ne p1, v1, :cond_0

    .line 70
    .line 71
    const-wide/16 v2, 0x1

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_0
    const-wide/16 v2, 0x0

    .line 75
    .line 76
    :goto_0
    iput-wide v2, p2, Ll/wvx;->l0:J

    .line 77
    .line 78
    sget-object p2, Lio/agora/rtc2/Constants$SimulcastStreamMode;->AUTO_SIMULCAST_STREAM:Lio/agora/rtc2/Constants$SimulcastStreamMode;

    .line 79
    .line 80
    const/4 v2, -0x1

    .line 81
    if-ne p1, v2, :cond_1

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_1
    if-nez p1, :cond_2

    .line 85
    .line 86
    sget-object p2, Lio/agora/rtc2/Constants$SimulcastStreamMode;->DISABLE_SIMULCAST_STREAM:Lio/agora/rtc2/Constants$SimulcastStreamMode;

    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_2
    if-ne p1, v1, :cond_3

    .line 90
    .line 91
    sget-object p2, Lio/agora/rtc2/Constants$SimulcastStreamMode;->ENABLE_SIMULCAST_STREAM:Lio/agora/rtc2/Constants$SimulcastStreamMode;

    .line 92
    .line 93
    :cond_3
    :goto_1
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 94
    .line 95
    if-eqz p0, :cond_4

    .line 96
    .line 97
    invoke-virtual {p0, p2, v0}, Lio/agora/rtc2/RtcEngine;->setDualStreamMode(Lio/agora/rtc2/Constants$SimulcastStreamMode;Lio/agora/rtc2/SimulcastStreamConfig;)I

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    return p0

    .line 102
    :cond_4
    return v2
.end method

.method public s0()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public s6()I
    .locals 0

    .line 1
    iget p0, p0, Ll/tc0;->W0:I

    .line 2
    .line 3
    return p0
.end method

.method public s7(D)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lio/agora/rtc2/internal/RtcEngineImpl;

    .line 6
    .line 7
    const-wide/high16 v0, 0x4059000000000000L    # 100.0

    .line 8
    .line 9
    mul-double/2addr p1, v0

    .line 10
    invoke-virtual {p0, p1, p2}, Lio/agora/rtc2/internal/RtcEngineImpl;->setEffectsVolume(D)I

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public stopSurroundMusic()V
    .locals 3

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 6
    .line 7
    const-string v2, "stopSurroundMusic:"

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0}, Lio/agora/rtc2/RtcEngine;->stopAudioMixing()I

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-boolean v0, p0, Ll/tc0;->A1:Z

    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public t7(Z)V
    .locals 2

    .line 1
    iput-boolean p1, p0, Ll/tc0;->f3:Z

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "setEnableConferenceReconnect:"

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public u0()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    return-wide v0
.end method

.method public u1()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    return-wide v0
.end method

.method public u7(Z)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lio/agora/rtc2/RtcEngine;->setEnableSpeakerphone(Z)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x1

    .line 11
    return p0
.end method

.method public v0(Ljava/nio/ByteBuffer;)V
    .locals 6

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    const-string v3, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 10
    .line 11
    new-instance v4, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v5, "writevideo:"

    .line 14
    .line 15
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 19
    .line 20
    .line 21
    move-result v5

    .line 22
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v5, ";timeStamp:"

    .line 26
    .line 27
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v2, v3, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-boolean v0, p0, Ll/tc0;->T:Z

    .line 41
    .line 42
    if-nez v0, :cond_2

    .line 43
    .line 44
    iget-boolean v0, p0, Ll/tc0;->X:Z

    .line 45
    .line 46
    if-eqz v0, :cond_2

    .line 47
    .line 48
    iget-boolean v0, p0, Ll/tc0;->m3:Z

    .line 49
    .line 50
    if-nez v0, :cond_2

    .line 51
    .line 52
    new-instance v0, Lio/agora/rtc2/video/AgoraVideoFrame;

    .line 53
    .line 54
    invoke-direct {v0}, Lio/agora/rtc2/video/AgoraVideoFrame;-><init>()V

    .line 55
    .line 56
    .line 57
    const/4 v1, 0x1

    .line 58
    iput v1, v0, Lio/agora/rtc2/video/AgoraVideoFrame;->format:I

    .line 59
    .line 60
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 61
    .line 62
    .line 63
    move-result-wide v2

    .line 64
    iput-wide v2, v0, Lio/agora/rtc2/video/AgoraVideoFrame;->timeStamp:J

    .line 65
    .line 66
    iget-object v2, p0, Ll/tc0;->o1:Ll/ror;

    .line 67
    .line 68
    iget v3, v2, Ll/tow;->m:I

    .line 69
    .line 70
    iput v3, v0, Lio/agora/rtc2/video/AgoraVideoFrame;->stride:I

    .line 71
    .line 72
    iget v2, v2, Ll/tow;->n:I

    .line 73
    .line 74
    iput v2, v0, Lio/agora/rtc2/video/AgoraVideoFrame;->height:I

    .line 75
    .line 76
    const/4 v2, 0x0

    .line 77
    iput v2, v0, Lio/agora/rtc2/video/AgoraVideoFrame;->rotation:I

    .line 78
    .line 79
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iput-object p1, v0, Lio/agora/rtc2/video/AgoraVideoFrame;->buf:[B

    .line 84
    .line 85
    iget-object p1, p0, Ll/tc0;->t1:Ljava/lang/Object;

    .line 86
    .line 87
    monitor-enter p1

    .line 88
    :try_start_0
    iget-object v2, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 89
    .line 90
    if-eqz v2, :cond_0

    .line 91
    .line 92
    iget-boolean v2, p0, Ll/tc0;->s3:Z

    .line 93
    .line 94
    if-nez v2, :cond_0

    .line 95
    .line 96
    iget-object v2, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 97
    .line 98
    invoke-virtual {v2, v0}, Lio/agora/rtc2/RtcEngine;->pushExternalVideoFrame(Lio/agora/rtc2/video/AgoraVideoFrame;)Z

    .line 99
    .line 100
    .line 101
    goto :goto_0

    .line 102
    :catchall_0
    move-exception p0

    .line 103
    goto :goto_1

    .line 104
    :cond_0
    :goto_0
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 105
    iget p1, p0, Ll/tc0;->u1:I

    .line 106
    .line 107
    add-int/2addr p1, v1

    .line 108
    iput p1, p0, Ll/tc0;->u1:I

    .line 109
    .line 110
    const/16 v0, 0x1e

    .line 111
    .line 112
    if-ge p1, v0, :cond_1

    .line 113
    .line 114
    iget-boolean p1, p0, Ll/tc0;->v1:Z

    .line 115
    .line 116
    if-eqz p1, :cond_2

    .line 117
    .line 118
    :cond_1
    invoke-direct {p0}, Ll/tc0;->M6()V

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    :goto_1
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 123
    throw p0

    .line 124
    :cond_2
    return-void
.end method

.method public v7(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public w1()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/tc0;->o1:Ll/ror;

    .line 2
    .line 3
    const-string v0, "M"

    .line 4
    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    iget-boolean p0, p0, Ll/ror;->h1:Z

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_0
    const-string p0, "S"

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_1
    return-object v0
.end method

.method public w6()F
    .locals 0

    .line 1
    iget p0, p0, Ll/tc0;->i1:F

    .line 2
    .line 3
    return p0
.end method

.method public w7(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public x1()J
    .locals 2

    .line 1
    iget p0, p0, Ll/tc0;->k1:I

    .line 2
    .line 3
    mul-int/lit16 p0, p0, 0x400

    .line 4
    .line 5
    int-to-long v0, p0

    .line 6
    return-wide v0
.end method

.method public x6()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lio/agora/rtc2/RtcEngine;->getAudioMixingDuration()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    int-to-long v0, p0

    .line 10
    return-wide v0

    .line 11
    :cond_0
    const-wide/16 v0, 0x0

    .line 12
    .line 13
    return-wide v0
.end method

.method public x7(Ljava/lang/String;)V
    .locals 2

    .line 1
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v1, "che.audio.profile"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    goto :goto_0

    .line 13
    :catch_0
    move-exception v0

    .line 14
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    :goto_0
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_0
    invoke-virtual {p0, p1}, Lio/agora/rtc2/RtcEngine;->setParameters(Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    :cond_1
    :goto_1
    return-void
.end method

.method public y(II)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "interval:"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, ",smooth:"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-string v2, "agoraPusherFilter"

    .line 26
    .line 27
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 35
    .line 36
    if-eqz p0, :cond_0

    .line 37
    .line 38
    const/4 v0, 0x1

    .line 39
    invoke-virtual {p0, p1, p2, v0}, Lio/agora/rtc2/RtcEngine;->enableAudioVolumeIndication(IIZ)I

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public y0(III)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "interval:"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, ",smooth:"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-string v2, "agoraPusherFilter"

    .line 26
    .line 27
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    if-eqz p3, :cond_0

    .line 35
    .line 36
    const/4 p3, 0x1

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const/4 p3, 0x0

    .line 39
    :goto_0
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 40
    .line 41
    if-eqz p0, :cond_1

    .line 42
    .line 43
    invoke-virtual {p0, p1, p2, p3}, Lio/agora/rtc2/RtcEngine;->enableAudioVolumeIndication(IIZ)I

    .line 44
    .line 45
    .line 46
    :cond_1
    return-void
.end method

.method public y6()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/tc0;->U:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lio/agora/rtc2/RtcEngine;->getAudioMixingCurrentPosition()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    int-to-long v0, p0

    .line 10
    return-wide v0

    .line 11
    :cond_0
    const-wide/16 v0, 0x0

    .line 12
    .line 13
    return-wide v0
.end method

.method public y7(ZZ)V
    .locals 0

    .line 1
    return-void
.end method

.method public z5(Lcom/immomo/mediacore/coninf/MRtcEventHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tc0;->R1:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 2
    .line 3
    return-void
.end method

.method public z7(Ljava/lang/String;)V
    .locals 31

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const-string v2, "pkmu"

    .line 6
    .line 7
    const-string v3, "renderMode"

    .line 8
    .line 9
    const-string v4, "alpha"

    .line 10
    .line 11
    const-string v5, "z"

    .line 12
    .line 13
    const-string v6, "h"

    .line 14
    .line 15
    const-string v7, "w"

    .line 16
    .line 17
    const-string v8, "y"

    .line 18
    .line 19
    const-string v9, "x"

    .line 20
    .line 21
    const-string v10, "id"

    .line 22
    .line 23
    const-string v11, "has"

    .line 24
    .line 25
    const-string v12, "conf"

    .line 26
    .line 27
    const-string v13, "shortSei"

    .line 28
    .line 29
    const-string v14, "mid"

    .line 30
    .line 31
    const-string v15, "bType"

    .line 32
    .line 33
    move-object/from16 v16, v2

    .line 34
    .line 35
    const-string v2, "ts"

    .line 36
    .line 37
    move-object/from16 v17, v3

    .line 38
    .line 39
    iget-object v3, v0, Ll/tc0;->o1:Ll/ror;

    .line 40
    .line 41
    if-eqz v3, :cond_21

    .line 42
    .line 43
    if-nez v1, :cond_0

    .line 44
    .line 45
    goto/16 :goto_f

    .line 46
    .line 47
    :cond_0
    iget-object v3, v0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 48
    .line 49
    if-nez v3, :cond_1

    .line 50
    .line 51
    new-instance v3, Lio/agora/rtc2/live/LiveTranscoding;

    .line 52
    .line 53
    invoke-direct {v3}, Lio/agora/rtc2/live/LiveTranscoding;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object v3, v0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 57
    .line 58
    :cond_1
    iget-object v3, v0, Ll/tc0;->o1:Ll/ror;

    .line 59
    .line 60
    move-object/from16 v18, v4

    .line 61
    .line 62
    iget v4, v3, Ll/tow;->k:I

    .line 63
    .line 64
    move-object/from16 v19, v5

    .line 65
    .line 66
    iget-object v5, v0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 67
    .line 68
    move-object/from16 v20, v6

    .line 69
    .line 70
    const/4 v6, 0x1

    .line 71
    if-lez v4, :cond_2

    .line 72
    .line 73
    iput v4, v5, Lio/agora/rtc2/live/LiveTranscoding;->width:I

    .line 74
    .line 75
    iget v4, v3, Ll/tow;->l:I

    .line 76
    .line 77
    iput v4, v5, Lio/agora/rtc2/live/LiveTranscoding;->height:I

    .line 78
    .line 79
    iget-boolean v4, v3, Ll/uow;->F0:Z

    .line 80
    .line 81
    if-eqz v4, :cond_3

    .line 82
    .line 83
    invoke-virtual {v3}, Ll/uow;->d()I

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    if-ne v3, v6, :cond_3

    .line 88
    .line 89
    iget-object v3, v0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 90
    .line 91
    iget-object v4, v0, Ll/tc0;->o1:Ll/ror;

    .line 92
    .line 93
    iget v5, v4, Ll/tow;->l:I

    .line 94
    .line 95
    iput v5, v3, Lio/agora/rtc2/live/LiveTranscoding;->width:I

    .line 96
    .line 97
    iget v4, v4, Ll/tow;->k:I

    .line 98
    .line 99
    iput v4, v3, Lio/agora/rtc2/live/LiveTranscoding;->height:I

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_2
    iget v4, v3, Ll/tow;->s:I

    .line 103
    .line 104
    iput v4, v5, Lio/agora/rtc2/live/LiveTranscoding;->width:I

    .line 105
    .line 106
    iget v3, v3, Ll/tow;->t:I

    .line 107
    .line 108
    iput v3, v5, Lio/agora/rtc2/live/LiveTranscoding;->height:I

    .line 109
    .line 110
    :cond_3
    :goto_0
    iget-object v3, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 111
    .line 112
    new-instance v4, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    const-string v5, "w:"

    .line 115
    .line 116
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    iget-object v5, v0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 120
    .line 121
    iget v5, v5, Lio/agora/rtc2/live/LiveTranscoding;->width:I

    .line 122
    .line 123
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v4

    .line 130
    new-instance v5, Ljava/lang/StringBuilder;

    .line 131
    .line 132
    const-string v6, "h:"

    .line 133
    .line 134
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    iget-object v6, v0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 138
    .line 139
    iget v6, v6, Lio/agora/rtc2/live/LiveTranscoding;->height:I

    .line 140
    .line 141
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v5

    .line 148
    const-string v6, "setJsonForPostion publishConfig"

    .line 149
    .line 150
    filled-new-array {v6, v4, v5}, [Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v4

    .line 154
    invoke-virtual {v3, v4}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 155
    .line 156
    .line 157
    iget-object v3, v0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 158
    .line 159
    iget v4, v3, Lio/agora/rtc2/live/LiveTranscoding;->width:I

    .line 160
    .line 161
    if-lez v4, :cond_21

    .line 162
    .line 163
    iget v4, v3, Lio/agora/rtc2/live/LiveTranscoding;->height:I

    .line 164
    .line 165
    if-gtz v4, :cond_4

    .line 166
    .line 167
    goto/16 :goto_f

    .line 168
    .line 169
    :cond_4
    const/4 v4, 0x0

    .line 170
    iput v4, v3, Lio/agora/rtc2/live/LiveTranscoding;->backgroundColor:I

    .line 171
    .line 172
    :try_start_0
    new-instance v5, Lorg/json/JSONObject;

    .line 173
    .line 174
    invoke-direct {v5, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    invoke-virtual {v5, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 178
    .line 179
    .line 180
    move-result v6

    .line 181
    if-eqz v6, :cond_5

    .line 182
    .line 183
    invoke-virtual {v5, v2}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    :cond_5
    invoke-virtual {v0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Y1()J

    .line 187
    .line 188
    .line 189
    move-result-wide v3

    .line 190
    invoke-virtual {v5, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 191
    .line 192
    .line 193
    invoke-virtual {v5, v15}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 194
    .line 195
    .line 196
    move-result v2

    .line 197
    if-eqz v2, :cond_6

    .line 198
    .line 199
    invoke-virtual {v5, v15}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    :cond_6
    iget-object v2, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 203
    .line 204
    iget-wide v2, v2, Ll/wvx;->s:J

    .line 205
    .line 206
    invoke-virtual {v5, v15, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 207
    .line 208
    .line 209
    goto :goto_1

    .line 210
    :catch_0
    const/4 v5, 0x0

    .line 211
    :goto_1
    if-eqz v5, :cond_7

    .line 212
    .line 213
    :try_start_1
    invoke-virtual {v5}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v1

    .line 217
    :cond_7
    new-instance v2, Lorg/json/JSONObject;

    .line 218
    .line 219
    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 220
    .line 221
    .line 222
    invoke-virtual {v2, v14}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 223
    .line 224
    .line 225
    move-result v3
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 226
    const-string v4, ""

    .line 227
    .line 228
    if-eqz v3, :cond_8

    .line 229
    .line 230
    :try_start_2
    invoke-virtual {v2, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object v3

    .line 234
    goto :goto_2

    .line 235
    :cond_8
    move-object v3, v4

    .line 236
    :goto_2
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 237
    .line 238
    .line 239
    move-result v5

    .line 240
    if-eqz v5, :cond_9

    .line 241
    .line 242
    goto/16 :goto_f

    .line 243
    .line 244
    :cond_9
    invoke-virtual {v2, v13}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 245
    .line 246
    .line 247
    move-result v5

    .line 248
    if-eqz v5, :cond_a

    .line 249
    .line 250
    const/4 v6, 0x0

    .line 251
    invoke-virtual {v2, v13, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 252
    .line 253
    .line 254
    move-result v5

    .line 255
    goto :goto_3

    .line 256
    :cond_a
    const/4 v5, 0x0

    .line 257
    :goto_3
    iget-object v13, v0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 258
    .line 259
    const/4 v14, 0x0

    .line 260
    invoke-virtual {v13, v14}, Lio/agora/rtc2/live/LiveTranscoding;->setUsers(Ljava/util/ArrayList;)V

    .line 261
    .line 262
    .line 263
    invoke-virtual {v2, v12}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 264
    .line 265
    .line 266
    move-result v13

    .line 267
    const/high16 v14, 0x3f800000    # 1.0f

    .line 268
    .line 269
    if-nez v13, :cond_d

    .line 270
    .line 271
    invoke-virtual {v2, v11}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 272
    .line 273
    .line 274
    move-result v12

    .line 275
    if-nez v12, :cond_b

    .line 276
    .line 277
    goto/16 :goto_f

    .line 278
    .line 279
    :cond_b
    invoke-virtual {v2, v11}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 280
    .line 281
    .line 282
    move-result-object v2

    .line 283
    if-eqz v2, :cond_c

    .line 284
    .line 285
    new-instance v11, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;

    .line 286
    .line 287
    invoke-direct {v11}, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;-><init>()V

    .line 288
    .line 289
    .line 290
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 291
    .line 292
    .line 293
    move-result v3

    .line 294
    iput v3, v11, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->uid:I

    .line 295
    .line 296
    const/4 v3, 0x1

    .line 297
    iput v3, v11, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->zOrder:I

    .line 298
    .line 299
    const/4 v6, 0x0

    .line 300
    iput v6, v11, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->x:I

    .line 301
    .line 302
    iput v6, v11, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->y:I

    .line 303
    .line 304
    iget-object v3, v0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 305
    .line 306
    iget v12, v3, Lio/agora/rtc2/live/LiveTranscoding;->width:I

    .line 307
    .line 308
    iput v12, v11, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->width:I

    .line 309
    .line 310
    iget v12, v3, Lio/agora/rtc2/live/LiveTranscoding;->height:I

    .line 311
    .line 312
    iput v12, v11, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->height:I

    .line 313
    .line 314
    iput v14, v11, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->alpha:F

    .line 315
    .line 316
    invoke-virtual {v3, v11}, Lio/agora/rtc2/live/LiveTranscoding;->addUser(Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;)I

    .line 317
    .line 318
    .line 319
    iget-object v3, v0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 320
    .line 321
    invoke-direct {v0, v1}, Ll/tc0;->v6(Ljava/lang/String;)Ljava/lang/String;

    .line 322
    .line 323
    .line 324
    move-result-object v11

    .line 325
    iput-object v11, v3, Lio/agora/rtc2/live/LiveTranscoding;->userConfigExtraInfo:Ljava/lang/String;

    .line 326
    .line 327
    goto :goto_4

    .line 328
    :cond_c
    const/4 v6, 0x0

    .line 329
    goto :goto_4

    .line 330
    :cond_d
    const/4 v6, 0x0

    .line 331
    invoke-virtual {v2, v12}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 332
    .line 333
    .line 334
    move-result-object v2

    .line 335
    :goto_4
    if-nez v2, :cond_e

    .line 336
    .line 337
    goto/16 :goto_f

    .line 338
    .line 339
    :cond_e
    move v3, v6

    .line 340
    :goto_5
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    .line 341
    .line 342
    .line 343
    move-result v11

    .line 344
    if-ge v3, v11, :cond_1f

    .line 345
    .line 346
    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    .line 347
    .line 348
    .line 349
    move-result-object v11

    .line 350
    check-cast v11, Lorg/json/JSONObject;

    .line 351
    .line 352
    if-eqz v11, :cond_f

    .line 353
    .line 354
    invoke-virtual {v11, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 355
    .line 356
    .line 357
    move-result v12

    .line 358
    if-eqz v12, :cond_f

    .line 359
    .line 360
    invoke-virtual {v11, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 361
    .line 362
    .line 363
    move-result-object v12

    .line 364
    goto :goto_6

    .line 365
    :cond_f
    move-object v12, v4

    .line 366
    :goto_6
    const-wide/16 v22, 0x0

    .line 367
    .line 368
    if-eqz v11, :cond_10

    .line 369
    .line 370
    invoke-virtual {v11, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 371
    .line 372
    .line 373
    move-result v13

    .line 374
    if-eqz v13, :cond_10

    .line 375
    .line 376
    invoke-virtual {v11, v9}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 377
    .line 378
    .line 379
    move-result-wide v24

    .line 380
    goto :goto_7

    .line 381
    :cond_10
    move-wide/from16 v24, v22

    .line 382
    .line 383
    :goto_7
    if-eqz v11, :cond_11

    .line 384
    .line 385
    invoke-virtual {v11, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 386
    .line 387
    .line 388
    move-result v13

    .line 389
    if-eqz v13, :cond_11

    .line 390
    .line 391
    invoke-virtual {v11, v8}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 392
    .line 393
    .line 394
    move-result-wide v22

    .line 395
    :cond_11
    const-wide/high16 v26, 0x3ff0000000000000L    # 1.0

    .line 396
    .line 397
    if-eqz v11, :cond_12

    .line 398
    .line 399
    invoke-virtual {v11, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 400
    .line 401
    .line 402
    move-result v13

    .line 403
    if-eqz v13, :cond_12

    .line 404
    .line 405
    invoke-virtual {v11, v7}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 406
    .line 407
    .line 408
    move-result-wide v28

    .line 409
    goto :goto_8

    .line 410
    :cond_12
    move-wide/from16 v28, v26

    .line 411
    .line 412
    :goto_8
    if-eqz v11, :cond_13

    .line 413
    .line 414
    move-object/from16 v13, v20

    .line 415
    .line 416
    invoke-virtual {v11, v13}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 417
    .line 418
    .line 419
    move-result v15

    .line 420
    if-eqz v15, :cond_14

    .line 421
    .line 422
    invoke-virtual {v11, v13}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 423
    .line 424
    .line 425
    move-result-wide v26

    .line 426
    goto :goto_9

    .line 427
    :cond_13
    move-object/from16 v13, v20

    .line 428
    .line 429
    :cond_14
    :goto_9
    if-eqz v11, :cond_15

    .line 430
    .line 431
    move-object/from16 v15, v19

    .line 432
    .line 433
    invoke-virtual {v11, v15}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 434
    .line 435
    .line 436
    move-result v19

    .line 437
    if-eqz v19, :cond_16

    .line 438
    .line 439
    invoke-virtual {v11, v15}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 440
    .line 441
    .line 442
    move-result v19

    .line 443
    const/16 v21, 0x1

    .line 444
    .line 445
    add-int/lit8 v19, v19, 0x1

    .line 446
    .line 447
    move/from16 v6, v19

    .line 448
    .line 449
    goto :goto_a

    .line 450
    :cond_15
    move-object/from16 v15, v19

    .line 451
    .line 452
    :cond_16
    const/4 v6, 0x1

    .line 453
    :goto_a
    if-eqz v11, :cond_17

    .line 454
    .line 455
    move-object/from16 v14, v18

    .line 456
    .line 457
    invoke-virtual {v11, v14}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 458
    .line 459
    .line 460
    move-result v18

    .line 461
    if-eqz v18, :cond_18

    .line 462
    .line 463
    invoke-virtual {v11, v14}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 464
    .line 465
    .line 466
    goto :goto_b

    .line 467
    :cond_17
    move-object/from16 v14, v18

    .line 468
    .line 469
    :cond_18
    :goto_b
    if-eqz v11, :cond_19

    .line 470
    .line 471
    move-object/from16 v18, v2

    .line 472
    .line 473
    move-object/from16 v2, v17

    .line 474
    .line 475
    invoke-virtual {v11, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 476
    .line 477
    .line 478
    move-result v17

    .line 479
    if-eqz v17, :cond_1a

    .line 480
    .line 481
    invoke-virtual {v11, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 482
    .line 483
    .line 484
    goto :goto_c

    .line 485
    :cond_19
    move-object/from16 v18, v2

    .line 486
    .line 487
    move-object/from16 v2, v17

    .line 488
    .line 489
    :cond_1a
    :goto_c
    if-eqz v11, :cond_1d

    .line 490
    .line 491
    move-object/from16 v17, v2

    .line 492
    .line 493
    move-object/from16 v2, v16

    .line 494
    .line 495
    invoke-virtual {v11, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 496
    .line 497
    .line 498
    move-result v16

    .line 499
    if-eqz v16, :cond_1c

    .line 500
    .line 501
    invoke-virtual {v11, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 502
    .line 503
    .line 504
    move-result v11

    .line 505
    move-object/from16 v16, v2

    .line 506
    .line 507
    const/4 v2, 0x2

    .line 508
    if-ne v11, v2, :cond_1b

    .line 509
    .line 510
    const/16 v2, 0xff

    .line 511
    .line 512
    goto :goto_e

    .line 513
    :cond_1b
    :goto_d
    const/4 v2, 0x0

    .line 514
    goto :goto_e

    .line 515
    :cond_1c
    move-object/from16 v16, v2

    .line 516
    .line 517
    goto :goto_d

    .line 518
    :cond_1d
    move-object/from16 v17, v2

    .line 519
    .line 520
    goto :goto_d

    .line 521
    :goto_e
    new-instance v11, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;

    .line 522
    .line 523
    invoke-direct {v11}, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;-><init>()V

    .line 524
    .line 525
    .line 526
    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 527
    .line 528
    .line 529
    move-result v20

    .line 530
    if-eqz v20, :cond_1e

    .line 531
    .line 532
    iget-object v2, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 533
    .line 534
    const-string v3, "setJsonForPostion "

    .line 535
    .line 536
    const-string v4, "id is empty string"

    .line 537
    .line 538
    filled-new-array {v3, v4}, [Ljava/lang/Object;

    .line 539
    .line 540
    .line 541
    move-result-object v3

    .line 542
    invoke-virtual {v2, v3}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 543
    .line 544
    .line 545
    goto/16 :goto_f

    .line 546
    .line 547
    :cond_1e
    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 548
    .line 549
    .line 550
    move-result v12

    .line 551
    iput v12, v11, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->uid:I

    .line 552
    .line 553
    iput v6, v11, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->zOrder:I

    .line 554
    .line 555
    const/high16 v6, 0x3f800000    # 1.0f

    .line 556
    .line 557
    iput v6, v11, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->alpha:F

    .line 558
    .line 559
    iget-object v12, v0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 560
    .line 561
    iget v6, v12, Lio/agora/rtc2/live/LiveTranscoding;->width:I

    .line 562
    .line 563
    move/from16 v30, v3

    .line 564
    .line 565
    move-object/from16 v20, v4

    .line 566
    .line 567
    int-to-double v3, v6

    .line 568
    mul-double v3, v3, v24

    .line 569
    .line 570
    double-to-int v3, v3

    .line 571
    iput v3, v11, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->x:I

    .line 572
    .line 573
    iget v3, v12, Lio/agora/rtc2/live/LiveTranscoding;->height:I

    .line 574
    .line 575
    move-object v4, v7

    .line 576
    move-object/from16 v24, v8

    .line 577
    .line 578
    int-to-double v7, v3

    .line 579
    mul-double v7, v7, v22

    .line 580
    .line 581
    double-to-int v7, v7

    .line 582
    iput v7, v11, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->y:I

    .line 583
    .line 584
    int-to-double v6, v6

    .line 585
    mul-double v6, v6, v28

    .line 586
    .line 587
    double-to-int v6, v6

    .line 588
    iput v6, v11, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->width:I

    .line 589
    .line 590
    int-to-double v6, v3

    .line 591
    mul-double v6, v6, v26

    .line 592
    .line 593
    double-to-int v3, v6

    .line 594
    iput v3, v11, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->height:I

    .line 595
    .line 596
    iput v2, v11, Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;->audioChannel:I

    .line 597
    .line 598
    invoke-virtual {v12, v11}, Lio/agora/rtc2/live/LiveTranscoding;->addUser(Lio/agora/rtc2/live/LiveTranscoding$TranscodingUser;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 599
    .line 600
    .line 601
    add-int/lit8 v3, v30, 0x1

    .line 602
    .line 603
    move-object v7, v4

    .line 604
    move-object/from16 v19, v15

    .line 605
    .line 606
    move-object/from16 v2, v18

    .line 607
    .line 608
    move-object/from16 v4, v20

    .line 609
    .line 610
    move-object/from16 v8, v24

    .line 611
    .line 612
    const/4 v6, 0x0

    .line 613
    move-object/from16 v20, v13

    .line 614
    .line 615
    move-object/from16 v18, v14

    .line 616
    .line 617
    const/high16 v14, 0x3f800000    # 1.0f

    .line 618
    .line 619
    goto/16 :goto_5

    .line 620
    .line 621
    :cond_1f
    iget-object v2, v0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 622
    .line 623
    invoke-direct {v0, v1}, Ll/tc0;->v6(Ljava/lang/String;)Ljava/lang/String;

    .line 624
    .line 625
    .line 626
    move-result-object v3

    .line 627
    iput-object v3, v2, Lio/agora/rtc2/live/LiveTranscoding;->userConfigExtraInfo:Ljava/lang/String;

    .line 628
    .line 629
    const/4 v3, 0x1

    .line 630
    if-ne v5, v3, :cond_20

    .line 631
    .line 632
    invoke-direct {v0, v1}, Ll/tc0;->p6(Ljava/lang/String;)Ljava/lang/String;

    .line 633
    .line 634
    .line 635
    move-result-object v1

    .line 636
    iget-object v2, v0, Ll/tc0;->h2:Lio/agora/rtc2/live/LiveTranscoding;

    .line 637
    .line 638
    iput-object v1, v2, Lio/agora/rtc2/live/LiveTranscoding;->userConfigExtraInfo:Ljava/lang/String;

    .line 639
    .line 640
    :cond_20
    iget-object v1, v0, Ll/tc0;->o1:Ll/ror;

    .line 641
    .line 642
    iget-object v1, v1, Ll/uow;->v0:Ljava/lang/String;

    .line 643
    .line 644
    invoke-direct {v0, v1}, Ll/tc0;->U5(Ljava/lang/String;)V

    .line 645
    .line 646
    .line 647
    return-void

    .line 648
    :catch_1
    iget-object v0, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 649
    .line 650
    new-instance v2, Ljava/lang/StringBuilder;

    .line 651
    .line 652
    const-string v3, "pos:"

    .line 653
    .line 654
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 655
    .line 656
    .line 657
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 658
    .line 659
    .line 660
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 661
    .line 662
    .line 663
    move-result-object v1

    .line 664
    const-string v2, "setJsonForPostion parseInt err"

    .line 665
    .line 666
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 667
    .line 668
    .line 669
    move-result-object v1

    .line 670
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 671
    .line 672
    .line 673
    :cond_21
    :goto_f
    return-void
.end method
