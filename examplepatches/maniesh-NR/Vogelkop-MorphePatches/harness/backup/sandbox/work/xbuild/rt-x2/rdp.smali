.class public final Lrdp;
.super Lp8p;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lpdp;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final g:Ljava/lang/String;

.field public final h:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lpdp;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lrdp;->Companion:Lpdp;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;I)V
    .registers 6

    and-int/lit8 v0, p1, 0x3

    const/4 v1, 0x3

    if-ne v1, v0, :cond_d

    invoke-direct {p0}, Lp8p;-><init>()V

    iput-object p2, p0, Lrdp;->g:Ljava/lang/String;

    iput p3, p0, Lrdp;->h:I

    return-void

    :cond_d
    sget-object p0, Lodp;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-static {p1, v1, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public constructor <init>(Landroid/net/http/SslError;)V
    .registers 4

    .line 20
    invoke-virtual {p1}, Landroid/net/http/SslError;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Landroid/net/http/SslError;->getPrimaryError()I

    move-result p1

    .line 21
    sget-object v1, Lwlp;->b:Lurj;

    .line 22
    const-string v1, "wv_ssl_error"

    .line 23
    invoke-direct {p0, v1}, Lp8p;-><init>(Ljava/lang/String;)V

    .line 24
    iput-object v0, p0, Lrdp;->g:Ljava/lang/String;

    iput p1, p0, Lrdp;->h:I

    return-void
.end method
