.class public final Lbdp;
.super Lp8p;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Ltcp;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final p:[Lkotlinx/serialization/KSerializer;


# instance fields
.field public final g:Ljava/lang/String;

.field public final h:I

.field public final i:I

.field public final j:Ljava/lang/String;

.field public final k:Ljava/lang/Boolean;

.field public final l:Ljava/lang/String;

.field public final m:Ljava/util/List;

.field public final n:Ljava/util/List;

.field public final o:I


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Ltcp;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lbdp;->Companion:Ltcp;

    new-instance v0, Lk72;

    sget-object v1, Lfuo;->Companion:Lqto;

    invoke-virtual {v1}, Lqto;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    new-instance v1, Lk72;

    sget-object v3, Lxhk;->a:Lxhk;

    invoke-direct {v1, v3, v2}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    const/16 v3, 0x9

    new-array v3, v3, [Lkotlinx/serialization/KSerializer;

    const/4 v4, 0x0

    aput-object v4, v3, v2

    const/4 v2, 0x1

    aput-object v4, v3, v2

    const/4 v2, 0x2

    aput-object v4, v3, v2

    const/4 v2, 0x3

    aput-object v4, v3, v2

    const/4 v2, 0x4

    aput-object v4, v3, v2

    const/4 v2, 0x5

    aput-object v4, v3, v2

    const/4 v2, 0x6

    aput-object v0, v3, v2

    const/4 v0, 0x7

    aput-object v1, v3, v0

    const/16 v0, 0x8

    aput-object v4, v3, v0

    sput-object v3, Lbdp;->p:[Lkotlinx/serialization/KSerializer;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;IILjava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/util/List;Ljava/util/List;I)V
    .registers 14

    and-int/lit16 v0, p1, 0x1ef

    const/4 v1, 0x0

    const/16 v2, 0x1ef

    if-ne v2, v0, :cond_24

    invoke-direct {p0}, Lp8p;-><init>()V

    iput-object p2, p0, Lbdp;->g:Ljava/lang/String;

    iput p3, p0, Lbdp;->h:I

    iput p4, p0, Lbdp;->i:I

    iput-object p5, p0, Lbdp;->j:Ljava/lang/String;

    and-int/lit8 p1, p1, 0x10

    if-nez p1, :cond_19

    iput-object v1, p0, Lbdp;->k:Ljava/lang/Boolean;

    goto :goto_1b

    :cond_19
    iput-object p6, p0, Lbdp;->k:Ljava/lang/Boolean;

    :goto_1b
    iput-object p7, p0, Lbdp;->l:Ljava/lang/String;

    iput-object p8, p0, Lbdp;->m:Ljava/util/List;

    iput-object p9, p0, Lbdp;->n:Ljava/util/List;

    iput p10, p0, Lbdp;->o:I

    return-void

    :cond_24
    sget-object p0, Lrcp;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-static {p1, v2, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    throw v1
.end method

.method public constructor <init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/util/List;Ljava/util/List;I)V
    .registers 11

    .line 42
    sget-object v0, Lwlp;->b:Lurj;

    .line 43
    const-string v0, "request"

    .line 44
    invoke-direct {p0, v0}, Lp8p;-><init>(Ljava/lang/String;)V

    .line 45
    iput-object p1, p0, Lbdp;->g:Ljava/lang/String;

    iput p2, p0, Lbdp;->h:I

    iput p3, p0, Lbdp;->i:I

    iput-object p4, p0, Lbdp;->j:Ljava/lang/String;

    iput-object p5, p0, Lbdp;->k:Ljava/lang/Boolean;

    iput-object p6, p0, Lbdp;->l:Ljava/lang/String;

    iput-object p7, p0, Lbdp;->m:Ljava/util/List;

    iput-object p8, p0, Lbdp;->n:Ljava/util/List;

    iput p9, p0, Lbdp;->o:I

    return-void
.end method
