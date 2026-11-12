.class public final synthetic Lvme;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lvme;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 22

    move-object/from16 v0, p0

    iget-byte v0, v0, Lvme;->a:B

    const-string v1, "com.opera.android.ntp.RequestOrigin"

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_128

    invoke-static {}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequestKt;->l()Lkotlin/Unit;

    move-result-object v0

    return-object v0

    :pswitch_f
    invoke-static {}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequestKt;->m()Lkotlin/Unit;

    move-result-object v0

    return-object v0

    :pswitch_14
    invoke-static {}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequestKt;->d()Lkotlin/Unit;

    move-result-object v0

    return-object v0

    :pswitch_19
    invoke-static {}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequestKt;->o()Lkotlin/Unit;

    move-result-object v0

    return-object v0

    :pswitch_1e
    invoke-static {}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequestKt;->n()Lkotlin/Unit;

    move-result-object v0

    return-object v0

    :pswitch_23
    new-instance v1, Lrwj;

    const/16 v19, 0x0

    const v20, 0xffff

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const-wide/16 v11, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const-wide/16 v16, 0x0

    const/16 v18, 0x0

    invoke-direct/range {v1 .. v20}, Lrwj;-><init>(JJLki9;Lgi9;Lhi9;Llh9;Ljava/lang/String;JLua3;Lvil;Lawc;JLbgl;Ljaj;I)V

    return-object v1

    :pswitch_40
    new-instance v0, Lakf;

    new-instance v1, Lkk3;

    const/16 v2, 0xa

    invoke-direct {v1, v2}, Lkk3;-><init>(B)V

    new-instance v2, Lhp2;

    const/16 v3, 0x8

    invoke-direct {v2, v3}, Lhp2;-><init>(B)V

    new-instance v3, Lbt8;

    const/4 v4, 0x2

    invoke-direct {v3, v4}, Lbt8;-><init>(B)V

    sget v4, Lu95;->h:I

    invoke-direct {v0, v1, v2, v3}, Lakf;-><init>(Ls7;Lt7;Lat8;)V

    return-object v0

    :pswitch_5c
    invoke-static {}, Lhff;->values()[Lhff;

    move-result-object v0

    new-instance v1, Li58;

    const-string v2, "com.opera.android.startup.fragments.personalization.OnboardingWallpapersSource"

    invoke-direct {v1, v2, v0}, Li58;-><init>(Ljava/lang/String;[Ljava/lang/Enum;)V

    return-object v1

    :pswitch_68
    new-instance v0, Ls9f;

    invoke-direct {v0}, Ls9f;-><init>()V

    new-instance v1, Lt9f;

    invoke-direct {v1, v0}, Lt9f;-><init>(Ls9f;)V

    return-object v1

    :pswitch_73
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_76
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_79
    new-instance v0, Lt7a;

    sget-object v1, Lxhk;->a:Lxhk;

    const/4 v2, 0x1

    invoke-direct {v0, v1, v1, v2}, Lt7a;-><init>(Lkotlinx/serialization/KSerializer;Lkotlinx/serialization/KSerializer;B)V

    return-object v0

    :pswitch_82
    new-instance v0, Lk72;

    sget-object v1, Lxhk;->a:Lxhk;

    invoke-direct {v0, v1, v2}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    return-object v0

    :pswitch_8a
    invoke-static {}, Lswh;->values()[Lswh;

    move-result-object v0

    new-instance v2, Li58;

    invoke-direct {v2, v1, v0}, Li58;-><init>(Ljava/lang/String;[Ljava/lang/Enum;)V

    return-object v2

    :pswitch_94
    new-instance v0, Lk72;

    sget-object v1, Lecb;->a:Lecb;

    invoke-direct {v0, v1, v2}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    return-object v0

    :pswitch_9c
    invoke-static {}, Lswh;->values()[Lswh;

    move-result-object v0

    new-instance v2, Li58;

    invoke-direct {v2, v1, v0}, Li58;-><init>(Ljava/lang/String;[Ljava/lang/Enum;)V

    return-object v2

    :pswitch_a6
    new-instance v0, Lk72;

    sget-object v1, Lxyl;->a:Lxyl;

    invoke-direct {v0, v1, v2}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    return-object v0

    :pswitch_ae
    new-instance v0, Lk72;

    sget-object v1, Ln3f;->a:Ln3f;

    invoke-direct {v0, v1, v2}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    return-object v0

    :pswitch_b6
    sget-object v0, Lcom/opera/android/news/newsfeed/internal/NewsPushTrackEventsUploaderWorker;->f:Lesd;

    sget-object v0, Lxne;->b:Lii;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt9f;

    return-object v0

    :pswitch_c1
    sget-object v0, Lcom/opera/android/news/newsfeed/internal/NewsPushTokenUploaderWorker;->f:Lesd;

    sget-object v0, Lxne;->b:Lii;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt9f;

    return-object v0

    :pswitch_cc
    new-instance v0, Lk72;

    sget-object v1, Lxhk;->a:Lxhk;

    invoke-direct {v0, v1, v2}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    return-object v0

    :pswitch_d4
    sget-object v0, Lboc;->Companion:Laoc;

    invoke-virtual {v0}, Laoc;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v0

    return-object v0

    :pswitch_db
    new-instance v0, Lk72;

    sget-object v1, Lhme;->a:Lhme;

    invoke-direct {v0, v1, v2}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    return-object v0

    :pswitch_e3
    new-instance v0, Lk72;

    sget-object v1, Lppc;->a:Lppc;

    invoke-direct {v0, v1, v2}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    return-object v0

    :pswitch_eb
    new-instance v0, Lk72;

    sget-object v1, Lhme;->a:Lhme;

    invoke-direct {v0, v1, v2}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    return-object v0

    :pswitch_f3
    invoke-static {}, Lene;->values()[Lene;

    move-result-object v0

    const-string v1, "ap"

    const-string v2, "aaw"

    const-string v3, "ft"

    const-string v4, "aet"

    filled-new-array {v3, v4, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    filled-new-array {v2, v2, v2, v2}, [[Ljava/lang/annotation/Annotation;

    move-result-object v2

    const-string v3, "com.opera.android.live_score.football.data.network.model.NetworkFootballFinishType"

    invoke-static {v3, v0, v1, v2}, Ljpo;->w(Ljava/lang/String;[Ljava/lang/Enum;[Ljava/lang/String;[[Ljava/lang/annotation/Annotation;)Li58;

    move-result-object v0

    return-object v0

    :pswitch_10f
    new-instance v0, Lm58;

    invoke-direct {v0}, Lm58;-><init>()V

    return-object v0

    :pswitch_115
    new-instance v0, Lm58;

    invoke-direct {v0}, Lm58;-><init>()V

    return-object v0

    :pswitch_11b
    new-instance v0, Lm58;

    invoke-direct {v0}, Lm58;-><init>()V

    return-object v0

    :pswitch_121
    new-instance v0, Lm58;

    invoke-direct {v0}, Lm58;-><init>()V

    return-object v0

    nop

    :pswitch_data_128
    .packed-switch 0x0
        :pswitch_121
        :pswitch_11b
        :pswitch_115
        :pswitch_10f
        :pswitch_f3
        :pswitch_eb
        :pswitch_e3
        :pswitch_db
        :pswitch_d4
        :pswitch_cc
        :pswitch_c1
        :pswitch_b6
        :pswitch_ae
        :pswitch_a6
        :pswitch_9c
        :pswitch_94
        :pswitch_8a
        :pswitch_82
        :pswitch_79
        :pswitch_76
        :pswitch_73
        :pswitch_68
        :pswitch_5c
        :pswitch_40
        :pswitch_23
        :pswitch_1e
        :pswitch_19
        :pswitch_14
        :pswitch_f
    .end packed-switch
.end method
