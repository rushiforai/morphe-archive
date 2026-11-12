.class public final synthetic Ltb2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lub2;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lub2;Ljava/lang/String;B)V
    .registers 4

    iput-byte p3, p0, Ltb2;->a:B

    iput-object p1, p0, Ltb2;->b:Lub2;

    iput-object p2, p0, Ltb2;->c:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 16

    iget-byte v0, p0, Ltb2;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    iget-object v3, p0, Ltb2;->c:Ljava/lang/String;

    const/4 v4, 0x0

    iget-object v5, p0, Ltb2;->b:Lub2;

    packed-switch v0, :pswitch_data_158

    check-cast p1, Lt0i;

    iget-object p0, p1, Lt0i;->a:Ljava/lang/Object;

    instance-of p1, p0, Lq0i;

    if-eqz p1, :cond_16

    move-object v0, v1

    goto :goto_17

    :cond_16
    move-object v0, p0

    :goto_17
    if-eqz v0, :cond_22

    if-eqz p1, :cond_1c

    move-object p0, v1

    :cond_1c
    new-instance p1, Lkotlin/Pair;

    invoke-direct {p1, p0, v1}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_56

    :cond_22
    iget-object p0, v5, Lub2;->d:Lob2;

    iget-object p1, p0, Lob2;->a:Ly5i;

    new-instance v0, Ltx0;

    invoke-direct {v0, v3, p0}, Ltx0;-><init>(Ljava/lang/String;Lob2;)V

    invoke-static {p1, v2, v4, v0}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    check-cast p0, Ljava/lang/Iterable;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_3c
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_50

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lpb2;

    iget-object v0, v0, Lpb2;->e:Ljava/util/List;

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0, p1}, Lo95;->t(Ljava/lang/Iterable;Ljava/util/Collection;)V

    goto :goto_3c

    :cond_50
    new-instance p0, Lkotlin/Pair;

    invoke-direct {p0, v1, p1}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    move-object p1, p0

    :goto_56
    return-object p1

    :pswitch_57
    check-cast p1, Lkotlin/Unit;

    iget-object p0, v5, Lub2;->d:Lob2;

    iget-object p0, p0, Lob2;->a:Ly5i;

    new-instance p1, Ltx0;

    const/16 v0, 0x8

    invoke-direct {p1, v3, v0}, Ltx0;-><init>(Ljava/lang/String;B)V

    invoke-static {p0, v2, v4, p1}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ls0o;

    return-object p0

    :pswitch_6b
    check-cast p1, Ljava/util/List;

    if-eqz p1, :cond_b9

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    iget-object v0, v5, Lub2;->d:Lob2;

    check-cast p1, Ljava/lang/Iterable;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_83
    :goto_83
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_ad

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lsb2;

    iget-object v6, v5, Lsb2;->b:Lxb2;

    if-eqz v6, :cond_a6

    iget-object v10, v6, Lxb2;->b:Ljava/lang/String;

    if-eqz v10, :cond_a6

    move-object v7, v6

    new-instance v6, Lpb2;

    iget-object v8, v5, Lsb2;->a:Ljava/util/List;

    iget-object v9, v7, Lxb2;->a:Ljava/lang/String;

    iget-object v11, v7, Lxb2;->c:Ljava/util/List;

    iget-object v7, p0, Ltb2;->c:Ljava/lang/String;

    invoke-direct/range {v6 .. v13}, Lpb2;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;J)V

    goto :goto_a7

    :cond_a6
    move-object v6, v1

    :goto_a7
    if-eqz v6, :cond_83

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_83

    :cond_ad
    iget-object p0, v0, Lob2;->a:Ly5i;

    new-instance p1, Lq3;

    const/16 v1, 0x19

    invoke-direct {p1, v0, v3, v1}, Lq3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p0, v4, v2, p1}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    :cond_b9
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_bc
    check-cast p1, Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_145

    iget-object p0, v5, Lub2;->c:Li16;

    :try_start_c6
    iget-object p1, p0, Li16;->b:Ljava/lang/Object;

    check-cast p1, Lii;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lt9f;

    invoke-static {v3}, Li16;->i(Ljava/lang/String;)Lkvh;

    move-result-object v0

    invoke-virtual {p1, v0}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object p1

    invoke-interface {p1}, Lv84;->execute()Lpzh;

    move-result-object p1
    :try_end_dc
    .catch Lo2j; {:try_start_c6 .. :try_end_dc} :catch_10b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_c6 .. :try_end_dc} :catch_10b
    .catch Ljava/io/IOException; {:try_start_c6 .. :try_end_dc} :catch_10b

    :try_start_dc
    iget-boolean v0, p1, Lpzh;->q:Z
    :try_end_de
    .catchall {:try_start_dc .. :try_end_de} :catchall_103

    if-nez v0, :cond_e4

    :try_start_e0
    invoke-virtual {p1}, Lpzh;->close()V
    :try_end_e3
    .catch Lo2j; {:try_start_e0 .. :try_end_e3} :catch_10b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_e0 .. :try_end_e3} :catch_10b
    .catch Ljava/io/IOException; {:try_start_e0 .. :try_end_e3} :catch_10b

    goto :goto_10b

    :cond_e4
    :try_start_e4
    iget-object p0, p0, Li16;->c:Ljava/lang/Object;

    check-cast p0, Lcrb;

    iget-object v0, p1, Lpzh;->g:Lvzh;

    invoke-virtual {v0}, Lvzh;->string()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Lk72;

    sget-object v3, Lsb2;->Companion:Lrb2;

    invoke-virtual {v3}, Lrb2;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v3

    invoke-direct {v2, v3, v4}, Lk72;-><init>(Lkotlinx/serialization/KSerializer;B)V

    invoke-virtual {p0, v0, v2}, Lrpb;->a(Ljava/lang/String;Lkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;
    :try_end_ff
    .catchall {:try_start_e4 .. :try_end_ff} :catchall_103

    :try_start_ff
    invoke-virtual {p1}, Lpzh;->close()V
    :try_end_102
    .catch Lo2j; {:try_start_ff .. :try_end_102} :catch_10b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_ff .. :try_end_102} :catch_10b
    .catch Ljava/io/IOException; {:try_start_ff .. :try_end_102} :catch_10b

    goto :goto_10c

    :catchall_103
    move-exception v0

    move-object p0, v0

    :try_start_105
    throw p0
    :try_end_106
    .catchall {:try_start_105 .. :try_end_106} :catchall_106

    :catchall_106
    move-exception v0

    :try_start_107
    invoke-static {p1, p0}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0
    :try_end_10b
    .catch Lo2j; {:try_start_107 .. :try_end_10b} :catch_10b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_107 .. :try_end_10b} :catch_10b
    .catch Ljava/io/IOException; {:try_start_107 .. :try_end_10b} :catch_10b

    :catch_10b
    :goto_10b
    move-object p0, v1

    :goto_10c
    if-eqz p0, :cond_145

    check-cast p0, Ljava/lang/Iterable;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_119
    :goto_119
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_144

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lsb2;

    iget-object v3, v2, Lsb2;->a:Ljava/util/List;

    const-string v4, "delegate_permission/common.handle_all_urls"

    invoke-interface {v3, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_119

    iget-object v2, v2, Lsb2;->b:Lxb2;

    if-eqz v2, :cond_137

    iget-object v2, v2, Lxb2;->a:Ljava/lang/String;

    goto :goto_138

    :cond_137
    move-object v2, v1

    :goto_138
    const-string v3, "android_app"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_119

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_119

    :cond_144
    move-object v1, p1

    :cond_145
    return-object v1

    :pswitch_146
    check-cast p1, Lkotlin/Unit;

    iget-object p0, v5, Lub2;->d:Lob2;

    iget-object p1, p0, Lob2;->a:Ly5i;

    new-instance v0, Ltx0;

    invoke-direct {v0, v3, p0}, Ltx0;-><init>(Ljava/lang/String;Lob2;)V

    invoke-static {p1, v2, v4, v0}, Lkfo;->Y(Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    return-object p0

    :pswitch_data_158
    .packed-switch 0x0
        :pswitch_146
        :pswitch_bc
        :pswitch_6b
        :pswitch_57
    .end packed-switch
.end method
