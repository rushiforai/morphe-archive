.class public final Lx2p;
.super Lp8p;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Le2p;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final r:[Lkotlinx/serialization/KSerializer;


# instance fields
.field public final g:Ljava/lang/String;

.field public final h:Ljava/lang/String;

.field public final i:Ljava/lang/String;

.field public final j:Lfuo;

.field public final k:Ljava/lang/String;

.field public final l:Ljava/lang/Boolean;

.field public final m:J

.field public final n:I

.field public final o:J

.field public final p:J

.field public final q:J


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Le2p;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lx2p;->Companion:Le2p;

    sget-object v0, Lfuo;->Companion:Lqto;

    invoke-virtual {v0}, Lqto;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v0

    const/16 v1, 0xb

    new-array v1, v1, [Lkotlinx/serialization/KSerializer;

    const/4 v2, 0x0

    const/4 v3, 0x0

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object v3, v1, v2

    const/4 v2, 0x2

    aput-object v3, v1, v2

    const/4 v2, 0x3

    aput-object v0, v1, v2

    const/4 v0, 0x4

    aput-object v3, v1, v0

    const/4 v0, 0x5

    aput-object v3, v1, v0

    const/4 v0, 0x6

    aput-object v3, v1, v0

    const/4 v0, 0x7

    aput-object v3, v1, v0

    const/16 v0, 0x8

    aput-object v3, v1, v0

    const/16 v0, 0x9

    aput-object v3, v1, v0

    const/16 v0, 0xa

    aput-object v3, v1, v0

    sput-object v1, Lx2p;->r:[Lkotlinx/serialization/KSerializer;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lfuo;Ljava/lang/String;Ljava/lang/Boolean;JIJJJ)V
    .registers 20

    and-int/lit16 v0, p1, 0x7cf

    const/4 v1, 0x0

    const/16 v2, 0x7cf

    if-ne v2, v0, :cond_33

    invoke-direct {p0}, Lp8p;-><init>()V

    iput-object p2, p0, Lx2p;->g:Ljava/lang/String;

    iput-object p3, p0, Lx2p;->h:Ljava/lang/String;

    iput-object p4, p0, Lx2p;->i:Ljava/lang/String;

    iput-object p5, p0, Lx2p;->j:Lfuo;

    and-int/lit8 p2, p1, 0x10

    if-nez p2, :cond_19

    iput-object v1, p0, Lx2p;->k:Ljava/lang/String;

    goto :goto_1b

    :cond_19
    iput-object p6, p0, Lx2p;->k:Ljava/lang/String;

    :goto_1b
    and-int/lit8 p1, p1, 0x20

    if-nez p1, :cond_22

    iput-object v1, p0, Lx2p;->l:Ljava/lang/Boolean;

    goto :goto_24

    :cond_22
    iput-object p7, p0, Lx2p;->l:Ljava/lang/Boolean;

    :goto_24
    iput-wide p8, p0, Lx2p;->m:J

    iput p10, p0, Lx2p;->n:I

    iput-wide p11, p0, Lx2p;->o:J

    move-wide/from16 p1, p13

    iput-wide p1, p0, Lx2p;->p:J

    move-wide/from16 p1, p15

    iput-wide p1, p0, Lx2p;->q:J

    return-void

    :cond_33
    sget-object p0, Lb2p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-static {p1, v2, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    throw v1
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lfuo;Ljava/lang/String;Ljava/lang/Boolean;JIJJJ)V
    .registers 17

    .line 57
    sget-object v0, Lwlp;->b:Lurj;

    .line 58
    const-string v0, "close"

    .line 59
    invoke-direct {p0, v0}, Lp8p;-><init>(Ljava/lang/String;)V

    .line 60
    iput-object p1, p0, Lx2p;->g:Ljava/lang/String;

    iput-object p2, p0, Lx2p;->h:Ljava/lang/String;

    iput-object p3, p0, Lx2p;->i:Ljava/lang/String;

    iput-object p4, p0, Lx2p;->j:Lfuo;

    iput-object p5, p0, Lx2p;->k:Ljava/lang/String;

    iput-object p6, p0, Lx2p;->l:Ljava/lang/Boolean;

    iput-wide p7, p0, Lx2p;->m:J

    iput p9, p0, Lx2p;->n:I

    iput-wide p10, p0, Lx2p;->o:J

    iput-wide p12, p0, Lx2p;->p:J

    move-wide p1, p14

    iput-wide p1, p0, Lx2p;->q:J

    return-void
.end method
