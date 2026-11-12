.class public final Ltep;
.super Lp8p;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lkep;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final l:[Lkotlinx/serialization/KSerializer;


# instance fields
.field public final g:Ljava/lang/String;

.field public final h:Ljava/lang/String;

.field public final i:Ljava/lang/String;

.field public final j:Lfuo;

.field public final k:Ljava/lang/Double;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lkep;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ltep;->Companion:Lkep;

    sget-object v0, Lfuo;->Companion:Lqto;

    invoke-virtual {v0}, Lqto;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v0

    const/4 v1, 0x5

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

    sput-object v1, Ltep;->l:[Lkotlinx/serialization/KSerializer;

    return-void
.end method

.method public constructor <init>(ILfuo;Ljava/lang/Double;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 10

    and-int/lit8 v0, p1, 0xf

    const/4 v1, 0x0

    const/16 v2, 0xf

    if-ne v2, v0, :cond_1c

    invoke-direct {p0}, Lp8p;-><init>()V

    iput-object p4, p0, Ltep;->g:Ljava/lang/String;

    iput-object p5, p0, Ltep;->h:Ljava/lang/String;

    iput-object p6, p0, Ltep;->i:Ljava/lang/String;

    iput-object p2, p0, Ltep;->j:Lfuo;

    and-int/lit8 p1, p1, 0x10

    if-nez p1, :cond_19

    iput-object v1, p0, Ltep;->k:Ljava/lang/Double;

    return-void

    :cond_19
    iput-object p3, p0, Ltep;->k:Ljava/lang/Double;

    return-void

    :cond_1c
    sget-object p0, Lhep;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-static {p1, v2, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    throw v1
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lfuo;Ljava/lang/Double;)V
    .registers 7

    .line 34
    sget-object v0, Lwlp;->b:Lurj;

    .line 35
    const-string v0, "viewable"

    .line 36
    invoke-direct {p0, v0}, Lp8p;-><init>(Ljava/lang/String;)V

    .line 37
    iput-object p1, p0, Ltep;->g:Ljava/lang/String;

    iput-object p2, p0, Ltep;->h:Ljava/lang/String;

    iput-object p3, p0, Ltep;->i:Ljava/lang/String;

    iput-object p4, p0, Ltep;->j:Lfuo;

    iput-object p5, p0, Ltep;->k:Ljava/lang/Double;

    return-void
.end method
