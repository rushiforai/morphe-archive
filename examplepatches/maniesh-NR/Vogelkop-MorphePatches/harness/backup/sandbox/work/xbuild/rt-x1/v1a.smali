.class public final Lv1a;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lru9;

.field public final b:Lnx5;

.field public final c:Lnrl;

.field public d:Lcom/opera/android/browser/chromium/CookieManager;

.field public final e:Ljdj;

.field public final f:Lplh;

.field public g:Lq1a;

.field public h:Ld3k;

.field public i:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>(Lru9;Lnx5;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lv1a;->a:Lru9;

    iput-object p2, p0, Lv1a;->b:Lnx5;

    new-instance p1, Lnrl;

    const/16 v0, 0x1a

    invoke-direct {p1, v0}, Lnrl;-><init>(B)V

    iput-object p1, p0, Lv1a;->c:Lnrl;

    const/4 p1, 0x6

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {v0, v0, v1, p1}, Lipe;->c(IILh04;I)Ljdj;

    move-result-object p1

    iput-object p1, p0, Lv1a;->e:Ljdj;

    invoke-static {p1}, La26;->i(Ljdj;)Lplh;

    move-result-object p1

    iput-object p1, p0, Lv1a;->f:Lplh;

    new-instance p1, Lt1a;

    invoke-direct {p1, p0, v1, v0}, Lt1a;-><init>(Lv1a;Lmt5;B)V

    const/4 p0, 0x3

    invoke-static {p2, v1, v1, p1, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void
.end method


# virtual methods
.method public final a(Lcom/opera/api/Callback;)V
    .registers 9

    iget-object v0, p0, Lv1a;->d:Lcom/opera/android/browser/chromium/CookieManager;

    if-eqz v0, :cond_20

    new-instance v1, Lorg/chromium/url/GURL;

    const-string v0, "https://www.google.com/"

    invoke-direct {v1, v0}, Lorg/chromium/url/GURL;-><init>(Ljava/lang/String;)V

    new-instance v6, Lhu5;

    const/16 v0, 0x14

    iget-object p0, p0, Lv1a;->a:Lru9;

    invoke-direct {v6, p0, p1, v0}, Lhu5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static/range {v1 .. v6}, LJ/N;->M8VJflmI(Ljava/lang/Object;ZZZLjava/lang/Object;Ljava/lang/Object;)V

    return-void

    :cond_20
    new-instance v0, Lzr9;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, Lzr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p0, Lv1a;->c:Lnrl;

    invoke-virtual {p0, v0}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    return-void
.end method

.method public final b()V
    .registers 6

    iget-object v0, p0, Lv1a;->d:Lcom/opera/android/browser/chromium/CookieManager;

    const/4 v1, 0x0

    if-eqz v0, :cond_3a

    new-instance v2, Lq1a;

    invoke-direct {v2, p0}, Lq1a;-><init>(Lv1a;)V

    iput-object v2, p0, Lv1a;->g:Lq1a;

    new-instance p0, Lorg/chromium/url/GURL;

    const-string v3, "https://www.google.com/"

    invoke-direct {p0, v3}, Lorg/chromium/url/GURL;-><init>(Ljava/lang/String;)V

    new-instance v3, Lkv5;

    invoke-direct {v3, p0}, Lkv5;-><init>(Lorg/chromium/url/GURL;)V

    new-instance v4, Lcom/opera/android/browser/chromium/CookieManager$ChangeListenerValue;

    invoke-direct {v4}, Lcom/opera/android/browser/chromium/CookieManager$ChangeListenerValue;-><init>()V

    iget-object v0, v0, Lcom/opera/android/browser/chromium/CookieManager;->a:Ljava/util/HashMap;

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/browser/chromium/CookieManager$ChangeListenerValue;

    if-nez v0, :cond_34

    iget-object v0, v4, Lcom/opera/android/browser/chromium/CookieManager$ChangeListenerValue;->a:Lh7f;

    invoke-virtual {v0, v2}, Lh7f;->b(Ljava/lang/Object;)Z

    const/4 v0, 0x0

    invoke-static {v1, p0, v0, v4}, LJ/N;->M9f3dmT1(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)J

    move-result-wide v0

    iput-wide v0, v4, Lcom/opera/android/browser/chromium/CookieManager$ChangeListenerValue;->b:J

    return-void

    :cond_34
    iget-object p0, v0, Lcom/opera/android/browser/chromium/CookieManager$ChangeListenerValue;->a:Lh7f;

    invoke-virtual {p0, v2}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void

    :cond_3a
    new-instance v0, Lr1a;

    invoke-direct {v0, p0, v1}, Lr1a;-><init>(Lv1a;B)V

    iget-object p0, p0, Lv1a;->c:Lnrl;

    invoke-virtual {p0, v0}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    return-void
.end method
