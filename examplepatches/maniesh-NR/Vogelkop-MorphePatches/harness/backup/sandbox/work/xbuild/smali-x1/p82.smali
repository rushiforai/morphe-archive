.class public final Lp82;
.super Ljw9;
.source "SourceFile"


# instance fields
.field public a:I

.field public final synthetic b:Lq82;


# direct methods
.method public constructor <init>(Lq82;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lp82;->b:Lq82;

    return-void
.end method


# virtual methods
.method public final f(II)V
    .registers 6

    iget-object p1, p0, Lp82;->b:Lq82;

    iget-object p2, p1, Lq82;->j:Lb2l;

    invoke-static {p2}, Luy3;->H(Lb2l;)Lcom/opera/android/browser/chromium/ChromiumContent;

    move-result-object p2

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p2}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p2

    check-cast p2, Lorg/chromium/content/browser/webcontents/WebContentsImpl;

    iget-object p2, p2, Lorg/chromium/content/browser/webcontents/WebContentsImpl;->g:Lhuh;

    invoke-virtual {p2}, Lhuh;->c()I

    move-result v0

    if-lez v0, :cond_4f

    invoke-virtual {p2}, Lhuh;->c()I

    move-result v0

    iget v1, p2, Lhuh;->b:F

    invoke-virtual {p2, v1}, Lhuh;->a(F)F

    move-result p2

    float-to-double v1, p2

    invoke-static {v1, v2}, Ljava/lang/Math;->floor(D)D

    move-result-wide v1

    double-to-int p2, v1

    mul-int/lit8 p2, p2, 0xa

    div-int/lit8 v1, v0, 0x2

    add-int/2addr v1, p2

    div-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0xa

    iget p2, p0, Lp82;->a:I

    if-le v1, p2, :cond_4f

    iput v1, p0, Lp82;->a:I

    iget-object p1, p1, Lq82;->a:Lh7f;

    invoke-static {p1, p1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p1

    :goto_3d
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_4f

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lr82;

    iget v0, p0, Lp82;->a:I

    invoke-interface {p2, v0}, Lr82;->c(I)V

    goto :goto_3d

    :cond_4f
    return-void
.end method
