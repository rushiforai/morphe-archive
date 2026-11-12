.class public final Lizo;
.super Lp8p;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lryo;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final m:[Lkotlinx/serialization/KSerializer;


# instance fields
.field public final g:Ljava/lang/String;

.field public final h:Ljava/lang/String;

.field public final i:Ljava/lang/String;

.field public final j:Lsm;

.field public final k:Lfuo;

.field public final l:Lwjp;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lryo;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lizo;->Companion:Lryo;

    invoke-static {}, Lsm;->values()[Lsm;

    move-result-object v0

    new-instance v1, Li58;

    const-string v2, "com.opera.ads.AdFormat"

    invoke-direct {v1, v2, v0}, Li58;-><init>(Ljava/lang/String;[Ljava/lang/Enum;)V

    sget-object v0, Lfuo;->Companion:Lqto;

    invoke-virtual {v0}, Lqto;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v0

    const/4 v2, 0x6

    new-array v2, v2, [Lkotlinx/serialization/KSerializer;

    const/4 v3, 0x0

    const/4 v4, 0x0

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object v4, v2, v3

    const/4 v3, 0x2

    aput-object v4, v2, v3

    const/4 v3, 0x3

    aput-object v1, v2, v3

    const/4 v1, 0x4

    aput-object v0, v2, v1

    const/4 v0, 0x5

    aput-object v4, v2, v0

    sput-object v2, Lizo;->m:[Lkotlinx/serialization/KSerializer;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lsm;Lfuo;Lwjp;)V
    .registers 10

    and-int/lit8 v0, p1, 0x3f

    const/16 v1, 0x3f

    if-ne v1, v0, :cond_16

    invoke-direct {p0}, Lp8p;-><init>()V

    iput-object p2, p0, Lizo;->g:Ljava/lang/String;

    iput-object p3, p0, Lizo;->h:Ljava/lang/String;

    iput-object p4, p0, Lizo;->i:Ljava/lang/String;

    iput-object p5, p0, Lizo;->j:Lsm;

    iput-object p6, p0, Lizo;->k:Lfuo;

    iput-object p7, p0, Lizo;->l:Lwjp;

    return-void

    :cond_16
    sget-object p0, Loyo;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-static {p1, v1, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lsm;Lfuo;Lwjp;)V
    .registers 8

    .line 29
    sget-object v0, Lwlp;->b:Lurj;

    .line 30
    const-string v0, "click_coords"

    .line 31
    invoke-direct {p0, v0}, Lp8p;-><init>(Ljava/lang/String;)V

    .line 32
    iput-object p1, p0, Lizo;->g:Ljava/lang/String;

    iput-object p2, p0, Lizo;->h:Ljava/lang/String;

    iput-object p3, p0, Lizo;->i:Ljava/lang/String;

    iput-object p4, p0, Lizo;->j:Lsm;

    iput-object p5, p0, Lizo;->k:Lfuo;

    iput-object p6, p0, Lizo;->l:Lwjp;

    return-void
.end method
