.class public final Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000N\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0010\t\n\u0002\u0008\u0004\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\r\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0005\u0010\u0003J\r\u0010\u0006\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0003J%\u0010\r\u001a\u00020\u00042\u0006\u0010\u0008\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u000c\u001a\u00020\u000b\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u001f\u0010\u0013\u001a\u00020\u00042\u0006\u0010\u0010\u001a\u00020\u000f2\u0008\u0010\u0012\u001a\u0004\u0018\u00010\u0011\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u000f\u0010\u0015\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\u0015\u0010\u0003R\u0014\u0010\u0019\u001a\u00020\u00168\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0017\u0010\u0018R\u0018\u0010\u001d\u001a\u0004\u0018\u00010\u001a8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001b\u0010\u001cR\u001b\u0010\"\u001a\u00020\u000f8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u001e\u0010\u001f\u001a\u0004\u0008 \u0010!R\u0016\u0010&\u001a\u00020#8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008$\u0010%\u00a8\u0006\'"
    }
    d2 = {
        "Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;",
        "",
        "<init>",
        "()V",
        "",
        "n",
        "l",
        "Landroid/app/Activity;",
        "activity",
        "",
        "surveyToken",
        "",
        "forceComplete",
        "r",
        "(Landroid/app/Activity;Ljava/lang/String;Z)V",
        "",
        "resultCode",
        "Landroid/content/Intent;",
        "data",
        "o",
        "(ILandroid/content/Intent;)V",
        "i",
        "Ll/hdh0;",
        "a",
        "Ll/hdh0;",
        "api",
        "Lcom/p1/mobile/putong/data/SurveyData;",
        "b",
        "Lcom/p1/mobile/putong/data/SurveyData;",
        "surveyData",
        "c",
        "Lkotlin/Lazy;",
        "m",
        "()I",
        "surveyInterval",
        "",
        "d",
        "J",
        "lastFetchTime",
        "putong-common_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# static fields
.field public static final INSTANCE:Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final a:Ll/hdh0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static b:Lcom/p1/mobile/putong/data/SurveyData;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public static final c:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static d:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;->INSTANCE:Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;

    .line 7
    .line 8
    new-instance v0, Ll/hdh0;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/hdh0;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;->a:Ll/hdh0;

    .line 14
    .line 15
    new-instance v0, Ll/idh0;

    .line 16
    .line 17
    invoke-direct {v0}, Ll/idh0;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sput-object v0, Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;->c:Lkotlin/Lazy;

    .line 25
    .line 26
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

.method public static synthetic a(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;->k(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic b(Ljava/lang/Object;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;->p(Ljava/lang/Object;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;->t(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)V

    return-void
.end method

.method public static d()I
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "intl_survey_check_interval"

    .line 6
    .line 7
    const/16 v2, 0xe10

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->z(Ljava/lang/String;I)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    mul-int/lit16 v0, v0, 0x3e8

    .line 14
    .line 15
    return v0
.end method

.method public static synthetic e(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;->q(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic f(Ljava/lang/Object;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;->s(Ljava/lang/Object;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/data/SurveySparrowData;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;->j(Lcom/p1/mobile/putong/data/SurveySparrowData;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic h(Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;->i()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final j(Lcom/p1/mobile/putong/data/SurveySparrowData;)Lkotlin/Unit;
    .locals 3

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SurveySparrowData;->data:Lcom/p1/mobile/putong/data/SurveyData;

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SurveyData;->token:Ljava/lang/String;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-lez v1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    :goto_0
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 28
    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Landroid/app/Activity;

    .line 36
    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SurveySparrowData;->data:Lcom/p1/mobile/putong/data/SurveyData;

    .line 40
    .line 41
    sput-object p0, Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;->b:Lcom/p1/mobile/putong/data/SurveyData;

    .line 42
    .line 43
    sget-object v2, Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;->INSTANCE:Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;

    .line 44
    .line 45
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/SurveyData;->forceComplete:Z

    .line 46
    .line 47
    invoke-virtual {v2, v1, v0, p0}, Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;->r(Landroid/app/Activity;Ljava/lang/String;Z)V

    .line 48
    .line 49
    .line 50
    :cond_1
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 51
    .line 52
    return-object p0
.end method

.method public static final k(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final p(Ljava/lang/Object;)Lkotlin/Unit;
    .locals 0

    .line 1
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final q(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final s(Ljava/lang/Object;)Lkotlin/Unit;
    .locals 0

    .line 1
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final t(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final i()V
    .locals 4

    .line 1
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/bn5;->signedIn_()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    sget-wide v2, Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;->d:J

    .line 14
    .line 15
    sub-long/2addr v0, v2

    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;->m()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    int-to-long v2, p0

    .line 21
    cmp-long p0, v0, v2

    .line 22
    .line 23
    if-lez p0, :cond_1

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 32
    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    check-cast p0, Landroid/app/Activity;

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    const/4 p0, 0x0

    .line 43
    :goto_0
    instance-of p0, p0, Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    if-eqz p0, :cond_1

    .line 46
    .line 47
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 48
    .line 49
    .line 50
    move-result-wide v0

    .line 51
    sput-wide v0, Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;->d:J

    .line 52
    .line 53
    :try_start_0
    sget-object p0, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 54
    .line 55
    sget-object p0, Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;->a:Ll/hdh0;

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/hdh0;->D()Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    new-instance v0, Ll/jdh0;

    .line 62
    .line 63
    invoke-direct {v0}, Ll/jdh0;-><init>()V

    .line 64
    .line 65
    .line 66
    new-instance v1, Ll/kdh0;

    .line 67
    .line 68
    invoke-direct {v1, v0}, Ll/kdh0;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-static {p0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :catchall_0
    move-exception p0

    .line 80
    sget-object v0, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 81
    .line 82
    invoke-static {p0}, Lkotlin/ResultKt;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-static {p0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    :cond_1
    return-void
.end method

.method public final l()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    sput-wide v0, Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;->d:J

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;->i()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final m()I
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;->c:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Number;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public final n()V
    .locals 1

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper$initSurvey$appLifecycleObserver$1;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper$initSurvey$appLifecycleObserver$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Landroidx/lifecycle/o;->Companion:Landroidx/lifecycle/o$b;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroidx/lifecycle/o$b;->a()Ll/ker;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Ll/ker;->getLifecycle()Landroidx/lifecycle/Lifecycle;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0, p0}, Landroidx/lifecycle/Lifecycle;->a(Ll/jer;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final o(ILandroid/content/Intent;)V
    .locals 0
    .param p2    # Landroid/content/Intent;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 p0, -0x1

    .line 2
    if-ne p1, p0, :cond_2

    .line 3
    .line 4
    if-eqz p2, :cond_2

    .line 5
    .line 6
    sget-object p0, Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;->b:Lcom/p1/mobile/putong/data/SurveyData;

    .line 7
    .line 8
    if-eqz p0, :cond_2

    .line 9
    .line 10
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/SurveyData;->forceComplete:Z

    .line 11
    .line 12
    const/4 p1, 0x1

    .line 13
    if-ne p0, p1, :cond_2

    .line 14
    .line 15
    :try_start_0
    sget-object p0, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 16
    .line 17
    sget-object p0, Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;->a:Ll/hdh0;

    .line 18
    .line 19
    sget-object p1, Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;->b:Lcom/p1/mobile/putong/data/SurveyData;

    .line 20
    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SurveyData;->token:Ljava/lang/String;

    .line 24
    .line 25
    if-nez p1, :cond_1

    .line 26
    .line 27
    :cond_0
    const-string p1, ""

    .line 28
    .line 29
    :cond_1
    invoke-virtual {p0, p1}, Ll/hdh0;->F(Ljava/lang/String;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    new-instance p1, Ll/ldh0;

    .line 34
    .line 35
    invoke-direct {p1}, Ll/ldh0;-><init>()V

    .line 36
    .line 37
    .line 38
    new-instance p2, Ll/mdh0;

    .line 39
    .line 40
    invoke-direct {p2, p1}, Ll/mdh0;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, p2}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-static {p0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :catchall_0
    move-exception p0

    .line 52
    sget-object p1, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 53
    .line 54
    invoke-static {p0}, Lkotlin/ResultKt;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-static {p0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    :cond_2
    return-void
.end method

.method public final r(Landroid/app/Activity;Ljava/lang/String;Z)V
    .locals 4
    .param p1    # Landroid/app/Activity;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    const-string p0, "male"

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    invoke-static {p2}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto/16 :goto_6

    .line 16
    .line 17
    :cond_0
    :try_start_0
    new-instance v0, Lcom/surveysparrow/ss_android_sdk/SsSurvey;

    .line 18
    .line 19
    const-string v1, "hello8253.surveysparrow.com"

    .line 20
    .line 21
    invoke-direct {v0, v1, p2}, Lcom/surveysparrow/ss_android_sdk/SsSurvey;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    :try_start_1
    sget-object v1, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 25
    .line 26
    sget-object v1, Ll/uqb0;->c0:Ll/bn5;

    .line 27
    .line 28
    invoke-interface {v1}, Ll/bn5;->me_()Lcom/p1/mobile/putong/data/User;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    if-eqz v1, :cond_8

    .line 33
    .line 34
    const-string v2, "publicID"

    .line 35
    .line 36
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v0, v2, v3}, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->addCustomParam(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/surveysparrow/ss_android_sdk/SsSurvey;

    .line 39
    .line 40
    .line 41
    const-string v2, "age"

    .line 42
    .line 43
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 44
    .line 45
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-virtual {v0, v2, v3}, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->addCustomParam(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/surveysparrow/ss_android_sdk/SsSurvey;

    .line 54
    .line 55
    .line 56
    const-string v2, "name"

    .line 57
    .line 58
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v0, v2, v3}, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->addCustomParam(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/surveysparrow/ss_android_sdk/SsSurvey;

    .line 61
    .line 62
    .line 63
    const-string v2, "gender"

    .line 64
    .line 65
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 66
    .line 67
    invoke-static {v3, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    if-eqz v3, :cond_1

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_1
    const-string p0, "female"

    .line 75
    .line 76
    :goto_0
    invoke-virtual {v0, v2, p0}, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->addCustomParam(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/surveysparrow/ss_android_sdk/SsSurvey;

    .line 77
    .line 78
    .line 79
    const-string p0, "userEmail"

    .line 80
    .line 81
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 82
    .line 83
    const-string v3, ""

    .line 84
    .line 85
    if-eqz v2, :cond_2

    .line 86
    .line 87
    :try_start_2
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Settings;->email:Ljava/lang/String;

    .line 88
    .line 89
    if-nez v2, :cond_3

    .line 90
    .line 91
    goto :goto_1

    .line 92
    :catchall_0
    move-exception p0

    .line 93
    goto :goto_4

    .line 94
    :cond_2
    :goto_1
    move-object v2, v3

    .line 95
    :cond_3
    invoke-virtual {v0, p0, v2}, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->addCustomParam(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/surveysparrow/ss_android_sdk/SsSurvey;

    .line 96
    .line 97
    .line 98
    const-string p0, "countryCode"

    .line 99
    .line 100
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 101
    .line 102
    if-eqz v2, :cond_4

    .line 103
    .line 104
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 105
    .line 106
    if-eqz v2, :cond_4

    .line 107
    .line 108
    iget v2, v2, Lcom/p1/mobile/putong/data/PhoneNumber;->countryCode:I

    .line 109
    .line 110
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    if-nez v2, :cond_5

    .line 115
    .line 116
    :cond_4
    move-object v2, v3

    .line 117
    :cond_5
    invoke-virtual {v0, p0, v2}, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->addCustomParam(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/surveysparrow/ss_android_sdk/SsSurvey;

    .line 118
    .line 119
    .line 120
    const-string p0, "phoneNumber"

    .line 121
    .line 122
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 123
    .line 124
    if-eqz v2, :cond_7

    .line 125
    .line 126
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 127
    .line 128
    if-eqz v2, :cond_7

    .line 129
    .line 130
    iget-object v2, v2, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 131
    .line 132
    if-nez v2, :cond_6

    .line 133
    .line 134
    goto :goto_2

    .line 135
    :cond_6
    move-object v3, v2

    .line 136
    :cond_7
    :goto_2
    invoke-virtual {v0, p0, v3}, Lcom/surveysparrow/ss_android_sdk/SsSurvey;->addCustomParam(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/surveysparrow/ss_android_sdk/SsSurvey;

    .line 137
    .line 138
    .line 139
    goto :goto_3

    .line 140
    :cond_8
    const/4 v1, 0x0

    .line 141
    :goto_3
    invoke-static {v1}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 142
    .line 143
    .line 144
    goto :goto_5

    .line 145
    :goto_4
    :try_start_3
    sget-object v1, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 146
    .line 147
    invoke-static {p0}, Lkotlin/ResultKt;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    invoke-static {p0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    :goto_5
    new-instance p0, Lcom/surveysparrow/ss_android_sdk/c;

    .line 155
    .line 156
    invoke-direct {p0, p1, v0}, Lcom/surveysparrow/ss_android_sdk/c;-><init>(Landroid/app/Activity;Lcom/surveysparrow/ss_android_sdk/SsSurvey;)V

    .line 157
    .line 158
    .line 159
    const/4 p1, 0x1

    .line 160
    invoke-virtual {p0, p1}, Lcom/surveysparrow/ss_android_sdk/c;->a(Z)Lcom/surveysparrow/ss_android_sdk/c;

    .line 161
    .line 162
    .line 163
    const/16 p1, 0x4da

    .line 164
    .line 165
    invoke-virtual {p0, p1}, Lcom/surveysparrow/ss_android_sdk/c;->d(I)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 166
    .line 167
    .line 168
    if-nez p3, :cond_9

    .line 169
    .line 170
    :try_start_4
    sget-object p0, Lcom/p1/mobile/putong/app/surveysparrow/SurveySparrowHelper;->a:Ll/hdh0;

    .line 171
    .line 172
    invoke-virtual {p0, p2}, Ll/hdh0;->F(Ljava/lang/String;)Lrx/c;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    new-instance p1, Ll/ndh0;

    .line 177
    .line 178
    invoke-direct {p1}, Ll/ndh0;-><init>()V

    .line 179
    .line 180
    .line 181
    new-instance p2, Ll/odh0;

    .line 182
    .line 183
    invoke-direct {p2, p1}, Ll/odh0;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {p0, p2}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 187
    .line 188
    .line 189
    move-result-object p0

    .line 190
    invoke-static {p0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 191
    .line 192
    .line 193
    goto :goto_6

    .line 194
    :catchall_1
    move-exception p0

    .line 195
    :try_start_5
    sget-object p1, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 196
    .line 197
    invoke-static {p0}, Lkotlin/ResultKt;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    invoke-static {p0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 202
    .line 203
    .line 204
    goto :goto_6

    .line 205
    :catch_0
    move-exception p0

    .line 206
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 207
    .line 208
    .line 209
    :cond_9
    :goto_6
    return-void
.end method
