.class public final Lev3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lgj;
.implements Lkx3;


# instance fields
.field public final synthetic a:Lcom/opera/android/BrowserActivity;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lev3;->a:Lcom/opera/android/BrowserActivity;

    return-void
.end method


# virtual methods
.method public final a(IILjava/lang/String;)V
    .registers 5

    if-eqz p2, :cond_70

    and-int/2addr p2, p1

    iget-object p0, p0, Lev3;->a:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    const/4 p1, 0x0

    if-eqz p2, :cond_3d

    if-nez p0, :cond_d

    move-object p0, p1

    :cond_d
    iget-object p0, p0, Lk6l;->b:Ljava/util/ArrayList;

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_17
    :goto_17
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_70

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb2l;

    check-cast p1, Ld7l;

    invoke-virtual {p1}, Ld7l;->i0()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/opera/android/browser/BrowserUtils;->getExternalUrlWithFallback(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    sget-object v0, Lhj;->a:Li7f;

    invoke-static {p2}, Lwqm;->q(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_17

    invoke-virtual {p1}, Ld7l;->b()V

    goto :goto_17

    :cond_3d
    if-nez p0, :cond_40

    move-object p0, p1

    :cond_40
    iget-object p0, p0, Lk6l;->b:Ljava/util/ArrayList;

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_4a
    :goto_4a
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_70

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb2l;

    check-cast p1, Ld7l;

    invoke-virtual {p1}, Ld7l;->i0()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/opera/android/browser/BrowserUtils;->getExternalUrlWithFallback(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    sget-object v0, Lhj;->a:Li7f;

    invoke-static {p2}, Lwqm;->q(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_4a

    invoke-virtual {p1}, Ld7l;->p()V

    goto :goto_4a

    :cond_70
    return-void
.end method

.method public final b(Ljava/lang/String;)V
    .registers 4

    if-eqz p1, :cond_37

    iget-object p0, p0, Lev3;->a:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez p0, :cond_9

    const/4 p0, 0x0

    :cond_9
    iget-object p0, p0, Lk6l;->b:Ljava/util/ArrayList;

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_13
    :goto_13
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_37

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb2l;

    check-cast v0, Ld7l;

    invoke-virtual {v0}, Ld7l;->i0()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/opera/android/browser/BrowserUtils;->getExternalUrlWithFallback(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/chromium/net/GURLUtils;->getOrigin(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_13

    invoke-virtual {v0}, Ld7l;->b()V

    goto :goto_13

    :cond_37
    return-void
.end method
