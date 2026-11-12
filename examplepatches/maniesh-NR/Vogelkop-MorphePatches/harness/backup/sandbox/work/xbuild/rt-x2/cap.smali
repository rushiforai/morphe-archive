.class public final Lcap;
.super Lp8p;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lo9p;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final m:[Lkotlinx/serialization/KSerializer;


# instance fields
.field public final g:Ljava/lang/String;

.field public final h:Ljava/lang/String;

.field public final i:Ljava/lang/String;

.field public final j:Lfuo;

.field public final k:Ljava/lang/String;

.field public final l:Ljava/lang/Boolean;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lo9p;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcap;->Companion:Lo9p;

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

    sput-object v1, Lcap;->m:[Lkotlinx/serialization/KSerializer;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lfuo;Ljava/lang/String;Ljava/lang/Boolean;)V
    .registers 11

    and-int/lit8 v0, p1, 0xf

    const/4 v1, 0x0

    const/16 v2, 0xf

    if-ne v2, v0, :cond_25

    invoke-direct {p0}, Lp8p;-><init>()V

    iput-object p2, p0, Lcap;->g:Ljava/lang/String;

    iput-object p3, p0, Lcap;->h:Ljava/lang/String;

    iput-object p4, p0, Lcap;->i:Ljava/lang/String;

    iput-object p5, p0, Lcap;->j:Lfuo;

    and-int/lit8 p2, p1, 0x10

    if-nez p2, :cond_19

    iput-object v1, p0, Lcap;->k:Ljava/lang/String;

    goto :goto_1b

    :cond_19
    iput-object p6, p0, Lcap;->k:Ljava/lang/String;

    :goto_1b
    and-int/lit8 p1, p1, 0x20

    if-nez p1, :cond_22

    iput-object v1, p0, Lcap;->l:Ljava/lang/Boolean;

    return-void

    :cond_22
    iput-object p7, p0, Lcap;->l:Ljava/lang/Boolean;

    return-void

    :cond_25
    sget-object p0, Lk9p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-static {p1, v2, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    throw v1
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lfuo;Ljava/lang/String;Ljava/lang/Boolean;)V
    .registers 8

    .line 43
    sget-object v0, Lwlp;->b:Lurj;

    .line 44
    const-string v0, "load_in_webview"

    .line 45
    invoke-direct {p0, v0}, Lp8p;-><init>(Ljava/lang/String;)V

    .line 46
    iput-object p1, p0, Lcap;->g:Ljava/lang/String;

    iput-object p2, p0, Lcap;->h:Ljava/lang/String;

    iput-object p3, p0, Lcap;->i:Ljava/lang/String;

    iput-object p4, p0, Lcap;->j:Lfuo;

    iput-object p5, p0, Lcap;->k:Ljava/lang/String;

    iput-object p6, p0, Lcap;->l:Ljava/lang/Boolean;

    return-void
.end method
