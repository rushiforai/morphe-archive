.class public Lcom/p1/mobile/putong/core/ui/report/d;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Lcom/p1/mobile/putong/core/ui/report/e;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Lcom/p1/mobile/android/app/Frag;

.field public c:Lcom/p1/mobile/putong/core/ui/report/ReportDescriptionFrag$a;

.field public d:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

.field public e:Ljava/lang/String;

.field public f:Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/report/ReportDescriptionFrag;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/report/d;->a:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/report/d;->b:Lcom/p1/mobile/android/app/Frag;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic e0(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture;
    .locals 0

    .line 1
    check-cast p0, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f0(Ljava/util/List;)Lrx/c;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    const-string v1, "report"

    .line 3
    .line 4
    invoke-static {v1}, Lcom/p1/mobile/putong/data/UploadSource;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UploadSource;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    invoke-static {p0, v1, v0, v2}, Ll/yb5;->K(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/UploadSource;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic g0(Lcom/p1/mobile/putong/core/ui/report/d;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/report/d;->n0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/core/ui/report/d;Lcom/p1/mobile/putong/data/Report;Ljava/util/List;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/report/d;->l0(Lcom/p1/mobile/putong/data/Report;Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/core/ui/report/d;Ljava/lang/String;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/report/d;->m0(Ljava/lang/String;Ll/uxj0;)V

    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/report/d;->c:Lcom/p1/mobile/putong/core/ui/report/ReportDescriptionFrag$a;

    .line 3
    .line 4
    return-void
.end method

.method public j0(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/report/d;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ge p1, v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/report/d;->a:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public k0(Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/report/ReportCategory;ZLcom/p1/mobile/putong/core/ui/report/ReportDescriptionFrag$a;Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/report/d;->e:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/report/d;->d:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 4
    .line 5
    iput-object p4, p0, Lcom/p1/mobile/putong/core/ui/report/d;->c:Lcom/p1/mobile/putong/core/ui/report/ReportDescriptionFrag$a;

    .line 6
    .line 7
    iput-object p5, p0, Lcom/p1/mobile/putong/core/ui/report/d;->f:Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;

    .line 8
    .line 9
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p0, Lcom/p1/mobile/putong/core/ui/report/e;

    .line 12
    .line 13
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->isCategorised()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->isGP()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    if-eqz p3, :cond_1

    .line 26
    .line 27
    :cond_0
    const/4 p1, 0x1

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const/4 p1, 0x0

    .line 30
    :goto_0
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/ui/report/e;->l(Lcom/p1/mobile/putong/core/ui/report/ReportCategory;Z)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic l0(Lcom/p1/mobile/putong/data/Report;Ljava/util/List;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/z0d0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/z0d0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p2, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    iput-object p2, p1, Lcom/p1/mobile/putong/data/Report;->pictures:Ljava/util/List;

    .line 11
    .line 12
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/report/d;->e:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p2, p0, p1}, Ll/dkb;->ha(Ljava/lang/String;Lcom/p1/mobile/putong/data/Report;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public final synthetic m0(Ljava/lang/String;Ll/uxj0;)V
    .locals 2

    .line 1
    new-instance p2, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "User reported {UID}"

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/report/d;->e:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/report/d;->d:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const-string v1, "Reason"

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p2, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    :cond_0
    sget-object v0, Ll/x95;->INSTANCE:Ll/x95;

    .line 27
    .line 28
    const-string v1, "Report User"

    .line 29
    .line 30
    invoke-virtual {v0, v1, p2}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 38
    .line 39
    .line 40
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/report/d;->c:Lcom/p1/mobile/putong/core/ui/report/ReportDescriptionFrag$a;

    .line 41
    .line 42
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    if-eqz p2, :cond_1

    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/report/d;->c:Lcom/p1/mobile/putong/core/ui/report/ReportDescriptionFrag$a;

    .line 49
    .line 50
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/ui/report/ReportDescriptionFrag$a;->Z(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    invoke-static {}, Ll/gra;->t1()Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    if-nez p0, :cond_2

    .line 58
    .line 59
    sget p0, Lcom/p1/mobile/putong/core/R$string;->zm:I

    .line 60
    .line 61
    sget p1, Lcom/p1/mobile/putong/core/R$string;->om:I

    .line 62
    .line 63
    invoke-static {p0, p1}, Ll/lu6;->b(II)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    :cond_2
    return-void
.end method

.method public final synthetic n0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public o0(IILandroid/content/Intent;)V
    .locals 0

    .line 1
    const/4 p1, -0x1

    .line 2
    if-ne p2, p1, :cond_0

    .line 3
    .line 4
    sget-object p1, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->h:Ljava/lang/String;

    .line 5
    .line 6
    invoke-virtual {p3, p1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Ljava/util/List;

    .line 11
    .line 12
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/report/d;->a:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p2, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast p0, Lcom/p1/mobile/putong/core/ui/report/e;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/report/e;->e(Ljava/util/List;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public p0()V
    .locals 11

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/report/f;->b()Lcom/p1/mobile/putong/core/ui/report/f;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "receive_report_user_id"

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/report/f;->k()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast v1, Lcom/p1/mobile/putong/core/ui/report/e;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/report/e;->m()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    const-string v1, "0"

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const-string v1, "1"

    .line 33
    .line 34
    :goto_0
    const-string v2, "report_mark"

    .line 35
    .line 36
    invoke-static {v2, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    const-string v1, "report_match_type"

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/report/f;->i()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/report/d;->a:Ljava/util/List;

    .line 51
    .line 52
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    const-string v2, "report_picture_number"

    .line 57
    .line 58
    invoke-static {v2, v1}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 59
    .line 60
    .line 61
    move-result-object v6

    .line 62
    const-string v1, "report_pre_id"

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/report/d;->r0()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-static {v1, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 69
    .line 70
    .line 71
    move-result-object v7

    .line 72
    const-string p0, "report_source_new"

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/report/f;->j()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-static {p0, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 79
    .line 80
    .line 81
    move-result-object v8

    .line 82
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    const-string v0, "reporter_user_id"

    .line 91
    .line 92
    invoke-static {v0, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 93
    .line 94
    .line 95
    move-result-object v9

    .line 96
    const-string p0, "report_submit_view_detail"

    .line 97
    .line 98
    const-string v0, "back"

    .line 99
    .line 100
    invoke-static {p0, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 101
    .line 102
    .line 103
    move-result-object v10

    .line 104
    filled-new-array/range {v3 .. v10}, [Ll/sfj0$a;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    const-string v0, "e_report_submit"

    .line 109
    .line 110
    const-string v1, "p_report_submit_view"

    .line 111
    .line 112
    invoke-static {v0, v1, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method public q0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/report/d;->b:Lcom/p1/mobile/android/app/Frag;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/report/d;->a:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    rsub-int/lit8 p0, p0, 0x8

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-static {v1, p0, v2, v2, v2}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->d2(Landroid/content/Context;IZZZ)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {v0, p0, v2}, Landroidx/fragment/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final r0()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/report/f;->b()Lcom/p1/mobile/putong/core/ui/report/f;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/report/f;->k()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-static {}, Ll/pzi0;->o()J

    .line 29
    .line 30
    .line 31
    move-result-wide v0

    .line 32
    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    shr-int/lit8 v0, p0, 0x10

    .line 44
    .line 45
    const v1, 0xffff

    .line 46
    .line 47
    .line 48
    and-int/2addr p0, v1

    .line 49
    add-int/2addr v0, p0

    .line 50
    new-instance p0, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string v1, "-"

    .line 67
    .line 68
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    return-object p0
.end method

.method public s0(Ljava/lang/String;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    sget v2, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 8
    .line 9
    const/4 v3, 0x1

    .line 10
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 11
    .line 12
    .line 13
    new-instance v1, Lcom/p1/mobile/putong/data/Report;

    .line 14
    .line 15
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/Report;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/report/d;->r0()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Report;->requestId:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/report/d;->d:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 29
    .line 30
    iget v3, v3, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->resId:I

    .line 31
    .line 32
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    sget-object v3, Lcom/p1/mobile/putong/data/Report;->CATEGORY_DEFAULT:Ljava/lang/String;

    .line 37
    .line 38
    iput-object v3, v1, Lcom/p1/mobile/putong/data/Report;->category:Ljava/lang/String;

    .line 39
    .line 40
    new-instance v3, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string v4, ":"

    .line 49
    .line 50
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    move-object/from16 v4, p1

    .line 54
    .line 55
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    iput-object v3, v1, Lcom/p1/mobile/putong/data/Report;->value:Ljava/lang/String;

    .line 63
    .line 64
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/report/d;->f:Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;

    .line 65
    .line 66
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    if-eqz v3, :cond_0

    .line 71
    .line 72
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/report/d;->f:Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;

    .line 73
    .line 74
    iget-object v3, v3, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;->reportFrom:Lcom/p1/mobile/putong/core/data/ReportFrom;

    .line 75
    .line 76
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    if-eqz v3, :cond_0

    .line 81
    .line 82
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/report/d;->f:Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;

    .line 83
    .line 84
    iget-object v3, v3, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;->reportTypeId:Ljava/lang/String;

    .line 85
    .line 86
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    if-nez v3, :cond_0

    .line 91
    .line 92
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/report/d;->f:Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;

    .line 93
    .line 94
    iget-object v3, v3, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;->reportFrom:Lcom/p1/mobile/putong/core/data/ReportFrom;

    .line 95
    .line 96
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/ReportFrom;->getFrom()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    iput-object v3, v1, Lcom/p1/mobile/putong/data/Report;->contentType:Ljava/lang/String;

    .line 101
    .line 102
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/report/d;->f:Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;

    .line 103
    .line 104
    iget-object v3, v3, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;->reportTypeId:Ljava/lang/String;

    .line 105
    .line 106
    iput-object v3, v1, Lcom/p1/mobile/putong/data/Report;->contentId:Ljava/lang/String;

    .line 107
    .line 108
    :cond_0
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/report/d;->f:Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;

    .line 109
    .line 110
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result v3

    .line 114
    if-eqz v3, :cond_1

    .line 115
    .line 116
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/report/d;->f:Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;

    .line 117
    .line 118
    iget-object v3, v3, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;->contentType:Ljava/lang/String;

    .line 119
    .line 120
    const-string v5, "profilelike"

    .line 121
    .line 122
    invoke-static {v5, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 123
    .line 124
    .line 125
    move-result v3

    .line 126
    if-eqz v3, :cond_1

    .line 127
    .line 128
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/report/d;->f:Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;

    .line 129
    .line 130
    iget-object v3, v3, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;->contentType:Ljava/lang/String;

    .line 131
    .line 132
    iput-object v3, v1, Lcom/p1/mobile/putong/data/Report;->contentType:Ljava/lang/String;

    .line 133
    .line 134
    new-instance v3, Ljava/util/ArrayList;

    .line 135
    .line 136
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 137
    .line 138
    .line 139
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/report/d;->f:Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;

    .line 140
    .line 141
    iget-object v5, v5, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;->profileCommentText:Ljava/lang/String;

    .line 142
    .line 143
    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    iput-object v3, v1, Lcom/p1/mobile/putong/data/Report;->chatMessages:Ljava/util/List;

    .line 147
    .line 148
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/report/f;->b()Lcom/p1/mobile/putong/core/ui/report/f;

    .line 149
    .line 150
    .line 151
    move-result-object v3

    .line 152
    const-string v5, "receive_report_user_id"

    .line 153
    .line 154
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/report/f;->k()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v6

    .line 158
    invoke-static {v5, v6}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 159
    .line 160
    .line 161
    move-result-object v7

    .line 162
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 163
    .line 164
    .line 165
    move-result v4

    .line 166
    const-string v5, "0"

    .line 167
    .line 168
    if-eqz v4, :cond_2

    .line 169
    .line 170
    move-object v4, v5

    .line 171
    goto :goto_0

    .line 172
    :cond_2
    const-string v4, "1"

    .line 173
    .line 174
    :goto_0
    const-string v6, "report_mark"

    .line 175
    .line 176
    invoke-static {v6, v4}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 177
    .line 178
    .line 179
    move-result-object v8

    .line 180
    const-string v4, "report_match_type"

    .line 181
    .line 182
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/report/f;->i()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v6

    .line 186
    invoke-static {v4, v6}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 187
    .line 188
    .line 189
    move-result-object v9

    .line 190
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/report/d;->a:Ljava/util/List;

    .line 191
    .line 192
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 193
    .line 194
    .line 195
    move-result v4

    .line 196
    const-string v6, "report_picture_number"

    .line 197
    .line 198
    invoke-static {v6, v4}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 199
    .line 200
    .line 201
    move-result-object v10

    .line 202
    const-string v4, "report_pre_id"

    .line 203
    .line 204
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/report/d;->r0()Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v6

    .line 208
    invoke-static {v4, v6}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 209
    .line 210
    .line 211
    move-result-object v11

    .line 212
    const-string v4, "report_source_new"

    .line 213
    .line 214
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/report/f;->j()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object v3

    .line 218
    invoke-static {v4, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 219
    .line 220
    .line 221
    move-result-object v12

    .line 222
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 223
    .line 224
    .line 225
    move-result-object v3

    .line 226
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object v3

    .line 230
    const-string v4, "reporter_user_id"

    .line 231
    .line 232
    invoke-static {v4, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 233
    .line 234
    .line 235
    move-result-object v13

    .line 236
    const-string v3, "report_submit_view_detail"

    .line 237
    .line 238
    const-string v4, "submit"

    .line 239
    .line 240
    invoke-static {v3, v4}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 241
    .line 242
    .line 243
    move-result-object v14

    .line 244
    const-string v3, "report_other_accounts"

    .line 245
    .line 246
    invoke-static {v3, v5}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 247
    .line 248
    .line 249
    move-result-object v15

    .line 250
    const-string v3, "report_chat"

    .line 251
    .line 252
    invoke-static {v3, v5}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 253
    .line 254
    .line 255
    move-result-object v16

    .line 256
    filled-new-array/range {v7 .. v16}, [Ll/sfj0$a;

    .line 257
    .line 258
    .line 259
    move-result-object v3

    .line 260
    const-string v4, "e_report_submit"

    .line 261
    .line 262
    const-string v5, "p_report_submit_view"

    .line 263
    .line 264
    invoke-static {v4, v5, v3}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 265
    .line 266
    .line 267
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/report/d;->a:Ljava/util/List;

    .line 268
    .line 269
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    .line 270
    .line 271
    .line 272
    move-result v3

    .line 273
    if-eqz v3, :cond_3

    .line 274
    .line 275
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 276
    .line 277
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 278
    .line 279
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/report/d;->e:Ljava/lang/String;

    .line 280
    .line 281
    invoke-virtual {v3, v4, v1}, Ll/dkb;->ha(Ljava/lang/String;Lcom/p1/mobile/putong/data/Report;)Lrx/c;

    .line 282
    .line 283
    .line 284
    move-result-object v1

    .line 285
    goto :goto_1

    .line 286
    :cond_3
    new-instance v3, Ll/i1y;

    .line 287
    .line 288
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/report/d;->a:Ljava/util/List;

    .line 289
    .line 290
    const/4 v5, 0x0

    .line 291
    invoke-direct {v3, v4, v5}, Ll/i1y;-><init>(Ljava/util/List;Z)V

    .line 292
    .line 293
    .line 294
    invoke-virtual {v3}, Lrx/c;->last()Lrx/c;

    .line 295
    .line 296
    .line 297
    move-result-object v3

    .line 298
    new-instance v4, Ll/v0d0;

    .line 299
    .line 300
    invoke-direct {v4}, Ll/v0d0;-><init>()V

    .line 301
    .line 302
    .line 303
    invoke-virtual {v3, v4}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 304
    .line 305
    .line 306
    move-result-object v3

    .line 307
    invoke-static {}, Ll/psd0;->Q()Lrx/c$d;

    .line 308
    .line 309
    .line 310
    move-result-object v4

    .line 311
    invoke-virtual {v3, v4}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 312
    .line 313
    .line 314
    move-result-object v3

    .line 315
    new-instance v4, Ll/w0d0;

    .line 316
    .line 317
    invoke-direct {v4, v0, v1}, Ll/w0d0;-><init>(Lcom/p1/mobile/putong/core/ui/report/d;Lcom/p1/mobile/putong/data/Report;)V

    .line 318
    .line 319
    .line 320
    invoke-virtual {v3, v4}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 321
    .line 322
    .line 323
    move-result-object v1

    .line 324
    :goto_1
    invoke-virtual {v0, v1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 325
    .line 326
    .line 327
    move-result-object v1

    .line 328
    new-instance v3, Ll/x0d0;

    .line 329
    .line 330
    invoke-direct {v3, v0, v2}, Ll/x0d0;-><init>(Lcom/p1/mobile/putong/core/ui/report/d;Ljava/lang/String;)V

    .line 331
    .line 332
    .line 333
    new-instance v2, Ll/y0d0;

    .line 334
    .line 335
    invoke-direct {v2, v0}, Ll/y0d0;-><init>(Lcom/p1/mobile/putong/core/ui/report/d;)V

    .line 336
    .line 337
    .line 338
    invoke-static {v3, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 339
    .line 340
    .line 341
    move-result-object v0

    .line 342
    invoke-virtual {v1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 343
    .line 344
    .line 345
    return-void
.end method
