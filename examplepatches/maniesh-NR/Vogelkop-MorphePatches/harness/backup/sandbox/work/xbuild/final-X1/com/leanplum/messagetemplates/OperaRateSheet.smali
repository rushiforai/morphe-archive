.class public final Lcom/leanplum/messagetemplates/OperaRateSheet;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000x\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u00c7\u0002\u0018\u00002\u00020\u0001:\u0001.B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0017\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0007\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J?\u0010\u0013\u001a\u00020\u00062\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u000c\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u0011H\u0002\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J9\u0010\u001c\u001a\u00020\u00062\u0006\u0010\u0016\u001a\u00020\u00152\u0006\u0010\u0012\u001a\u00020\u00112\u0018\u0010\u001b\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0019\u0012\u0004\u0012\u00020\u001a0\u00180\u0017H\u0002\u00a2\u0006\u0004\u0008\u001c\u0010\u001dJG\u0010!\u001a\u00020\u00062\u0006\u0010\u001f\u001a\u00020\u001e2\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u000c\u001a\u00020\u000b2\u0006\u0010\u0016\u001a\u00020\u00152\u0006\u0010 \u001a\u00020\u00192\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0010\u001a\u00020\u000fH\u0002\u00a2\u0006\u0004\u0008!\u0010\"J\u0013\u0010%\u001a\u00020$*\u00020#H\u0002\u00a2\u0006\u0004\u0008%\u0010&R\u0014\u0010(\u001a\u00020\'8\u0002X\u0082T\u00a2\u0006\u0006\n\u0004\u0008(\u0010)R\u0014\u0010*\u001a\u00020\'8\u0002X\u0082T\u00a2\u0006\u0006\n\u0004\u0008*\u0010)R\u0014\u0010,\u001a\u00020+8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008,\u0010-\u00a8\u0006/"
    }
    d2 = {
        "Lcom/leanplum/messagetemplates/OperaRateSheet;",
        "",
        "<init>",
        "()V",
        "Lorm;",
        "usageReporter",
        "",
        "register",
        "(Lorm;)V",
        "Landroid/app/Activity;",
        "activity",
        "Lqjh;",
        "rateFlowStarter",
        "Lcom/leanplum/ActionContext;",
        "actionContext",
        "Lskm;",
        "unfilteredUsageReporter",
        "Lu55;",
        "clock",
        "initiateRateSheet",
        "(Landroid/app/Activity;Lqjh;Lcom/leanplum/ActionContext;Lorm;Lskm;Lu55;)V",
        "La2i;",
        "reviewManager",
        "Lcom/opera/api/Callback;",
        "Ltw7;",
        "Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;",
        "Lx1i;",
        "callback",
        "requestReviewInfo",
        "(La2i;Lu55;Lcom/opera/api/Callback;)V",
        "Landroid/content/Context;",
        "context",
        "reviewInfo",
        "onReviewInfo",
        "(Landroid/content/Context;Lcom/leanplum/ActionContext;Lqjh;La2i;Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;Lorm;Lskm;)V",
        "Leo0;",
        "Lvb0;",
        "toDialogAction",
        "(Leo0;)Lvb0;",
        "",
        "NAME",
        "Ljava/lang/String;",
        "TAG",
        "Lpn7;",
        "REVIEW_INFO_FETCH_TIMEOUT",
        "J",
        "TimedReviewInfo",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final $stable:I = 0x0

.field public static final INSTANCE:Lcom/leanplum/messagetemplates/OperaRateSheet;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final NAME:Ljava/lang/String; = "Rate Dialog"
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final REVIEW_INFO_FETCH_TIMEOUT:J

.field private static final TAG:Ljava/lang/String; = "OperaRateSheet"
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lcom/leanplum/messagetemplates/OperaRateSheet;

    invoke-direct {v0}, Lcom/leanplum/messagetemplates/OperaRateSheet;-><init>()V

    sput-object v0, Lcom/leanplum/messagetemplates/OperaRateSheet;->INSTANCE:Lcom/leanplum/messagetemplates/OperaRateSheet;

    sget-object v0, Lpn7;->b:Lon7;

    const/4 v0, 0x3

    sget-object v1, Lun7;->e:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lcom/leanplum/messagetemplates/OperaRateSheet;->REVIEW_INFO_FETCH_TIMEOUT:J

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic a(Landroid/app/Activity;Lcom/leanplum/ActionContext;Lqjh;Lmcj;Lorm;Lskm;Ltw7;)V
    .registers 7

    invoke-static/range {p0 .. p6}, Lcom/leanplum/messagetemplates/OperaRateSheet;->initiateRateSheet$lambda$0(Landroid/app/Activity;Lcom/leanplum/ActionContext;Lqjh;La2i;Lorm;Lskm;Ltw7;)V

    return-void
.end method

.method public static final synthetic access$initiateRateSheet(Lcom/leanplum/messagetemplates/OperaRateSheet;Landroid/app/Activity;Lqjh;Lcom/leanplum/ActionContext;Lorm;Lskm;Lu55;)V
    .registers 7

    invoke-direct/range {p0 .. p6}, Lcom/leanplum/messagetemplates/OperaRateSheet;->initiateRateSheet(Landroid/app/Activity;Lqjh;Lcom/leanplum/ActionContext;Lorm;Lskm;Lu55;)V

    return-void
.end method

.method public static synthetic b(Lu55;JLcom/opera/api/Callback;Lcom/google/android/gms/tasks/Task;)V
    .registers 5

    invoke-static {p0, p1, p2, p3, p4}, Lcom/leanplum/messagetemplates/OperaRateSheet;->requestReviewInfo$lambda$0(Lu55;JLcom/opera/api/Callback;Lcom/google/android/gms/tasks/Task;)V

    return-void
.end method

.method public static synthetic c(Landroid/content/Context;Lcom/leanplum/ActionContext;Lorm;Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;Lskm;Lpjh;)V
    .registers 6

    invoke-static/range {p0 .. p5}, Lcom/leanplum/messagetemplates/OperaRateSheet;->onReviewInfo$lambda$0(Landroid/content/Context;Lcom/leanplum/ActionContext;Lorm;Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;Lskm;Lpjh;)V

    return-void
.end method

.method private final initiateRateSheet(Landroid/app/Activity;Lqjh;Lcom/leanplum/ActionContext;Lorm;Lskm;Lu55;)V
    .registers 16

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-nez v0, :cond_7

    move-object v0, p1

    :cond_7
    new-instance v5, Lmcj;

    new-instance v1, Lctp;

    invoke-direct {v1, v0}, Lctp;-><init>(Landroid/content/Context;)V

    invoke-direct {v5, v1}, Lmcj;-><init>(Lctp;)V

    new-instance v1, Lqe9;

    const/4 v8, 0x1

    move-object v2, p1

    move-object v4, p2

    move-object v3, p3

    move-object v6, p4

    move-object v7, p5

    invoke-direct/range {v1 .. v8}, Lqe9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {p0, v5, p6, v1}, Lcom/leanplum/messagetemplates/OperaRateSheet;->requestReviewInfo(La2i;Lu55;Lcom/opera/api/Callback;)V

    return-void
.end method

.method private static final initiateRateSheet$lambda$0(Landroid/app/Activity;Lcom/leanplum/ActionContext;Lqjh;La2i;Lorm;Lskm;Ltw7;)V
    .registers 15

    instance-of v0, p6, Lrw7;

    if-eqz v0, :cond_25

    check-cast p6, Lrw7;

    iget-object p0, p6, Lrw7;->a:Ljava/lang/Object;

    check-cast p0, Lx1i;

    iget-object p2, p0, Lx1i;->a:Ljava/lang/String;

    check-cast p4, Lx5f;

    const/16 p3, 0xb

    invoke-virtual {p4, p3, p2}, Lx5f;->R(ILjava/lang/String;)V

    iget-object p0, p0, Lx1i;->a:Ljava/lang/String;

    const-string p2, "Review error: "

    invoke-virtual {p2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    sget-object p2, Leg0;->f:Leg0;

    invoke-virtual {p1}, Lcom/leanplum/internal/BaseActionContext;->getMessageId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p4, p0, p2, p1}, Lx5f;->p0(Ljava/lang/String;Leg0;Ljava/lang/String;)V

    return-void

    :cond_25
    instance-of v0, p6, Lsw7;

    if-eqz v0, :cond_3c

    check-cast p6, Lsw7;

    iget-object p6, p6, Lsw7;->a:Ljava/lang/Object;

    move-object v5, p6

    check-cast v5, Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;

    sget-object v0, Lcom/leanplum/messagetemplates/OperaRateSheet;->INSTANCE:Lcom/leanplum/messagetemplates/OperaRateSheet;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v6, p4

    move-object v7, p5

    invoke-direct/range {v0 .. v7}, Lcom/leanplum/messagetemplates/OperaRateSheet;->onReviewInfo(Landroid/content/Context;Lcom/leanplum/ActionContext;Lqjh;La2i;Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;Lorm;Lskm;)V

    return-void

    :cond_3c
    invoke-static {}, Lh9o;->p()V

    return-void
.end method

.method private final onReviewInfo(Landroid/content/Context;Lcom/leanplum/ActionContext;Lqjh;La2i;Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;Lorm;Lskm;)V
    .registers 15

    invoke-static {p1}, Ltjh;->a(Landroid/content/Context;)Ltjh;

    move-result-object p0

    iget-object p0, p0, Ltjh;->a:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "lastShown"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-interface {p0, v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    new-instance p0, Ls9i;

    new-instance v0, Lrxh;

    const v1, 0x7f1401b7

    invoke-direct {v0, v1}, Lrxh;-><init>(I)V

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    new-instance v1, Lsxh;

    const v2, 0x7f140d86

    invoke-direct {v1, v2, v0}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    new-instance v0, Lqxh;

    const-string v2, ""

    invoke-direct {v0, v2}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-direct {p0, v1, v0}, Ls9i;-><init>(Lpxh;Lpxh;)V

    new-instance v0, Lxbf;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lxbf;-><init>(B)V

    move-object v3, p2

    move-object p2, p3

    new-instance p3, La87;

    const/4 v1, 0x1

    invoke-direct {p3, p0, v0, v1}, La87;-><init>(Ls9i;Lxbf;B)V

    move-object v5, p5

    invoke-virtual {v5}, Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;->getReviewInfo()Lz1i;

    move-result-object p5

    new-instance v1, Lcom/leanplum/messagetemplates/a;

    move-object v2, p1

    move-object v4, p6

    move-object v6, p7

    invoke-direct/range {v1 .. v6}, Lcom/leanplum/messagetemplates/a;-><init>(Landroid/content/Context;Lcom/leanplum/ActionContext;Lorm;Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;Lskm;)V

    move-object p6, v1

    iget-object p0, p2, Lqjh;->b:Lew3;

    invoke-virtual {p0}, Lew3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqim;

    new-instance p1, Lai;

    const/4 p7, 0x6

    invoke-direct/range {p1 .. p7}, Lai;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p3, p0, p1}, La87;->s0(Lqim;Lai;)V

    return-void
.end method

.method private static final onReviewInfo$lambda$0(Landroid/content/Context;Lcom/leanplum/ActionContext;Lorm;Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;Lskm;Lpjh;)V
    .registers 19

    move-object/from16 v0, p5

    iget-object v1, v0, Lpjh;->b:Leo0;

    iget-object v3, v0, Lpjh;->b:Leo0;

    sget-object v2, Leo0;->e:Leo0;

    if-eq v1, v2, :cond_1c

    invoke-static {p0}, Ltjh;->a(Landroid/content/Context;)Ltjh;

    move-result-object v1

    iget-object v1, v1, Ltjh;->a:Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    const-string v2, "hasRated"

    const/4 v4, 0x1

    invoke-static {v1, v2, v4}, Lcom/appsflyer/internal/j;->d(Landroid/content/SharedPreferences;Ljava/lang/String;Z)V

    :cond_1c
    sget-object v1, Lcom/leanplum/messagetemplates/OperaRateSheet;->INSTANCE:Lcom/leanplum/messagetemplates/OperaRateSheet;

    invoke-direct {v1, v3}, Lcom/leanplum/messagetemplates/OperaRateSheet;->toDialogAction(Leo0;)Lvb0;

    move-result-object v1

    sget-object v2, Lvb0;->b:Lvb0;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_34

    const/4 v8, 0x0

    const/4 v9, 0x0

    const-string v5, "Primary Action"

    const-wide/16 v6, 0x0

    move-object v4, p1

    invoke-virtual/range {v4 .. v9}, Lcom/leanplum/ActionContext;->trackMessageEvent(Ljava/lang/String;DLjava/lang/String;Ljava/util/Map;)V

    :cond_34
    iget-object v4, v0, Lpjh;->a:Lee0;

    invoke-static {p0}, Lxi5;->a(Landroid/content/Context;)Lxi5;

    move-result-object v2

    invoke-virtual {v2}, Lxi5;->b()J

    move-result-wide v5

    invoke-static {p0}, Loji;->y(Landroid/content/Context;)Loji;

    move-result-object p0

    iget-object p0, p0, Loji;->a:Ljava/lang/Object;

    check-cast p0, Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v2, "TOTAL_PAGE_LOADS"

    const/4 v7, 0x0

    invoke-interface {p0, v2, v7}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    int-to-long v7, p0

    invoke-virtual/range {p3 .. p3}, Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;->getFetchTime-UwyO8pc()J

    move-result-wide v9

    invoke-static {v9, v10}, Lpn7;->f(J)J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    iget-object p0, v0, Lpjh;->d:Ljava/lang/Integer;

    if-eqz p0, :cond_6f

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    int-to-long v11, p0

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    :goto_6d
    move-object v11, p0

    goto :goto_71

    :cond_6f
    const/4 p0, 0x0

    goto :goto_6d

    :goto_71
    move-object v2, p2

    check-cast v2, Lx5f;

    const/4 v9, 0x1

    sget-object v12, Lho0;->c:Lho0;

    invoke-virtual/range {v2 .. v12}, Lx5f;->u0(Leo0;Lee0;JJZLjava/lang/Long;Ljava/lang/Long;Lho0;)V

    iget-object p0, v0, Lpjh;->c:Ljava/lang/String;

    move-object/from16 p2, p4

    check-cast p2, Lx5f;

    invoke-virtual {p2, p0}, Lx5f;->t0(Ljava/lang/String;)V

    sget-object v9, Ldg0;->b:Ldg0;

    invoke-virtual {p1}, Lcom/leanplum/internal/BaseActionContext;->getMessageId()Ljava/lang/String;

    move-result-object v10

    sget-object v5, Lgg0;->h:Lgg0;

    const-wide/16 v7, 0x2

    move-object v6, v1

    move-object v4, v2

    invoke-virtual/range {v4 .. v10}, Lx5f;->Y(Lgg0;Lvb0;JLdg0;Ljava/lang/String;)V

    return-void
.end method

.method public static final register(Lorm;)V
    .registers 4
    .param p0    # Lorm;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    new-instance v0, Lcom/leanplum/ActionArgs;

    invoke-direct {v0}, Lcom/leanplum/ActionArgs;-><init>()V

    new-instance v1, Lcom/leanplum/messagetemplates/OperaRateSheet$register$1;

    invoke-direct {v1, p0}, Lcom/leanplum/messagetemplates/OperaRateSheet$register$1;-><init>(Lorm;)V

    const-string p0, "Rate Dialog"

    const/4 v2, 0x3

    invoke-static {p0, v2, v0, v1}, Lcom/leanplum/Leanplum;->defineAction(Ljava/lang/String;ILcom/leanplum/ActionArgs;Lcom/leanplum/callbacks/ActionCallback;)V

    return-void
.end method

.method private final requestReviewInfo(La2i;Lu55;Lcom/opera/api/Callback;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "La2i;",
            "Lu55;",
            "Lcom/opera/api/Callback;",
            ")V"
        }
    .end annotation

    move-object p0, p2

    check-cast p0, Lulp;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    check-cast p1, Lmcj;

    invoke-virtual {p1}, Lmcj;->k()Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    new-instance p1, Lzx;

    invoke-direct {p1, p2, v0, v1, p3}, Lzx;-><init>(Lu55;JLcom/opera/api/Callback;)V

    invoke-virtual {p0, p1}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method private static final requestReviewInfo$lambda$0(Lu55;JLcom/opera/api/Callback;Lcom/google/android/gms/tasks/Task;)V
    .registers 7

    check-cast p0, Lulp;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    sget-object p0, Lpn7;->b:Lon7;

    sget-object p0, Lun7;->d:Lun7;

    invoke-static {v0, v1, p0}, Lcs5;->y0(JLun7;)J

    move-result-wide v0

    invoke-static {p1, p2, p0}, Lcs5;->y0(JLun7;)J

    move-result-wide p0

    invoke-static {v0, v1, p0, p1}, Lpn7;->l(JJ)J

    move-result-wide p0

    sget-wide v0, Lcom/leanplum/messagetemplates/OperaRateSheet;->REVIEW_INFO_FETCH_TIMEOUT:J

    invoke-static {p0, p1, v0, v1}, Lpn7;->c(JJ)I

    move-result p2

    if-lez p2, :cond_3b

    new-instance p2, Lv1i;

    invoke-static {p0, p1}, Lpn7;->f(J)J

    move-result-wide p0

    const-string p4, "Timeout ("

    const-string v0, " ms)"

    invoke-static {p0, p1, p4, v0}, Lz1m;->j(JLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p2, p0}, Lx1i;-><init>(Ljava/lang/String;)V

    new-instance p0, Lrw7;

    invoke-direct {p0, p2}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-interface {p3, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_3b
    invoke-virtual {p4}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result p2

    if-nez p2, :cond_6c

    invoke-virtual {p4}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p0

    instance-of p1, p0, Ly1i;

    sget-object p2, Lw1i;->b:Lw1i;

    if-eqz p1, :cond_63

    check-cast p0, Ly1i;

    invoke-virtual {p0}, Ly1i;->d()I

    move-result p0

    const/16 p1, -0x64

    if-eq p0, p1, :cond_61

    const/4 p1, -0x2

    if-eq p0, p1, :cond_5e

    const/4 p1, -0x1

    if-ne p0, p1, :cond_63

    sget-object p2, Lu1i;->b:Lu1i;

    goto :goto_63

    :cond_5e
    sget-object p2, Lt1i;->b:Lt1i;

    goto :goto_63

    :cond_61
    sget-object p2, Ls1i;->b:Ls1i;

    :cond_63
    :goto_63
    new-instance p0, Lrw7;

    invoke-direct {p0, p2}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-interface {p3, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_6c
    new-instance p2, Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;

    invoke-virtual {p4}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lz1i;

    const/4 v0, 0x0

    invoke-direct {p2, p4, p0, p1, v0}, Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;-><init>(Lz1i;JLkotlin/jvm/internal/DefaultConstructorMarker;)V

    new-instance p0, Lsw7;

    invoke-direct {p0, p2}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-interface {p3, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method private final toDialogAction(Leo0;)Lvb0;
    .registers 2

    sget-object p0, Leo0;->d:Leo0;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_23

    sget-object p0, Leo0;->b:Leo0;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_23

    sget-object p0, Leo0;->c:Leo0;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1b

    sget-object p0, Lvb0;->c:Lvb0;

    return-object p0

    :cond_1b
    sget-object p0, Leo0;->e:Leo0;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    sget-object p0, Lvb0;->d:Lvb0;

    return-object p0

    :cond_23
    sget-object p0, Lvb0;->b:Lvb0;

    return-object p0
.end method
