.class public final Lwjp;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lsjp;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I

.field public final d:I

.field public final e:J

.field public final f:Lzap;

.field public final g:Lzap;

.field public final h:I

.field public final i:I

.field public final j:Ljava/lang/String;

.field public k:Z

.field public l:J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lsjp;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lwjp;->Companion:Lsjp;

    return-void
.end method

.method public constructor <init>(IIIIIJLzap;Lzap;IILjava/lang/String;ZJ)V
    .registers 19

    and-int/lit16 v0, p1, 0x1bf

    const/4 v1, 0x0

    const/16 v2, 0x1bf

    if-ne v2, v0, :cond_43

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Lwjp;->a:I

    iput p3, p0, Lwjp;->b:I

    iput p4, p0, Lwjp;->c:I

    iput p5, p0, Lwjp;->d:I

    iput-wide p6, p0, Lwjp;->e:J

    iput-object p8, p0, Lwjp;->f:Lzap;

    and-int/lit8 p2, p1, 0x40

    if-nez p2, :cond_1d

    iput-object v1, p0, Lwjp;->g:Lzap;

    goto :goto_1f

    :cond_1d
    iput-object p9, p0, Lwjp;->g:Lzap;

    :goto_1f
    iput p10, p0, Lwjp;->h:I

    iput p11, p0, Lwjp;->i:I

    and-int/lit16 p2, p1, 0x200

    if-nez p2, :cond_2a

    iput-object v1, p0, Lwjp;->j:Ljava/lang/String;

    goto :goto_2c

    :cond_2a
    iput-object p12, p0, Lwjp;->j:Ljava/lang/String;

    :goto_2c
    and-int/lit16 p2, p1, 0x400

    if-nez p2, :cond_34

    const/4 p2, 0x0

    :goto_31
    iput-boolean p2, p0, Lwjp;->k:Z

    goto :goto_37

    :cond_34
    move/from16 p2, p13

    goto :goto_31

    :goto_37
    and-int/lit16 p1, p1, 0x800

    if-nez p1, :cond_40

    const-wide/16 p1, -0x1

    :goto_3d
    iput-wide p1, p0, Lwjp;->l:J

    return-void

    :cond_40
    move-wide/from16 p1, p14

    goto :goto_3d

    :cond_43
    sget-object p0, Lrjp;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-static {p1, v2, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    throw v1
.end method

.method public constructor <init>(IIIIJLzap;Lzap;IILjava/lang/String;)V
    .registers 12

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lwjp;->a:I

    iput p2, p0, Lwjp;->b:I

    iput p3, p0, Lwjp;->c:I

    iput p4, p0, Lwjp;->d:I

    iput-wide p5, p0, Lwjp;->e:J

    iput-object p7, p0, Lwjp;->f:Lzap;

    iput-object p8, p0, Lwjp;->g:Lzap;

    iput p9, p0, Lwjp;->h:I

    iput p10, p0, Lwjp;->i:I

    iput-object p11, p0, Lwjp;->j:Ljava/lang/String;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lwjp;->k:Z

    const-wide/16 p1, -0x1

    iput-wide p1, p0, Lwjp;->l:J

    return-void
.end method
