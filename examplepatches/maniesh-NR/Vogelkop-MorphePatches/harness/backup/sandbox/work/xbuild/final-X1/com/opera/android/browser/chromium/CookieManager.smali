.class public final Lcom/opera/android/browser/chromium/CookieManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/opera/android/browser/chromium/CookieManager$ChangeListenerValue;
    }
.end annotation


# instance fields
.field public final a:Ljava/util/HashMap;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/opera/android/browser/chromium/CookieManager;->a:Ljava/util/HashMap;

    return-void
.end method

.method public static addCookie(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)V
    .registers 7
    .param p0    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljv5;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "ZZ)V"
        }
    .end annotation

    move-object p5, p4

    move-object p4, p3

    move-object p3, p2

    move-object p2, p1

    new-instance p1, Ljv5;

    invoke-direct/range {p1 .. p6}, Ljv5;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static callCallback(Lcom/opera/api/Callback;Ljava/util/List;)V
    .registers 2
    .param p0    # Lcom/opera/api/Callback;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/opera/api/Callback;",
            "Ljava/util/List<",
            "Ljv5;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public static changedCookie(Lcom/opera/android/browser/chromium/CookieManager$ChangeListenerValue;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)V
    .registers 9
    .param p0    # Lcom/opera/android/browser/chromium/CookieManager$ChangeListenerValue;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-object p0, p0, Lcom/opera/android/browser/chromium/CookieManager$ChangeListenerValue;->a:Lh7f;

    new-instance p2, Lg7f;

    invoke-direct {p2, p0}, Lg7f;-><init>(Lh7f;)V

    :cond_7
    :goto_7
    invoke-virtual {p2}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_4d

    invoke-virtual {p2}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lq1a;

    iget-object p0, p0, Lq1a;->a:Lv1a;

    const-string p5, "HSID"

    invoke-static {p1, p5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p5

    if-nez p5, :cond_25

    const-string p5, "SID"

    invoke-static {p1, p5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p5

    if-eqz p5, :cond_7

    :cond_25
    const-string p5, "/"

    invoke-static {p4, p5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p5

    if-eqz p5, :cond_7

    const-string p5, ".google.com"

    invoke-static {p3, p5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p5

    if-eqz p5, :cond_7

    iget-object p5, p0, Lv1a;->h:Ld3k;

    const/4 p6, 0x0

    if-eqz p5, :cond_3d

    invoke-virtual {p5, p6}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    :cond_3d
    iget-object p5, p0, Lv1a;->b:Lnx5;

    new-instance v0, Lt1a;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p6, v1}, Lt1a;-><init>(Lv1a;Lmt5;B)V

    const/4 v1, 0x3

    invoke-static {p5, p6, p6, v0, v1}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    move-result-object p5

    iput-object p5, p0, Lv1a;->h:Ld3k;

    goto :goto_7

    :cond_4d
    return-void
.end method
