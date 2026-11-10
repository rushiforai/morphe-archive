.class public final synthetic LC/d;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:Li/x;


# direct methods
.method public synthetic constructor <init>(Li/x;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LC/d;->a:Li/x;

    return-void
.end method


# virtual methods
.method public final a(LC/j;ILandroid/os/Bundle;)Z
    .locals 5

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x19

    const/4 v2, 0x1

    if-lt v0, v1, :cond_1

    and-int/2addr p2, v2

    if-eqz p2, :cond_1

    :try_start_0
    iget-object p2, p1, LC/j;->b:Ljava/lang/Object;

    check-cast p2, LC/i;

    invoke-interface {p2}, LC/i;->b()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    iget-object p2, p1, LC/j;->b:Ljava/lang/Object;

    check-cast p2, LC/i;

    invoke-interface {p2}, LC/i;->d()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/os/Parcelable;

    if-nez p3, :cond_0

    new-instance p3, Landroid/os/Bundle;

    invoke-direct {p3}, Landroid/os/Bundle;-><init>()V

    goto :goto_0

    :cond_0
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1, p3}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    move-object p3, v1

    :goto_0
    const-string v1, "androidx.core.view.extra.INPUT_CONTENT_INFO"

    invoke-virtual {p3, v1, p2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    goto :goto_1

    :catch_0
    move-exception p1

    const-string p2, "InputConnectionCompat"

    const-string p3, "Can\'t insert content from IME; requestPermission() failed"

    invoke-static {p2, p3, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_3

    :cond_1
    :goto_1
    new-instance p2, Landroid/content/ClipData;

    iget-object v1, p1, LC/j;->b:Ljava/lang/Object;

    check-cast v1, LC/i;

    invoke-interface {v1}, LC/i;->a()Landroid/content/ClipDescription;

    move-result-object v1

    new-instance v3, Landroid/content/ClipData$Item;

    iget-object p1, p1, LC/j;->b:Ljava/lang/Object;

    check-cast p1, LC/i;

    invoke-interface {p1}, LC/i;->e()Landroid/net/Uri;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/content/ClipData$Item;-><init>(Landroid/net/Uri;)V

    invoke-direct {p2, v1, v3}, Landroid/content/ClipData;-><init>(Landroid/content/ClipDescription;Landroid/content/ClipData$Item;)V

    const/16 v1, 0x1f

    const/4 v3, 0x2

    if-lt v0, v1, :cond_2

    new-instance v0, LC/j;

    invoke-direct {v0, p2, v3}, LC/j;-><init>(Landroid/content/ClipData;I)V

    goto :goto_2

    :cond_2
    new-instance v0, Ly/e;

    invoke-direct {v0}, Ly/e;-><init>()V

    iput-object p2, v0, Ly/e;->b:Landroid/content/ClipData;

    iput v3, v0, Ly/e;->c:I

    :goto_2
    invoke-interface {p1}, LC/i;->c()Landroid/net/Uri;

    move-result-object p1

    invoke-interface {v0, p1}, Ly/d;->e(Landroid/net/Uri;)V

    invoke-interface {v0, p3}, Ly/d;->a(Landroid/os/Bundle;)V

    invoke-interface {v0}, Ly/d;->k()Ly/g;

    move-result-object p1

    iget-object p2, p0, LC/d;->a:Li/x;

    invoke-static {p2, p1}, Ly/K;->f(Landroid/view/View;Ly/g;)Ly/g;

    move-result-object p1

    if-nez p1, :cond_3

    return v2

    :cond_3
    :goto_3
    const/4 p1, 0x0

    return p1
.end method
