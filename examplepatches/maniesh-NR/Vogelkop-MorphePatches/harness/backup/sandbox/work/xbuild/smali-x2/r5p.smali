.class public final Lr5p;
.super Lp8p;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lb4p;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final g:Ljava/lang/String;

.field public final h:Ljava/lang/String;

.field public final i:Ljava/lang/String;

.field public final j:Ljava/lang/String;

.field public final k:Ljava/lang/Boolean;

.field public final l:I

.field public final m:Ljava/lang/String;

.field public final n:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lb4p;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lr5p;->Companion:Lb4p;

    return-void
.end method

.method public constructor <init>(ILjava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 9

    .line 54
    sget-object v0, Lwlp;->b:Lurj;

    .line 55
    const-string v0, "error"

    .line 56
    invoke-direct {p0, v0}, Lp8p;-><init>(Ljava/lang/String;)V

    .line 57
    iput-object p3, p0, Lr5p;->g:Ljava/lang/String;

    iput-object p4, p0, Lr5p;->h:Ljava/lang/String;

    iput-object p5, p0, Lr5p;->i:Ljava/lang/String;

    iput-object p6, p0, Lr5p;->j:Ljava/lang/String;

    iput-object p2, p0, Lr5p;->k:Ljava/lang/Boolean;

    iput p1, p0, Lr5p;->l:I

    iput-object p7, p0, Lr5p;->m:Ljava/lang/String;

    if-eqz p7, :cond_1e

    const/16 p1, 0x400

    invoke-static {p1, p7}, Lpik;->D(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_1f

    :cond_1e
    const/4 p1, 0x0

    :goto_1f
    iput-object p1, p0, Lr5p;->n:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;ILjava/lang/String;)V
    .registers 12

    and-int/lit8 v0, p1, 0x27

    const/4 v1, 0x0

    const/16 v2, 0x27

    if-ne v2, v0, :cond_30

    invoke-direct {p0}, Lp8p;-><init>()V

    iput-object p2, p0, Lr5p;->g:Ljava/lang/String;

    iput-object p3, p0, Lr5p;->h:Ljava/lang/String;

    iput-object p4, p0, Lr5p;->i:Ljava/lang/String;

    and-int/lit8 p2, p1, 0x8

    if-nez p2, :cond_17

    iput-object v1, p0, Lr5p;->j:Ljava/lang/String;

    goto :goto_19

    :cond_17
    iput-object p5, p0, Lr5p;->j:Ljava/lang/String;

    :goto_19
    and-int/lit8 p2, p1, 0x10

    if-nez p2, :cond_20

    iput-object v1, p0, Lr5p;->k:Ljava/lang/Boolean;

    goto :goto_22

    :cond_20
    iput-object p6, p0, Lr5p;->k:Ljava/lang/Boolean;

    :goto_22
    iput p7, p0, Lr5p;->l:I

    iput-object v1, p0, Lr5p;->m:Ljava/lang/String;

    and-int/lit8 p1, p1, 0x40

    if-nez p1, :cond_2d

    iput-object v1, p0, Lr5p;->n:Ljava/lang/String;

    return-void

    :cond_2d
    iput-object p8, p0, Lr5p;->n:Ljava/lang/String;

    return-void

    :cond_30
    sget-object p0, Lv3p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-static {p1, v2, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    throw v1
.end method
