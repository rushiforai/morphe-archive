.class public final Lebp;
.super Lp8p;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lvap;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final m:[Lkotlinx/serialization/KSerializer;


# instance fields
.field public final g:Ljava/lang/String;

.field public final h:Ljava/lang/String;

.field public final i:Ljava/lang/String;

.field public final j:Lfuo;

.field public final k:Ljava/lang/Double;

.field public final l:I


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lvap;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lebp;->Companion:Lvap;

    sget-object v0, Lfuo;->Companion:Lqto;

    invoke-virtual {v0}, Lqto;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v0

    const/4 v1, 0x6

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

    sput-object v1, Lebp;->m:[Lkotlinx/serialization/KSerializer;

    return-void
.end method

.method public constructor <init>(ILfuo;Ljava/lang/Double;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 8

    .line 36
    sget-object v0, Lwlp;->b:Lurj;

    .line 37
    const-string v0, "render"

    .line 38
    invoke-direct {p0, v0}, Lp8p;-><init>(Ljava/lang/String;)V

    .line 39
    iput-object p4, p0, Lebp;->g:Ljava/lang/String;

    iput-object p5, p0, Lebp;->h:Ljava/lang/String;

    iput-object p6, p0, Lebp;->i:Ljava/lang/String;

    iput-object p2, p0, Lebp;->j:Lfuo;

    iput-object p3, p0, Lebp;->k:Ljava/lang/Double;

    iput p1, p0, Lebp;->l:I

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lfuo;Ljava/lang/Double;I)V
    .registers 11

    and-int/lit8 v0, p1, 0x2f

    const/4 v1, 0x0

    const/16 v2, 0x2f

    if-ne v2, v0, :cond_1e

    invoke-direct {p0}, Lp8p;-><init>()V

    iput-object p2, p0, Lebp;->g:Ljava/lang/String;

    iput-object p3, p0, Lebp;->h:Ljava/lang/String;

    iput-object p4, p0, Lebp;->i:Ljava/lang/String;

    iput-object p5, p0, Lebp;->j:Lfuo;

    and-int/lit8 p1, p1, 0x10

    if-nez p1, :cond_19

    iput-object v1, p0, Lebp;->k:Ljava/lang/Double;

    goto :goto_1b

    :cond_19
    iput-object p6, p0, Lebp;->k:Ljava/lang/Double;

    :goto_1b
    iput p7, p0, Lebp;->l:I

    return-void

    :cond_1e
    sget-object p0, Luap;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-static {p1, v2, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    throw v1
.end method
