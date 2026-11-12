.class public final Lqfp;
.super Lp8p;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lofp;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final g:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lofp;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lqfp;->Companion:Lofp;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .registers 5

    and-int/lit8 v0, p1, 0x1

    const/4 v1, 0x1

    if-ne v1, v0, :cond_b

    invoke-direct {p0}, Lp8p;-><init>()V

    iput-object p2, p0, Lqfp;->g:Ljava/lang/String;

    return-void

    :cond_b
    sget-object p0, Lnfp;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-static {p1, v1, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public constructor <init>(Landroid/webkit/WebView;)V
    .registers 3

    .line 18
    invoke-virtual {p1}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    move-result-object p1

    .line 19
    sget-object v0, Lwlp;->b:Lurj;

    .line 20
    const-string v0, "wv_rpu"

    .line 21
    invoke-direct {p0, v0}, Lp8p;-><init>(Ljava/lang/String;)V

    .line 22
    iput-object p1, p0, Lqfp;->g:Ljava/lang/String;

    return-void
.end method
