.class public final Lqep;
.super Lp8p;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lnep;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final g:Ljava/lang/String;

.field public final h:Z

.field public final i:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lnep;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lqep;->Companion:Lnep;

    return-void
.end method

.method public constructor <init>(IILjava/lang/String;Z)V
    .registers 7

    and-int/lit8 v0, p1, 0x7

    const/4 v1, 0x7

    if-ne v1, v0, :cond_f

    .line 26
    invoke-direct {p0}, Lp8p;-><init>()V

    iput-object p3, p0, Lqep;->g:Ljava/lang/String;

    iput-boolean p4, p0, Lqep;->h:Z

    iput p2, p0, Lqep;->i:I

    return-void

    .line 27
    :cond_f
    sget-object p0, Lmep;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    .line 28
    invoke-static {p1, v1, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public constructor <init>(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)V
    .registers 5

    invoke-virtual {p1}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Landroid/webkit/RenderProcessGoneDetail;->didCrash()Z

    move-result v0

    invoke-virtual {p2}, Landroid/webkit/RenderProcessGoneDetail;->rendererPriorityAtExit()I

    move-result p2

    sget-object v1, Lwlp;->b:Lurj;

    const-string v1, "wv_rpg"

    invoke-direct {p0, v1}, Lp8p;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lqep;->g:Ljava/lang/String;

    iput-boolean v0, p0, Lqep;->h:Z

    iput p2, p0, Lqep;->i:I

    return-void
.end method
