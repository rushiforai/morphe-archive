.class public final Lfnp;
.super Lp8p;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lcnp;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final g:Ljava/lang/String;

.field public final h:Ljava/lang/Long;

.field public final i:Ljava/lang/Long;

.field public final j:Ljava/lang/Long;

.field public final k:Ljava/lang/Long;

.field public final l:Ljava/lang/Boolean;

.field public final m:Ljava/lang/String;

.field public final n:J

.field public final o:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcnp;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lfnp;->Companion:Lcnp;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Boolean;Ljava/lang/String;JLjava/lang/String;)V
    .registers 14

    and-int/lit16 v0, p1, 0x1ff

    const/16 v1, 0x1ff

    if-ne v1, v0, :cond_1c

    invoke-direct {p0}, Lp8p;-><init>()V

    iput-object p2, p0, Lfnp;->g:Ljava/lang/String;

    iput-object p3, p0, Lfnp;->h:Ljava/lang/Long;

    iput-object p4, p0, Lfnp;->i:Ljava/lang/Long;

    iput-object p5, p0, Lfnp;->j:Ljava/lang/Long;

    iput-object p6, p0, Lfnp;->k:Ljava/lang/Long;

    iput-object p7, p0, Lfnp;->l:Ljava/lang/Boolean;

    iput-object p8, p0, Lfnp;->m:Ljava/lang/String;

    iput-wide p9, p0, Lfnp;->n:J

    iput-object p11, p0, Lfnp;->o:Ljava/lang/String;

    return-void

    :cond_1c
    sget-object p0, Lbnp;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-static {p1, v1, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Boolean;Ljava/lang/String;JLjava/lang/String;)V
    .registers 12

    .line 35
    sget-object v0, Lwlp;->b:Lurj;

    .line 36
    const-string v0, "ir"

    .line 37
    invoke-direct {p0, v0}, Lp8p;-><init>(Ljava/lang/String;)V

    .line 38
    iput-object p1, p0, Lfnp;->g:Ljava/lang/String;

    iput-object p2, p0, Lfnp;->h:Ljava/lang/Long;

    iput-object p3, p0, Lfnp;->i:Ljava/lang/Long;

    iput-object p4, p0, Lfnp;->j:Ljava/lang/Long;

    iput-object p5, p0, Lfnp;->k:Ljava/lang/Long;

    iput-object p6, p0, Lfnp;->l:Ljava/lang/Boolean;

    iput-object p7, p0, Lfnp;->m:Ljava/lang/String;

    iput-wide p8, p0, Lfnp;->n:J

    iput-object p10, p0, Lfnp;->o:Ljava/lang/String;

    return-void
.end method
