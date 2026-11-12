.class public final Ll7p;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lr6p;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:J

.field public final b:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lr6p;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ll7p;->Companion:Lr6p;

    return-void
.end method

.method public constructor <init>(IJLjava/lang/String;)V
    .registers 7

    and-int/lit8 v0, p1, 0x3

    const/4 v1, 0x3

    if-ne v1, v0, :cond_d

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p2, p0, Ll7p;->a:J

    iput-object p4, p0, Ll7p;->b:Ljava/lang/String;

    return-void

    :cond_d
    sget-object p0, Lp6p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-static {p1, v1, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public constructor <init>(JLjava/lang/String;)V
    .registers 4

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Ll7p;->a:J

    iput-object p3, p0, Ll7p;->b:Ljava/lang/String;

    return-void
.end method
