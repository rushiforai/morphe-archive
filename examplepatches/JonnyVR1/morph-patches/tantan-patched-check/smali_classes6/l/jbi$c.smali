.class public Ll/jbi$c;
.super Ll/ie80$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/jbi;->e()Ll/ie80$c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/jbi;


# direct methods
.method public constructor <init>(Ll/jbi;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jbi$c;->a:Ll/jbi;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/ie80$c;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Exception;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/ie80$c;->a(Ljava/lang/Exception;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/jbi$c;->a:Ll/jbi;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-static {p1, v0}, Ll/jbi;->J0(Ll/jbi;Z)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/jbi$c;->a:Ll/jbi;

    .line 11
    .line 12
    invoke-static {p1}, Ll/jbi;->H0(Ll/jbi;)Ll/qai;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object p0, p0, Ll/jbi$c;->a:Ll/jbi;

    .line 17
    .line 18
    iget-object p0, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 21
    .line 22
    const/4 v0, 0x2

    .line 23
    invoke-virtual {p1, p0, v0}, Ll/qai;->a(Ljava/lang/String;I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public d()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ie80$c;->d()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/jbi$c;->a:Ll/jbi;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-static {v0, v1}, Ll/jbi;->F0(Ll/jbi;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/jbi$c;->a:Ll/jbi;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-static {v0, v1}, Ll/jbi;->J0(Ll/jbi;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/jbi$c;->a:Ll/jbi;

    .line 17
    .line 18
    invoke-static {v0}, Ll/jbi;->H0(Ll/jbi;)Ll/qai;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object p0, p0, Ll/jbi$c;->a:Ll/jbi;

    .line 23
    .line 24
    iget-object p0, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 27
    .line 28
    const/4 v1, 0x2

    .line 29
    invoke-virtual {v0, p0, v1}, Ll/qai;->a(Ljava/lang/String;I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public onComplete()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/ie80$c;->onComplete()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/jbi$c;->a:Ll/jbi;

    .line 5
    .line 6
    iget-object v0, v0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/jbi$c;->a:Ll/jbi;

    .line 15
    .line 16
    iget-object v0, v0, Ll/yqg;->C:Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Ll/jbi$c;->a:Ll/jbi;

    .line 25
    .line 26
    iget-object v1, v0, Ll/yqg;->H:Ll/ogh;

    .line 27
    .line 28
    iget-object v1, v1, Ll/ogh;->h:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v0, v0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 33
    .line 34
    const-string v2, "moment_id"

    .line 35
    .line 36
    invoke-static {v2, v0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v2, p0, Ll/jbi$c;->a:Ll/jbi;

    .line 41
    .line 42
    iget-object v2, v2, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 43
    .line 44
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 45
    .line 46
    const-string v3, "owner_id"

    .line 47
    .line 48
    invoke-static {v3, v2}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    filled-new-array {v0, v2}, [Ll/tfj0$a;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const-string v2, "e_video_play_over"

    .line 57
    .line 58
    invoke-static {v2, v1, v0}, Ll/tfj0;->f(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 59
    .line 60
    .line 61
    :cond_0
    invoke-static {}, Ll/cmg;->z0()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_1

    .line 66
    .line 67
    iget-object v0, p0, Ll/jbi$c;->a:Ll/jbi;

    .line 68
    .line 69
    invoke-static {v0}, Ll/jbi;->D0(Ll/jbi;)Ll/x20;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_1

    .line 78
    .line 79
    iget-object v0, p0, Ll/jbi$c;->a:Ll/jbi;

    .line 80
    .line 81
    iget-object v0, v0, Ll/yqg;->C:Lcom/p1/mobile/android/app/Act;

    .line 82
    .line 83
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    sget-object v1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 88
    .line 89
    if-ne v0, v1, :cond_1

    .line 90
    .line 91
    iget-object p0, p0, Ll/jbi$c;->a:Ll/jbi;

    .line 92
    .line 93
    invoke-static {p0}, Ll/jbi;->D0(Ll/jbi;)Ll/x20;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-interface {p0}, Ll/x20;->call()V

    .line 98
    .line 99
    .line 100
    :cond_1
    return-void
.end method

.method public onPause()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ie80$c;->onPause()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/jbi$c;->a:Ll/jbi;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {v0, v1}, Ll/jbi;->J0(Ll/jbi;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/jbi$c;->a:Ll/jbi;

    .line 11
    .line 12
    invoke-static {v0}, Ll/jbi;->H0(Ll/jbi;)Ll/qai;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object p0, p0, Ll/jbi$c;->a:Ll/jbi;

    .line 17
    .line 18
    iget-object p0, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-virtual {v0, p0, v1}, Ll/qai;->a(Ljava/lang/String;I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public onResume()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/ie80$c;->onResume()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/jbi$c;->a:Ll/jbi;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-static {v0, v1}, Ll/jbi;->J0(Ll/jbi;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/jbi$c;->a:Ll/jbi;

    .line 11
    .line 12
    invoke-static {v0}, Ll/jbi;->H0(Ll/jbi;)Ll/qai;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Ll/jbi$c;->a:Ll/jbi;

    .line 17
    .line 18
    iget-object v1, v1, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 19
    .line 20
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 21
    .line 22
    const/4 v2, 0x3

    .line 23
    invoke-virtual {v0, v1, v2}, Ll/qai;->a(Ljava/lang/String;I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/jbi$c;->a:Ll/jbi;

    .line 27
    .line 28
    invoke-static {v0}, Ll/jbi;->E0(Ll/jbi;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    iget-object v0, p0, Ll/jbi$c;->a:Ll/jbi;

    .line 35
    .line 36
    iget-object v1, v0, Ll/yqg;->H:Ll/ogh;

    .line 37
    .line 38
    iget-object v1, v1, Ll/ogh;->h:Ljava/lang/String;

    .line 39
    .line 40
    iget-object v0, v0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 43
    .line 44
    const-string v2, "moment_id"

    .line 45
    .line 46
    invoke-static {v2, v0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iget-object v2, p0, Ll/jbi$c;->a:Ll/jbi;

    .line 51
    .line 52
    iget-object v2, v2, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 53
    .line 54
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 55
    .line 56
    const-string v3, "owner_id"

    .line 57
    .line 58
    invoke-static {v3, v2}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    filled-new-array {v0, v2}, [Ll/tfj0$a;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    const-string v2, "e_video_play_start"

    .line 67
    .line 68
    invoke-static {v2, v1, v0}, Ll/tfj0;->f(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Ll/jbi$c;->a:Ll/jbi;

    .line 72
    .line 73
    const/4 v0, 0x0

    .line 74
    invoke-static {p0, v0}, Ll/jbi;->F0(Ll/jbi;Z)V

    .line 75
    .line 76
    .line 77
    :cond_0
    return-void
.end method

.method public onStart()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jbi$c;->a:Ll/jbi;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jbi;->H0(Ll/jbi;)Ll/qai;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/jbi$c;->a:Ll/jbi;

    .line 8
    .line 9
    iget-object v1, v1, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, v1, v2}, Ll/qai;->a(Ljava/lang/String;I)V

    .line 15
    .line 16
    .line 17
    invoke-super {p0}, Ll/ie80$c;->onStart()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/jbi$c;->a:Ll/jbi;

    .line 21
    .line 22
    iget-object v1, v0, Ll/yqg;->H:Ll/ogh;

    .line 23
    .line 24
    iget-object v1, v1, Ll/ogh;->h:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v0, v0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 29
    .line 30
    const-string v2, "moment_id"

    .line 31
    .line 32
    invoke-static {v2, v0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object p0, p0, Ll/jbi$c;->a:Ll/jbi;

    .line 37
    .line 38
    iget-object p0, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 41
    .line 42
    const-string v2, "owner_id"

    .line 43
    .line 44
    invoke-static {v2, p0}, Ll/tfj0$a;->g(Ljava/lang/String;Ljava/lang/String;)Ll/tfj0$a;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    filled-new-array {v0, p0}, [Ll/tfj0$a;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    const-string v0, "e_video_play_start"

    .line 53
    .line 54
    invoke-static {v0, v1, p0}, Ll/tfj0;->f(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method
