.class public Ll/cn40;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:I = 0x271a

.field public static b:I = 0x6

.field public static c:Lcom/p1/mobile/putong/feed/data/Moment;

.field public static d:Lcom/p1/mobile/putong/feed/data/Moment;

.field public static e:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;>;"
        }
    .end annotation
.end field

.field public static f:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;>;"
        }
    .end annotation
.end field

.field public static g:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ll/pf60<",
            "Lcom/p1/mobile/android/app/Act;",
            "Landroid/content/Intent;",
            ">;>;"
        }
    .end annotation
.end field

.field public static h:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;"
        }
    .end annotation
.end field

.field public static i:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/Moment;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/cn40;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    sput-object v0, Ll/cn40;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Ll/cn40;->e:Lrx/subjects/a;

    .line 16
    .line 17
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sput-object v0, Ll/cn40;->f:Lrx/subjects/a;

    .line 22
    .line 23
    new-instance v0, Ll/yl40;

    .line 24
    .line 25
    invoke-direct {v0}, Ll/yl40;-><init>()V

    .line 26
    .line 27
    .line 28
    const/16 v1, 0x190

    .line 29
    .line 30
    invoke-static {v1, v0}, Ll/dmk0;->a(ILl/y20;)Ll/y20;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    sput-object v0, Ll/cn40;->g:Ll/y20;

    .line 35
    .line 36
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    sput-object v0, Ll/cn40;->h:Lrx/subjects/a;

    .line 41
    .line 42
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sput-object v0, Ll/cn40;->i:Lrx/subjects/a;

    .line 47
    .line 48
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic A(Ll/pf60;)V
    .locals 2

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Ljava/lang/Integer;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    sget-object v0, Ll/cn40;->h:Lrx/subjects/a;

    .line 18
    .line 19
    sget-object v1, Ll/cn40;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    const/4 v0, 0x6

    .line 25
    sput v0, Ll/cn40;->b:I

    .line 26
    .line 27
    :cond_0
    sget-object v0, Ll/cn40;->e:Lrx/subjects/a;

    .line 28
    .line 29
    invoke-virtual {v0, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast v0, Ljava/lang/Integer;

    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    sput v0, Ll/cn40;->b:I

    .line 41
    .line 42
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 43
    .line 44
    if-eqz p0, :cond_1

    .line 45
    .line 46
    check-cast p0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 47
    .line 48
    sput-object p0, Ll/cn40;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-nez p0, :cond_1

    .line 57
    .line 58
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->h:Ll/cu9;

    .line 59
    .line 60
    sget-object v0, Ll/cn40;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 61
    .line 62
    invoke-virtual {p0, v0}, Ll/cu9;->A0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 63
    .line 64
    .line 65
    :cond_1
    return-void
.end method

.method public static A0(Ll/pf60;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/sm40;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/sm40;-><init>(Ll/pf60;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Ll/cn40;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/Moment;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic C(Lcom/p1/mobile/android/app/Act;IZLl/y20;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Ll/cn40;->d0(Lcom/p1/mobile/android/app/Act;IZLl/y20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic D(Ll/pf60;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/cmg;->x0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    new-instance v1, Ll/zl40;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/zl40;-><init>(Ll/pf60;)V

    .line 14
    .line 15
    .line 16
    const-string p0, "p_fake_nearby_moment_popup"

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-static {v0, p0, v2, v1}, Ll/zzg;->e(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Ll/x20;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-object v0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast p0, Landroid/content/Intent;

    .line 38
    .line 39
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    return-void
.end method

.method public static E()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->globalLifeCycle_()Ljava/util/HashMap;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_4

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-eqz v2, :cond_0

    .line 34
    .line 35
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    check-cast v2, Lcom/p1/mobile/android/app/Act$r;

    .line 40
    .line 41
    iget-object v2, v2, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 42
    .line 43
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    check-cast v2, Landroid/app/Activity;

    .line 48
    .line 49
    if-nez v2, :cond_2

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    instance-of v3, v2, Lcom/p1/mobile/putong/feed/newui/mediapicker/CompactMediaPickerAct;

    .line 53
    .line 54
    if-nez v3, :cond_3

    .line 55
    .line 56
    instance-of v3, v2, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditAct;

    .line 57
    .line 58
    if-nez v3, :cond_3

    .line 59
    .line 60
    instance-of v3, v2, Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;

    .line 61
    .line 62
    if-nez v3, :cond_3

    .line 63
    .line 64
    instance-of v3, v2, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;

    .line 65
    .line 66
    if-nez v3, :cond_3

    .line 67
    .line 68
    instance-of v3, v2, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;

    .line 69
    .line 70
    if-nez v3, :cond_3

    .line 71
    .line 72
    instance-of v3, v2, Lcom/p1/mobile/putong/feed/newui/kankan/recorder/ComicFaceRecorderActivity;

    .line 73
    .line 74
    if-eqz v3, :cond_1

    .line 75
    .line 76
    :cond_3
    invoke-virtual {v2}, Landroid/app/Activity;->finish()V

    .line 77
    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_4
    return-void
.end method

.method public static F()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/cn40;->h:Lrx/subjects/a;

    .line 2
    .line 3
    new-instance v1, Ll/ym40;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/ym40;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    return-object v0
.end method

.method public static G()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/cn40;->i:Lrx/subjects/a;

    .line 2
    .line 3
    new-instance v1, Ll/em40;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/em40;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    return-object v0
.end method

.method public static H()V
    .locals 4

    .line 1
    sget-object v0, Ll/cn40;->f:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget-object v0, Ll/cn40;->f:Lrx/subjects/a;

    .line 14
    .line 15
    new-instance v1, Ll/pf60;

    .line 16
    .line 17
    const/4 v2, 0x6

    .line 18
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    const/4 v3, 0x0

    .line 23
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public static I()V
    .locals 4

    .line 1
    sget-object v0, Ll/cn40;->e:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget-object v0, Ll/cn40;->e:Lrx/subjects/a;

    .line 14
    .line 15
    new-instance v1, Ll/pf60;

    .line 16
    .line 17
    const/4 v2, 0x6

    .line 18
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    const/4 v3, 0x0

    .line 23
    invoke-direct {v1, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public static J(Ljava/lang/String;)Z
    .locals 1

    .line 1
    const-string v0, "newuser_checkin_post_guide_pop"

    .line 2
    .line 3
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const-string v0, "newuser_checkin"

    .line 10
    .line 11
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public static K()Z
    .locals 2

    .line 1
    sget-object v0, Ll/cn40;->e:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    sget-object v0, Ll/cn40;->e:Lrx/subjects/a;

    .line 10
    .line 11
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/pf60;

    .line 16
    .line 17
    iget-object v0, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v0, Ljava/lang/Integer;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v1, 0x5

    .line 26
    if-ne v0, v1, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const/4 v0, 0x0

    .line 30
    return v0

    .line 31
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 32
    return v0
.end method

.method public static L(Ljava/lang/Throwable;)Z
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 12
    .line 13
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 14
    .line 15
    const v0, 0x9dad

    .line 16
    .line 17
    .line 18
    if-eq p0, v0, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 24
    return p0
.end method

.method public static M(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/kl40;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {}, Ll/uc4;->i()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    new-instance v0, Ll/im40;

    .line 15
    .line 16
    invoke-direct {v0, p0, p1}, Ll/im40;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p0, v0}, Ll/cn40;->a0(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->a:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p0, p1}, Ll/cn40;->x0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_2

    .line 30
    .line 31
    :goto_0
    return-void

    .line 32
    :cond_2
    const/4 p1, 0x0

    .line 33
    invoke-static {p0, p1}, Ll/cn40;->q0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static N(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Ll/cn40;->O(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;Ljava/lang/String;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static O(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;Ljava/lang/String;)V
    .locals 6

    .line 1
    const/4 v4, 0x0

    .line 2
    const/4 v5, 0x0

    .line 3
    const/4 v3, 0x0

    .line 4
    move-object v0, p0

    .line 5
    move-object v1, p1

    .line 6
    move-object v2, p2

    .line 7
    invoke-static/range {v0 .. v5}, Ll/cn40;->P(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static P(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V
    .locals 7

    .line 1
    const/4 v6, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move-object v3, p3

    .line 6
    move-object v4, p4

    .line 7
    move-object v5, p5

    .line 8
    invoke-static/range {v0 .. v6}, Ll/cn40;->Q(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/TopicMoment;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static Q(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/TopicMoment;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/kl40;->f()Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-nez p3, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {}, Ll/uc4;->i()Z

    .line 9
    .line 10
    .line 11
    move-result p3

    .line 12
    if-nez p3, :cond_1

    .line 13
    .line 14
    new-instance p3, Ll/bn40;

    .line 15
    .line 16
    invoke-direct {p3, p0, p1, p2}, Ll/bn40;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p0, p3}, Ll/cn40;->a0(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    if-nez p1, :cond_2

    .line 24
    .line 25
    invoke-static {p2}, Ll/cn40;->J(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result p3

    .line 29
    if-nez p3, :cond_2

    .line 30
    .line 31
    invoke-static {p0, p2, p5}, Ll/cn40;->y0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/TopicMoment;)Z

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    if-eqz p2, :cond_2

    .line 36
    .line 37
    :goto_0
    return-void

    .line 38
    :cond_2
    invoke-static {p0, p1}, Ll/cn40;->q0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static R(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/os/Parcelable;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/kl40;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "\u5f53\u524d\u673a\u578b\u4e0d\u652f\u6301\u53d1\u5e03\u52a8\u6001\uff01"

    .line 8
    .line 9
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-static {}, Ll/uc4;->i()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    new-instance v0, Ll/cm40;

    .line 20
    .line 21
    invoke-direct {v0, p0, p1, p2}, Ll/cm40;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p0, v0}, Ll/cn40;->a0(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;-><init>(Landroid/content/Context;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->c(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->h(Landroid/os/Parcelable;)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->a()Landroid/content/Intent;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    const/4 p2, 0x0

    .line 46
    invoke-static {p0, p1, p2, p2}, Ll/cn40;->v0(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;Ll/y20;Ll/x20;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public static S(Lcom/p1/mobile/putong/feed/data/Moment;ZLjava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Ll/cn40;->h:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-static {p0, v0, p1, p2}, Ll/cn40;->V(Lcom/p1/mobile/putong/feed/data/Moment;ZZLjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static T(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)V
    .locals 6

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->pe()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object p0, Ll/cn40;->h:Lrx/subjects/a;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    const/4 v3, 0x0

    .line 17
    const/4 v4, 0x1

    .line 18
    const/4 v1, 0x0

    .line 19
    const/4 v2, 0x0

    .line 20
    move-object v0, p1

    .line 21
    move-object v5, p2

    .line 22
    invoke-static/range {v0 .. v5}, Ll/cn40;->W(Lcom/p1/mobile/putong/feed/data/Moment;ZZZZLjava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    move-object v0, p1

    .line 27
    move-object v5, p2

    .line 28
    const/4 p1, 0x0

    .line 29
    invoke-static {v0, p1, v5}, Ll/cn40;->S(Lcom/p1/mobile/putong/feed/data/Moment;ZLjava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const/4 p1, 0x1

    .line 33
    invoke-static {p0, p1}, Ll/orb0;->v(Landroid/content/Context;Z)Landroid/content/Intent;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static U(Lcom/p1/mobile/putong/feed/data/Moment;Z)V
    .locals 6

    .line 1
    const/4 v4, 0x1

    .line 2
    const/4 v5, 0x0

    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v3, 0x0

    .line 5
    move-object v0, p0

    .line 6
    move v2, p1

    .line 7
    invoke-static/range {v0 .. v5}, Ll/cn40;->W(Lcom/p1/mobile/putong/feed/data/Moment;ZZZZLjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static V(Lcom/p1/mobile/putong/feed/data/Moment;ZZLjava/lang/String;)V
    .locals 6

    .line 1
    const/4 v2, 0x0

    .line 2
    const/4 v4, 0x0

    .line 3
    move-object v0, p0

    .line 4
    move v1, p1

    .line 5
    move v3, p2

    .line 6
    move-object v5, p3

    .line 7
    invoke-static/range {v0 .. v5}, Ll/cn40;->W(Lcom/p1/mobile/putong/feed/data/Moment;ZZZZLjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static W(Lcom/p1/mobile/putong/feed/data/Moment;ZZZZLjava/lang/String;)V
    .locals 7

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v4

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 6
    .line 7
    invoke-virtual {v0, p0, p1, p2}, Ll/jka;->Bc(Lcom/p1/mobile/putong/feed/data/Moment;ZZ)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance v0, Ll/zm40;

    .line 12
    .line 13
    move-object v3, p0

    .line 14
    move v6, p3

    .line 15
    move v2, p4

    .line 16
    move-object v1, p5

    .line 17
    invoke-direct/range {v0 .. v6}, Ll/zm40;-><init>(Ljava/lang/String;ZLcom/p1/mobile/putong/feed/data/Moment;JZ)V

    .line 18
    .line 19
    .line 20
    new-instance p0, Ll/an40;

    .line 21
    .line 22
    invoke-direct {p0, v2, v3, v6}, Ll/an40;-><init>(ZLcom/p1/mobile/putong/feed/data/Moment;Z)V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static X(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 1

    .line 1
    sget-object v0, Ll/cn40;->i:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static Y()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/cn40;->f:Lrx/subjects/a;

    .line 2
    .line 3
    return-object v0
.end method

.method public static Z()Lrx/subjects/a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/cn40;->e:Lrx/subjects/a;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic a(Landroid/content/Intent;)V
    .locals 1

    .line 1
    const/high16 v0, 0x24000000

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static a0(Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 2

    .line 1
    const-string v0, "\u6b63\u5728\u4e0b\u8f7d\u76f8\u673a\u8d44\u6e90"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->progress(Ljava/lang/String;)Landroid/app/Dialog;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/uc4;->n()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    new-instance v1, Ll/am40;

    .line 26
    .line 27
    invoke-direct {v1, v0, p1}, Ll/am40;-><init>(Landroid/app/Dialog;Ll/x20;)V

    .line 28
    .line 29
    .line 30
    new-instance p1, Ll/bm40;

    .line 31
    .line 32
    invoke-direct {p1}, Ll/bm40;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public static synthetic b()V
    .locals 0

    .line 1
    invoke-static {}, Ll/cn40;->E()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static b0(Lcom/p1/mobile/android/app/Act;I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, p1, v0}, Ll/cn40;->c0(Lcom/p1/mobile/android/app/Act;IZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic c(Landroid/app/Dialog;Ll/x20;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 8
    .line 9
    .line 10
    invoke-interface {p1}, Ll/x20;->call()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public static c0(Lcom/p1/mobile/android/app/Act;IZ)V
    .locals 2

    .line 1
    invoke-static {}, Ll/kl40;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Ll/uc4;->i()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    new-instance p2, Ll/km40;

    .line 15
    .line 16
    invoke-direct {p2, p0, p1}, Ll/km40;-><init>(Lcom/p1/mobile/android/app/Act;I)V

    .line 17
    .line 18
    .line 19
    invoke-static {p0, p2}, Ll/cn40;->a0(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withImagePickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const/4 v1, 0x1

    .line 48
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withVideoPickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withFadeFinishAnim(Z)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    const/4 p2, 0x2

    .line 65
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withFromType(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    const-string p2, "p_camera_album_picture_preview"

    .line 70
    .line 71
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withMediaPreviewPageId(Ljava/lang/String;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Landroid/content/Intent;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    sget p2, Ll/a8c0;->i:I

    .line 84
    .line 85
    const/4 v0, 0x0

    .line 86
    invoke-virtual {p0, p2, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 87
    .line 88
    .line 89
    sget-object p2, Ll/cn40;->g:Ll/y20;

    .line 90
    .line 91
    new-instance v0, Ll/pf60;

    .line 92
    .line 93
    invoke-direct {v0, p0, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 94
    .line 95
    .line 96
    invoke-interface {p2, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public static synthetic d(ZLcom/p1/mobile/putong/feed/data/Moment;ZLjava/lang/Throwable;)V
    .locals 6

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-static {p3}, Ll/cn40;->L(Ljava/lang/Throwable;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const-string p0, "\u53d1\u5e03\u5931\u8d25"

    .line 10
    .line 11
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    const/4 p0, 0x1

    .line 15
    invoke-static {p0, p3}, Ll/zzg;->g(ZLjava/lang/Throwable;)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v2, "p_moment_post"

    .line 23
    .line 24
    const/4 v5, 0x0

    .line 25
    move-object v1, p1

    .line 26
    move v4, p2

    .line 27
    move-object v3, p3

    .line 28
    invoke-virtual/range {v0 .. v5}, Ll/er60;->o(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ljava/lang/Throwable;ZLjava/util/Map;)V

    .line 29
    .line 30
    .line 31
    instance-of p0, v3, Lcom/p1/mobile/putong/safety/IllegalPictureException;

    .line 32
    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    invoke-virtual {v3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-nez p0, :cond_1

    .line 44
    .line 45
    invoke-virtual {v3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p0, p1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const-string p1, "qrcode"

    .line 58
    .line 59
    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    if-eqz p0, :cond_1

    .line 64
    .line 65
    const-string p0, "\u56fe\u7247\u4e2d\u5b58\u5728\u4e8c\u7ef4\u7801\uff0c\u53d1\u5e03\u5931\u8d25"

    .line 66
    .line 67
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_1
    invoke-static {v3}, Ll/cn40;->L(Ljava/lang/Throwable;)Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    if-eqz p0, :cond_2

    .line 76
    .line 77
    invoke-static {v3}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 78
    .line 79
    .line 80
    :cond_2
    return-void
.end method

.method public static d0(Lcom/p1/mobile/android/app/Act;IZLl/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "IZ",
            "Ll/y20<",
            "Landroid/content/Intent;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/kl40;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Ll/uc4;->i()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    new-instance v0, Ll/dm40;

    .line 15
    .line 16
    invoke-direct {v0, p0, p1, p2, p3}, Ll/dm40;-><init>(Lcom/p1/mobile/android/app/Act;IZLl/y20;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p0, v0}, Ll/cn40;->a0(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withImagePickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const/4 v1, 0x1

    .line 48
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withVideoPickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withFadeFinishAnim(Z)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    const/4 p2, 0x2

    .line 65
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withFromType(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    const-string p2, "p_camera_album_picture_preview"

    .line 70
    .line 71
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withMediaPreviewPageId(Ljava/lang/String;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Landroid/content/Intent;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    sget p2, Ll/a8c0;->i:I

    .line 84
    .line 85
    const/4 v0, 0x0

    .line 86
    invoke-virtual {p0, p2, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 87
    .line 88
    .line 89
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result p2

    .line 93
    if-eqz p2, :cond_2

    .line 94
    .line 95
    invoke-interface {p3, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 96
    .line 97
    .line 98
    :cond_2
    sget-object p2, Ll/cn40;->g:Ll/y20;

    .line 99
    .line 100
    new-instance p3, Ll/pf60;

    .line 101
    .line 102
    invoke-direct {p3, p0, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 103
    .line 104
    .line 105
    invoke-interface {p2, p3}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/cn40;->O(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static e0(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    const-string v1, ""

    .line 3
    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-static {p0, v2, v0, v1}, Ll/cn40;->g0(Lcom/p1/mobile/android/app/Act;ZLjava/util/ArrayList;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/cn40;->p0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static f0(Lcom/p1/mobile/android/app/Act;Z)V
    .locals 6

    .line 1
    const-string v3, ""

    .line 2
    .line 3
    const/4 v4, 0x0

    .line 4
    const/4 v1, 0x0

    .line 5
    const/4 v2, 0x0

    .line 6
    move-object v0, p0

    .line 7
    move v5, p1

    .line 8
    invoke-static/range {v0 .. v5}, Ll/cn40;->h0(Lcom/p1/mobile/android/app/Act;ZLjava/util/ArrayList;Ljava/lang/String;ZZ)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic g(Ll/pf60;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p0, Landroid/content/Intent;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public static g0(Lcom/p1/mobile/android/app/Act;ZLjava/util/ArrayList;Ljava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Z",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 v4, 0x0

    .line 2
    const/4 v5, 0x0

    .line 3
    move-object v0, p0

    .line 4
    move v1, p1

    .line 5
    move-object v2, p2

    .line 6
    move-object v3, p3

    .line 7
    invoke-static/range {v0 .. v5}, Ll/cn40;->h0(Lcom/p1/mobile/android/app/Act;ZLjava/util/ArrayList;Ljava/lang/String;ZZ)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic h(Landroid/content/Intent;)V
    .locals 1

    .line 1
    const/high16 v0, 0x24000000

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static h0(Lcom/p1/mobile/android/app/Act;ZLjava/util/ArrayList;Ljava/lang/String;ZZ)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Z",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Ljava/lang/String;",
            "ZZ)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/kl40;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Ll/uc4;->i()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    new-instance p1, Ll/wm40;

    .line 15
    .line 16
    invoke-direct {p1, p0}, Ll/wm40;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p0, p1}, Ll/cn40;->a0(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    const/4 v3, 0x1

    .line 24
    const/4 v4, 0x0

    .line 25
    const/16 v1, 0x9

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    move-object v0, p0

    .line 29
    move v5, p1

    .line 30
    move-object v6, p2

    .line 31
    move-object v7, p3

    .line 32
    move v8, p4

    .line 33
    move v9, p5

    .line 34
    invoke-static/range {v0 .. v9}, Lcom/p1/mobile/putong/feed/newui/mediapicker/CompactMediaPickerAct;->e2(Landroid/content/Context;ILcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;ZZZLjava/util/ArrayList;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    const-string p2, "android.permission.CAMERA"

    .line 43
    .line 44
    filled-new-array {p2}, [Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    const/4 p2, 0x0

    .line 53
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    const/4 p2, 0x1

    .line 58
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    new-instance p2, Ll/xm40;

    .line 63
    .line 64
    invoke-direct {p2, v0, p0, v8}, Ll/xm40;-><init>(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;Z)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->o(Ll/x20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public static synthetic i()V
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->U1:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static i0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, v0}, Ll/cn40;->k0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ZLjava/lang/String;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;Ll/y20;Ll/x20;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Ll/cn40;->u0(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;Ll/y20;Ll/x20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static j0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ZLcom/p1/mobile/putong/feed/data/TopicMoment;Ljava/lang/String;Z)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;Z",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/kl40;->f()Z

    .line 2
    .line 3
    .line 4
    move-result p5

    .line 5
    if-eqz p5, :cond_0

    .line 6
    .line 7
    const/4 v5, 0x1

    .line 8
    move-object v0, p0

    .line 9
    move-object v1, p1

    .line 10
    move v2, p2

    .line 11
    move-object v3, p3

    .line 12
    move-object v4, p4

    .line 13
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->q2(Landroid/content/Context;Ljava/util/ArrayList;ZLcom/p1/mobile/putong/feed/data/TopicMoment;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/4 p1, 0x0

    .line 18
    invoke-static {v0, p0, p1, p1}, Ll/cn40;->u0(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;Ll/y20;Ll/x20;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    move-object v0, p0

    .line 23
    move-object v1, p1

    .line 24
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/feed/ui/moments/CaptionAct;->Y1(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/android/app/Act;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/cn40;->b0(Lcom/p1/mobile/android/app/Act;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static k0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ZLjava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;Z",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 v4, 0x0

    .line 2
    const/4 v5, 0x0

    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move v2, p2

    .line 6
    move-object v3, p3

    .line 7
    invoke-static/range {v0 .. v5}, Ll/cn40;->l0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/cn40;->q0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static l0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 v6, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move v2, p2

    .line 5
    move-object v3, p3

    .line 6
    move-object v4, p4

    .line 7
    move-object v5, p5

    .line 8
    invoke-static/range {v0 .. v6}, Ll/cn40;->m0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic m(Ll/pf60;)V
    .locals 2

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Ljava/lang/Integer;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    sget-object v0, Ll/cn40;->i:Lrx/subjects/a;

    .line 18
    .line 19
    sget-object v1, Ll/cn40;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    sget-object v0, Ll/cn40;->f:Lrx/subjects/a;

    .line 25
    .line 26
    invoke-virtual {v0, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static m0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 v7, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move v2, p2

    .line 5
    move-object v3, p3

    .line 6
    move-object v4, p4

    .line 7
    move-object v5, p5

    .line 8
    move-object v6, p6

    .line 9
    invoke-static/range {v0 .. v7}, Ll/cn40;->n0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/TopicMoment;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic n(Ljava/lang/String;ZLcom/p1/mobile/putong/feed/data/Moment;JZLl/uxj0;)V
    .locals 6

    .line 1
    const-string p6, "p_meet_greet"

    .line 2
    .line 3
    invoke-static {p0, p6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const-string p0, "\u4eca\u65e5\u5076\u9047\u673a\u4f1a+1"

    .line 10
    .line 11
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    if-eqz p1, :cond_1

    .line 16
    .line 17
    const-string p0, "\u53d1\u5e03\u6210\u529f"

    .line 18
    .line 19
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    :goto_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 23
    .line 24
    .line 25
    move-result-wide p0

    .line 26
    sub-long/2addr p0, p3

    .line 27
    const-string p3, "nearby"

    .line 28
    .line 29
    invoke-static {p3, p2, p0, p1}, Ll/g9i;->j0(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;J)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const/16 v3, 0xc9

    .line 37
    .line 38
    const/4 v5, 0x0

    .line 39
    const-string v2, "p_moment_post"

    .line 40
    .line 41
    move-object v1, p2

    .line 42
    move v4, p5

    .line 43
    invoke-virtual/range {v0 .. v5}, Ll/er60;->n(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;IZLjava/util/Map;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public static n0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/TopicMoment;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/kl40;->f()Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->p2(Landroid/content/Context;Ljava/util/ArrayList;Z)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const/4 p2, 0x0

    .line 12
    invoke-static {p0, p1, p2, p2}, Ll/cn40;->u0(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;Ll/y20;Ll/x20;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/CaptionAct;->Y1(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const/16 p2, 0x32

    .line 21
    .line 22
    invoke-virtual {p0, p1, p2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/os/Parcelable;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/cn40;->R(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static o0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/CaptionAct;->Z1(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/cn40;->M(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static p0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/uc4;->i()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/rm40;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1}, Ll/rm40;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v0}, Ll/cn40;->a0(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumSelectFrameAct;->L2(Landroid/content/Context;Lcom/p1/mobile/putong/data/Media;)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    sget v0, Ll/cn40;->a:I

    .line 21
    .line 22
    invoke-virtual {p0, p1, v0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;Ll/y20;Ll/x20;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Ll/cn40;->w0(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;Ll/y20;Ll/x20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static q0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/kl40;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Ll/uc4;->i()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    new-instance v0, Ll/nm40;

    .line 15
    .line 16
    invoke-direct {v0, p0, p1}, Ll/nm40;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p0, v0}, Ll/cn40;->a0(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    const/16 v0, 0x9

    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    const/4 v2, 0x0

    .line 27
    invoke-static {p0, v0, p1, v1, v2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/CompactMediaPickerAct;->c2(Landroid/content/Context;ILcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;ZZ)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v3, "android.permission.CAMERA"

    .line 36
    .line 37
    filled-new-array {v3}, [Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v1, Ll/om40;

    .line 54
    .line 55
    invoke-direct {v1, p0, p1}, Ll/om40;-><init>(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->o(Ll/x20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public static synthetic r(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;Ll/y20;Ll/x20;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Ll/cn40;->v0(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;Ll/y20;Ll/x20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static r0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;I)V
    .locals 7

    .line 1
    invoke-static {}, Ll/uc4;->i()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/jm40;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1, p2}, Ll/jm40;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;I)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v0}, Ll/cn40;->a0(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const/4 v4, 0x0

    .line 17
    const/4 v5, 0x0

    .line 18
    const/4 v2, 0x1

    .line 19
    const/4 v3, 0x0

    .line 20
    move-object v1, p0

    .line 21
    move-object v6, p1

    .line 22
    invoke-static/range {v1 .. v6}, Lcom/p1/mobile/putong/feed/newui/mediapicker/CompactMediaPickerAct;->d2(Landroid/content/Context;ILcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;ZZLjava/lang/String;)Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {}, Ll/wzx;->k()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    const-string v0, "android.permission.RECORD_AUDIO"

    .line 31
    .line 32
    const-string v2, "android.permission.CAMERA"

    .line 33
    .line 34
    const/4 v3, 0x2

    .line 35
    const/4 v4, 0x1

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    new-array p1, v3, [Ljava/lang/String;

    .line 39
    .line 40
    aput-object v2, p1, v5

    .line 41
    .line 42
    aput-object v0, p1, v4

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    const/4 p1, 0x4

    .line 46
    new-array p1, p1, [Ljava/lang/String;

    .line 47
    .line 48
    aput-object v2, p1, v5

    .line 49
    .line 50
    aput-object v0, p1, v4

    .line 51
    .line 52
    const-string v0, "android.permission.READ_EXTERNAL_STORAGE"

    .line 53
    .line 54
    aput-object v0, p1, v3

    .line 55
    .line 56
    const/4 v0, 0x3

    .line 57
    const-string v2, "android.permission.WRITE_EXTERNAL_STORAGE"

    .line 58
    .line 59
    aput-object v2, p1, v0

    .line 60
    .line 61
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->c()Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->r([Ljava/lang/String;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p1, v5}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->w(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-virtual {p1, v4}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->u(Z)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    new-instance v0, Ll/um40;

    .line 78
    .line 79
    invoke-direct {v0, v1, p0, p2}, Ll/um40;-><init>(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;I)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->o(Ll/x20;)Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper$a;->i(Landroid/app/Activity;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;)V
    .locals 2

    .line 1
    sget-object v0, Ll/cn40;->g:Ll/y20;

    .line 2
    .line 3
    new-instance v1, Ll/pf60;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static s0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 p2, 0x0

    .line 2
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->p2(Landroid/content/Context;Ljava/util/ArrayList;Z)Landroid/content/Intent;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    new-instance p2, Ll/lm40;

    .line 7
    .line 8
    invoke-direct {p2}, Ll/lm40;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance p3, Ll/mm40;

    .line 12
    .line 13
    invoke-direct {p3}, Ll/mm40;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {p0, p1, p2, p3}, Ll/cn40;->u0(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;Ll/y20;Ll/x20;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic t(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static t0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;Ljava/lang/String;ZLjava/lang/String;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->f(Ljava/util/ArrayList;)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1, p4}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->c(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const/4 p4, 0x0

    .line 15
    invoke-virtual {p1, p4}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->j(Z)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->k(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->l(Z)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1, p5}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->i(Z)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct$a;->a()Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    new-instance p2, Ll/pm40;

    .line 36
    .line 37
    invoke-direct {p2}, Ll/pm40;-><init>()V

    .line 38
    .line 39
    .line 40
    new-instance p3, Ll/qm40;

    .line 41
    .line 42
    invoke-direct {p3}, Ll/qm40;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {p0, p1, p2, p3}, Ll/cn40;->v0(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;Ll/y20;Ll/x20;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/cn40;->r0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static u0(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;Ll/y20;Ll/x20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Landroid/content/Intent;",
            "Ll/y20<",
            "Landroid/content/Intent;",
            ">;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/uc4;->i()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/vm40;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1, p2, p3}, Ll/vm40;-><init>(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;Ll/y20;Ll/x20;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v0}, Ll/cn40;->a0(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-interface {p2, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    sget-object p2, Ll/cn40;->g:Ll/y20;

    .line 26
    .line 27
    new-instance v0, Ll/pf60;

    .line 28
    .line 29
    invoke-direct {v0, p0, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    invoke-interface {p2, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_2

    .line 40
    .line 41
    invoke-interface {p3}, Ll/x20;->call()V

    .line 42
    .line 43
    .line 44
    :cond_2
    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/cn40;->e0(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static v0(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;Ll/y20;Ll/x20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Landroid/content/Intent;",
            "Ll/y20<",
            "Landroid/content/Intent;",
            ">;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/kl40;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Ll/uc4;->i()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    new-instance v0, Ll/fm40;

    .line 15
    .line 16
    invoke-direct {v0, p0, p1, p2, p3}, Ll/fm40;-><init>(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;Ll/y20;Ll/x20;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p0, v0}, Ll/cn40;->a0(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    invoke-static {}, Ll/owi;->a()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    new-instance v0, Ll/gm40;

    .line 30
    .line 31
    invoke-direct {v0}, Ll/gm40;-><init>()V

    .line 32
    .line 33
    .line 34
    new-instance v1, Ll/hm40;

    .line 35
    .line 36
    invoke-direct {v1, p0, p1, p2, p3}, Ll/hm40;-><init>(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;Ll/y20;Ll/x20;)V

    .line 37
    .line 38
    .line 39
    sget-object p1, Ll/l3h;->a:Ljava/lang/String;

    .line 40
    .line 41
    const/4 p2, 0x0

    .line 42
    invoke-static {p0, v0, p2, v1, p1}, Ll/k3h;->P0(Lcom/p1/mobile/android/app/Act;Ll/x20;ZLl/x20;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_2
    invoke-static {p0, p1, p2, p3}, Ll/cn40;->w0(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;Ll/y20;Ll/x20;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;Z)V
    .locals 2

    .line 1
    sget-object v0, Ll/cn40;->g:Ll/y20;

    .line 2
    .line 3
    new-instance v1, Ll/pf60;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    sget p1, Ll/a8c0;->i:I

    .line 14
    .line 15
    const/4 p2, 0x0

    .line 16
    invoke-virtual {p0, p1, p2}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public static w0(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;Ll/y20;Ll/x20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Landroid/content/Intent;",
            "Ll/y20<",
            "Landroid/content/Intent;",
            ">;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p2, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    sget-object p2, Ll/cn40;->g:Ll/y20;

    .line 11
    .line 12
    new-instance v0, Ll/pf60;

    .line 13
    .line 14
    invoke-direct {v0, p0, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    invoke-interface {p2, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-interface {p3}, Ll/x20;->call()V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public static synthetic x(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static x0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Ll/cn40;->y0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/TopicMoment;)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Ll/cn40;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/Moment;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static y0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/TopicMoment;)Z
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object p1, p1, Ll/jka;->U:Ll/jxd0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->new_()Lcom/p1/mobile/putong/data/Picture;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-static {p1}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const/4 p2, 0x1

    .line 26
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/newcaption/NewCaptionAct;->p2(Landroid/content/Context;Ljava/util/ArrayList;Z)Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const/4 v0, 0x0

    .line 31
    invoke-static {p0, p1, v0, v0}, Ll/cn40;->u0(Lcom/p1/mobile/android/app/Act;Landroid/content/Intent;Ll/y20;Ll/x20;)V

    .line 32
    .line 33
    .line 34
    return p2

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method public static synthetic z()V
    .locals 0

    .line 1
    invoke-static {}, Ll/cn40;->E()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static z0(Ll/pf60;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/tm40;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/tm40;-><init>(Ll/pf60;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
