.class public final Ll/s3s0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/p3y0;

.field public final b:Ll/ptx0;

.field public final c:Ll/rlv0;

.field public final d:Ll/pns0;

.field public final e:Ll/x7t0;

.field public final f:Ll/o1t0;

.field public final g:Ll/qns0;

.field public h:Ll/y2t0;


# direct methods
.method public constructor <init>(Ll/p3y0;Ll/ptx0;Ll/rlv0;Ll/pns0;Ll/x7t0;Ll/o1t0;Ll/qns0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/s3s0;->a:Ll/p3y0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/s3s0;->b:Ll/ptx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/s3s0;->c:Ll/rlv0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/s3s0;->d:Ll/pns0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/s3s0;->e:Ll/x7t0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/s3s0;->f:Ll/o1t0;

    .line 15
    .line 16
    iput-object p7, p0, Ll/s3s0;->g:Ll/qns0;

    .line 17
    .line 18
    return-void
.end method

.method public static bridge synthetic a(Ll/s3s0;)Ll/ptx0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s3s0;->b:Ll/ptx0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic b(Ll/s3s0;)Ll/p3y0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s3s0;->a:Ll/p3y0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic g(Ll/s3s0;)Ll/rlv0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s3s0;->c:Ll/rlv0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic i(Ll/s3s0;)Ll/pns0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s3s0;->d:Ll/pns0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic k(Ll/s3s0;)Ll/o1t0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s3s0;->f:Ll/o1t0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic m(Ll/s3s0;)Ll/y2t0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s3s0;->h:Ll/y2t0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic p(Ll/s3s0;Ll/y2t0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/s3s0;->h:Ll/y2t0;

    .line 2
    .line 3
    return-void
.end method

.method public static bridge synthetic q(Landroid/content/Context;Ljava/lang/String;)V
    .locals 6

    .line 1
    new-instance v4, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "action"

    .line 7
    .line 8
    const-string v1, "no_ads_fallback"

    .line 9
    .line 10
    invoke-virtual {v4, v0, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const-string v0, "flow"

    .line 14
    .line 15
    invoke-virtual {v4, v0, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ll/k6s0;->b()Ll/obt0;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {}, Ll/k6s0;->c()Lcom/google/android/gms/internal/ads/zzcei;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget-object v2, p1, Lcom/google/android/gms/internal/ads/zzcei;->zza:Ljava/lang/String;

    .line 27
    .line 28
    const-string v3, "gmob-apps"

    .line 29
    .line 30
    const/4 v5, 0x1

    .line 31
    move-object v1, p0

    .line 32
    invoke-virtual/range {v0 .. v5}, Ll/obt0;->p(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Z)V

    .line 33
    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public final c(Landroid/content/Context;Ljava/lang/String;Ll/uws0;)Ll/ats0;
    .locals 1

    .line 1
    new-instance v0, Ll/vtr0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Ll/vtr0;-><init>(Ll/s3s0;Landroid/content/Context;Ljava/lang/String;Ll/uws0;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-virtual {v0, p1, p0}, Ll/z4s0;->d(Landroid/content/Context;Z)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ll/ats0;

    .line 12
    .line 13
    return-object p0
.end method

.method public final d(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/zzq;Ljava/lang/String;Ll/uws0;)Ll/oys0;
    .locals 6

    .line 1
    new-instance v0, Ll/gor0;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v2, p1

    .line 5
    move-object v3, p2

    .line 6
    move-object v4, p3

    .line 7
    move-object v5, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Ll/gor0;-><init>(Ll/s3s0;Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/zzq;Ljava/lang/String;Ll/uws0;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    invoke-virtual {v0, v2, p0}, Ll/z4s0;->d(Landroid/content/Context;Z)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ll/oys0;

    .line 17
    .line 18
    return-object p0
.end method

.method public final e(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/zzq;Ljava/lang/String;Ll/uws0;)Ll/oys0;
    .locals 6

    .line 1
    new-instance v0, Ll/zqr0;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v2, p1

    .line 5
    move-object v3, p2

    .line 6
    move-object v4, p3

    .line 7
    move-object v5, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Ll/zqr0;-><init>(Ll/s3s0;Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/zzq;Ljava/lang/String;Ll/uws0;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    invoke-virtual {v0, v2, p0}, Ll/z4s0;->d(Landroid/content/Context;Z)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ll/oys0;

    .line 17
    .line 18
    return-object p0
.end method

.method public final f(Landroid/content/Context;Ll/uws0;)Ll/tgu0;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    new-instance v0, Ll/udr0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/udr0;-><init>(Ll/s3s0;Landroid/content/Context;Ll/uws0;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-virtual {v0, p1, p0}, Ll/z4s0;->d(Landroid/content/Context;Z)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ll/tgu0;

    .line 12
    .line 13
    return-object p0
.end method

.method public final h(Landroid/content/Context;Landroid/widget/FrameLayout;Landroid/widget/FrameLayout;)Ll/els0;
    .locals 1

    .line 1
    new-instance v0, Ll/azr0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2, p3, p1}, Ll/azr0;-><init>(Ll/s3s0;Landroid/widget/FrameLayout;Landroid/widget/FrameLayout;Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-virtual {v0, p1, p0}, Ll/z4s0;->d(Landroid/content/Context;Z)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ll/els0;

    .line 12
    .line 13
    return-object p0
.end method

.method public final j(Landroid/content/Context;Ll/uws0;)Ll/k1t0;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    new-instance v0, Ll/kjr0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/kjr0;-><init>(Ll/s3s0;Landroid/content/Context;Ll/uws0;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-virtual {v0, p1, p0}, Ll/z4s0;->d(Landroid/content/Context;Z)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ll/k1t0;

    .line 12
    .line 13
    return-object p0
.end method

.method public final l(Landroid/app/Activity;)Ll/r1t0;
    .locals 4
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    new-instance v0, Ll/abr0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/abr0;-><init>(Ll/s3s0;Landroid/app/Activity;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const-string v1, "com.google.android.gms.ads.internal.overlay.useClientJar"

    .line 11
    .line 12
    invoke-virtual {p0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    const/4 v3, 0x0

    .line 17
    if-nez v2, :cond_0

    .line 18
    .line 19
    const-string p0, "useClientJar flag not found in activity intent extras."

    .line 20
    .line 21
    invoke-static {p0}, Ll/dct0;->d(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-virtual {p0, v1, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    :goto_0
    invoke-virtual {v0, p1, v3}, Ll/z4s0;->d(Landroid/content/Context;Z)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Ll/r1t0;

    .line 34
    .line 35
    return-object p0
.end method

.method public final n(Landroid/content/Context;Ljava/lang/String;Ll/uws0;)Ll/l7t0;
    .locals 1

    .line 1
    new-instance v0, Ll/m2s0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Ll/m2s0;-><init>(Ll/s3s0;Landroid/content/Context;Ljava/lang/String;Ll/uws0;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-virtual {v0, p1, p0}, Ll/z4s0;->d(Landroid/content/Context;Z)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ll/l7t0;

    .line 12
    .line 13
    return-object p0
.end method

.method public final o(Landroid/content/Context;Ll/uws0;)Ll/eat0;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    new-instance v0, Ll/rgr0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/rgr0;-><init>(Ll/s3s0;Landroid/content/Context;Ll/uws0;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-virtual {v0, p1, p0}, Ll/z4s0;->d(Landroid/content/Context;Z)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ll/eat0;

    .line 12
    .line 13
    return-object p0
.end method
