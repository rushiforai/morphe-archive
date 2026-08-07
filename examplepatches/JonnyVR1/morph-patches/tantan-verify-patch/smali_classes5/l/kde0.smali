.class public Ll/kde0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/kde0$b;
    }
.end annotation


# static fields
.field public static final j:Ljava/lang/String;

.field public static final k:Ljava/lang/String;

.field public static final l:[Ljava/lang/String;

.field public static m:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public a:Landroid/content/ContentResolver;

.field public b:Landroid/database/ContentObserver;

.field public c:I

.field public d:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public f:Z

.field public g:Lcom/p1/mobile/android/app/Dialog;

.field public h:Ll/gcg0;

.field public i:Z


# direct methods
.method static constructor <clinit>()V
    .locals 15

    .line 1
    sget-object v0, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ll/kde0;->j:Ljava/lang/String;

    .line 8
    .line 9
    sget-object v0, Landroid/provider/MediaStore$Images$Media;->INTERNAL_CONTENT_URI:Landroid/net/Uri;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Ll/kde0;->k:Ljava/lang/String;

    .line 16
    .line 17
    const-string v0, "_data"

    .line 18
    .line 19
    const-string v1, "date_added"

    .line 20
    .line 21
    const-string v2, "_display_name"

    .line 22
    .line 23
    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sput-object v0, Ll/kde0;->l:[Ljava/lang/String;

    .line 28
    .line 29
    const-string v13, "\u622a\u5c4f"

    .line 30
    .line 31
    const-string v14, "\u622a\u56fe"

    .line 32
    .line 33
    const-string v1, "screenshot"

    .line 34
    .line 35
    const-string v2, "screen_shot"

    .line 36
    .line 37
    const-string v3, "screen-shot"

    .line 38
    .line 39
    const-string v4, "screen shot"

    .line 40
    .line 41
    const-string v5, "screencapture"

    .line 42
    .line 43
    const-string v6, "screen_capture"

    .line 44
    .line 45
    const-string v7, "screen-capture"

    .line 46
    .line 47
    const-string v8, "screen capture"

    .line 48
    .line 49
    const-string v9, "screencap"

    .line 50
    .line 51
    const-string v10, "screen_cap"

    .line 52
    .line 53
    const-string v11, "screen-cap"

    .line 54
    .line 55
    const-string v12, "screen cap"

    .line 56
    .line 57
    filled-new-array/range {v1 .. v14}, [Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    sput-object v0, Ll/kde0;->m:Ljava/util/List;

    .line 66
    .line 67
    return-void
.end method

.method public constructor <init>()V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "Range"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/kde0;->d:Lrx/subjects/b;

    .line 9
    .line 10
    new-instance v0, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/kde0;->e:Ljava/util/List;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput-boolean v0, p0, Ll/kde0;->f:Z

    .line 19
    .line 20
    iput-boolean v0, p0, Ll/kde0;->i:Z

    .line 21
    .line 22
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Ll/kde0;->a:Landroid/content/ContentResolver;

    .line 29
    .line 30
    new-instance v0, Ll/kde0$a;

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    invoke-direct {v0, p0, v1}, Ll/kde0$a;-><init>(Ll/kde0;Landroid/os/Handler;)V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Ll/kde0;->b:Landroid/database/ContentObserver;

    .line 37
    .line 38
    return-void
.end method

.method public synthetic constructor <init>(Ll/lde0;)V
    .locals 0

    .line 39
    invoke-direct {p0}, Ll/kde0;-><init>()V

    return-void
.end method

.method public static synthetic a(Ll/kde0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kde0;->r(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Ll/kde0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kde0;->q(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic d(Ll/kde0;Lcom/p1/mobile/android/app/Act$r;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kde0;->p(Lcom/p1/mobile/android/app/Act$r;)V

    return-void
.end method

.method public static bridge synthetic e(Ll/kde0;)Landroid/content/ContentResolver;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kde0;->a:Landroid/content/ContentResolver;

    return-object p0
.end method

.method public static bridge synthetic f(Ll/kde0;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kde0;->e:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic g(Ll/kde0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/kde0;->f:Z

    return p0
.end method

.method public static bridge synthetic h(Ll/kde0;)Lrx/subjects/b;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kde0;->d:Lrx/subjects/b;

    return-object p0
.end method

.method public static bridge synthetic i()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/kde0;->j:Ljava/lang/String;

    return-object v0
.end method

.method public static bridge synthetic j()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/kde0;->k:Ljava/lang/String;

    return-object v0
.end method

.method public static bridge synthetic k()[Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/kde0;->l:[Ljava/lang/String;

    return-object v0
.end method

.method public static bridge synthetic l(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Ll/kde0;->s(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic m(JJ)Z
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Ll/kde0;->t(JJ)Z

    move-result p0

    return p0
.end method

.method public static o()Ll/kde0;
    .locals 1

    .line 1
    sget-object v0, Ll/kde0$b;->INSTANCE:Ll/kde0;

    .line 2
    .line 3
    return-object v0
.end method

.method public static s(Ljava/lang/String;)Z
    .locals 3

    .line 1
    sget-object v0, Ll/kde0;->m:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v2, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_1
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method public static t(JJ)Z
    .locals 0

    .line 1
    sub-long/2addr p0, p2

    .line 2
    invoke-static {p0, p1}, Ljava/lang/Math;->abs(J)J

    .line 3
    .line 4
    .line 5
    move-result-wide p0

    .line 6
    const-wide/16 p2, 0xa

    .line 7
    .line 8
    cmp-long p0, p0, p2

    .line 9
    .line 10
    if-gtz p0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public static u()Z
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v1, :cond_2

    .line 15
    .line 16
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 17
    .line 18
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_2

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 25
    .line 26
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 29
    .line 30
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    const/16 v4, 0x5d

    .line 35
    .line 36
    if-eqz v3, :cond_0

    .line 37
    .line 38
    iget v1, v1, Lcom/p1/mobile/putong/data/PhoneNumber;->countryCode:I

    .line 39
    .line 40
    if-eq v1, v4, :cond_1

    .line 41
    .line 42
    :cond_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_2

    .line 47
    .line 48
    iget v0, v0, Lcom/p1/mobile/putong/data/PhoneNumber;->countryCode:I

    .line 49
    .line 50
    if-ne v0, v4, :cond_2

    .line 51
    .line 52
    :cond_1
    return v2

    .line 53
    :cond_2
    invoke-static {}, Ll/d79;->q0()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_3

    .line 58
    .line 59
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-static {v1}, Ll/d79;->s(Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-eqz v1, :cond_3

    .line 72
    .line 73
    return v2

    .line 74
    :cond_3
    if-nez v0, :cond_4

    .line 75
    .line 76
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 77
    .line 78
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e1:Ll/uwa;

    .line 79
    .line 80
    invoke-virtual {v0}, Ll/uwa;->a3()Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_4

    .line 85
    .line 86
    return v2

    .line 87
    :cond_4
    invoke-static {}, Ll/gra;->w1()Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    return v0
.end method


# virtual methods
.method public n()V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/kde0;->i:Z

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    iput v1, p0, Ll/kde0;->c:I

    .line 6
    .line 7
    invoke-static {}, Ll/icg0;->a()Ll/gcg0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iput-object v1, p0, Ll/kde0;->h:Ll/gcg0;

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground()Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    new-instance v3, Ll/gde0;

    .line 18
    .line 19
    invoke-direct {v3, p0}, Ll/gde0;-><init>(Ll/kde0;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-virtual {v2, v3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v1, v2}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Ll/kde0;->h:Ll/gcg0;

    .line 34
    .line 35
    iget-object v2, p0, Ll/kde0;->d:Lrx/subjects/b;

    .line 36
    .line 37
    invoke-virtual {v2}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-virtual {v2, v3}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    new-instance v3, Ll/hde0;

    .line 50
    .line 51
    invoke-direct {v3, p0}, Ll/hde0;-><init>(Ll/kde0;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-virtual {v2, v3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v1, v2}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 63
    .line 64
    .line 65
    iget-object v1, p0, Ll/kde0;->a:Landroid/content/ContentResolver;

    .line 66
    .line 67
    sget-object v2, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    .line 68
    .line 69
    iget-object v3, p0, Ll/kde0;->b:Landroid/database/ContentObserver;

    .line 70
    .line 71
    invoke-virtual {v1, v2, v0, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 72
    .line 73
    .line 74
    iget-object v1, p0, Ll/kde0;->a:Landroid/content/ContentResolver;

    .line 75
    .line 76
    sget-object v2, Landroid/provider/MediaStore$Images$Media;->INTERNAL_CONTENT_URI:Landroid/net/Uri;

    .line 77
    .line 78
    iget-object p0, p0, Ll/kde0;->b:Landroid/database/ContentObserver;

    .line 79
    .line 80
    invoke-virtual {v1, v2, v0, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public final synthetic p(Lcom/p1/mobile/android/app/Act$r;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    iput-boolean v0, p0, Ll/kde0;->f:Z

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Landroid/app/Activity;

    .line 14
    .line 15
    instance-of v1, p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 16
    .line 17
    if-nez v1, :cond_1

    .line 18
    .line 19
    instance-of v1, p1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAct;

    .line 20
    .line 21
    if-nez v1, :cond_1

    .line 22
    .line 23
    instance-of v1, p1, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;

    .line 24
    .line 25
    if-nez v1, :cond_1

    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-interface {v1, p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->hr(Landroid/app/Activity;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_2

    .line 36
    .line 37
    :cond_1
    const/4 v0, 0x1

    .line 38
    :cond_2
    iput-boolean v0, p0, Ll/kde0;->f:Z

    .line 39
    .line 40
    return-void
.end method

.method public final synthetic q(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/kde0;->u()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 26
    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Landroid/app/Activity;

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_2
    const/4 v0, 0x0

    .line 43
    :goto_0
    instance-of v1, v0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 44
    .line 45
    if-eqz v1, :cond_3

    .line 46
    .line 47
    move-object v1, v0

    .line 48
    check-cast v1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 49
    .line 50
    sget-object v2, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 51
    .line 52
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->i6(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-eqz v1, :cond_5

    .line 57
    .line 58
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 59
    .line 60
    invoke-virtual {p0, v0, p1}, Ll/kde0;->w(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_3
    instance-of v1, v0, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;

    .line 65
    .line 66
    if-eqz v1, :cond_4

    .line 67
    .line 68
    move-object v1, v0

    .line 69
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;

    .line 70
    .line 71
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->a3()Ll/q3m;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-interface {v1}, Ll/t3m;->P1()Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    if-nez v1, :cond_5

    .line 80
    .line 81
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 82
    .line 83
    invoke-virtual {p0, v0, p1}, Ll/kde0;->w(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_4
    instance-of v1, v0, Lcom/p1/mobile/android/app/Act;

    .line 88
    .line 89
    if-eqz v1, :cond_5

    .line 90
    .line 91
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 92
    .line 93
    invoke-virtual {p0, v0, p1}, Ll/kde0;->w(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    :cond_5
    :goto_1
    return-void
.end method

.method public final synthetic r(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/kde0;->g:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-object p1, p0, Ll/kde0;->g:Lcom/p1/mobile/android/app/Dialog;

    .line 8
    .line 9
    return-void
.end method

.method public v()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/kde0;->i:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    iput v0, p0, Ll/kde0;->c:I

    .line 8
    .line 9
    iget-object v1, p0, Ll/kde0;->d:Lrx/subjects/b;

    .line 10
    .line 11
    const-string v2, ""

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Ll/kde0;->h:Ll/gcg0;

    .line 17
    .line 18
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    iget-object v1, p0, Ll/kde0;->h:Ll/gcg0;

    .line 25
    .line 26
    invoke-virtual {v1}, Ll/gcg0;->unsubscribe()V

    .line 27
    .line 28
    .line 29
    :cond_1
    invoke-static {}, Ll/icg0;->a()Ll/gcg0;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iput-object v1, p0, Ll/kde0;->h:Ll/gcg0;

    .line 34
    .line 35
    iget-object v1, p0, Ll/kde0;->a:Landroid/content/ContentResolver;

    .line 36
    .line 37
    iget-object v2, p0, Ll/kde0;->b:Landroid/database/ContentObserver;

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 40
    .line 41
    .line 42
    iput-boolean v0, p0, Ll/kde0;->i:Z

    .line 43
    .line 44
    return-void
.end method

.method public final w(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 5

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_3

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/app/Activity;->isDestroyed()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_3

    .line 14
    .line 15
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-eqz p2, :cond_0

    .line 20
    .line 21
    goto/16 :goto_1

    .line 22
    .line 23
    :cond_0
    iget-object p2, p0, Ll/kde0;->g:Lcom/p1/mobile/android/app/Dialog;

    .line 24
    .line 25
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    if-eqz p2, :cond_1

    .line 30
    .line 31
    iget-object p2, p0, Ll/kde0;->g:Lcom/p1/mobile/android/app/Dialog;

    .line 32
    .line 33
    invoke-virtual {p2}, Landroid/app/Dialog;->isShowing()Z

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    if-eqz p2, :cond_1

    .line 38
    .line 39
    goto/16 :goto_1

    .line 40
    .line 41
    :cond_1
    iget p2, p0, Ll/kde0;->c:I

    .line 42
    .line 43
    const/4 v0, 0x1

    .line 44
    add-int/2addr p2, v0

    .line 45
    iput p2, p0, Ll/kde0;->c:I

    .line 46
    .line 47
    const-class p2, Ll/kde0;

    .line 48
    .line 49
    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    const-string v1, "p_get_screenshoot_warning"

    .line 54
    .line 55
    invoke-static {v1, p2}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    const-string v1, "tooltips_trigger_mode"

    .line 60
    .line 61
    const-string v2, "passive"

    .line 62
    .line 63
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    filled-new-array {v1}, [Ll/pf60;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {p2, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Dialog$e;->u()Lcom/p1/mobile/android/app/Dialog$e;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    sget v2, Ll/kec0;->Rb:I

    .line 83
    .line 84
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->M(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    const/4 v2, 0x0

    .line 89
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    iput-object v1, p0, Ll/kde0;->g:Lcom/p1/mobile/android/app/Dialog;

    .line 98
    .line 99
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    sget v2, Ll/adc0;->je:I

    .line 104
    .line 105
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    check-cast v2, Lv/VText;

    .line 110
    .line 111
    sget v3, Ll/adc0;->P1:I

    .line 112
    .line 113
    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    check-cast v3, Lv/VText;

    .line 118
    .line 119
    iget v4, p0, Ll/kde0;->c:I

    .line 120
    .line 121
    if-ne v4, v0, :cond_2

    .line 122
    .line 123
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Q0:I

    .line 124
    .line 125
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(I)V

    .line 126
    .line 127
    .line 128
    sget p1, Lcom/p1/mobile/putong/core/R$string;->O0:I

    .line 129
    .line 130
    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setText(I)V

    .line 131
    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_2
    sget v0, Lcom/p1/mobile/putong/core/R$string;->P0:I

    .line 135
    .line 136
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v4

    .line 140
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object v4

    .line 144
    invoke-virtual {p1, v0, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 149
    .line 150
    .line 151
    sget p1, Lcom/p1/mobile/putong/core/R$string;->N0:I

    .line 152
    .line 153
    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setText(I)V

    .line 154
    .line 155
    .line 156
    :goto_0
    sget p1, Ll/adc0;->ya:I

    .line 157
    .line 158
    invoke-virtual {v1, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    new-instance v0, Ll/ide0;

    .line 163
    .line 164
    invoke-direct {v0, p0}, Ll/ide0;-><init>(Ll/kde0;)V

    .line 165
    .line 166
    .line 167
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 168
    .line 169
    .line 170
    iget-object p1, p0, Ll/kde0;->g:Lcom/p1/mobile/android/app/Dialog;

    .line 171
    .line 172
    new-instance v0, Ll/jde0;

    .line 173
    .line 174
    invoke-direct {v0, p2}, Ll/jde0;-><init>(Ll/l4g0;)V

    .line 175
    .line 176
    .line 177
    invoke-virtual {p1, v0}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 178
    .line 179
    .line 180
    invoke-static {p2}, Ll/w1e;->f(Ll/l4g0;)V

    .line 181
    .line 182
    .line 183
    iget-object p0, p0, Ll/kde0;->g:Lcom/p1/mobile/android/app/Dialog;

    .line 184
    .line 185
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 186
    .line 187
    .line 188
    :cond_3
    :goto_1
    return-void
.end method
