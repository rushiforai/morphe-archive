.class public Lcom/tantanapp/media/ttmediamncertification/impl/DummyActivity;
.super Landroid/app/Activity;
.source "SourceFile"


# instance fields
.field public a:Ll/ltl$b;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ll/ltl$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/media/ttmediamncertification/impl/DummyActivity;->a:Ll/ltl$b;

    .line 2
    .line 3
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    new-instance p2, Ll/kxf;

    .line 5
    .line 6
    invoke-direct {p2}, Ll/kxf;-><init>()V

    .line 7
    .line 8
    .line 9
    const/16 v0, 0x2329

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    if-ne p1, v0, :cond_1

    .line 13
    .line 14
    invoke-static {}, Lcom/immomo/mncertification/MNFCService;->getInstance()Lcom/immomo/mncertification/MNFCService;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1, p3}, Lcom/immomo/mncertification/MNFCService;->fetchResult(Landroid/content/Intent;)Lcom/immomo/mncertification/resultbean/CertificationResult;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    iget p3, p1, Lcom/immomo/mncertification/resultbean/CertificationResult;->resultCode:I

    .line 25
    .line 26
    if-nez p3, :cond_0

    .line 27
    .line 28
    const/4 p3, 0x1

    .line 29
    iput-boolean p3, p2, Ll/kxf;->h:Z

    .line 30
    .line 31
    iget-object p3, p1, Lcom/immomo/mncertification/resultbean/CertificationResult;->personId:Ljava/lang/String;

    .line 32
    .line 33
    iput-object p3, p2, Ll/kxf;->o:Ljava/lang/String;

    .line 34
    .line 35
    iget p1, p1, Lcom/immomo/mncertification/resultbean/CertificationResult;->resultCode:I

    .line 36
    .line 37
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iput-object p1, p2, Ll/kxf;->b:Ljava/lang/String;

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    iput-boolean v1, p2, Ll/kxf;->h:Z

    .line 45
    .line 46
    iget p1, p1, Lcom/immomo/mncertification/resultbean/CertificationResult;->resultCode:I

    .line 47
    .line 48
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iput-object p1, p2, Ll/kxf;->b:Ljava/lang/String;

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    iput-boolean v1, p2, Ll/kxf;->h:Z

    .line 56
    .line 57
    const-string p1, "requestCode error"

    .line 58
    .line 59
    iput-object p1, p2, Ll/kxf;->b:Ljava/lang/String;

    .line 60
    .line 61
    :goto_0
    iget-object p1, p0, Lcom/tantanapp/media/ttmediamncertification/impl/DummyActivity;->a:Ll/ltl$b;

    .line 62
    .line 63
    if-eqz p1, :cond_2

    .line 64
    .line 65
    invoke-interface {p1, p2}, Ll/ltl$b;->a(Ll/kxf;)V

    .line 66
    .line 67
    .line 68
    :cond_2
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const-string v0, "option-key-mode"

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const v2, 0x1e724ffc

    .line 19
    .line 20
    .line 21
    const/16 v3, 0x2329

    .line 22
    .line 23
    if-eq v1, v2, :cond_1

    .line 24
    .line 25
    const p1, 0x6851bedb

    .line 26
    .line 27
    .line 28
    if-eq v1, p1, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const-string p1, "VERIFY_SILENT"

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_2

    .line 38
    .line 39
    invoke-static {}, Lcom/immomo/mncertification/MNFCService;->getInstance()Lcom/immomo/mncertification/MNFCService;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1, p0, v3}, Lcom/immomo/mncertification/MNFCService;->startSilentCertification(Landroid/app/Activity;I)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :catch_0
    move-exception p1

    .line 48
    goto :goto_1

    .line 49
    :cond_1
    const-string v1, "VERIFY_INTERACTIVE"

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_2

    .line 56
    .line 57
    new-instance v0, Lcom/immomo/mncertification/MNFCService$Config;

    .line 58
    .line 59
    invoke-direct {v0}, Lcom/immomo/mncertification/MNFCService$Config;-><init>()V

    .line 60
    .line 61
    .line 62
    const-string v1, "option-key-action-count"

    .line 63
    .line 64
    const/4 v2, 0x4

    .line 65
    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    const-string v2, "option-key-page-title"

    .line 70
    .line 71
    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    iput v1, v0, Lcom/immomo/mncertification/MNFCService$Config;->actionCount:I

    .line 76
    .line 77
    iput-object p1, v0, Lcom/immomo/mncertification/MNFCService$Config;->title:Ljava/lang/String;

    .line 78
    .line 79
    invoke-static {}, Lcom/immomo/mncertification/MNFCService;->getInstance()Lcom/immomo/mncertification/MNFCService;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {p1, p0, v3, v0}, Lcom/immomo/mncertification/MNFCService;->startInteractiveCertification(Landroid/app/Activity;ILcom/immomo/mncertification/MNFCService$Config;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_2
    :goto_0
    invoke-static {}, Lcom/immomo/mncertification/MNFCService;->getInstance()Lcom/immomo/mncertification/MNFCService;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-virtual {p1, p0, v3}, Lcom/immomo/mncertification/MNFCService;->startSilentCertification(Landroid/app/Activity;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :goto_1
    new-instance v0, Ll/kxf;

    .line 96
    .line 97
    invoke-direct {v0}, Ll/kxf;-><init>()V

    .line 98
    .line 99
    .line 100
    const/4 v1, 0x0

    .line 101
    iput-boolean v1, v0, Ll/kxf;->h:Z

    .line 102
    .line 103
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    iput-object p1, v0, Ll/kxf;->d:Ljava/lang/String;

    .line 108
    .line 109
    iget-object p1, p0, Lcom/tantanapp/media/ttmediamncertification/impl/DummyActivity;->a:Ll/ltl$b;

    .line 110
    .line 111
    if-eqz p1, :cond_3

    .line 112
    .line 113
    invoke-interface {p1, v0}, Ll/ltl$b;->a(Ll/kxf;)V

    .line 114
    .line 115
    .line 116
    :cond_3
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 117
    .line 118
    .line 119
    return-void
.end method
