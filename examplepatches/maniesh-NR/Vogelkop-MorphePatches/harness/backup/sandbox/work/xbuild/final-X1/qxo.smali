.class public final Lqxo;
.super Lp8p;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lyvo;
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

.field public final l:Ljava/lang/Integer;

.field public final m:Ljava/lang/String;

.field public final n:Ljava/lang/String;

.field public final o:Ljava/util/List;

.field public final p:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lyvo;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lqxo;->Companion:Lyvo;

    sget-object v0, Lfuo;->Companion:Lqto;

    invoke-virtual {v0}, Lqto;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v0

    new-instance v1, Lk72;

    sget-object v2, Lxhk;->a:Lxhk;

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    const/16 v2, 0x9

    new-array v2, v2, [Lkotlinx/serialization/KSerializer;

    const/4 v4, 0x0

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object v4, v2, v3

    const/4 v3, 0x2

    aput-object v4, v2, v3

    const/4 v3, 0x3

    aput-object v0, v2, v3

    const/4 v0, 0x4

    aput-object v4, v2, v0

    const/4 v0, 0x5

    aput-object v4, v2, v0

    const/4 v0, 0x6

    aput-object v4, v2, v0

    const/4 v0, 0x7

    aput-object v1, v2, v0

    const/16 v0, 0x8

    aput-object v4, v2, v0

    sput-object v2, Lqxo;->q:[Lkotlinx/serialization/KSerializer;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lfuo;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;)V
    .registers 14

    and-int/lit8 v0, p1, 0xf

    const/4 v1, 0x0

    const/16 v2, 0xf

    if-ne v2, v0, :cond_42

    invoke-direct {p0}, Lp8p;-><init>()V

    iput-object p2, p0, Lqxo;->g:Ljava/lang/String;

    iput-object p3, p0, Lqxo;->h:Ljava/lang/String;

    iput-object p4, p0, Lqxo;->i:Ljava/lang/String;

    iput-object p5, p0, Lqxo;->j:Lfuo;

    iput-object v1, p0, Lqxo;->k:Ljava/lang/String;

    and-int/lit8 p2, p1, 0x10

    if-nez p2, :cond_1b

    iput-object v1, p0, Lqxo;->l:Ljava/lang/Integer;

    goto :goto_1d

    :cond_1b
    iput-object p6, p0, Lqxo;->l:Ljava/lang/Integer;

    :goto_1d
    and-int/lit8 p2, p1, 0x20

    if-nez p2, :cond_24

    iput-object v1, p0, Lqxo;->m:Ljava/lang/String;

    goto :goto_26

    :cond_24
    iput-object p7, p0, Lqxo;->m:Ljava/lang/String;

    :goto_26
    and-int/lit8 p2, p1, 0x40

    if-nez p2, :cond_2d

    iput-object v1, p0, Lqxo;->n:Ljava/lang/String;

    goto :goto_2f

    :cond_2d
    iput-object p8, p0, Lqxo;->n:Ljava/lang/String;

    :goto_2f
    and-int/lit16 p2, p1, 0x80

    if-nez p2, :cond_36

    iput-object v1, p0, Lqxo;->o:Ljava/util/List;

    goto :goto_38

    :cond_36
    iput-object p9, p0, Lqxo;->o:Ljava/util/List;

    :goto_38
    and-int/lit16 p1, p1, 0x100

    if-nez p1, :cond_3f

    iput-object v1, p0, Lqxo;->p:Ljava/lang/String;

    return-void

    :cond_3f
    iput-object p10, p0, Lqxo;->p:Ljava/lang/String;

    return-void

    :cond_42
    sget-object p0, Lsvo;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-static {p1, v2, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    throw v1
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lfuo;Ljava/lang/String;Ljava/lang/Integer;)V
    .registers 8

    .line 72
    sget-object v0, Lwlp;->b:Lurj;

    .line 73
    const-string v0, "bpis"

    .line 74
    invoke-direct {p0, v0}, Lp8p;-><init>(Ljava/lang/String;)V

    .line 75
    iput-object p1, p0, Lqxo;->g:Ljava/lang/String;

    iput-object p2, p0, Lqxo;->h:Ljava/lang/String;

    iput-object p3, p0, Lqxo;->i:Ljava/lang/String;

    iput-object p4, p0, Lqxo;->j:Lfuo;

    iput-object p5, p0, Lqxo;->k:Ljava/lang/String;

    iput-object p6, p0, Lqxo;->l:Ljava/lang/Integer;

    const/4 p1, 0x0

    iput-object p1, p0, Lqxo;->m:Ljava/lang/String;

    iput-object p1, p0, Lqxo;->n:Ljava/lang/String;

    iput-object p1, p0, Lqxo;->o:Ljava/util/List;

    if-eqz p5, :cond_22

    const/16 p1, 0xff

    invoke-static {p1, p5}, Lpik;->D(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :cond_22
    iput-object p1, p0, Lqxo;->p:Ljava/lang/String;

    return-void
.end method
