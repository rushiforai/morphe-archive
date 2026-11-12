.class public abstract Lr25;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Lrxh;

.field public final c:Lrxh;

.field public final d:I

.field public final e:La35;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lrxh;Lrxh;ILa35;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lr25;->a:Ljava/lang/String;

    iput-object p2, p0, Lr25;->b:Lrxh;

    iput-object p3, p0, Lr25;->c:Lrxh;

    iput p4, p0, Lr25;->d:I

    iput-object p5, p0, Lr25;->e:La35;

    return-void
.end method


# virtual methods
.method public a(Ls25;Ljava/lang/Runnable;)V
    .registers 4

    new-instance p0, Lz;

    invoke-direct {p0, p2}, Lz;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lz;->b()Lyqd;

    move-result-object p2

    sget-object v0, Llx3;->a:Li7f;

    invoke-static {p2}, LJ/N;->MZpN8dyq(Ljava/lang/Object;)V

    sget-object p2, Lxne;->b:Lii;

    invoke-virtual {p2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lt9f;

    iget-object p2, p2, Lt9f;->k:La74;

    if-eqz p2, :cond_1f

    :try_start_1a
    iget-object p2, p2, La74;->a:Lokhttp3/internal/cache/DiskLruCache;

    invoke-virtual {p2}, Lokhttp3/internal/cache/DiskLruCache;->evictAll()V
    :try_end_1f
    .catch Ljava/io/IOException; {:try_start_1a .. :try_end_1f} :catch_1f

    :catch_1f
    :cond_1f
    invoke-static {}, LJ/N;->MFg$8iJw()V

    iget-object p2, p1, Ls25;->a:Lcom/opera/android/BrowserActivity;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    check-cast p2, Lcom/opera/android/OperaApplication;

    iget-object p2, p2, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p2, p2, Lxv1;->o1:Lj4c;

    invoke-virtual {p2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lwun;

    iget-object v0, p2, Lwun;->g:Lko7;

    invoke-virtual {v0}, Lldk;->i()V

    iget-object v0, p2, Lwun;->c:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->clear()V

    iget-object v0, p2, Lwun;->d:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    invoke-virtual {p2}, Lwun;->d()V

    iget-object p1, p1, Ls25;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    iget-object p1, p1, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p1, p1, Lxv1;->S0:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Leoj;

    iget-object p2, p1, Leoj;->c:Livg;

    invoke-virtual {p2}, Livg;->removeAll()V

    iget-object p1, p1, Leoj;->d:Lhoj;

    invoke-interface {p1}, Lhoj;->removeAll()V

    invoke-virtual {p0}, Lz;->e()V

    return-void
.end method

.method public b()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public abstract c(Ls25;Lcom/opera/api/Callback;)V
.end method

.method public d(Ls25;)Z
    .registers 2

    const/4 p0, 0x1

    return p0
.end method
