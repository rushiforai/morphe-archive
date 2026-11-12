.class public final Lrro;
.super Lp8p;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Loqo;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final g:Ljava/lang/String;

.field public final h:I

.field public final i:I

.field public final j:Ljava/lang/String;

.field public final k:Ljava/lang/Boolean;

.field public final l:Ljava/lang/String;

.field public final m:Ljava/lang/String;

.field public final n:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Loqo;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lrro;->Companion:Loqo;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;IILjava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 13

    and-int/lit8 v0, p1, 0xf

    const/4 v1, 0x0

    const/16 v2, 0xf

    if-ne v2, v0, :cond_37

    invoke-direct {p0}, Lp8p;-><init>()V

    iput-object p2, p0, Lrro;->g:Ljava/lang/String;

    iput p3, p0, Lrro;->h:I

    iput p4, p0, Lrro;->i:I

    iput-object p5, p0, Lrro;->j:Ljava/lang/String;

    and-int/lit8 p2, p1, 0x10

    if-nez p2, :cond_19

    iput-object v1, p0, Lrro;->k:Ljava/lang/Boolean;

    goto :goto_1b

    :cond_19
    iput-object p6, p0, Lrro;->k:Ljava/lang/Boolean;

    :goto_1b
    and-int/lit8 p2, p1, 0x20

    if-nez p2, :cond_22

    iput-object v1, p0, Lrro;->l:Ljava/lang/String;

    goto :goto_24

    :cond_22
    iput-object p7, p0, Lrro;->l:Ljava/lang/String;

    :goto_24
    and-int/lit8 p2, p1, 0x40

    if-nez p2, :cond_2b

    iput-object v1, p0, Lrro;->m:Ljava/lang/String;

    goto :goto_2d

    :cond_2b
    iput-object p8, p0, Lrro;->m:Ljava/lang/String;

    :goto_2d
    and-int/lit16 p1, p1, 0x80

    if-nez p1, :cond_34

    iput-object v1, p0, Lrro;->n:Ljava/lang/String;

    return-void

    :cond_34
    iput-object p9, p0, Lrro;->n:Ljava/lang/String;

    return-void

    :cond_37
    sget-object p0, Llqo;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-static {p1, v2, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    throw v1
.end method
