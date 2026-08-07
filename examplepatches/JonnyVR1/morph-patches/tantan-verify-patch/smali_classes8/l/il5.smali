.class public Ll/il5;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/jl5;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;

.field public b:Ll/z5y;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z5y<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public c:I

.field public d:Z

.field public e:I


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    check-cast p1, Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;

    .line 5
    .line 6
    iput-object p1, p0, Ll/il5;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e0(Ll/il5;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/il5;->j0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic f0(Ll/il5;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/il5;->k0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic g0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic h0(Ll/il5;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/il5;->l0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method private synthetic j0(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/jl5;

    .line 4
    .line 5
    iget-object v0, p0, Ll/il5;->b:Ll/z5y;

    .line 6
    .line 7
    invoke-interface {v0}, Ll/z5y;->source()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1, v0}, Ll/jl5;->j(Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast p1, Ll/jl5;

    .line 17
    .line 18
    iget p0, p0, Ll/il5;->c:I

    .line 19
    .line 20
    invoke-virtual {p1, p0}, Ll/jl5;->c(I)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private synthetic k0(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/ui/PlayerView;->A:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Ll/pb1;->e(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast p0, Ll/jl5;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/jl5;->k()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private synthetic l0(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-eq p1, v0, :cond_2

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 6
    .line 7
    if-eq p1, v0, :cond_2

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 10
    .line 11
    if-eq p1, v0, :cond_2

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/android/app/c;->o:Lcom/p1/mobile/android/app/c;

    .line 14
    .line 15
    if-ne p1, v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p0}, Ll/il5;->i0()Lcom/p1/mobile/putong/data/Media;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/il5;->i0()Lcom/p1/mobile/putong/data/Media;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 29
    .line 30
    const-string p1, "video/mp4"

    .line 31
    .line 32
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_1

    .line 37
    .line 38
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-interface {p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Zo()Ll/nam;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const/4 p1, 0x1

    .line 47
    invoke-interface {p0, p1}, Ll/nam;->f(Z)V

    .line 48
    .line 49
    .line 50
    :cond_1
    return-void

    .line 51
    :cond_2
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-interface {p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Zo()Ll/nam;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const/4 p1, 0x0

    .line 60
    invoke-interface {p0, p1}, Ll/nam;->f(Z)V

    .line 61
    .line 62
    .line 63
    return-void
.end method


# virtual methods
.method public Z()V
    .locals 5

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/il5;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "user_id"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Ll/il5;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;

    .line 17
    .line 18
    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const-string v2, "source_type"

    .line 23
    .line 24
    const/4 v3, -0x1

    .line 25
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    iput v1, p0, Ll/il5;->e:I

    .line 30
    .line 31
    iget-object v1, p0, Ll/il5;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;

    .line 32
    .line 33
    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const-string v2, "current_data"

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    iget-object v2, p0, Ll/il5;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/CommonMediaPreviewAct;

    .line 44
    .line 45
    invoke-virtual {v2}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    const-string v4, "all_data"

    .line 50
    .line 51
    invoke-virtual {v2, v4}, Landroid/content/Intent;->getStringArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    iget v4, p0, Ll/il5;->e:I

    .line 56
    .line 57
    if-eq v4, v3, :cond_2

    .line 58
    .line 59
    if-eqz v4, :cond_1

    .line 60
    .line 61
    const/4 v2, 0x1

    .line 62
    if-eq v4, v2, :cond_0

    .line 63
    .line 64
    const/4 v2, 0x2

    .line 65
    if-eq v4, v2, :cond_1

    .line 66
    .line 67
    const/4 v2, 0x3

    .line 68
    if-eq v4, v2, :cond_0

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_0
    new-instance v2, Ll/su90;

    .line 72
    .line 73
    invoke-direct {v2, v0, v4}, Ll/su90;-><init>(Ljava/lang/String;I)V

    .line 74
    .line 75
    .line 76
    iput-object v2, p0, Ll/il5;->b:Ll/z5y;

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_1
    new-instance v2, Ll/zxa0;

    .line 80
    .line 81
    invoke-direct {v2, v0, v4}, Ll/zxa0;-><init>(Ljava/lang/String;I)V

    .line 82
    .line 83
    .line 84
    iput-object v2, p0, Ll/il5;->b:Ll/z5y;

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_2
    new-instance v0, Ll/gqd;

    .line 88
    .line 89
    invoke-direct {v0, v2}, Ll/gqd;-><init>(Ljava/util/List;)V

    .line 90
    .line 91
    .line 92
    iput-object v0, p0, Ll/il5;->b:Ll/z5y;

    .line 93
    .line 94
    :goto_0
    iget-object v0, p0, Ll/il5;->b:Ll/z5y;

    .line 95
    .line 96
    invoke-interface {v0, v1}, Ll/z5y;->a(Ljava/lang/String;)I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    iput v0, p0, Ll/il5;->c:I

    .line 101
    .line 102
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/el5;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/el5;-><init>(Ll/il5;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/fl5;

    .line 17
    .line 18
    invoke-direct {v1}, Ll/fl5;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/gl5;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/gl5;-><init>(Ll/il5;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/hl5;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/hl5;-><init>(Ll/il5;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/ui/PlayerView;->A:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/pb1;->e(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public i0()Lcom/p1/mobile/putong/data/Media;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/il5;->b:Ll/z5y;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/z5y;->source()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/il5;->b:Ll/z5y;

    .line 14
    .line 15
    invoke-interface {v0}, Ll/z5y;->source()Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget p0, p0, Ll/il5;->c:I

    .line 20
    .line 21
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return-object p0
.end method

.method public m0()Ll/z5y;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/z5y<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/il5;->b:Ll/z5y;

    .line 2
    .line 3
    return-object p0
.end method
