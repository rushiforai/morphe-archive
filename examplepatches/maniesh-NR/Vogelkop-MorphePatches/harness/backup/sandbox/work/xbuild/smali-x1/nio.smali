.class public final Lnio;
.super Lp8p;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lkio;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final k:[Lkotlinx/serialization/KSerializer;


# instance fields
.field public final g:Ljava/lang/String;

.field public final h:Ljava/lang/String;

.field public final i:Ljava/lang/String;

.field public final j:Lfuo;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lkio;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lnio;->Companion:Lkio;

    sget-object v0, Lfuo;->Companion:Lqto;

    invoke-virtual {v0}, Lqto;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v0

    const/4 v1, 0x4

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

    sput-object v1, Lnio;->k:[Lkotlinx/serialization/KSerializer;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lfuo;)V
    .registers 8

    and-int/lit8 v0, p1, 0xf

    const/16 v1, 0xf

    if-ne v1, v0, :cond_12

    invoke-direct {p0}, Lp8p;-><init>()V

    iput-object p2, p0, Lnio;->g:Ljava/lang/String;

    iput-object p3, p0, Lnio;->h:Ljava/lang/String;

    iput-object p4, p0, Lnio;->i:Ljava/lang/String;

    iput-object p5, p0, Lnio;->j:Lfuo;

    return-void

    :cond_12
    sget-object p0, Ljio;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-static {p1, v1, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lfuo;)V
    .registers 6

    .line 25
    sget-object v0, Lwlp;->b:Lurj;

    .line 26
    const-string v0, "wvvm_adChoice"

    .line 27
    invoke-direct {p0, v0}, Lp8p;-><init>(Ljava/lang/String;)V

    .line 28
    iput-object p1, p0, Lnio;->g:Ljava/lang/String;

    iput-object p2, p0, Lnio;->h:Ljava/lang/String;

    iput-object p3, p0, Lnio;->i:Ljava/lang/String;

    iput-object p4, p0, Lnio;->j:Lfuo;

    return-void
.end method
