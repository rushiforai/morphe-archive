.class public final Ll/leg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/klg0;


# instance fields
.field public a:Ll/ukg0;

.field public final synthetic b:Ll/thg0;


# direct methods
.method public constructor <init>(Ll/thg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/leg0;->b:Ll/thg0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 3

    .line 1
    const-string v0, "SudGameLoadingStageLoadPackage"

    .line 2
    .line 3
    const-string v1, "PackageDownloadListener.onDownloadStart"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/thg0;->j:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/leg0;->b:Ll/thg0;

    .line 14
    .line 15
    iget-boolean v1, v0, Ll/thg0;->f:Z

    .line 16
    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    iget-object v1, v0, Ll/thg0;->c:Ll/mrg0;

    .line 20
    .line 21
    iget-object v0, v0, Ll/thg0;->a:Landroid/content/Context;

    .line 22
    .line 23
    sget v2, Ltech/sud/gip/R$string;->fsm_mgp_game_loading_stage_loadPackage_game_package_download_start:I

    .line 24
    .line 25
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v1, v0}, Ll/mrg0;->c(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    new-instance v0, Ll/ukg0;

    .line 33
    .line 34
    const-string v1, "checkoutGamePkg"

    .line 35
    .line 36
    invoke-direct {v0, v1}, Ll/ukg0;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Ll/leg0;->a:Ll/ukg0;

    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public final b(Ljava/lang/String;Ll/bxg0;)V
    .locals 3

    .line 1
    sget-object v0, Ll/thg0;->j:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "PackageDownloadListener.onSuccess"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/leg0;->b:Ll/thg0;

    .line 9
    .line 10
    iget-boolean v1, v0, Ll/thg0;->f:Z

    .line 11
    .line 12
    if-nez v1, :cond_3

    .line 13
    .line 14
    iget-object v1, v0, Ll/thg0;->c:Ll/mrg0;

    .line 15
    .line 16
    iget-object v0, v0, Ll/thg0;->a:Landroid/content/Context;

    .line 17
    .line 18
    sget v2, Ltech/sud/gip/R$string;->fsm_mgp_game_loading_stage_loadPackage_game_package_download_finish:I

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v1, v0}, Ll/mrg0;->c(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/leg0;->b:Ll/thg0;

    .line 28
    .line 29
    iget-object v1, v0, Ll/thg0;->b:Ltech/sud/gip/core/GameInfo;

    .line 30
    .line 31
    iput-object p1, v1, Ltech/sud/gip/core/GameInfo;->gamePath:Ljava/lang/String;

    .line 32
    .line 33
    iget p1, v1, Ltech/sud/gip/core/GameInfo;->engine:I

    .line 34
    .line 35
    iget-object v1, v0, Ll/thg0;->d:Ll/cmg0;

    .line 36
    .line 37
    iget-object v0, v0, Ll/thg0;->i:Ll/tgg0;

    .line 38
    .line 39
    const/4 v2, 0x1

    .line 40
    if-ne v2, p1, :cond_0

    .line 41
    .line 42
    iget-object p1, v1, Ll/cmg0;->a:Ll/nsg0;

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Ll/vog0;->i(Ll/lsg0;)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    const/4 v2, 0x5

    .line 49
    if-ne v2, p1, :cond_1

    .line 50
    .line 51
    iget-object p1, v1, Ll/cmg0;->b:Ll/osg0;

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Ll/vog0;->i(Ll/lsg0;)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 58
    .line 59
    .line 60
    :goto_0
    iget-object p1, p0, Ll/leg0;->a:Ll/ukg0;

    .line 61
    .line 62
    if-eqz p1, :cond_3

    .line 63
    .line 64
    iget-object v0, p0, Ll/leg0;->b:Ll/thg0;

    .line 65
    .line 66
    iget-object v0, v0, Ll/thg0;->b:Ltech/sud/gip/core/GameInfo;

    .line 67
    .line 68
    if-eqz v0, :cond_2

    .line 69
    .line 70
    iget v0, v0, Ltech/sud/gip/core/GameInfo;->engine:I

    .line 71
    .line 72
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iget-object p1, p1, Ll/ukg0;->j:Ljava/util/HashMap;

    .line 77
    .line 78
    const-string v1, "engine"

    .line 79
    .line 80
    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    :cond_2
    iget-object p1, p0, Ll/leg0;->a:Ll/ukg0;

    .line 84
    .line 85
    const/4 v0, 0x2

    .line 86
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iget-object p1, p1, Ll/ukg0;->j:Ljava/util/HashMap;

    .line 91
    .line 92
    const-string v1, "package_type"

    .line 93
    .line 94
    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    iget-object p1, p0, Ll/leg0;->a:Ll/ukg0;

    .line 98
    .line 99
    const/4 v0, 0x0

    .line 100
    iput v0, p1, Ll/ukg0;->e:I

    .line 101
    .line 102
    const-string v1, "success"

    .line 103
    .line 104
    iput-object v1, p1, Ll/ukg0;->f:Ljava/lang/String;

    .line 105
    .line 106
    iget-object v1, p0, Ll/leg0;->b:Ll/thg0;

    .line 107
    .line 108
    iget-wide v1, v1, Ll/thg0;->g:J

    .line 109
    .line 110
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    iput-object v1, p1, Ll/ukg0;->g:Ljava/lang/String;

    .line 115
    .line 116
    iget-object p0, p0, Ll/leg0;->a:Ll/ukg0;

    .line 117
    .line 118
    iput-object p2, p0, Ll/ukg0;->n:Ll/bxg0;

    .line 119
    .line 120
    sget-object p1, Ll/fug0;->a:Ljava/lang/String;

    .line 121
    .line 122
    iget-object p1, p0, Ll/ukg0;->a:Ljava/lang/String;

    .line 123
    .line 124
    iget p2, p0, Ll/ukg0;->e:I

    .line 125
    .line 126
    invoke-virtual {p0}, Ll/ukg0;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    new-instance v1, Ll/nog0;

    .line 131
    .line 132
    invoke-direct {v1, p0, v0, p1, p2}, Ll/nog0;-><init>(Ljava/lang/String;ZLjava/lang/String;I)V

    .line 133
    .line 134
    .line 135
    invoke-static {v1}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 136
    .line 137
    .line 138
    :cond_3
    return-void
.end method

.method public final c(JJLtech/sud/gip/core/PkgDownloadStatus;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final d(JJ)V
    .locals 7

    .line 1
    sget-object v0, Ll/thg0;->j:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "PackageDownloadListener.onDownloadProgress "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, "/"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/leg0;->b:Ll/thg0;

    .line 29
    .line 30
    iget-boolean v0, p0, Ll/thg0;->f:Z

    .line 31
    .line 32
    if-nez v0, :cond_0

    .line 33
    .line 34
    iget-object p0, p0, Ll/thg0;->c:Ll/mrg0;

    .line 35
    .line 36
    iget-object p0, p0, Ll/mrg0;->a:Ll/gug0;

    .line 37
    .line 38
    iget-object v0, p0, Ll/gug0;->h:Ll/bgg0;

    .line 39
    .line 40
    if-eqz v0, :cond_0

    .line 41
    .line 42
    long-to-float p0, p1

    .line 43
    const/high16 v1, 0x3f800000    # 1.0f

    .line 44
    .line 45
    mul-float/2addr p0, v1

    .line 46
    const/high16 v2, 0x44800000    # 1024.0f

    .line 47
    .line 48
    div-float/2addr p0, v2

    .line 49
    long-to-float v3, p3

    .line 50
    mul-float/2addr v3, v1

    .line 51
    div-float/2addr v3, v2

    .line 52
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 53
    .line 54
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    filled-new-array {p0, v2}, [Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    const-string v2, "%.2fKB/%.2fKB"

    .line 67
    .line 68
    invoke-static {v1, v2, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    iget-object v1, v0, Ll/bgg0;->e:Landroid/content/Context;

    .line 73
    .line 74
    sget v2, Ltech/sud/gip/R$string;->fsm_mgp_game_loading_view_download_update_progress:I

    .line 75
    .line 76
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    iget-object v2, v0, Ll/wmg0;->b:Ljava/lang/String;

    .line 81
    .line 82
    filled-new-array {v2, p0}, [Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    iget-object v1, v0, Ll/bgg0;->k:Landroid/widget/TextView;

    .line 91
    .line 92
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 93
    .line 94
    .line 95
    const/16 v5, 0x28

    .line 96
    .line 97
    const/16 v6, 0x50

    .line 98
    .line 99
    move-wide v1, p1

    .line 100
    move-wide v3, p3

    .line 101
    invoke-virtual/range {v0 .. v6}, Ll/bgg0;->d(JJII)V

    .line 102
    .line 103
    .line 104
    :cond_0
    return-void
.end method

.method public final e(ILjava/lang/String;Ll/bxg0;)V
    .locals 3

    .line 1
    sget-object v0, Ll/thg0;->j:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "PackageDownloadListener.onFailure:"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/leg0;->b:Ll/thg0;

    .line 21
    .line 22
    iget-boolean v1, v0, Ll/thg0;->f:Z

    .line 23
    .line 24
    if-nez v1, :cond_2

    .line 25
    .line 26
    iget-object v1, v0, Ll/thg0;->c:Ll/mrg0;

    .line 27
    .line 28
    iget-object v0, v0, Ll/thg0;->a:Landroid/content/Context;

    .line 29
    .line 30
    sget v2, Ltech/sud/gip/R$string;->fsm_mgp_game_loading_stage_loadPackage_game_package_download_fail:I

    .line 31
    .line 32
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v1, v0}, Ll/mrg0;->c(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/leg0;->b:Ll/thg0;

    .line 40
    .line 41
    iget-object v0, v0, Ll/thg0;->c:Ll/mrg0;

    .line 42
    .line 43
    const/4 v1, 0x3

    .line 44
    invoke-virtual {v0, v1, p1, p2}, Ll/mrg0;->b(IILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/leg0;->a:Ll/ukg0;

    .line 48
    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    iget-object v1, p0, Ll/leg0;->b:Ll/thg0;

    .line 52
    .line 53
    iget-object v1, v1, Ll/thg0;->b:Ltech/sud/gip/core/GameInfo;

    .line 54
    .line 55
    if-eqz v1, :cond_0

    .line 56
    .line 57
    iget v1, v1, Ltech/sud/gip/core/GameInfo;->engine:I

    .line 58
    .line 59
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    iget-object v0, v0, Ll/ukg0;->j:Ljava/util/HashMap;

    .line 64
    .line 65
    const-string v2, "engine"

    .line 66
    .line 67
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    :cond_0
    iget-object v0, p0, Ll/leg0;->a:Ll/ukg0;

    .line 71
    .line 72
    const/4 v1, 0x2

    .line 73
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    iget-object v0, v0, Ll/ukg0;->j:Ljava/util/HashMap;

    .line 78
    .line 79
    const-string v2, "package_type"

    .line 80
    .line 81
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Ll/leg0;->a:Ll/ukg0;

    .line 85
    .line 86
    iput p1, v0, Ll/ukg0;->e:I

    .line 87
    .line 88
    if-eqz p2, :cond_1

    .line 89
    .line 90
    iput-object p2, v0, Ll/ukg0;->f:Ljava/lang/String;

    .line 91
    .line 92
    :cond_1
    iget-object p1, p0, Ll/leg0;->b:Ll/thg0;

    .line 93
    .line 94
    iget-wide p1, p1, Ll/thg0;->g:J

    .line 95
    .line 96
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    iput-object p1, v0, Ll/ukg0;->g:Ljava/lang/String;

    .line 101
    .line 102
    iget-object p0, p0, Ll/leg0;->a:Ll/ukg0;

    .line 103
    .line 104
    iput-object p3, p0, Ll/ukg0;->n:Ll/bxg0;

    .line 105
    .line 106
    sget-object p1, Ll/fug0;->a:Ljava/lang/String;

    .line 107
    .line 108
    iget-object p1, p0, Ll/ukg0;->a:Ljava/lang/String;

    .line 109
    .line 110
    iget p2, p0, Ll/ukg0;->e:I

    .line 111
    .line 112
    invoke-virtual {p0}, Ll/ukg0;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    new-instance p3, Ll/nog0;

    .line 117
    .line 118
    const/4 v0, 0x0

    .line 119
    invoke-direct {p3, p0, v0, p1, p2}, Ll/nog0;-><init>(Ljava/lang/String;ZLjava/lang/String;I)V

    .line 120
    .line 121
    .line 122
    invoke-static {p3}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 123
    .line 124
    .line 125
    :cond_2
    return-void
.end method
