.class public final Lq0o;
.super Ll7n;
.source "SourceFile"


# static fields
.field public static final k:J

.field public static final synthetic l:I


# instance fields
.field public final b:Lxbf;

.field public final c:Lpch;

.field public final d:Ltzn;

.field public final e:Lpde;

.field public f:Lpyl;

.field public g:Ljava/util/List;

.field public h:Z

.field public i:Z

.field public j:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lpn7;->b:Lon7;

    const/4 v0, 0x2

    sget-object v1, Lun7;->e:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lq0o;->k:J

    return-void
.end method

.method public constructor <init>(Lxbf;Lpch;Ltzn;)V
    .registers 4

    invoke-direct {p0}, Ll7n;-><init>()V

    iput-object p1, p0, Lq0o;->b:Lxbf;

    iput-object p2, p0, Lq0o;->c:Lpch;

    iput-object p3, p0, Lq0o;->d:Ltzn;

    new-instance p1, Lpde;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lq0o;->e:Lpde;

    sget-object p1, Ll08;->a:Ll08;

    iput-object p1, p0, Lq0o;->g:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final f()V
    .registers 7

    iget-object v0, p0, Lq0o;->c:Lpch;

    iget-object v0, v0, Lpch;->a:Ludf;

    iget-object v0, v0, Ludf;->a:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v1, "pushed.sequence"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2e

    iget-object v0, p0, Lq0o;->f:Lpyl;

    if-nez v0, :cond_2e

    new-instance v0, Lk0o;

    sget-object v3, Lj0o;->a:Lj0o;

    new-instance v4, Lq0n;

    const/16 v5, 0xf

    invoke-direct {v4, v5}, Lq0n;-><init>(B)V

    invoke-direct {v0, v3, v2, v4, v1}, Lk0o;-><init>(Lj0o;ZLkotlin/jvm/functions/Function1;I)V

    iget-object p0, p0, Lq0o;->e:Lpde;

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :cond_2e
    iget-object v0, p0, Lq0o;->f:Lpyl;

    const/4 v1, 0x0

    if-nez v0, :cond_48

    invoke-virtual {p0}, Lq0o;->g()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lq0o;->g:Ljava/util/List;

    new-instance v2, Lpyl;

    invoke-direct {v2, v0, v1}, Lpyl;-><init>(Ljava/util/List;Landroid/os/Bundle;)V

    iput-object v2, p0, Lq0o;->f:Lpyl;

    invoke-static {p0}, Lp7n;->a(Ll7n;)Lf65;

    move-result-object v0

    invoke-virtual {v2, v0}, Lpyl;->r(Lf65;)V

    move-object v0, v2

    :cond_48
    invoke-static {p0}, Lp7n;->a(Ll7n;)Lf65;

    move-result-object v2

    new-instance v3, Lcek;

    const/16 v4, 0xa

    invoke-direct {v3, v0, p0, v1, v4}, Lcek;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    const/4 p0, 0x3

    invoke-static {v2, v1, v1, v3, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void
.end method

.method public final g()Ljava/util/List;
    .registers 25

    move-object/from16 v0, p0

    new-instance v1, Ljjg;

    const/16 v2, 0x11

    invoke-direct {v1, v0, v2}, Ljjg;-><init>(Ljava/lang/Object;B)V

    new-instance v5, Le0o;

    iget-object v0, v0, Lq0o;->b:Lxbf;

    iget-object v2, v0, Lxbf;->b:Ljava/lang/Object;

    check-cast v2, Lr65;

    iget-object v3, v0, Lxbf;->e:Ljava/lang/Object;

    check-cast v3, Lsdf;

    iget-object v4, v0, Lxbf;->f:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/settings/SettingsManager;

    invoke-direct {v5, v2, v3, v4, v1}, Le0o;-><init>(Lr65;Lsdf;Lcom/opera/android/settings/SettingsManager;Ljjg;)V

    new-instance v1, Li0o;

    iget-object v3, v0, Lxbf;->d:Ljava/lang/Object;

    check-cast v3, Lt1;

    iget-object v4, v0, Lxbf;->g:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/Lazy;

    invoke-direct {v1, v2, v3, v4}, Li0o;-><init>(Lr65;Lt1;Lcom/opera/android/Lazy;)V

    new-instance v6, Lo0o;

    sget-object v7, Lm0o;->a:Lm0o;

    new-instance v8, Lo0o;

    sget-object v9, Lm0o;->b:Lm0o;

    new-instance v10, Lcfn;

    iget-object v0, v0, Lxbf;->c:Ljava/lang/Object;

    move-object v13, v0

    check-cast v13, Lc0o;

    const/16 v16, 0x0

    const/16 v17, 0x7

    const/4 v11, 0x0

    const-class v14, Lc0o;

    move-object v12, v13

    move-object v13, v14

    const-string v14, "isFirstRun"

    const-string v15, "isFirstRun()Z"

    invoke-direct/range {v10 .. v17}, Lcfn;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v14, v13

    move-object v13, v12

    new-instance v11, Lcfn;

    const/16 v17, 0x0

    const/16 v18, 0x8

    const/4 v12, 0x0

    const-string v15, "canOfferDefaultBrowser"

    const-string v16, "canOfferDefaultBrowser()Z"

    invoke-direct/range {v11 .. v18}, Lcfn;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v0, v13

    move-object v2, v14

    const/4 v3, 0x2

    new-array v4, v3, [Lmtb;

    const/16 v19, 0x0

    aput-object v10, v4, v19

    const/16 v20, 0x1

    aput-object v11, v4, v20

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v10

    const/4 v13, 0x0

    const/16 v14, 0x1c

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-direct/range {v8 .. v14}, Lo0o;-><init>(Lm0o;Ljava/util/List;Ljava/util/List;Lkotlin/jvm/functions/Function1;Lxm6;I)V

    new-instance v9, Lo0o;

    sget-object v10, Lm0o;->c:Lm0o;

    new-instance v11, Lcfn;

    const/16 v18, 0x9

    const/4 v12, 0x0

    const-string v15, "isFirstRun"

    const-string v16, "isFirstRun()Z"

    move-object v13, v0

    move-object v14, v2

    invoke-direct/range {v11 .. v18}, Lcfn;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v0, v11

    new-instance v11, Lcfn;

    const/16 v18, 0xa

    const-string v15, "needsNotificationPermission"

    const-string v16, "needsNotificationPermission()Z"

    invoke-direct/range {v11 .. v18}, Lcfn;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v2, v11

    new-instance v11, Lcfn;

    const/16 v18, 0xb

    const-string v15, "isNotificationOnboardingEnabled"

    const-string v16, "isNotificationOnboardingEnabled()Z"

    invoke-direct/range {v11 .. v18}, Lcfn;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v4, v13

    move-object/from16 v16, v14

    const/4 v12, 0x3

    new-array v12, v12, [Lmtb;

    aput-object v0, v12, v19

    aput-object v2, v12, v20

    aput-object v11, v12, v3

    invoke-static {v12}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v11

    const/4 v14, 0x0

    const/16 v15, 0x1c

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-direct/range {v9 .. v15}, Lo0o;-><init>(Lm0o;Ljava/util/List;Ljava/util/List;Lkotlin/jvm/functions/Function1;Lxm6;I)V

    new-instance v0, Lo0o;

    sget-object v2, Lm0o;->d:Lm0o;

    new-instance v11, Lcfn;

    const/16 v18, 0xc

    const/4 v12, 0x0

    const-string v15, "isCmpIntroductionDue"

    move-object/from16 v14, v16

    const-string v16, "isCmpIntroductionDue()Z"

    move-object v13, v4

    invoke-direct/range {v11 .. v18}, Lcfn;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-static {v11}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v19

    const/16 v22, 0x0

    const/16 v23, 0x1c

    const/16 v20, 0x0

    const/16 v21, 0x0

    move-object/from16 v17, v0

    move-object/from16 v18, v2

    invoke-direct/range {v17 .. v23}, Lo0o;-><init>(Lm0o;Ljava/util/List;Ljava/util/List;Lkotlin/jvm/functions/Function1;Lxm6;I)V

    filled-new-array {v8, v9, v0}, [Lo0o;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    new-instance v10, Llrk;

    const/16 v16, 0x0

    const/16 v17, 0x17

    const/4 v11, 0x1

    sget-object v12, Lg0o;->a:Lg0o;

    const-class v13, Lg0o;

    const-string v14, "screen"

    const-string v15, "screen(Lcom/opera/android/startup/WelcomeOnboardingContext;)Lcom/opera/android/startup/WelcomeOnboardingScreen;"

    invoke-direct/range {v10 .. v17}, Llrk;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    const/4 v11, 0x0

    const/16 v12, 0x12

    const/4 v8, 0x0

    invoke-direct/range {v6 .. v12}, Lo0o;-><init>(Lm0o;Ljava/util/List;Ljava/util/List;Lkotlin/jvm/functions/Function1;Lxm6;I)V

    move-object v0, v6

    new-instance v2, Lo0o;

    sget-object v11, Lm0o;->e:Lm0o;

    new-instance v3, Lcfn;

    const/4 v9, 0x0

    const/16 v10, 0xd

    const/4 v4, 0x0

    const-class v6, Le0o;

    const-string v7, "shouldShow"

    const-string v8, "shouldShow()Z"

    invoke-direct/range {v3 .. v10}, Lcfn;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-static {v3}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v12

    new-instance v3, Llrk;

    const/16 v10, 0x18

    const/4 v4, 0x1

    const-string v7, "screen"

    const-string v8, "screen(Lcom/opera/android/startup/WelcomeOnboardingContext;)Lcom/opera/android/startup/WelcomeOnboardingScreen;"

    invoke-direct/range {v3 .. v10}, Llrk;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v7, v11

    const/4 v11, 0x0

    move-object v8, v12

    const/16 v12, 0x14

    const/4 v9, 0x0

    move-object v6, v2

    move-object v10, v3

    invoke-direct/range {v6 .. v12}, Lo0o;-><init>(Lm0o;Ljava/util/List;Ljava/util/List;Lkotlin/jvm/functions/Function1;Lxm6;I)V

    new-instance v3, Lo0o;

    sget-object v4, Lm0o;->f:Lm0o;

    new-instance v6, Lcfn;

    const/4 v12, 0x0

    const/4 v13, 0x6

    const/4 v7, 0x0

    const-class v9, Li0o;

    const-string v10, "shouldShow"

    const-string v11, "shouldShow()Z"

    move-object v8, v1

    invoke-direct/range {v6 .. v13}, Lcfn;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-static {v6}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    new-instance v6, Llrk;

    const/16 v13, 0x16

    const/4 v7, 0x1

    const-string v10, "screen"

    const-string v11, "screen(Lcom/opera/android/startup/WelcomeOnboardingContext;)Lcom/opera/android/startup/WelcomeOnboardingScreen;"

    invoke-direct/range {v6 .. v13}, Llrk;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v1, v6

    new-instance v6, Lxm6;

    const/16 v12, 0x8

    const/4 v13, 0x3

    const-string v10, "preload"

    const-string v11, "preload(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;"

    invoke-direct/range {v6 .. v13}, Lxm6;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    const/4 v9, 0x4

    move-object v8, v6

    const/4 v6, 0x0

    move-object v7, v1

    invoke-direct/range {v3 .. v9}, Lo0o;-><init>(Lm0o;Ljava/util/List;Ljava/util/List;Lkotlin/jvm/functions/Function1;Lxm6;I)V

    filled-new-array {v0, v2, v3}, [Lo0o;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
