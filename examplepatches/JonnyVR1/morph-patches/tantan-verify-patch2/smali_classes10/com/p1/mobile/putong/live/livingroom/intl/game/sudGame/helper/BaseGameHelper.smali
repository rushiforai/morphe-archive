.class public abstract Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$e;,
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$ErrorEnum;
    }
.end annotation


# static fields
.field public static j:J


# instance fields
.field public a:Lcom/p1/mobile/android/app/Act;

.field public b:Ljava/lang/String;

.field public final c:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;

.field public final d:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;

.field public e:Z

.field public f:Landroid/view/View;

.field public g:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel;

.field public h:I

.field public final i:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->c:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;

    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->d:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;

    .line 17
    .line 18
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel;

    .line 19
    .line 20
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->g:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel;

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->h:I

    .line 27
    .line 28
    new-instance v0, Ll/bm2;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/bm2;-><init>(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->i:Ljava/lang/Runnable;

    .line 34
    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->a:Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->r()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->e:Z

    return p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$ErrorEnum;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->g(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$ErrorEnum;)V

    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;Lcom/p1/mobile/android/app/Act;JLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->p(Lcom/p1/mobile/android/app/Act;JLjava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;J)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->s(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;J)V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;Ltech/sud/gip/core/ISudFSMStateHandle;II)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->u(Ltech/sud/gip/core/ISudFSMStateHandle;II)V

    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;Ltech/sud/gip/core/ISudFSMStateHandle;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->o()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->i()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    new-instance v2, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$c;

    .line 10
    .line 11
    invoke-direct {v2, p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$c;-><init>(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;Ltech/sud/gip/core/ISudFSMStateHandle;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->k(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$e;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public B(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->g:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p1, p0}, Ltech/sud/gip/core/ISudFSMStateHandle;->success(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public C(Landroid/view/View;Ltech/sud/gip/core/ISudFSMStateHandle;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    if-lez v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, p2, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->u(Ltech/sud/gip/core/ISudFSMStateHandle;II)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$d;

    .line 22
    .line 23
    invoke-direct {v1, p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$d;-><init>(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;Landroid/view/View;Ltech/sud/gip/core/ISudFSMStateHandle;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public D(Ljava/lang/String;J)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->q()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const-string p0, "gameRoomId can not be empty"

    .line 14
    .line 15
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    sget-wide v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->j:J

    .line 20
    .line 21
    cmp-long v0, v0, p2

    .line 22
    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->b:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    :cond_1
    return-void

    .line 34
    :cond_2
    sget-object v0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 35
    .line 36
    const-string v1, "sud_game_loading"

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ll/lej0;->d(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    const/4 v0, 0x1

    .line 42
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->e:Z

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->h()V

    .line 45
    .line 46
    .line 47
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->b:Ljava/lang/String;

    .line 48
    .line 49
    sput-wide p2, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->j:J

    .line 50
    .line 51
    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->t(J)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final g(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$ErrorEnum;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->h:I

    .line 5
    .line 6
    add-int/lit8 v0, v0, 0x1

    .line 7
    .line 8
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->h:I

    .line 9
    .line 10
    const/4 v1, 0x2

    .line 11
    if-gt v0, v1, :cond_1

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->i:Ljava/lang/Runnable;

    .line 14
    .line 15
    invoke-static {p1}, Ll/l51;->o(Ljava/lang/Runnable;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->a:Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->i:Ljava/lang/Runnable;

    .line 24
    .line 25
    const-wide/16 v0, 0x7d0

    .line 26
    .line 27
    invoke-static {p1, p0, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void

    .line 31
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$ErrorEnum;->INIT_SDK_ERROR:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$ErrorEnum;

    .line 32
    .line 33
    if-eq p1, v0, :cond_2

    .line 34
    .line 35
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$ErrorEnum;->LOAD_MG_ERROR:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$ErrorEnum;

    .line 36
    .line 37
    if-ne p1, v0, :cond_3

    .line 38
    .line 39
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 40
    .line 41
    new-instance v1, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    const-string v2, "intl live sud game error"

    .line 44
    .line 45
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string p1, "  gameId:"

    .line 56
    .line 57
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    sget-wide v2, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->j:J

    .line 61
    .line 62
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    const-string p1, "\u56fd\u9645\u5316\u4e09\u65b9\u6e38\u620fsdk\u521d\u59cb\u5316\u9519\u8bef"

    .line 73
    .line 74
    sget-object v1, Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;->p9:Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;

    .line 75
    .line 76
    invoke-static {v0, p1, v1}, Lcom/tantanapp/common/utils/CrashHelper;->e(Ljava/lang/Throwable;Ljava/lang/String;Lcom/tantanapp/common/utils/CrashHelper$ReportLevel;)V

    .line 77
    .line 78
    .line 79
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->w()V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public final h()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->i:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    sget-wide v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->j:J

    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    if-lez v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->c:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->destroyMG()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->d:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;->destroyMG()V

    .line 22
    .line 23
    .line 24
    sput-wide v2, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->j:J

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->f:Landroid/view/View;

    .line 28
    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->b:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->y()V

    .line 32
    .line 33
    .line 34
    :cond_0
    const/4 v0, 0x0

    .line 35
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->h:I

    .line 36
    .line 37
    return-void
.end method

.method public abstract i()Ljava/lang/String;
.end method

.method public abstract j()Ljava/lang/String;
.end method

.method public abstract k(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$e;)V
.end method

.method public abstract l(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel;)V
.end method

.method public abstract m()Ljava/lang/String;
.end method

.method public n()Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->d:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;->getSudFSMMGCache()Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGCache;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public abstract o()Ljava/lang/String;
.end method

.method public onExpireCode(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->c:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;

    .line 2
    .line 3
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->A(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;Ltech/sud/gip/core/ISudFSMStateHandle;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onGameDestroyed()V
    .locals 0

    return-void
.end method

.method public onGameStarted()V
    .locals 0

    return-void
.end method

.method public onGetGameCfg(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->B(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onGetGameViewInfo(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->f:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->C(Landroid/view/View;Ltech/sud/gip/core/ISudFSMStateHandle;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final p(Lcom/p1/mobile/android/app/Act;JLjava/lang/String;)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->i()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->j()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    new-instance v2, Ltech/sud/gip/core/SudInitSDKParamModel;

    .line 10
    .line 11
    invoke-direct {v2}, Ltech/sud/gip/core/SudInitSDKParamModel;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, v2, Ltech/sud/gip/core/SudInitSDKParamModel;->context:Landroid/content/Context;

    .line 15
    .line 16
    iput-object v0, v2, Ltech/sud/gip/core/SudInitSDKParamModel;->appId:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v1, v2, Ltech/sud/gip/core/SudInitSDKParamModel;->appKey:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->q()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iput-boolean v0, v2, Ltech/sud/gip/core/SudInitSDKParamModel;->isTestEnv:Z

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->o()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, v2, Ltech/sud/gip/core/SudInitSDKParamModel;->userId:Ljava/lang/String;

    .line 31
    .line 32
    new-instance v3, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$b;

    .line 33
    .line 34
    move-object v4, p0

    .line 35
    move-object v5, p1

    .line 36
    move-wide v7, p2

    .line 37
    move-object v6, p4

    .line 38
    invoke-direct/range {v3 .. v8}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;J)V

    .line 39
    .line 40
    .line 41
    invoke-static {v2, v3}, Ltech/sud/mgp/core/SudMGP;->initSDK(Ltech/sud/gip/core/SudInitSDKParamModel;Ltech/sud/gip/core/ISudListenerInitSDK;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public abstract q()Z
.end method

.method public final synthetic r()V
    .locals 2

    .line 1
    sget-wide v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->j:J

    .line 2
    .line 3
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->t(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final s(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;J)V
    .locals 9

    .line 1
    invoke-virtual {p1}, Landroid/app/Activity;->isDestroyed()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_3

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->e:Z

    .line 8
    .line 9
    if-eqz v0, :cond_3

    .line 10
    .line 11
    sget-wide v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->j:J

    .line 12
    .line 13
    cmp-long v0, p3, v0

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->d:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;->setSudFSMMGListener(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->o()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->b:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->m()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v7

    .line 33
    iget-object v8, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->d:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGDecorator;

    .line 34
    .line 35
    move-object v1, p1

    .line 36
    move-object v4, p2

    .line 37
    move-wide v5, p3

    .line 38
    invoke-static/range {v1 .. v8}, Ltech/sud/mgp/core/SudMGP;->loadMG(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ltech/sud/gip/core/ISudFSMMG;)Ltech/sud/gip/core/ISudFSTAPP;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    if-nez p1, :cond_2

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->q()Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_1

    .line 49
    .line 50
    const-string p1, "loadMG params error"

    .line 51
    .line 52
    invoke-static {p1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$ErrorEnum;->LOAD_MG_ERROR:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$ErrorEnum;

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->g(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$ErrorEnum;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->c:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;

    .line 62
    .line 63
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->setISudFSTAPP(Ltech/sud/gip/core/ISudFSTAPP;)V

    .line 64
    .line 65
    .line 66
    invoke-interface {p1}, Ltech/sud/gip/core/ISudFSTAPP;->getGameView()Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->f:Landroid/view/View;

    .line 71
    .line 72
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->v(Landroid/view/View;)V

    .line 73
    .line 74
    .line 75
    :cond_3
    :goto_0
    return-void
.end method

.method public final t(J)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const-wide/16 v0, 0x0

    .line 10
    .line 11
    cmp-long v0, p1, v0

    .line 12
    .line 13
    if-gtz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->o()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->i()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    new-instance v2, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$a;

    .line 25
    .line 26
    invoke-direct {v2, p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;J)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->k(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$e;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    :goto_0
    return-void
.end method

.method public final u(Ltech/sud/gip/core/ISudFSMStateHandle;II)V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    iput v1, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel;->ret_code:I

    .line 8
    .line 9
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel;->view_size:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel$GameViewSizeModel;

    .line 10
    .line 11
    iput p2, v1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel$GameViewSizeModel;->width:I

    .line 12
    .line 13
    iput p3, v1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel$GameViewSizeModel;->height:I

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->l(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/utils/SudJsonUtils;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p1, p0}, Ltech/sud/gip/core/ISudFSMStateHandle;->success(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public abstract v(Landroid/view/View;)V
.end method

.method public w()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->e:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->h()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public x()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->c:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->pauseMG()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public abstract y()V
.end method

.method public z()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->c:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->playMG()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
