.class public final Lzap;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lyap;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I

.field public final d:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lyap;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lzap;->Companion:Lyap;

    return-void
.end method

.method public constructor <init>(IIII)V
    .registers 5

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lzap;->a:I

    iput p2, p0, Lzap;->b:I

    iput p3, p0, Lzap;->c:I

    iput p4, p0, Lzap;->d:I

    return-void
.end method

.method public constructor <init>(IIIII)V
    .registers 8

    and-int/lit8 v0, p1, 0xf

    const/16 v1, 0xf

    if-ne v1, v0, :cond_12

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Lzap;->a:I

    iput p3, p0, Lzap;->b:I

    iput p4, p0, Lzap;->c:I

    iput p5, p0, Lzap;->d:I

    return-void

    :cond_12
    sget-object p0, Lxap;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-static {p1, v1, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    const/4 p0, 0x0

    throw p0
.end method
