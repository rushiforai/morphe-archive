.class public final synthetic Lzzn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:Lxbf;

.field public final synthetic b:Lvzn;

.field public final synthetic c:Ltzn;

.field public final synthetic d:Lmsl;

.field public final synthetic e:Lumi;

.field public final synthetic f:Lvzn;

.field public final synthetic g:Lvzn;

.field public final synthetic h:Lvzn;

.field public final synthetic i:Lwzn;


# direct methods
.method public synthetic constructor <init>(Lxbf;Lvzn;Ltzn;Lmsl;Lumi;Lvzn;Lvzn;Lvzn;Lwzn;)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzzn;->a:Lxbf;

    iput-object p2, p0, Lzzn;->b:Lvzn;

    iput-object p3, p0, Lzzn;->c:Ltzn;

    iput-object p4, p0, Lzzn;->d:Lmsl;

    iput-object p5, p0, Lzzn;->e:Lumi;

    iput-object p6, p0, Lzzn;->f:Lvzn;

    iput-object p7, p0, Lzzn;->g:Lvzn;

    iput-object p8, p0, Lzzn;->h:Lvzn;

    iput-object p9, p0, Lzzn;->i:Lwzn;

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 19

    move-object/from16 v0, p0

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v1, v0, Lzzn;->a:Lxbf;

    iget-object v2, v1, Lxbf;->c:Ljava/lang/Object;

    move-object v4, v2

    check-cast v4, Lcom/opera/android/startup/WelcomeActivity;

    invoke-virtual {v4}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v2

    move-object v6, v2

    check-cast v6, Lcom/opera/android/OperaApplication;

    new-instance v3, Lyzn;

    iget-object v2, v0, Lzzn;->b:Lvzn;

    invoke-virtual {v2}, Lvzn;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lmcj;

    new-instance v5, Lpw3;

    const/4 v10, 0x0

    const/16 v11, 0xf

    const-class v7, Lcom/opera/android/OperaApplication;

    const-string v8, "usageReporter"

    const-string v9, "getUsageReporter()Lcom/opera/android/analytics/UsageReporter;"

    invoke-direct/range {v5 .. v11}, Lpw3;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v12, Lwv1;

    const/4 v13, 0x4

    invoke-direct {v12, v5, v13}, Lwv1;-><init>(Lb6h;B)V

    new-instance v5, Lpw3;

    const/16 v11, 0x10

    const-string v8, "onboardingReporter"

    const-string v9, "getOnboardingReporter()Lcom/opera/android/onboarding/OnboardingReporter;"

    invoke-direct/range {v5 .. v11}, Lpw3;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v14, Lwv1;

    invoke-direct {v14, v5, v13}, Lwv1;-><init>(Lb6h;B)V

    iget-object v5, v1, Lxbf;->f:Ljava/lang/Object;

    move-object v15, v5

    check-cast v15, Lj4c;

    new-instance v5, Lpw3;

    const/16 v11, 0x11

    const-string v8, "cmpConsentController"

    const-string v9, "getCmpConsentController()Lcom/opera/android/cmpconsent/CmpConsentController;"

    invoke-direct/range {v5 .. v11}, Lpw3;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v9, v12

    new-instance v12, Lwv1;

    invoke-direct {v12, v5, v13}, Lwv1;-><init>(Lb6h;B)V

    iget-object v1, v1, Lxbf;->b:Ljava/lang/Object;

    check-cast v1, Lxbf;

    iget-object v1, v1, Lxbf;->b:Ljava/lang/Object;

    check-cast v1, Lmi;

    iget-object v1, v1, Lmi;->m:Lhi;

    iget-object v6, v0, Lzzn;->c:Ltzn;

    iget-object v7, v0, Lzzn;->d:Lmsl;

    iget-object v8, v0, Lzzn;->e:Lumi;

    iget-object v13, v0, Lzzn;->f:Lvzn;

    move-object v10, v14

    iget-object v14, v0, Lzzn;->g:Lvzn;

    move-object v11, v15

    iget-object v15, v0, Lzzn;->h:Lvzn;

    iget-object v0, v0, Lzzn;->i:Lwzn;

    move-object/from16 v16, v0

    move-object/from16 v17, v1

    move-object v5, v2

    invoke-direct/range {v3 .. v17}, Lyzn;-><init>(Lcom/opera/android/startup/WelcomeActivity;Lmcj;Ltzn;Lmsl;Lumi;Lwv1;Lwv1;Lj4c;Lwv1;Lvzn;Lvzn;Lvzn;Lwzn;Lcom/opera/android/Lazy;)V

    return-object v3
.end method
