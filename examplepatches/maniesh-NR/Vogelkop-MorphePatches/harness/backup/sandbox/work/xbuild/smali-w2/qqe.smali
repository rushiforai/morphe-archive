.class public final Lqqe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lshj;


# instance fields
.field public final a:Lcom/opera/android/browser/chromium/ChromiumContent;

.field public final b:Lnw3;


# direct methods
.method public constructor <init>(Lcom/opera/android/browser/chromium/ChromiumContent;Lnw3;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqqe;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    iput-object p2, p0, Lqqe;->b:Lnw3;

    return-void
.end method


# virtual methods
.method public final b(Lorg/chromium/content_public/browser/NavigationHandle;Lorg/chromium/url/GURL;ZZ)Z
    .registers 7

    invoke-virtual {p2}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object p1

    sget-object p2, Lwqm;->a:[Ljava/lang/String;

    const/4 p2, 0x0

    if-eqz p1, :cond_e5

    const-string p3, "feed-news:"

    invoke-virtual {p1, p3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_e5

    const/16 p3, 0xc

    invoke-virtual {p1, p3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p3

    sget-object p4, Laik;->a:[Ljava/lang/String;

    invoke-static {p3, p4}, Laik;->s(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    const/16 p4, 0x3f

    invoke-virtual {p3, p4}, Ljava/lang/String;->indexOf(I)I

    move-result p4

    if-ltz p4, :cond_29

    invoke-virtual {p3, p2, p4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p3

    :cond_29
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p4

    if-eqz p4, :cond_32

    new-array p3, p2, [Ljava/lang/String;

    goto :goto_38

    :cond_32
    const-string p4, "/"

    invoke-virtual {p3, p4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p3

    :goto_38
    array-length p4, p3

    const/4 v0, 0x1

    if-lt p4, v0, :cond_e5

    aget-object p4, p3, p2

    const-string v1, "feedback"

    invoke-virtual {v1, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_e4

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    const-string p4, "entry_id"

    invoke-static {p1, p4}, Lwqm;->m(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_e4

    iget-object v1, p0, Lqqe;->b:Lnw3;

    iget-object v1, v1, Lnw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object v1

    invoke-virtual {v1}, Lfqe;->c()Luqe;

    move-result-object v1

    invoke-virtual {v1, p4, p2}, Luqe;->e(Ljava/lang/String;Z)Lmsh;

    move-result-object p2

    if-eqz p2, :cond_e4

    array-length p4, p3

    sub-int/2addr p4, v0

    aget-object p3, p3, p4

    const-string p4, "like"

    invoke-virtual {p4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_b2

    const-string p0, "value"

    invoke-static {p1, p0}, Lwqm;->m(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_e4

    invoke-static {p0}, Llsh;->d(Ljava/lang/String;)Llsh;

    move-result-object p0

    if-eqz p0, :cond_e4

    iget-object p1, p2, Lmsh;->e:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Llsh;

    if-eq p1, p0, :cond_e4

    invoke-virtual {p2, p0}, Lmsh;->c(Llsh;)V

    iget-object p1, v1, Luqe;->h:Luy8;

    iget-object p0, p0, Llsh;->a:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of p3, p2, Lure;

    const-string p4, "web_page"

    if-eqz p3, :cond_a9

    new-instance p3, Lgy8;

    invoke-direct {p3, p2, p0, p4}, Lgy8;-><init>(Lmsh;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1, p3}, Luy8;->e(Lzx8;)V

    return v0

    :cond_a9
    new-instance p3, Lgy8;

    invoke-direct {p3, p2, p0, p4}, Lgy8;-><init>(Lmsh;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1, p3}, Luy8;->c(Ldy8;)V

    return v0

    :cond_b2
    const-string p1, "negative_feedback"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_e4

    new-instance p1, Lf1p;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p1, Lf1p;->a:Ljava/lang/Object;

    iput-object p2, p1, Lf1p;->b:Ljava/lang/Object;

    new-instance p3, Li16;

    const/16 p4, 0x1a

    invoke-direct {p3, p0, v1, p2, p4}, Li16;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p4, Lc37;

    invoke-direct {p4}, Ljava/lang/Object;-><init>()V

    iput-object v1, p4, Lc37;->a:Ljava/lang/Object;

    iput-object p2, p4, Lc37;->b:Ljava/lang/Object;

    new-instance v1, Lxq3;

    invoke-static {p2, p1, p3, p4}, Lk1g;->y(Lmsh;Lox8;Lox8;Lox8;)Ljava/util/ArrayList;

    move-result-object p1

    const/4 p2, 0x0

    invoke-direct {v1, p2, p1}, Lxq3;-><init>(Landroid/view/View;Ljava/util/List;)V

    iget-object p0, p0, Lqqe;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->p:Lcom/opera/android/browser/dialog/DialogDelegate;

    invoke-interface {p0, v1}, Lcom/opera/android/browser/dialog/DialogDelegate;->d(Lcej;)V

    :cond_e4
    return v0

    :cond_e5
    return p2
.end method
