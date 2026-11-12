.class public final Lcom/opera/android/favorites/SpeedDialDataFetcher;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lcom/opera/api/Callback;

.field public final c:Ljava/lang/String;

.field public final d:B

.field public final e:I

.field public final f:I


# direct methods
.method public constructor <init>(Lorg/chromium/content_public/browser/WebContents;Ljava/lang/String;ILandroid/content/Context;ILcom/opera/api/Callback;)V
    .registers 15

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p4, p0, Lcom/opera/android/favorites/SpeedDialDataFetcher;->a:Landroid/content/Context;

    iput-object p6, p0, Lcom/opera/android/favorites/SpeedDialDataFetcher;->b:Lcom/opera/api/Callback;

    iput-object p2, p0, Lcom/opera/android/favorites/SpeedDialDataFetcher;->c:Ljava/lang/String;

    iput-byte p3, p0, Lcom/opera/android/favorites/SpeedDialDataFetcher;->d:B

    iput p5, p0, Lcom/opera/android/favorites/SpeedDialDataFetcher;->e:I

    const/4 p3, 0x0

    if-nez p1, :cond_12

    move p6, p3

    goto :goto_16

    :cond_12
    invoke-interface {p1}, Lorg/chromium/content_public/browser/WebContents;->T()I

    move-result p6

    :goto_16
    iput p6, p0, Lcom/opera/android/favorites/SpeedDialDataFetcher;->f:I

    new-instance v0, Lghf;

    invoke-static {p4}, Lcqp;->f0(Landroid/content/Context;)Lpne;

    move-result-object v1

    sget-object v4, Lvml;->d:Lumi;

    new-instance v5, Lwzg;

    const/4 p4, 0x5

    invoke-direct {v5, p4, p0, p1, p3}, Lwzg;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    const-wide/16 v6, 0xbb8

    move-object v2, p2

    move v3, p5

    invoke-direct/range {v0 .. v7}, Lghf;-><init>(Lpne;Ljava/lang/String;ILumi;Lbnj;J)V

    return-void
.end method


# virtual methods
.method public final finalizeAndSetIcon(Landroid/graphics/Bitmap;Z)V
    .registers 5
    .param p1    # Landroid/graphics/Bitmap;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    sget-object v0, Lvml;->d:Lumi;

    new-instance v1, Lkzj;

    invoke-direct {v1, p0, p1, p2}, Lkzj;-><init>(Lcom/opera/android/favorites/SpeedDialDataFetcher;Landroid/graphics/Bitmap;Z)V

    invoke-interface {v0, v1}, Ltcl;->b(Lesk;)Lnml;

    move-result-object p1

    new-instance p2, Ltxi;

    const/16 v1, 0xc

    invoke-direct {p2, p0, v1}, Ltxi;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p2}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p0

    invoke-virtual {p1, p0}, Lnml;->b(Lnml;)V

    const/4 p0, 0x0

    invoke-virtual {p1, p0}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method
