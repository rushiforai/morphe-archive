.class public final Lk2b;
.super Lptn;
.source "SourceFile"


# instance fields
.field public b:J

.field public c:J

.field public final synthetic d:Ll2b;


# direct methods
.method public constructor <init>(Ll2b;Lorg/chromium/content_public/browser/WebContents;)V
    .registers 3

    iput-object p1, p0, Lk2b;->d:Ll2b;

    invoke-direct {p0, p2}, Lptn;-><init>(Lorg/chromium/content_public/browser/WebContents;)V

    return-void
.end method


# virtual methods
.method public final didFinishNavigationInPrimaryMainFrame(Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 8

    iget-object v0, p0, Lk2b;->d:Ll2b;

    iget-object v1, v0, Ll2b;->W:Ljava/lang/StringBuilder;

    iget v2, p1, Lorg/chromium/content_public/browser/NavigationHandle;->m:I

    const/16 v3, 0xc8

    if-eq v2, v3, :cond_10

    const/16 p0, 0x23

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    return-void

    :cond_10
    iget-boolean v2, p1, Lorg/chromium/content_public/browser/NavigationHandle;->a:Z

    if-eqz v2, :cond_137

    iget-boolean v2, p1, Lorg/chromium/content_public/browser/NavigationHandle;->h:Z

    if-eqz v2, :cond_137

    iget-boolean v2, p1, Lorg/chromium/content_public/browser/NavigationHandle;->c:Z

    if-nez v2, :cond_137

    iget-boolean v2, p1, Lorg/chromium/content_public/browser/NavigationHandle;->j:Z

    if-nez v2, :cond_137

    iget-wide v2, p1, Lorg/chromium/content_public/browser/NavigationHandle;->s:J

    iget-wide v4, p0, Lk2b;->b:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_4b

    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lk2b;->b:J

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lk2b;->c:J

    sub-long/2addr v2, v4

    sget-object p0, Lpn7;->b:Lon7;

    sget-object p0, Lun7;->d:Lun7;

    invoke-static {v2, v3, p0}, Lcs5;->y0(JLun7;)J

    move-result-wide v2

    const/4 p0, 0x5

    sget-object v4, Lun7;->e:Lun7;

    invoke-static {p0, v4}, Lcs5;->x0(ILun7;)J

    move-result-wide v4

    invoke-static {v2, v3, v4, v5}, Lpn7;->c(JJ)I

    move-result p0

    if-lez p0, :cond_4b

    const/4 p0, 0x1

    iput-boolean p0, v0, Ll2b;->X:Z

    :cond_4b
    iget-object p0, p1, Lorg/chromium/content_public/browser/NavigationHandle;->e:Lorg/chromium/url/GURL;

    invoke-virtual {p0}, Lorg/chromium/url/GURL;->c()Ljava/lang/String;

    move-result-object p0

    const-string v2, "accounts.google.com"

    invoke-virtual {v2, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    iput-boolean p0, v0, Ll2b;->P:Z

    if-eqz p0, :cond_5e

    invoke-virtual {v0}, Ll2b;->Q0()V

    :cond_5e
    iget-object p0, p1, Lorg/chromium/content_public/browser/NavigationHandle;->e:Lorg/chromium/url/GURL;

    invoke-virtual {p0}, Lorg/chromium/url/GURL;->c()Ljava/lang/String;

    move-result-object p0

    const-string v3, "takeout.google.com"

    invoke-virtual {v3, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    const/16 v3, 0x8

    const/4 v4, 0x0

    if-eqz p0, :cond_8e

    invoke-virtual {v0}, Ll2b;->P0()V

    iget-object p0, v0, Ll2b;->S:Landroid/view/View;

    if-nez p0, :cond_77

    move-object p0, v4

    :cond_77
    invoke-virtual {p0, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, v0, Ll2b;->T:Landroid/view/View;

    if-eqz p0, :cond_7f

    move-object v4, p0

    :cond_7f
    invoke-virtual {v4, v3}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0}, Ll2b;->O0()V

    const/16 p0, 0x41

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ll2b;->J0()V

    return-void

    :cond_8e
    iget-object p0, p1, Lorg/chromium/content_public/browser/NavigationHandle;->e:Lorg/chromium/url/GURL;

    invoke-virtual {p0}, Lorg/chromium/url/GURL;->c()Ljava/lang/String;

    move-result-object p0

    const-string v5, "passwords.google.com"

    invoke-virtual {v5, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    iget-object v5, p1, Lorg/chromium/content_public/browser/NavigationHandle;->e:Lorg/chromium/url/GURL;

    if-eqz p0, :cond_d2

    invoke-virtual {v5}, Lorg/chromium/url/GURL;->e()Ljava/lang/String;

    move-result-object p0

    const-string p1, "/error/sync-passphrase"

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_b3

    const/16 p0, 0x42

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ll2b;->I0()V

    return-void

    :cond_b3
    invoke-virtual {v0}, Ll2b;->P0()V

    iget-object p0, v0, Ll2b;->S:Landroid/view/View;

    if-nez p0, :cond_bb

    move-object p0, v4

    :cond_bb
    invoke-virtual {p0, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, v0, Ll2b;->T:Landroid/view/View;

    if-eqz p0, :cond_c3

    move-object v4, p0

    :cond_c3
    invoke-virtual {v4, v3}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0}, Ll2b;->O0()V

    const/16 p0, 0x43

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ll2b;->H0()V

    return-void

    :cond_d2
    invoke-virtual {v5}, Lorg/chromium/url/GURL;->c()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_11a

    iget-boolean p0, v0, Ll2b;->O:Z

    const/4 p1, 0x0

    if-eqz p0, :cond_ee

    iput-boolean p1, v0, Ll2b;->O:Z

    iget-object p0, v0, Ll2b;->M:Lyl8;

    if-eqz p0, :cond_ec

    iget-object v2, p0, Lyl8;->d:Ltcc;

    invoke-virtual {p0, v2}, Lxl8;->b(Ltcc;)V

    :cond_ec
    iput-object v4, v0, Ll2b;->M:Lyl8;

    :cond_ee
    iget-object p0, v0, Ll2b;->N:Lj3b;

    if-eqz p0, :cond_fe

    iget-object v2, p0, Lj3b;->b:Lor2;

    iget-object v2, v2, Lor2;->d:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    invoke-virtual {v2}, Lcom/opera/android/widget/LottieAnimationView;->q()V

    invoke-virtual {p0, v3}, Landroid/view/View;->setVisibility(I)V

    :cond_fe
    iget-object p0, v0, Ll2b;->S:Landroid/view/View;

    if-nez p0, :cond_103

    move-object p0, v4

    :cond_103
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, v0, Ll2b;->T:Landroid/view/View;

    if-eqz p0, :cond_10b

    move-object v4, p0

    :cond_10b
    invoke-virtual {v4, p1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0}, Ll2b;->B0()V

    const/16 p0, 0x44

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ll2b;->F0()V

    return-void

    :cond_11a
    iget-object p0, p1, Lorg/chromium/content_public/browser/NavigationHandle;->e:Lorg/chromium/url/GURL;

    invoke-virtual {p0}, Lorg/chromium/url/GURL;->c()Ljava/lang/String;

    move-result-object p0

    const-string p1, "gds.google.com"

    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_131

    const/16 p0, 0x45

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ll2b;->G0()V

    return-void

    :cond_131
    const/16 p0, 0x3f

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    return-void

    :cond_137
    iget-boolean p0, p1, Lorg/chromium/content_public/browser/NavigationHandle;->j:Z

    if-eqz p0, :cond_140

    const/16 p0, 0x21

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_140
    return-void
.end method

.method public final didStartNavigationInPrimaryMainFrame(Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 4

    iget-boolean v0, p1, Lorg/chromium/content_public/browser/NavigationHandle;->c:Z

    if-nez v0, :cond_16

    iget-boolean v0, p1, Lorg/chromium/content_public/browser/NavigationHandle;->j:Z

    if-nez v0, :cond_16

    iget-boolean v0, p1, Lorg/chromium/content_public/browser/NavigationHandle;->a:Z

    if-eqz v0, :cond_16

    iget-wide v0, p1, Lorg/chromium/content_public/browser/NavigationHandle;->s:J

    iput-wide v0, p0, Lk2b;->b:J

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lk2b;->c:J

    :cond_16
    return-void
.end method
