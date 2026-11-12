.class public final Lleg;
.super Lptn;
.source "SourceFile"


# instance fields
.field public final synthetic b:B

.field public final c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/opera/android/browser/WebContentsWrapper;Lorg/chromium/content_public/browser/WebContents;Lorg/chromium/content_public/browser/WebContents;)V
    .registers 5

    const/4 v0, 0x2

    iput-byte v0, p0, Lleg;->b:B

    .line 14
    iput-object p3, p0, Lleg;->c:Ljava/lang/Object;

    iput-object p1, p0, Lleg;->d:Ljava/lang/Object;

    invoke-direct {p0, p2}, Lptn;-><init>(Lorg/chromium/content_public/browser/WebContents;)V

    return-void
.end method

.method public constructor <init>(Lkoi;Lorg/chromium/content_public/browser/WebContents;Lcom/opera/android/browser/WebContentsWrapper;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lleg;->b:B

    iput-object p3, p0, Lleg;->c:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lleg;->d:Ljava/lang/Object;

    invoke-direct {p0, p2}, Lptn;-><init>(Lorg/chromium/content_public/browser/WebContents;)V

    return-void
.end method

.method public constructor <init>(Lmeg;Lcom/opera/android/BrowserActivity;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lleg;->b:B

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lleg;->d:Ljava/lang/Object;

    .line 17
    iput-object p2, p0, Lleg;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final didFinishNavigationInPrimaryMainFrame(Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 7

    iget-byte v0, p0, Lleg;->b:B

    packed-switch v0, :pswitch_data_74

    return-void

    :pswitch_6
    iget-object v0, p0, Lleg;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/browser/WebContentsWrapper;

    iget-boolean p1, p1, Lorg/chromium/content_public/browser/NavigationHandle;->j:Z

    iput-boolean p1, v0, Lcom/opera/android/browser/WebContentsWrapper;->j:Z

    iget-object p0, p0, Lleg;->c:Ljava/lang/Object;

    check-cast p0, Lorg/chromium/content_public/browser/WebContents;

    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->s()Lorg/chromium/url/GURL;

    move-result-object p0

    iget-object p0, p0, Lorg/chromium/url/GURL;->a:Ljava/lang/String;

    invoke-static {p0}, Lcom/opera/android/browser/UrlMangler;->c(Ljava/lang/String;)Z

    move-result p1

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez p1, :cond_28

    invoke-static {p0}, Lcom/opera/android/browser/UrlMangler;->d(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_28

    move p1, v2

    goto :goto_29

    :cond_28
    move p1, v1

    :goto_29
    iget-boolean v3, v0, Lcom/opera/android/browser/WebContentsWrapper;->g:Z

    if-ne v3, p1, :cond_30

    move p1, v3

    move v3, v2

    goto :goto_33

    :cond_30
    iput-boolean p1, v0, Lcom/opera/android/browser/WebContentsWrapper;->g:Z

    move v3, v1

    :goto_33
    if-nez p1, :cond_3d

    invoke-static {p0}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_3d

    move p1, v2

    goto :goto_3e

    :cond_3d
    move p1, v1

    :goto_3e
    iget-boolean v4, v0, Lcom/opera/android/browser/WebContentsWrapper;->f:Z

    if-ne v4, p1, :cond_44

    move p1, v2

    goto :goto_47

    :cond_44
    iput-boolean p1, v0, Lcom/opera/android/browser/WebContentsWrapper;->f:Z

    move p1, v1

    :goto_47
    or-int/2addr v3, p1

    invoke-static {p0}, LJ/N;->Mjn2DHEV(Ljava/lang/Object;)I

    move-result p0

    iget p1, v0, Lcom/opera/android/browser/WebContentsWrapper;->e:I

    if-ne p1, p0, :cond_52

    move v1, v2

    goto :goto_54

    :cond_52
    iput p0, v0, Lcom/opera/android/browser/WebContentsWrapper;->e:I

    :goto_54
    or-int/2addr v3, v1

    const-wide/16 p0, 0x0

    if-eqz v3, :cond_66

    invoke-virtual {v0}, Lcom/opera/android/browser/WebContentsWrapper;->i()V

    iget-wide v0, v0, Lcom/opera/android/browser/WebContentsWrapper;->a:J

    cmp-long p0, v0, p0

    if-eqz p0, :cond_73

    invoke-static {v0, v1}, LJ/N;->MlSk$KdJ(J)V

    goto :goto_73

    :cond_66
    iget-boolean v1, v0, Lcom/opera/android/browser/WebContentsWrapper;->g:Z

    if-eqz v1, :cond_73

    iget-wide v0, v0, Lcom/opera/android/browser/WebContentsWrapper;->a:J

    cmp-long p0, v0, p0

    if-eqz p0, :cond_73

    invoke-static {v0, v1}, LJ/N;->MlSk$KdJ(J)V

    :cond_73
    :goto_73
    return-void

    :pswitch_data_74
    .packed-switch 0x2
        :pswitch_6
    .end packed-switch
.end method

.method public final didStartNavigationInPrimaryMainFrame(Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 2

    iget-byte p1, p0, Lleg;->b:B

    packed-switch p1, :pswitch_data_e

    return-void

    :pswitch_6
    iget-object p0, p0, Lleg;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/WebContentsWrapper;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/opera/android/browser/WebContentsWrapper;->j:Z

    return-void

    :pswitch_data_e
    .packed-switch 0x2
        :pswitch_6
    .end packed-switch
.end method

.method public final g()V
    .registers 5

    iget-object v0, p0, Lleg;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/browser/WebContentsWrapper;

    iget-object p0, p0, Lleg;->d:Ljava/lang/Object;

    check-cast p0, Lkoi;

    iget-boolean v1, p0, Lkoi;->g:Z

    iget-object v2, p0, Lkoi;->f:Ljava/util/HashMap;

    iget-object v3, p0, Lkoi;->b:Lfoi;

    if-nez v1, :cond_61

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_61

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lkoi;->c:Lcom/opera/android/browser/WebContentsWrapper;

    if-ne v0, v1, :cond_61

    iget-object v0, p0, Lkoi;->d:Landroid/view/ViewGroup;

    const/4 v1, 0x0

    if-eqz v0, :cond_32

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0, v1}, Lfoi;->b(Landroid/view/ViewGroup;Lioi;)V

    iput-object v1, p0, Lkoi;->d:Landroid/view/ViewGroup;

    :cond_32
    iget-object v0, v3, Lfoi;->a:Ljava/lang/Object;

    check-cast v0, Lioi;

    iget-object v0, v0, Lioi;->a:Lhoi;

    iput-object v1, v0, Lhoi;->b:Lcom/opera/android/browser/WebContentsWrapper;

    invoke-virtual {p0}, Lkoi;->b()Lcom/opera/android/browser/WebContentsWrapper;

    move-result-object v0

    iput-object v0, p0, Lkoi;->c:Lcom/opera/android/browser/WebContentsWrapper;

    if-eqz v0, :cond_61

    iget-boolean v1, v0, Lcom/opera/android/browser/WebContentsWrapper;->j:Z

    if-nez v1, :cond_61

    invoke-virtual {v0}, Lcom/opera/android/browser/WebContentsWrapper;->getView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lkoi;->d:Landroid/view/ViewGroup;

    if-eqz v0, :cond_57

    iget-object v1, v3, Lfoi;->a:Ljava/lang/Object;

    check-cast v1, Lioi;

    invoke-static {v0, v1}, Lfoi;->b(Landroid/view/ViewGroup;Lioi;)V

    :cond_57
    iget-object p0, p0, Lkoi;->c:Lcom/opera/android/browser/WebContentsWrapper;

    iget-object v0, v3, Lfoi;->a:Ljava/lang/Object;

    check-cast v0, Lioi;

    iget-object v0, v0, Lioi;->a:Lhoi;

    iput-object p0, v0, Lhoi;->b:Lcom/opera/android/browser/WebContentsWrapper;

    :cond_61
    return-void
.end method

.method public final hasEffectivelyFullscreenVideoChange(Z)V
    .registers 3

    iget-byte v0, p0, Lleg;->b:B

    packed-switch v0, :pswitch_data_18

    return-void

    :pswitch_6
    if-nez p1, :cond_17

    iget-object p1, p0, Lleg;->d:Ljava/lang/Object;

    check-cast p1, Lmeg;

    iget-object p0, p0, Lleg;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/BrowserActivity;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/app/Activity;->moveTaskToBack(Z)Z

    invoke-virtual {p1}, Lmeg;->a()V

    :cond_17
    return-void

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final onVisibilityChanged(I)V
    .registers 6

    iget-byte v0, p0, Lleg;->b:B

    packed-switch v0, :pswitch_data_76

    return-void

    :pswitch_6
    if-eqz p1, :cond_72

    const/4 v0, 0x2

    if-ne p1, v0, :cond_75

    iget-object p1, p0, Lleg;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/browser/WebContentsWrapper;

    iget-object p0, p0, Lleg;->d:Ljava/lang/Object;

    check-cast p0, Lkoi;

    iget-boolean v0, p0, Lkoi;->g:Z

    iget-object v1, p0, Lkoi;->b:Lfoi;

    iget-object v2, p0, Lkoi;->e:Ljava/util/ArrayList;

    iget-object v3, p0, Lkoi;->f:Ljava/util/HashMap;

    if-nez v0, :cond_75

    invoke-virtual {v3, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_75

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v3, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    iget-object v3, p0, Lkoi;->c:Lcom/opera/android/browser/WebContentsWrapper;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v2

    if-lt v0, v2, :cond_75

    iget-object v0, p0, Lkoi;->d:Landroid/view/ViewGroup;

    const/4 v2, 0x0

    if-eqz v0, :cond_47

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0, v2}, Lfoi;->b(Landroid/view/ViewGroup;Lioi;)V

    iput-object v2, p0, Lkoi;->d:Landroid/view/ViewGroup;

    :cond_47
    iget-object v0, v1, Lfoi;->a:Ljava/lang/Object;

    check-cast v0, Lioi;

    iget-object v0, v0, Lioi;->a:Lhoi;

    iput-object v2, v0, Lhoi;->b:Lcom/opera/android/browser/WebContentsWrapper;

    iput-object p1, p0, Lkoi;->c:Lcom/opera/android/browser/WebContentsWrapper;

    iget-boolean v0, p1, Lcom/opera/android/browser/WebContentsWrapper;->j:Z

    if-nez v0, :cond_75

    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->getView()Landroid/view/View;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Landroid/view/ViewGroup;

    iput-object v2, p0, Lkoi;->d:Landroid/view/ViewGroup;

    if-eqz v0, :cond_69

    check-cast v0, Landroid/view/ViewGroup;

    iget-object p0, v1, Lfoi;->a:Ljava/lang/Object;

    check-cast p0, Lioi;

    invoke-static {v0, p0}, Lfoi;->b(Landroid/view/ViewGroup;Lioi;)V

    :cond_69
    iget-object p0, v1, Lfoi;->a:Ljava/lang/Object;

    check-cast p0, Lioi;

    iget-object p0, p0, Lioi;->a:Lhoi;

    iput-object p1, p0, Lhoi;->b:Lcom/opera/android/browser/WebContentsWrapper;

    goto :goto_75

    :cond_72
    invoke-virtual {p0}, Lleg;->g()V

    :cond_75
    :goto_75
    return-void

    :pswitch_data_76
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method

.method public final webContentsDestroyed()V
    .registers 3

    iget-byte v0, p0, Lleg;->b:B

    packed-switch v0, :pswitch_data_1c

    return-void

    :pswitch_6
    invoke-virtual {p0}, Lleg;->g()V

    iget-object v0, p0, Lleg;->d:Ljava/lang/Object;

    check-cast v0, Lkoi;

    iget-object v1, v0, Lkoi;->e:Ljava/util/ArrayList;

    iget-object p0, p0, Lleg;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/WebContentsWrapper;

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object v0, v0, Lkoi;->f:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_data_1c
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method
