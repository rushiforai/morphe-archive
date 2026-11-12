.class public final Lwfp;
.super Lp8p;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lkfp;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final q:[Lkotlinx/serialization/KSerializer;


# instance fields
.field public final g:Ljava/lang/String;

.field public final h:Ljava/lang/String;

.field public final i:Ljava/lang/String;

.field public final j:Lfuo;

.field public final k:Ljava/lang/String;

.field public final l:Ljava/lang/Boolean;

.field public final m:Ljava/lang/Double;

.field public final n:Ljava/lang/Integer;

.field public final o:Ljava/lang/Long;

.field public final p:Ljava/lang/Long;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lkfp;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lwfp;->Companion:Lkfp;

    sget-object v0, Lfuo;->Companion:Lqto;

    invoke-virtual {v0}, Lqto;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v0

    const/16 v1, 0xa

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

    sput-object v1, Lwfp;->q:[Lkotlinx/serialization/KSerializer;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lfuo;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Double;Ljava/lang/Integer;Ljava/lang/Long;Ljava/lang/Long;)V
    .registers 15

    and-int/lit8 v0, p1, 0xf

    const/4 v1, 0x0

    const/16 v2, 0xf

    if-ne v2, v0, :cond_49

    invoke-direct {p0}, Lp8p;-><init>()V

    iput-object p2, p0, Lwfp;->g:Ljava/lang/String;

    iput-object p3, p0, Lwfp;->h:Ljava/lang/String;

    iput-object p4, p0, Lwfp;->i:Ljava/lang/String;

    iput-object p5, p0, Lwfp;->j:Lfuo;

    and-int/lit8 p2, p1, 0x10

    if-nez p2, :cond_19

    iput-object v1, p0, Lwfp;->k:Ljava/lang/String;

    goto :goto_1b

    :cond_19
    iput-object p6, p0, Lwfp;->k:Ljava/lang/String;

    :goto_1b
    and-int/lit8 p2, p1, 0x20

    if-nez p2, :cond_22

    iput-object v1, p0, Lwfp;->l:Ljava/lang/Boolean;

    goto :goto_24

    :cond_22
    iput-object p7, p0, Lwfp;->l:Ljava/lang/Boolean;

    :goto_24
    and-int/lit8 p2, p1, 0x40

    if-nez p2, :cond_2b

    iput-object v1, p0, Lwfp;->m:Ljava/lang/Double;

    goto :goto_2d

    :cond_2b
    iput-object p8, p0, Lwfp;->m:Ljava/lang/Double;

    :goto_2d
    and-int/lit16 p2, p1, 0x80

    if-nez p2, :cond_34

    iput-object v1, p0, Lwfp;->n:Ljava/lang/Integer;

    goto :goto_36

    :cond_34
    iput-object p9, p0, Lwfp;->n:Ljava/lang/Integer;

    :goto_36
    and-int/lit16 p2, p1, 0x100

    if-nez p2, :cond_3d

    iput-object v1, p0, Lwfp;->o:Ljava/lang/Long;

    goto :goto_3f

    :cond_3d
    iput-object p10, p0, Lwfp;->o:Ljava/lang/Long;

    :goto_3f
    and-int/lit16 p1, p1, 0x200

    if-nez p1, :cond_46

    iput-object v1, p0, Lwfp;->p:Ljava/lang/Long;

    return-void

    :cond_46
    iput-object p11, p0, Lwfp;->p:Ljava/lang/Long;

    return-void

    :cond_49
    sget-object p0, Lifp;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-static {p1, v2, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    throw v1
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lfuo;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Double;Ljava/lang/Integer;Ljava/lang/Long;Ljava/lang/Long;)V
    .registers 12

    .line 79
    sget-object v0, Lwlp;->b:Lurj;

    .line 80
    const-string v0, "visible"

    .line 81
    invoke-direct {p0, v0}, Lp8p;-><init>(Ljava/lang/String;)V

    .line 82
    iput-object p1, p0, Lwfp;->g:Ljava/lang/String;

    iput-object p2, p0, Lwfp;->h:Ljava/lang/String;

    iput-object p3, p0, Lwfp;->i:Ljava/lang/String;

    iput-object p4, p0, Lwfp;->j:Lfuo;

    iput-object p5, p0, Lwfp;->k:Ljava/lang/String;

    iput-object p6, p0, Lwfp;->l:Ljava/lang/Boolean;

    iput-object p7, p0, Lwfp;->m:Ljava/lang/Double;

    iput-object p8, p0, Lwfp;->n:Ljava/lang/Integer;

    iput-object p9, p0, Lwfp;->o:Ljava/lang/Long;

    iput-object p10, p0, Lwfp;->p:Ljava/lang/Long;

    return-void
.end method
