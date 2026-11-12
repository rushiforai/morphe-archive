.class public final Lsoo;
.super Lp8p;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lymo;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final k:[Lkotlinx/serialization/KSerializer;


# instance fields
.field public final g:Ljava/lang/String;

.field public final h:Ljava/lang/String;

.field public final i:Ljava/util/List;

.field public final j:I


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lymo;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lsoo;->Companion:Lymo;

    new-instance v0, Lk72;

    sget-object v1, Lfuo;->Companion:Lqto;

    invoke-virtual {v1}, Lqto;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    const/4 v1, 0x4

    new-array v1, v1, [Lkotlinx/serialization/KSerializer;

    const/4 v3, 0x0

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object v3, v1, v2

    const/4 v2, 0x2

    aput-object v0, v1, v2

    const/4 v0, 0x3

    aput-object v3, v1, v0

    sput-object v1, Lsoo;->k:[Lkotlinx/serialization/KSerializer;

    return-void
.end method

.method public constructor <init>(IILjava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .registers 8

    and-int/lit8 v0, p1, 0xf

    const/16 v1, 0xf

    if-ne v1, v0, :cond_12

    invoke-direct {p0}, Lp8p;-><init>()V

    iput-object p3, p0, Lsoo;->g:Ljava/lang/String;

    iput-object p4, p0, Lsoo;->h:Ljava/lang/String;

    iput-object p5, p0, Lsoo;->i:Ljava/util/List;

    iput p2, p0, Lsoo;->j:I

    return-void

    :cond_12
    sget-object p0, Lkmo;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-static {p1, v1, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;I)V
    .registers 6

    .line 25
    sget-object v0, Lwlp;->b:Lurj;

    .line 26
    const-string v0, "bid"

    .line 27
    invoke-direct {p0, v0}, Lp8p;-><init>(Ljava/lang/String;)V

    .line 28
    iput-object p1, p0, Lsoo;->g:Ljava/lang/String;

    iput-object p2, p0, Lsoo;->h:Ljava/lang/String;

    iput-object p3, p0, Lsoo;->i:Ljava/util/List;

    iput p4, p0, Lsoo;->j:I

    return-void
.end method
