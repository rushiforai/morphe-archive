.class public final Lcom/opera/android/GpuWorkarounds;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lumi;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/opera/android/GpuWorkarounds;->a:Landroid/content/Context;

    iput-object p2, p0, Lcom/opera/android/GpuWorkarounds;->b:Lumi;

    return-void
.end method


# virtual methods
.method public final gpuInformation(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    if-eqz p2, :cond_2f

    const-string p1, "Adreno (TM) "

    invoke-virtual {p2, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2f

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p1

    const/16 v0, 0xc

    if-le p1, v0, :cond_2f

    invoke-virtual {p2, v0}, Ljava/lang/String;->charAt(I)C

    move-result p1

    const/16 p2, 0x34

    if-eq p1, p2, :cond_1e

    const/16 p2, 0x35

    if-ne p1, p2, :cond_2f

    :cond_1e
    new-instance p1, Lld9;

    const/16 p2, 0xf

    invoke-direct {p1, p0, p2}, Lld9;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lcom/opera/android/GpuWorkarounds;->b:Lumi;

    invoke-interface {p0, p1}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    :cond_2f
    return-void
.end method
