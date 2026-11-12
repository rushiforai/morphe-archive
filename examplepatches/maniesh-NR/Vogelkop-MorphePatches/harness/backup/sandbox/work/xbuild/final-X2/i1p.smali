.class public final Li1p;
.super Lp8p;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lj0p;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final n:[Lkotlinx/serialization/KSerializer;


# instance fields
.field public final g:Ljava/lang/String;

.field public final h:Ljava/lang/String;

.field public final i:Ljava/lang/String;

.field public final j:Lfuo;

.field public final k:Ljava/lang/String;

.field public final l:Ljava/lang/String;

.field public final m:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lj0p;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Li1p;->Companion:Lj0p;

    sget-object v0, Lfuo;->Companion:Lqto;

    invoke-virtual {v0}, Lqto;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v0

    const/4 v1, 0x7

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

    sput-object v1, Li1p;->n:[Lkotlinx/serialization/KSerializer;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lfuo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 12

    and-int/lit8 v0, p1, 0x3f

    const/4 v1, 0x0

    const/16 v2, 0x3f

    if-ne v2, v0, :cond_20

    invoke-direct {p0}, Lp8p;-><init>()V

    iput-object p2, p0, Li1p;->g:Ljava/lang/String;

    iput-object p3, p0, Li1p;->h:Ljava/lang/String;

    iput-object p4, p0, Li1p;->i:Ljava/lang/String;

    iput-object p5, p0, Li1p;->j:Lfuo;

    iput-object p6, p0, Li1p;->k:Ljava/lang/String;

    iput-object p7, p0, Li1p;->l:Ljava/lang/String;

    and-int/lit8 p1, p1, 0x40

    if-nez p1, :cond_1d

    iput-object v1, p0, Li1p;->m:Ljava/lang/String;

    return-void

    :cond_1d
    iput-object p8, p0, Li1p;->m:Ljava/lang/String;

    return-void

    :cond_20
    sget-object p0, Ld0p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-static {p1, v2, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    throw v1
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lfuo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 9

    .line 38
    sget-object v0, Lwlp;->b:Lurj;

    .line 39
    const-string v0, "click"

    .line 40
    invoke-direct {p0, v0}, Lp8p;-><init>(Ljava/lang/String;)V

    .line 41
    iput-object p1, p0, Li1p;->g:Ljava/lang/String;

    iput-object p2, p0, Li1p;->h:Ljava/lang/String;

    iput-object p3, p0, Li1p;->i:Ljava/lang/String;

    iput-object p4, p0, Li1p;->j:Lfuo;

    iput-object p5, p0, Li1p;->k:Ljava/lang/String;

    iput-object p6, p0, Li1p;->l:Ljava/lang/String;

    iput-object p7, p0, Li1p;->m:Ljava/lang/String;

    return-void
.end method
