.class public final synthetic Lgzh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lgzh;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 26

    move-object/from16 v0, p0

    iget-byte v0, v0, Lgzh;->a:B

    const-string v1, "com.opera.momi.clientsdk.ui.RootComponent.Config.CashOut"

    const-string v2, "com.opera.momi.clientsdk.ui.RootComponent.Config.DevSettings"

    const-string v3, "com.opera.momi.clientsdk.ui.RootComponent.Config.History"

    const-string v4, "com.opera.momi.clientsdk.ui.RootComponent.Config.Leaderboard"

    const-string v5, "com.opera.momi.clientsdk.ui.RootComponent.Config.Licenses"

    const-string v6, "com.opera.momi.clientsdk.ui.RootComponent.Config.Main"

    const-string v7, "com.opera.momi.clientsdk.ui.RootComponent.Config.Rewards"

    const-string v8, "com.opera.momi.clientsdk.ui.RootComponent.Config.SpotifyVoucher"

    const/4 v9, 0x1

    const/4 v10, 0x0

    const/4 v11, 0x0

    packed-switch v0, :pswitch_data_23a

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-static {v0}, Landroid/icu/text/TimeZoneFormat;->getInstance(Ljava/util/Locale;)Landroid/icu/text/TimeZoneFormat;

    move-result-object v0

    return-object v0

    :pswitch_23
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v0

    return-object v0

    :pswitch_28
    new-instance v0, Lk72;

    sget-object v1, Lhfj;->a:Lhfj;

    invoke-direct {v0, v1, v11}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    return-object v0

    :pswitch_30
    new-instance v0, Lk72;

    sget-object v1, Lofj;->a:Lofj;

    invoke-direct {v0, v1, v11}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    return-object v0

    :pswitch_38
    new-instance v0, Lk72;

    sget-object v1, Lrej;->a:Lrej;

    invoke-direct {v0, v1, v11}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    return-object v0

    :pswitch_40
    invoke-static {}, Ldfj;->values()[Ldfj;

    move-result-object v0

    const-string v5, "error_not_supported"

    const-string v6, "error_mime_does_not_match"

    const-string v1, "in_progress"

    const-string v2, "finished"

    const-string v3, "error_processing"

    const-string v4, "error_too_long"

    filled-new-array/range {v1 .. v6}, [Ljava/lang/String;

    move-result-object v1

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    filled-new-array/range {v2 .. v7}, [[Ljava/lang/annotation/Annotation;

    move-result-object v2

    const-string v3, "com.opera.android.aiassistant.api.ShodanApi.FileUploadStatus"

    invoke-static {v3, v0, v1, v2}, Ljpo;->w(Ljava/lang/String;[Ljava/lang/Enum;[Ljava/lang/String;[[Ljava/lang/annotation/Annotation;)Li58;

    move-result-object v0

    return-object v0

    :pswitch_65
    new-instance v0, Lt7a;

    sget-object v1, Lxhk;->a:Lxhk;

    invoke-direct {v0, v1, v1, v9}, Lt7a;-><init>(Lkotlinx/serialization/KSerializer;Lkotlinx/serialization/KSerializer;B)V

    return-object v0

    :pswitch_6d
    sget-object v0, Ldfj;->Companion:Lcfj;

    invoke-virtual {v0}, Lcfj;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v0

    return-object v0

    :pswitch_74
    return-object v10

    :pswitch_75
    new-instance v1, Lacj;

    sget-object v2, Lxaj;->a:Lu8i;

    sget-object v3, Lxaj;->b:Lu8i;

    sget-object v4, Lxaj;->c:Lu8i;

    sget-object v5, Lxaj;->d:Lu8i;

    sget-object v6, Lxaj;->f:Lu8i;

    invoke-direct/range {v1 .. v6}, Lacj;-><init>(Lu8i;Lu8i;Lu8i;Lu8i;Lu8i;)V

    return-object v1

    :pswitch_85
    return-object v10

    :pswitch_86
    :try_start_86
    new-instance v0, Ldvk;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    filled-new-array {v0}, [Ldvk;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0
    :try_end_97
    .catchall {:try_start_86 .. :try_end_97} :catchall_a4

    invoke-static {v0}, Lv1j;->b(Ljava/util/Iterator;)Ldo5;

    move-result-object v0

    invoke-static {v0}, Ly1j;->g(Lkotlin/sequences/Sequence;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lzi4;->c0(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0

    :catchall_a4
    move-exception v0

    new-instance v1, Ljava/util/ServiceConfigurationError;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/util/ServiceConfigurationError;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :pswitch_af
    :try_start_af
    new-instance v0, Lhyb;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    filled-new-array {v0}, [Lhyb;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0
    :try_end_c0
    .catchall {:try_start_af .. :try_end_c0} :catchall_cd

    invoke-static {v0}, Lv1j;->b(Ljava/util/Iterator;)Ldo5;

    move-result-object v0

    invoke-static {v0}, Ly1j;->g(Lkotlin/sequences/Sequence;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lzi4;->c0(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0

    :catchall_cd
    move-exception v0

    new-instance v1, Ljava/util/ServiceConfigurationError;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/util/ServiceConfigurationError;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :pswitch_d8
    return-object v10

    :pswitch_d9
    new-instance v0, Lvoi;

    invoke-direct {v0, v11}, Lvoi;-><init>(I)V

    return-object v0

    :pswitch_df
    sget v0, Lcom/opera/android/qr/ScanQrCodeActivity;->k:I

    sget-object v0, Llfh;->l:[Ljava/lang/String;

    new-instance v0, Lt33;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    return-object v0

    :pswitch_e9
    return-object v10

    :pswitch_ea
    new-instance v0, Luji;

    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-direct {v0, v1}, Luji;-><init>(Ljava/util/Map;)V

    return-object v0

    :pswitch_f5
    new-instance v0, Li58;

    sget-object v1, Le7i;->INSTANCE:Le7i;

    new-array v2, v11, [Ljava/lang/annotation/Annotation;

    invoke-direct {v0, v8, v1, v2}, Li58;-><init>(Ljava/lang/String;Li7i;[Ljava/lang/annotation/Annotation;)V

    return-object v0

    :pswitch_ff
    new-instance v0, Li58;

    sget-object v1, Ld7i;->INSTANCE:Ld7i;

    new-array v2, v11, [Ljava/lang/annotation/Annotation;

    invoke-direct {v0, v7, v1, v2}, Li58;-><init>(Ljava/lang/String;Li7i;[Ljava/lang/annotation/Annotation;)V

    return-object v0

    :pswitch_109
    new-instance v0, Li58;

    sget-object v1, Lz6i;->INSTANCE:Lz6i;

    new-array v2, v11, [Ljava/lang/annotation/Annotation;

    invoke-direct {v0, v6, v1, v2}, Li58;-><init>(Ljava/lang/String;Li7i;[Ljava/lang/annotation/Annotation;)V

    return-object v0

    :pswitch_113
    new-instance v0, Li58;

    sget-object v1, Ly6i;->INSTANCE:Ly6i;

    new-array v2, v11, [Ljava/lang/annotation/Annotation;

    invoke-direct {v0, v5, v1, v2}, Li58;-><init>(Ljava/lang/String;Li7i;[Ljava/lang/annotation/Annotation;)V

    return-object v0

    :pswitch_11d
    new-instance v0, Li58;

    sget-object v1, Lx6i;->INSTANCE:Lx6i;

    new-array v2, v11, [Ljava/lang/annotation/Annotation;

    invoke-direct {v0, v4, v1, v2}, Li58;-><init>(Ljava/lang/String;Li7i;[Ljava/lang/annotation/Annotation;)V

    return-object v0

    :pswitch_127
    new-instance v0, Li58;

    sget-object v1, Lw6i;->INSTANCE:Lw6i;

    new-array v2, v11, [Ljava/lang/annotation/Annotation;

    invoke-direct {v0, v3, v1, v2}, Li58;-><init>(Ljava/lang/String;Li7i;[Ljava/lang/annotation/Annotation;)V

    return-object v0

    :pswitch_131
    new-instance v0, Li58;

    sget-object v1, Lv6i;->INSTANCE:Lv6i;

    new-array v3, v11, [Ljava/lang/annotation/Annotation;

    invoke-direct {v0, v2, v1, v3}, Li58;-><init>(Ljava/lang/String;Li7i;[Ljava/lang/annotation/Annotation;)V

    return-object v0

    :pswitch_13b
    new-instance v0, Li58;

    sget-object v2, Lt6i;->INSTANCE:Lt6i;

    new-array v3, v11, [Ljava/lang/annotation/Annotation;

    invoke-direct {v0, v1, v2, v3}, Li58;-><init>(Ljava/lang/String;Li7i;[Ljava/lang/annotation/Annotation;)V

    return-object v0

    :pswitch_145
    new-instance v0, Lyqi;

    const-class v10, Li7i;

    invoke-static {v10}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v10

    const-class v12, Lt6i;

    invoke-static {v12}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v12

    const-class v13, Lv6i;

    invoke-static {v13}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v13

    const-class v14, Lw6i;

    invoke-static {v14}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v14

    const-class v15, Lx6i;

    invoke-static {v15}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v15

    const-class v16, Ly6i;

    invoke-static/range {v16 .. v16}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v16

    const-class v17, Lz6i;

    invoke-static/range {v17 .. v17}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v17

    const-class v18, Lc7i;

    invoke-static/range {v18 .. v18}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v18

    const-class v19, Ld7i;

    invoke-static/range {v19 .. v19}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v19

    const-class v20, Le7i;

    invoke-static/range {v20 .. v20}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v20

    const-class v21, Lh7i;

    invoke-static/range {v21 .. v21}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v21

    move/from16 p0, v9

    const/16 v9, 0xa

    move/from16 v22, v11

    new-array v11, v9, [Litb;

    aput-object v12, v11, v22

    aput-object v13, v11, p0

    const/4 v12, 0x2

    aput-object v14, v11, v12

    const/4 v13, 0x3

    aput-object v15, v11, v13

    const/4 v14, 0x4

    aput-object v16, v11, v14

    const/4 v15, 0x5

    aput-object v17, v11, v15

    const/16 v16, 0x6

    aput-object v18, v11, v16

    const/16 v17, 0x7

    aput-object v19, v11, v17

    const/16 v18, 0x8

    aput-object v20, v11, v18

    const/16 v19, 0x9

    aput-object v21, v11, v19

    move/from16 v20, v12

    new-instance v12, Li58;

    move/from16 v21, v13

    sget-object v13, Lt6i;->INSTANCE:Lt6i;

    move/from16 v23, v14

    move/from16 v24, v15

    move/from16 v14, v22

    new-array v15, v14, [Ljava/lang/annotation/Annotation;

    invoke-direct {v12, v1, v13, v15}, Li58;-><init>(Ljava/lang/String;Li7i;[Ljava/lang/annotation/Annotation;)V

    new-instance v1, Li58;

    sget-object v13, Lv6i;->INSTANCE:Lv6i;

    new-array v15, v14, [Ljava/lang/annotation/Annotation;

    invoke-direct {v1, v2, v13, v15}, Li58;-><init>(Ljava/lang/String;Li7i;[Ljava/lang/annotation/Annotation;)V

    new-instance v2, Li58;

    sget-object v13, Lw6i;->INSTANCE:Lw6i;

    new-array v15, v14, [Ljava/lang/annotation/Annotation;

    invoke-direct {v2, v3, v13, v15}, Li58;-><init>(Ljava/lang/String;Li7i;[Ljava/lang/annotation/Annotation;)V

    new-instance v3, Li58;

    sget-object v13, Lx6i;->INSTANCE:Lx6i;

    new-array v15, v14, [Ljava/lang/annotation/Annotation;

    invoke-direct {v3, v4, v13, v15}, Li58;-><init>(Ljava/lang/String;Li7i;[Ljava/lang/annotation/Annotation;)V

    new-instance v4, Li58;

    sget-object v13, Ly6i;->INSTANCE:Ly6i;

    new-array v15, v14, [Ljava/lang/annotation/Annotation;

    invoke-direct {v4, v5, v13, v15}, Li58;-><init>(Ljava/lang/String;Li7i;[Ljava/lang/annotation/Annotation;)V

    new-instance v5, Li58;

    sget-object v13, Lz6i;->INSTANCE:Lz6i;

    new-array v15, v14, [Ljava/lang/annotation/Annotation;

    invoke-direct {v5, v6, v13, v15}, Li58;-><init>(Ljava/lang/String;Li7i;[Ljava/lang/annotation/Annotation;)V

    new-instance v6, Li58;

    sget-object v13, Ld7i;->INSTANCE:Ld7i;

    new-array v15, v14, [Ljava/lang/annotation/Annotation;

    invoke-direct {v6, v7, v13, v15}, Li58;-><init>(Ljava/lang/String;Li7i;[Ljava/lang/annotation/Annotation;)V

    new-instance v7, Li58;

    sget-object v13, Le7i;->INSTANCE:Le7i;

    new-array v15, v14, [Ljava/lang/annotation/Annotation;

    invoke-direct {v7, v8, v13, v15}, Li58;-><init>(Ljava/lang/String;Li7i;[Ljava/lang/annotation/Annotation;)V

    new-array v8, v9, [Lkotlinx/serialization/KSerializer;

    aput-object v12, v8, v14

    aput-object v1, v8, p0

    aput-object v2, v8, v20

    aput-object v3, v8, v21

    aput-object v4, v8, v23

    aput-object v5, v8, v24

    sget-object v1, La7i;->a:La7i;

    aput-object v1, v8, v16

    aput-object v6, v8, v17

    aput-object v7, v8, v18

    sget-object v1, Lf7i;->a:Lf7i;

    aput-object v1, v8, v19

    const/4 v14, 0x0

    new-array v9, v14, [Ljava/lang/annotation/Annotation;

    const-string v5, "com.opera.momi.clientsdk.ui.RootComponent.Config"

    move-object v4, v0

    move-object v6, v10

    move-object v7, v11

    invoke-direct/range {v4 .. v9}, Lyqi;-><init>(Ljava/lang/String;Ls15;[Litb;[Lkotlinx/serialization/KSerializer;[Ljava/lang/annotation/Annotation;)V

    return-object v4

    :pswitch_229
    new-instance v0, Lk5i;

    sget-wide v1, Lu95;->g:J

    invoke-direct {v0, v1, v2, v10}, Lk5i;-><init>(JLj5i;)V

    return-object v0

    :pswitch_231
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object v0

    :pswitch_234
    sget-object v0, Lhzh;->a:Lhp7;

    sget-object v0, Lfl6;->a:Lfl6;

    return-object v0

    nop

    :pswitch_data_23a
    .packed-switch 0x0
        :pswitch_234
        :pswitch_231
        :pswitch_229
        :pswitch_145
        :pswitch_13b
        :pswitch_131
        :pswitch_127
        :pswitch_11d
        :pswitch_113
        :pswitch_109
        :pswitch_ff
        :pswitch_f5
        :pswitch_ea
        :pswitch_e9
        :pswitch_df
        :pswitch_d9
        :pswitch_d8
        :pswitch_af
        :pswitch_86
        :pswitch_85
        :pswitch_75
        :pswitch_74
        :pswitch_6d
        :pswitch_65
        :pswitch_40
        :pswitch_38
        :pswitch_30
        :pswitch_28
        :pswitch_23
    .end packed-switch
.end method
