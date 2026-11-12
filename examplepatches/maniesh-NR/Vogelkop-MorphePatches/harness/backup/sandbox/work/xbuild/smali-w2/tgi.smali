.class public final Ltgi;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:F

.field public final b:Ljava/util/LinkedHashSet;

.field public c:Lr9b;

.field public final d:Lty3;


# direct methods
.method public constructor <init>(F)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ltgi;->a:F

    new-instance p1, Ljava/util/LinkedHashSet;

    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p1, p0, Ltgi;->b:Ljava/util/LinkedHashSet;

    sget-object p1, Lr9b;->e:Lr9b;

    iput-object p1, p0, Ltgi;->c:Lr9b;

    new-instance p1, Lty3;

    const/16 v0, 0x8

    invoke-direct {p1, p0, v0}, Lty3;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Ltgi;->d:Lty3;

    return-void
.end method


# virtual methods
.method public final a(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 9

    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->f()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p1

    if-eqz p1, :cond_c

    invoke-interface {p1}, Lorg/chromium/content_public/browser/WebContents;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_d

    :cond_c
    return-void

    :cond_d
    iget-object v0, p0, Ltgi;->c:Lr9b;

    new-instance v1, Landroid/graphics/Rect;

    iget v2, v0, Lr9b;->a:I

    int-to-float v2, v2

    iget p0, p0, Ltgi;->a:F

    div-float/2addr v2, p0

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-float v2, v2

    float-to-int v2, v2

    iget v3, v0, Lr9b;->b:I

    int-to-float v3, v3

    div-float/2addr v3, p0

    float-to-double v3, v3

    invoke-static {v3, v4}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v3

    double-to-float v3, v3

    float-to-int v3, v3

    iget v4, v0, Lr9b;->c:I

    int-to-float v4, v4

    div-float/2addr v4, p0

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v4

    double-to-float v4, v4

    float-to-int v4, v4

    iget v0, v0, Lr9b;->d:I

    int-to-float v0, v0

    div-float/2addr v0, p0

    float-to-double v5, v0

    invoke-static {v5, v6}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v5

    double-to-float p0, v5

    float-to-int p0, p0

    invoke-direct {v1, v2, v3, v4, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-interface {p1, v1}, Lorg/chromium/content_public/browser/WebContents;->Q(Landroid/graphics/Rect;)V

    return-void
.end method
