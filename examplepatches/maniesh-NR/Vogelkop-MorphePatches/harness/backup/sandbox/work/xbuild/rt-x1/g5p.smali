.class public final Lg5p;
.super Lf4p;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lf5p;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final b:I

.field public final c:Ld5p;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lf5p;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lg5p;->Companion:Lf5p;

    return-void
.end method

.method public constructor <init>(IILd5p;)V
    .registers 6

    and-int/lit8 v0, p1, 0x3

    const/4 v1, 0x3

    if-ne v1, v0, :cond_d

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Lg5p;->b:I

    iput-object p3, p0, Lg5p;->c:Ld5p;

    return-void

    :cond_d
    sget-object p0, Le5p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-static {p1, v1, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    const/4 p0, 0x0

    throw p0
.end method
