.class public final Lnyo;
.super Landroid/webkit/WebView;
.source "SourceFile"


# static fields
.field public static final synthetic f:I


# instance fields
.field public final a:Ljava/util/ArrayList;

.field public b:Z

.field public c:B

.field public d:J

.field public e:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    invoke-direct {p0, p1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lnyo;->a:Ljava/util/ArrayList;

    const/4 p1, 0x1

    iput-byte p1, p0, Lnyo;->c:B

    return-void
.end method


# virtual methods
.method public final onAttachedToWindow()V
    .registers 5

    invoke-super {p0}, Landroid/webkit/WebView;->onAttachedToWindow()V

    iget-byte v0, p0, Lnyo;->c:B

    const/4 v1, 0x1

    if-ne v0, v1, :cond_24

    const/4 v0, 0x2

    iput-byte v0, p0, Lnyo;->c:B

    iget-object v0, p0, Lnyo;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :cond_12
    :goto_12
    if-ge v2, v1, :cond_24

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    if-eqz v3, :cond_12

    check-cast v3, Lh9p;

    iget-object v3, v3, Lh9p;->a:Ly9p;

    invoke-virtual {v3, p0}, Laoo;->v(Landroid/view/View;)V

    goto :goto_12

    :cond_24
    return-void
.end method

.method public final onPause()V
    .registers 2

    invoke-super {p0}, Landroid/webkit/WebView;->onPause()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lnyo;->b:Z

    return-void
.end method

.method public final onResume()V
    .registers 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lnyo;->b:Z

    invoke-super {p0}, Landroid/webkit/WebView;->onResume()V

    return-void
.end method

.method public final onVisibilityChanged(Landroid/view/View;I)V
    .registers 3

    invoke-super {p0, p1, p2}, Landroid/webkit/WebView;->onVisibilityChanged(Landroid/view/View;I)V

    if-eqz p2, :cond_d

    iget-boolean p1, p0, Lnyo;->b:Z

    if-nez p1, :cond_d

    invoke-virtual {p0}, Lnyo;->onPause()V

    return-void

    :cond_d
    iget-boolean p1, p0, Lnyo;->b:Z

    if-eqz p1, :cond_14

    invoke-virtual {p0}, Lnyo;->onResume()V

    :cond_14
    return-void
.end method
