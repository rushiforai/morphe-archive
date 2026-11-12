.class public final synthetic Lo5f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 11
    iput-byte p2, p0, Lo5f;->a:B

    iput-object p1, p0, Lo5f;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lp3g;Lq3g;)V
    .registers 3

    .line 10
    const/16 p1, 0x16

    iput-byte p1, p0, Lo5f;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lo5f;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lwxf;Lopi;)V
    .registers 3

    const/16 p2, 0x13

    iput-byte p2, p0, Lo5f;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lo5f;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9

    iget-byte v0, p0, Lo5f;->a:B

    const/4 v1, 0x0

    const/16 v2, 0x98b

    const/4 v3, 0x2

    const/4 v4, -0x1

    const/4 v5, 0x0

    const/4 v6, 0x1

    iget-object p0, p0, Lo5f;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_4b8

    check-cast p0, Lkotlinx/serialization/descriptors/SerialDescriptor;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p0, p1}, Lkotlinx/serialization/descriptors/SerialDescriptor;->f(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p0, p1}, Lkotlinx/serialization/descriptors/SerialDescriptor;->h(I)Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object p0

    invoke-interface {p0}, Lkotlinx/serialization/descriptors/SerialDescriptor;->i()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_37
    check-cast p0, Ls14;

    check-cast p1, Lpg;

    invoke-virtual {p0}, Ls14;->M()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_41
    check-cast p0, Lv8g;

    check-cast p1, Loh;

    iget v0, p1, Loh;->a:I

    iget-object p1, p1, Loh;->b:Landroid/content/Intent;

    invoke-static {v0, p1}, Landroid/webkit/WebChromeClient$FileChooserParams;->parseResult(ILandroid/content/Intent;)[Landroid/net/Uri;

    move-result-object p1

    iget-object v0, p0, Lv8g;->a:Landroid/webkit/ValueCallback;

    if-eqz v0, :cond_54

    invoke-interface {v0, p1}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    :cond_54
    iput-object v1, p0, Lv8g;->a:Landroid/webkit/ValueCallback;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_59
    check-cast p0, Licg;

    check-cast p1, Ln6j;

    iget-object v0, p0, Licg;->e:Ly5g;

    iget-char v0, v0, Lv6j;->a:C

    invoke-virtual {p1, v0}, Ln6j;->a(I)V

    iget-object v0, p0, Licg;->f:Luj;

    iget-char v0, v0, Lv6j;->a:C

    invoke-virtual {p1, v0}, Ln6j;->a(I)V

    iget-object v0, p0, Licg;->g:Luj;

    iget-char v0, v0, Lv6j;->a:C

    invoke-virtual {p1, v0}, Ln6j;->a(I)V

    iget-object p0, p0, Licg;->h:Lqte;

    iget-char p0, p0, Lv6j;->a:C

    invoke-virtual {p1, p0}, Ln6j;->a(I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_7c
    check-cast p0, Lb6g;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-ne p1, v4, :cond_89

    invoke-virtual {p0}, Lb6g;->invoke()Ljava/lang/Object;

    :cond_89
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_8c
    check-cast p0, Lm6g;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_c5

    iget-object p1, p0, Lm6g;->h:Lx5g;

    iget-object p1, p1, Lx5g;->e:La4g;

    if-eqz p1, :cond_b2

    iget-object v0, p1, La4g;->a:Ljava/util/List;

    :goto_9e
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_b2

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    sub-int/2addr v1, v6

    iget-wide v2, p1, La4g;->b:J

    invoke-static {v2, v3, v1}, LJ/N;->MvKxovNE(JI)V

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_9e

    :cond_b2
    invoke-virtual {p0}, Lm6g;->g()V

    iget-object p0, p0, Lm6g;->j:Lysj;

    const p1, 0x7f140f5c

    const/16 v0, 0x1388

    invoke-static {p1, v0, p0}, Lam2;->i(IILysj;)Lglj;

    move-result-object p1

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p0, p1, v0}, Lr22;->b(Ljjm;Lijm;)V

    :cond_c5
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_c8
    check-cast p0, Ly5g;

    check-cast p1, Ln6j;

    iget-object p0, p0, Ly5g;->i:Lex4;

    check-cast p0, Lqte;

    iget-char p0, p0, Lv6j;->a:C

    invoke-virtual {p1, p0}, Ln6j;->a(I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_d8
    check-cast p0, Lq3g;

    check-cast p1, Lw3g;

    iget-object v0, p0, Lq3g;->c:Ljava/lang/String;

    if-nez v0, :cond_10b

    iget-object v2, p1, Lw3g;->g:Ljava/lang/String;

    const-string v3, "android"

    invoke-static {v2, v3, v5}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v3

    if-nez v3, :cond_10b

    :try_start_ea
    const-string p1, "opera-user"

    invoke-static {v2, p1, v5}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_f5

    iget-object p0, p0, Lq3g;->b:Ljava/net/URI;

    goto :goto_f7

    :cond_f5
    iget-object p0, p0, Lq3g;->a:Ljava/net/URI;

    :goto_f7
    invoke-static {v2}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p1

    invoke-virtual {p1}, Ljava/net/URI;->getAuthority()Ljava/lang/String;

    move-result-object p1

    if-eqz p0, :cond_105

    invoke-virtual {p0}, Ljava/net/URI;->getAuthority()Ljava/lang/String;

    move-result-object v1

    :cond_105
    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5
    :try_end_109
    .catch Ljava/lang/IllegalArgumentException; {:try_start_ea .. :try_end_109} :catch_288

    goto/16 :goto_288

    :cond_10b
    iget-object p0, p1, Lw3g;->g:Ljava/lang/String;

    invoke-static {v0, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    goto/16 :goto_288

    :pswitch_113
    check-cast p0, Le1g;

    check-cast p1, Lr6j;

    new-instance v0, Lhx4;

    iget-char v1, p0, Lv6j;->a:C

    iget-object p1, p1, Lr6j;->j:Lo6j;

    iget-object p1, p1, Lo6j;->a:Ljava/util/Set;

    invoke-direct {v0, v1, p1}, Lhx4;-><init>(ILjava/util/Set;)V

    invoke-virtual {p0, v0}, Le1g;->b(Lhx4;)Lix4;

    move-result-object p0

    return-object p0

    :pswitch_127
    check-cast p0, Ld1g;

    check-cast p1, Lr6j;

    iget-object p0, p0, Ld1g;->d:Lkak;

    iget-object p1, p1, Lr6j;->j:Lo6j;

    iget-object p1, p1, Lo6j;->a:Ljava/util/Set;

    iget-object v0, p0, Lkak;->b:Lekc;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    if-eqz p1, :cond_14c

    if-eqz v0, :cond_14c

    iget-object v1, p0, Lkak;->c:Ljak;

    invoke-interface {v1}, Ljak;->k()Ls6j;

    move-result-object v1

    new-instance v2, Lhx4;

    iget-char p0, p0, Lkak;->a:C

    invoke-direct {v2, p0, p1}, Lhx4;-><init>(ILjava/util/Set;)V

    invoke-interface {v1, v2, v0}, Ls6j;->a(Lhx4;Ljava/lang/Object;)Lix4;

    move-result-object v1

    :cond_14c
    return-object v1

    :pswitch_14d
    check-cast p0, Lwxf;

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iget-object p0, p0, Lwxf;->b:Lgu6;

    invoke-virtual {p0}, Lsxf;->p()I

    move-result v0

    if-eqz v0, :cond_164

    invoke-virtual {p0}, Lsxf;->p()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr p1, v0

    goto :goto_165

    :cond_164
    const/4 p1, 0x0

    :goto_165
    invoke-static {p1}, Lzed;->b(F)I

    move-result p1

    invoke-virtual {p0}, Lsxf;->k()I

    move-result v0

    add-int/2addr v0, p1

    invoke-virtual {p0, v0}, Lsxf;->j(I)I

    move-result p1

    iget-object p0, p0, Lsxf;->q:Lq0g;

    invoke-virtual {p0, p1}, Lq0g;->i(I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_17a
    check-cast p0, Lhd;

    check-cast p1, Lkotlin/Unit;

    iget-object p1, p0, Lhd;->g:Ljava/lang/Object;

    check-cast p1, Lmgh;

    invoke-virtual {p1}, Lmgh;->h()Ljf0;

    move-result-object p1

    check-cast p1, Lw56;

    if-nez p1, :cond_18d

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_1b5

    :cond_18d
    :try_start_18d
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    new-instance v1, Lxq0;

    new-instance v1, Ljava/io/DataOutputStream;

    invoke-direct {v1, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_199
    .catch Ljava/io/IOException; {:try_start_18d .. :try_end_199} :catch_1b3

    :try_start_199
    invoke-virtual {v1, v3}, Ljava/io/DataOutputStream;->writeByte(I)V

    invoke-static {v1, p1}, Lxq0;->f4(Ljava/io/DataOutputStream;Lw56;)V
    :try_end_19f
    .catchall {:try_start_199 .. :try_end_19f} :catchall_1ae

    :try_start_19f
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    iget-object p0, p0, Lhd;->e:Ljava/lang/Object;

    check-cast p0, Lshf;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    invoke-virtual {p0, p1}, Lshf;->H([B)V

    goto :goto_1b3

    :catchall_1ae
    move-exception p0

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    throw p0
    :try_end_1b3
    .catch Ljava/io/IOException; {:try_start_19f .. :try_end_1b3} :catch_1b3

    :catch_1b3
    :goto_1b3
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_1b5
    return-object p0

    :pswitch_1b6
    check-cast p0, Lwsf;

    check-cast p1, Lkotlin/Unit;

    iget-object p1, p0, Lwsf;->e:Lmgh;

    invoke-virtual {p1}, Lmgh;->h()Ljf0;

    move-result-object p1

    check-cast p1, Lv56;

    if-nez p1, :cond_1c7

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_1ed

    :cond_1c7
    :try_start_1c7
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    new-instance v1, Lxq0;

    new-instance v1, Ljava/io/DataOutputStream;

    invoke-direct {v1, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_1d3
    .catch Ljava/io/IOException; {:try_start_1c7 .. :try_end_1d3} :catch_1eb

    :try_start_1d3
    invoke-virtual {v1, v3}, Ljava/io/DataOutputStream;->writeByte(I)V

    invoke-static {v1, p1}, Lxq0;->e4(Ljava/io/DataOutputStream;Lv56;)V
    :try_end_1d9
    .catchall {:try_start_1d3 .. :try_end_1d9} :catchall_1e6

    :try_start_1d9
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    iget-object p0, p0, Lwsf;->c:Lshf;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    invoke-virtual {p0, p1}, Lshf;->H([B)V

    goto :goto_1eb

    :catchall_1e6
    move-exception p0

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    throw p0
    :try_end_1eb
    .catch Ljava/io/IOException; {:try_start_1d9 .. :try_end_1eb} :catch_1eb

    :catch_1eb
    :goto_1eb
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_1ed
    return-object p0

    :pswitch_1ee
    check-cast p0, Lhd;

    check-cast p1, Lkotlin/Unit;

    iget-object p1, p0, Lhd;->g:Ljava/lang/Object;

    check-cast p1, Lmgh;

    invoke-virtual {p1}, Lmgh;->h()Ljf0;

    move-result-object p1

    check-cast p1, Lu56;

    if-nez p1, :cond_201

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_229

    :cond_201
    :try_start_201
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    new-instance v1, Lxq0;

    new-instance v1, Ljava/io/DataOutputStream;

    invoke-direct {v1, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_20d
    .catch Ljava/io/IOException; {:try_start_201 .. :try_end_20d} :catch_227

    :try_start_20d
    invoke-virtual {v1, v3}, Ljava/io/DataOutputStream;->writeByte(I)V

    invoke-static {v1, p1}, Lxq0;->d4(Ljava/io/DataOutputStream;Lu56;)V
    :try_end_213
    .catchall {:try_start_20d .. :try_end_213} :catchall_222

    :try_start_213
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    iget-object p0, p0, Lhd;->e:Ljava/lang/Object;

    check-cast p0, Lshf;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    invoke-virtual {p0, p1}, Lshf;->H([B)V

    goto :goto_227

    :catchall_222
    move-exception p0

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    throw p0
    :try_end_227
    .catch Ljava/io/IOException; {:try_start_213 .. :try_end_227} :catch_227

    :catch_227
    :goto_227
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_229
    return-object p0

    :pswitch_22a
    check-cast p0, La3g;

    check-cast p1, Ler0;

    iget-wide v0, p0, La3g;->b:J

    iget-object v2, p1, Ler0;->a:Ldr0;

    invoke-virtual {v2, v6, v6, v0, v1}, Ljf0;->p(IIJ)V

    iget-wide v0, p0, La3g;->c:J

    iget-object p1, p1, Ler0;->a:Ldr0;

    invoke-virtual {p1, v5, v6, v0, v1}, Ljf0;->p(IIJ)V

    iget-wide v0, p0, La3g;->d:J

    invoke-virtual {p1, v3, v6, v0, v1}, Ljf0;->p(IIJ)V

    iget-wide v0, p0, La3g;->e:J

    const/4 p0, 0x3

    invoke-virtual {p1, p0, v6, v0, v1}, Ljf0;->p(IIJ)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_24a
    check-cast p0, Lqrf;

    iget-object p0, p0, Lqrf;->c:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_252
    if-ge v5, v0, :cond_264

    invoke-virtual {p0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v5, v5, 0x1

    check-cast v1, Lprf;

    iget-object v2, v1, Lprf;->a:Lt5h;

    iget-object v1, v1, Lprf;->b:Ljava/lang/Object;

    invoke-virtual {v2, p1, v1}, Lt5h;->q(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_252

    :cond_264
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_267
    check-cast p0, Lxg5;

    check-cast p1, Lvb7;

    new-instance p1, Lci;

    const/16 v0, 0xd

    invoke-direct {p1, p0, v0}, Lci;-><init>(Ljava/lang/Object;B)V

    return-object p1

    :pswitch_273
    check-cast p0, Lvoh;

    check-cast p1, Lvoh;

    iget v0, p1, Lvoh;->b:F

    iget v1, p0, Lvoh;->d:F

    cmpg-float v0, v0, v1

    if-gez v0, :cond_288

    iget p1, p1, Lvoh;->d:F

    iget p0, p0, Lvoh;->b:F

    cmpl-float p0, p1, p0

    if-lez p0, :cond_288

    move v5, v6

    :catch_288
    :cond_288
    :goto_288
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_28d
    check-cast p0, Lmlf;

    check-cast p1, Lkotlin/Unit;

    iget-object p1, p0, Lmlf;->d:Ljava/lang/Object;

    check-cast p1, Lx5f;

    iget-object v0, p0, Lmlf;->c:Ljava/lang/Object;

    check-cast v0, Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    iget-object p0, p0, Lmlf;->f:Ljava/lang/Object;

    monitor-enter p0

    :try_start_2a2
    invoke-static {v0}, Lmlf;->d(Landroid/content/SharedPreferences;)Ljava/util/LinkedHashMap;

    move-result-object v1

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_2b0
    .catchall {:try_start_2a2 .. :try_end_2b0} :catchall_345

    monitor-exit p0

    const-string p0, "stop_event_"

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2c0
    :goto_2c0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2f0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Number;

    invoke-virtual {v6}, Ljava/lang/Number;->intValue()I

    move-result v6

    invoke-static {v4, p0, v5}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_2c0

    if-lez v6, :cond_2c0

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v0, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2c0

    :cond_2f0
    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->d0(Ljava/lang/Iterable;)I

    move-result v0

    new-instance v2, Lehc;

    invoke-direct {v2, v0}, Lehc;-><init>(I)V

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_307
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_330

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    invoke-static {v3, p0}, Lkotlin/text/StringsKt;->T(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move v4, v5

    :goto_328
    if-ge v4, v1, :cond_307

    invoke-virtual {v2, v3}, Lehc;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    goto :goto_328

    :cond_330
    invoke-static {v2}, Lkotlin/collections/a;->a(Lehc;)Lehc;

    move-result-object p0

    iget-boolean v0, p1, Lx5f;->h:Z

    if-eqz v0, :cond_342

    new-instance v0, Lrkc;

    const/16 v1, 0x1c

    invoke-direct {v0, p0, v1}, Lrkc;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Lx5f;->T0(Lkotlin/jvm/functions/Function1;)V

    :cond_342
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :catchall_345
    move-exception p1

    monitor-exit p0

    throw p1

    :pswitch_348
    check-cast p0, Lkdf;

    check-cast p1, Lxsh;

    invoke-virtual {p0, p1}, Lkdf;->T0(Lxsh;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_352
    check-cast p0, Lxt2;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {p0, p1}, Lgcf;->setEnabled(Z)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_360
    check-cast p0, Lvbf;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lvbf;->m(Ljava/lang/CharSequence;)Llbf;

    move-result-object p0

    return-object p0

    :pswitch_369
    check-cast p0, Lzaf;

    check-cast p1, Landroid/view/View;

    iget-object p0, p0, Lzaf;->b:Lgbf;

    invoke-virtual {p0}, Lgbf;->n()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_375
    check-cast p0, Lvzh;

    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {p0}, Lvzh;->close()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_37f
    check-cast p0, Lrq0;

    check-cast p1, Lck0;

    invoke-virtual {p1}, Lck0;->d()Ltd0;

    move-result-object p1

    iget-object v0, p1, Ltd0;->a:Lzpa;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lqq0;

    invoke-direct {v0, v2, v4, v6}, Ljf0;-><init>(III)V

    iget-object p1, p1, Ltd0;->b:Lqd0;

    const/16 v1, 0x9

    invoke-virtual {p1, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    if-eqz v2, :cond_3a9

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3a9

    new-instance v3, Lhf0;

    invoke-direct {v3, p1, v1, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_3b2

    :cond_3a9
    invoke-static {p1, v1, v6}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v2

    new-instance v3, Lhf0;

    invoke-direct {v3, p1, v1, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_3b2
    invoke-virtual {v3, v0}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, v5, v6, p0}, Ljf0;->q(IILjava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_3bb
    check-cast p0, Llqm;

    check-cast p1, Lye0;

    invoke-virtual {p0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object p0

    iget-object p1, p1, Lye0;->a:Lxe0;

    invoke-virtual {p1, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    if-eqz v0, :cond_3d9

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3d9

    new-instance v1, Lif0;

    invoke-direct {v1, p1, v5, v0}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_3e6

    :cond_3d9
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p1, v5, v6, v0}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v1, Lif0;

    invoke-direct {v1, p1, v5, v0}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_3e6
    const-wide/16 v2, 0x1

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v1, p0, p1}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_3f2
    check-cast p0, Lph0;

    check-cast p1, Lck0;

    invoke-virtual {p1}, Lck0;->d()Ltd0;

    move-result-object p1

    iget-object v0, p1, Ltd0;->a:Lzpa;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Loh0;

    invoke-direct {v0, v2, v4, v6}, Ljf0;-><init>(III)V

    iget-object p1, p1, Ltd0;->b:Lqd0;

    const/4 v1, 0x6

    invoke-virtual {p1, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    if-eqz v2, :cond_41b

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_41b

    new-instance v3, Lhf0;

    invoke-direct {v3, p1, v1, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_424

    :cond_41b
    invoke-static {p1, v1, v6}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v2

    new-instance v3, Lhf0;

    invoke-direct {v3, p1, v1, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_424
    invoke-virtual {v3, v0}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    if-nez p0, :cond_42a

    move v6, v5

    :cond_42a
    invoke-virtual {v0, v5, v6, p0}, Ljf0;->q(IILjava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_430
    check-cast p0, Lvt0;

    check-cast p1, Ltd0;

    iget-object v0, p1, Ltd0;->a:Lzpa;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lut0;

    invoke-direct {v0, v2, v4, v6}, Ljf0;-><init>(III)V

    iget-object p1, p1, Ltd0;->b:Lqd0;

    const/16 v1, 0x48

    invoke-virtual {p1, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    if-eqz v2, :cond_456

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_456

    new-instance v3, Lhf0;

    invoke-direct {v3, p1, v1, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_45f

    :cond_456
    invoke-static {p1, v1, v6}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v2

    new-instance v3, Lhf0;

    invoke-direct {v3, p1, v1, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_45f
    invoke-virtual {v3, v0}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, v5, v6, p0}, Ljf0;->q(IILjava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_468
    check-cast p0, Lvd0;

    check-cast p1, Lrj0;

    iget-object p1, p1, Lrj0;->a:Lqj0;

    invoke-virtual {p1, v5, v6, p0}, Ljf0;->q(IILjava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_474
    check-cast p0, Lnl0;

    check-cast p1, Lck0;

    invoke-virtual {p1}, Lck0;->d()Ltd0;

    move-result-object p1

    iget-object p1, p1, Ltd0;->c:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lyb0;

    iget-object v0, p1, Lyb0;->a:Lzpa;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lml0;

    invoke-direct {v0, v2, v4, v6}, Ljf0;-><init>(III)V

    iget-object p1, p1, Lyb0;->b:Lxb0;

    const/16 v1, 0x30

    invoke-virtual {p1, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    if-eqz v2, :cond_4a6

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_4a6

    new-instance v3, Lhf0;

    invoke-direct {v3, p1, v1, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_4af

    :cond_4a6
    invoke-static {p1, v1, v6}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object v2

    new-instance v3, Lhf0;

    invoke-direct {v3, p1, v1, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_4af
    invoke-virtual {v3, v0}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, v5, v6, p0}, Ljf0;->q(IILjava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_4b8
    .packed-switch 0x0
        :pswitch_474
        :pswitch_468
        :pswitch_430
        :pswitch_3f2
        :pswitch_3bb
        :pswitch_37f
        :pswitch_375
        :pswitch_369
        :pswitch_360
        :pswitch_352
        :pswitch_348
        :pswitch_28d
        :pswitch_273
        :pswitch_267
        :pswitch_24a
        :pswitch_22a
        :pswitch_1ee
        :pswitch_1b6
        :pswitch_17a
        :pswitch_14d
        :pswitch_127
        :pswitch_113
        :pswitch_d8
        :pswitch_c8
        :pswitch_8c
        :pswitch_7c
        :pswitch_59
        :pswitch_41
        :pswitch_37
    .end packed-switch
.end method
