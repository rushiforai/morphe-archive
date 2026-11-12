.class public final Lqke;
.super Ly08;
.source "SourceFile"


# instance fields
.field public final a:Lcom/opera/android/settings/SettingsManager;

.field public final b:Lnw3;

.field public final c:Ljava/util/HashMap;

.field public final d:Li7f;


# direct methods
.method public constructor <init>(Lk6l;Lcom/opera/android/settings/SettingsManager;Lnw3;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lqke;->c:Ljava/util/HashMap;

    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    iput-object v0, p0, Lqke;->d:Li7f;

    invoke-virtual {p1, p0}, Lk6l;->b(La2l;)V

    iput-object p2, p0, Lqke;->a:Lcom/opera/android/settings/SettingsManager;

    iput-object p3, p0, Lqke;->b:Lnw3;

    return-void
.end method

.method public static Z(Lorg/chromium/url/GURL;)Z
    .registers 3

    iget-boolean v0, p0, Lorg/chromium/url/GURL;->b:Z

    if-eqz v0, :cond_1e

    invoke-virtual {p0}, Lorg/chromium/url/GURL;->f()Ljava/lang/String;

    move-result-object v0

    const-string v1, "http"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c

    invoke-virtual {p0}, Lorg/chromium/url/GURL;->f()Ljava/lang/String;

    move-result-object p0

    const-string v0, "https"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1e

    :cond_1c
    const/4 p0, 0x1

    return p0

    :cond_1e
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public final E(Lb2l;Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 9

    move-object v0, p1

    check-cast v0, Ld7l;

    iget-object v1, v0, Ld7l;->j:Le7l;

    invoke-interface {v1}, Lb9l;->getId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object v2, p0, Lqke;->c:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Loke;

    if-eqz v1, :cond_6a

    iget-object v3, v1, Loke;->g:Lorg/chromium/content_public/browser/NavigationHandle;

    if-ne v3, p2, :cond_6a

    const/4 v3, 0x0

    iput-object v3, v1, Loke;->g:Lorg/chromium/content_public/browser/NavigationHandle;

    iget-boolean v3, p2, Lorg/chromium/content_public/browser/NavigationHandle;->h:Z

    if-eqz v3, :cond_5d

    iget-boolean v3, p2, Lorg/chromium/content_public/browser/NavigationHandle;->j:Z

    if-nez v3, :cond_5d

    iget-boolean v3, p2, Lorg/chromium/content_public/browser/NavigationHandle;->i:Z

    if-nez v3, :cond_5d

    iget v3, p2, Lorg/chromium/content_public/browser/NavigationHandle;->m:I

    const/16 v4, 0x190

    if-lt v3, v4, :cond_34

    const/16 v4, 0x258

    if-lt v3, v4, :cond_5d

    :cond_34
    iget-object v3, p2, Lorg/chromium/content_public/browser/NavigationHandle;->e:Lorg/chromium/url/GURL;

    invoke-static {v3}, Lqke;->Z(Lorg/chromium/url/GURL;)Z

    move-result v3

    if-eqz v3, :cond_5d

    iget p2, p2, Lorg/chromium/content_public/browser/NavigationHandle;->d:I

    and-int/lit16 v3, p2, 0xff

    const/16 v4, 0x8

    if-eq v3, v4, :cond_5d

    const/high16 v3, 0x1000000

    and-int/2addr p2, v3

    if-nez p2, :cond_5d

    iget-wide v2, v1, Loke;->f:J

    const-wide/16 v4, 0x0

    cmp-long p2, v2, v4

    if-nez p2, :cond_55

    iget-boolean p2, v1, Loke;->c:Z

    if-eqz p2, :cond_6a

    :cond_55
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    invoke-virtual {p0, p1, v1, v2, v3}, Lqke;->X(Lb2l;Loke;J)V

    return-void

    :cond_5d
    iget-object p0, v0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->getId()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_6a
    return-void
.end method

.method public final Q(Lb2l;Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 10

    iget-boolean v0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->c:Z

    if-eqz v0, :cond_8

    iget-boolean v0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->b:Z

    if-eqz v0, :cond_5f

    :cond_8
    iget-object v0, p2, Lorg/chromium/content_public/browser/NavigationHandle;->e:Lorg/chromium/url/GURL;

    invoke-static {v0}, Lqke;->Z(Lorg/chromium/url/GURL;)Z

    move-result v0

    if-eqz v0, :cond_5f

    move-object v0, p1

    check-cast v0, Ld7l;

    iget-object v1, v0, Ld7l;->j:Le7l;

    invoke-interface {v1}, Lb9l;->getId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Loke;

    iget-object v3, p0, Lqke;->a:Lcom/opera/android/settings/SettingsManager;

    const-string v4, "compression"

    invoke-virtual {v3, v4}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v3

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->m()Z

    move-result v0

    invoke-direct {v2, v3, v0, p2}, Loke;-><init>(ZZLorg/chromium/content_public/browser/NavigationHandle;)V

    iget-object v0, p0, Lqke;->c:Ljava/util/HashMap;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Loke;

    if-eqz v0, :cond_5f

    iget-object v1, v0, Loke;->g:Lorg/chromium/content_public/browser/NavigationHandle;

    if-nez v1, :cond_5f

    iget-wide v1, v0, Loke;->f:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_5f

    iget-boolean v1, v0, Loke;->c:Z

    if-nez v1, :cond_5f

    iget-boolean p2, p2, Lorg/chromium/content_public/browser/NavigationHandle;->c:Z

    if-eqz p2, :cond_5f

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iget-wide v5, v0, Loke;->e:J

    cmp-long p2, v5, v3

    if-nez p2, :cond_5a

    iput-wide v1, v0, Loke;->e:J

    :cond_5a
    iput-wide v1, v0, Loke;->f:J

    invoke-virtual {p0, p1, v0, v1, v2}, Lqke;->X(Lb2l;Loke;J)V

    :cond_5f
    return-void
.end method

.method public final W(Lpke;)V
    .registers 2

    iget-object p0, p0, Lqke;->d:Li7f;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final X(Lb2l;Loke;J)V
    .registers 16

    iget-boolean v0, p2, Loke;->c:Z

    if-nez v0, :cond_12

    iget-wide v0, p2, Loke;->e:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_67

    iget-wide v0, p2, Loke;->f:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_67

    :cond_12
    move-object v0, p1

    check-cast v0, Ld7l;

    iget-object v1, v0, Ld7l;->j:Le7l;

    invoke-interface {v1}, Lb9l;->getId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object v2, p0, Lqke;->c:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lqke;->b:Lnw3;

    iget-object v1, v1, Lnw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object v1

    iget-object v2, v1, Lydn;->d:Lvdn;

    iget-boolean v3, v2, Lvdn;->a:Z

    const/4 v4, 0x1

    if-eqz v3, :cond_46

    iget-boolean v5, p2, Loke;->d:Z

    if-eqz v5, :cond_40

    if-nez v3, :cond_48

    goto :goto_46

    :cond_40
    invoke-virtual {v2}, Lvdn;->a()Z

    move-result v2

    if-nez v2, :cond_48

    :cond_46
    :goto_46
    move v10, v4

    goto :goto_4d

    :cond_48
    invoke-virtual {v1, v0}, Lydn;->t(Ljava/lang/String;)Z

    move-result v4

    goto :goto_46

    :goto_4d
    iget-object p0, p0, Lqke;->d:Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :goto_53
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_67

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lpke;

    move-object v6, p1

    move-object v7, p2

    move-wide v8, p3

    invoke-interface/range {v5 .. v10}, Lpke;->w(Lb2l;Loke;JZ)V

    goto :goto_53

    :cond_67
    return-void
.end method

.method public final Y(Lpke;)V
    .registers 2

    iget-object p0, p0, Lqke;->d:Li7f;

    invoke-virtual {p0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final j(Lb2l;)V
    .registers 7

    move-object v0, p1

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->getId()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-object v1, p0, Lqke;->c:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Loke;

    if-eqz v0, :cond_2c

    iget-wide v1, v0, Loke;->f:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_2c

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iput-wide v1, v0, Loke;->f:J

    iget-object v3, v0, Loke;->g:Lorg/chromium/content_public/browser/NavigationHandle;

    if-nez v3, :cond_2c

    invoke-virtual {p0, p1, v0, v1, v2}, Lqke;->X(Lb2l;Loke;J)V

    :cond_2c
    return-void
.end method

.method public final l(Lb2l;I)V
    .registers 8

    move-object v0, p1

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->getId()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-object v1, p0, Lqke;->c:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Loke;

    if-eqz v0, :cond_2c

    iget-wide v1, v0, Loke;->e:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_2c

    const/16 v1, 0x64

    if-lt p2, v1, :cond_2c

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iput-wide v1, v0, Loke;->e:J

    invoke-virtual {p0, p1, v0, v1, v2}, Lqke;->X(Lb2l;Loke;J)V

    :cond_2c
    return-void
.end method
