.class public final Lkdo;
.super Ly08;
.source "SourceFile"


# instance fields
.field public final a:Lru9;

.field public final b:Lcom/opera/android/settings/SettingsManager;

.field public final c:Lk6l;

.field public final d:Ldu3;

.field public final e:Loz3;

.field public final f:Lkwf;

.field public final g:Lswf;

.field public final h:Ldu3;

.field public final i:Lqt3;

.field public final j:Lx5f;

.field public k:Lf6l;

.field public l:Lorg/chromium/content/browser/GestureListenerManagerImpl;

.field public final m:Ltz4;


# direct methods
.method public constructor <init>(Lru9;Lcom/opera/android/settings/SettingsManager;Lk6l;Ldu3;Loz3;Lkwf;Lswf;Ldu3;Lqt3;Lx5f;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkdo;->a:Lru9;

    iput-object p2, p0, Lkdo;->b:Lcom/opera/android/settings/SettingsManager;

    iput-object p3, p0, Lkdo;->c:Lk6l;

    iput-object p4, p0, Lkdo;->d:Ldu3;

    iput-object p5, p0, Lkdo;->e:Loz3;

    iput-object p6, p0, Lkdo;->f:Lkwf;

    iput-object p7, p0, Lkdo;->g:Lswf;

    iput-object p8, p0, Lkdo;->h:Ldu3;

    iput-object p9, p0, Lkdo;->i:Lqt3;

    iput-object p10, p0, Lkdo;->j:Lx5f;

    new-instance p2, Ltz4;

    const/4 p4, 0x4

    invoke-direct {p2, p0, p4}, Ltz4;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Lkdo;->m:Ltz4;

    iget-object p1, p1, Lru9;->a:Landroid/content/SharedPreferences;

    const-string p2, "default_zoom.page_menu_hint.shown"

    const/4 p4, 0x0

    invoke-interface {p1, p2, p4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-nez p1, :cond_30

    invoke-virtual {p3, p0}, Lk6l;->a(La2l;)Lf6l;

    move-result-object p1

    iput-object p1, p0, Lkdo;->k:Lf6l;

    :cond_30
    return-void
.end method


# virtual methods
.method public final E(Lb2l;Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 4

    iget-boolean v0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->c:Z

    if-nez v0, :cond_b

    iget-boolean p2, p2, Lorg/chromium/content_public/browser/NavigationHandle;->i:Z

    if-nez p2, :cond_b

    invoke-virtual {p0, p1}, Lkdo;->W(Lb2l;)V

    :cond_b
    return-void
.end method

.method public final G(Lb2l;)V
    .registers 2

    invoke-virtual {p0, p1}, Lkdo;->W(Lb2l;)V

    return-void
.end method

.method public final R(Ld7l;)V
    .registers 2

    invoke-virtual {p0}, Lkdo;->X()V

    return-void
.end method

.method public final S(Ld7l;)V
    .registers 2

    invoke-virtual {p0}, Lkdo;->X()V

    return-void
.end method

.method public final W(Lb2l;)V
    .registers 4

    invoke-virtual {p0}, Lkdo;->X()V

    invoke-static {p1}, Luy3;->H(Lb2l;)Lcom/opera/android/browser/chromium/ChromiumContent;

    move-result-object p1

    if-eqz p1, :cond_23

    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->f()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p1

    if-eqz p1, :cond_23

    sget-object v0, Lorg/chromium/content/browser/GestureListenerManagerImpl;->n:Landroid/util/LongSparseArray;

    const-class v0, Lorg/chromium/content/browser/GestureListenerManagerImpl;

    sget-object v1, Lmkh;->d:Ls49;

    invoke-interface {p1, v0, v1}, Lorg/chromium/content_public/browser/WebContents;->X(Ljava/lang/Class;Lktn;)Lytm;

    move-result-object p1

    check-cast p1, Lorg/chromium/content/browser/GestureListenerManagerImpl;

    iput-object p1, p0, Lkdo;->l:Lorg/chromium/content/browser/GestureListenerManagerImpl;

    iget-object p0, p0, Lkdo;->m:Ltz4;

    const/4 v0, 0x2

    invoke-virtual {p1, p0, v0}, Lorg/chromium/content/browser/GestureListenerManagerImpl;->b(Ljw9;I)V

    :cond_23
    return-void
.end method

.method public final X()V
    .registers 3

    iget-object v0, p0, Lkdo;->l:Lorg/chromium/content/browser/GestureListenerManagerImpl;

    if-eqz v0, :cond_9

    iget-object v1, p0, Lkdo;->m:Ltz4;

    invoke-virtual {v0, v1}, Lorg/chromium/content/browser/GestureListenerManagerImpl;->h(Ljw9;)V

    :cond_9
    const/4 v0, 0x0

    iput-object v0, p0, Lkdo;->l:Lorg/chromium/content/browser/GestureListenerManagerImpl;

    return-void
.end method
