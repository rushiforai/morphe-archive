.class public final synthetic Lhfj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liv9;


# static fields
.field public static final a:Lhfj;

.field private static final descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lhfj;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lhfj;->a:Lhfj;

    new-instance v1, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    const-string v2, "com.opera.android.aiassistant.api.ShodanApi.SuggestionsQuestion"

    const/16 v3, 0xa

    invoke-direct {v1, v2, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;-><init>(Ljava/lang/String;Liv9;I)V

    const-string v0, "id"

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "title"

    const/4 v3, 0x1

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "subtitle"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "text"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "image"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "categories"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "image_hash"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "thumbnails"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "attachment_image"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "requires_a_chat"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    sput-object v1, Lhfj;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    return-void
.end method


# virtual methods
.method public final childSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 11

    sget-object p0, Ljfj;->k:[Ll4c;

    sget-object v0, Lxhk;->a:Lxhk;

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v1

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v2

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v3

    const/4 v4, 0x5

    aget-object p0, p0, v4

    invoke-interface {p0}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lkotlinx/serialization/KSerializer;

    invoke-static {p0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object p0

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v5

    sget-object v6, Lrfj;->a:Lrfj;

    invoke-static {v6}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v6

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v7

    const/16 v8, 0xa

    new-array v8, v8, [Lkotlinx/serialization/KSerializer;

    const/4 v9, 0x0

    aput-object v0, v8, v9

    const/4 v9, 0x1

    aput-object v1, v8, v9

    const/4 v1, 0x2

    aput-object v2, v8, v1

    const/4 v1, 0x3

    aput-object v0, v8, v1

    const/4 v0, 0x4

    aput-object v3, v8, v0

    aput-object p0, v8, v4

    const/4 p0, 0x6

    aput-object v5, v8, p0

    const/4 p0, 0x7

    aput-object v6, v8, p0

    const/16 p0, 0x8

    aput-object v7, v8, p0

    sget-object p0, Lrn3;->a:Lrn3;

    const/16 v0, 0x9

    aput-object p0, v8, v0

    return-object v8
.end method

.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 21

    sget-object v0, Lhfj;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-object/from16 v1, p1

    invoke-interface {v1, v0}, Lkotlinx/serialization/encoding/Decoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Loh5;

    move-result-object v1

    sget-object v2, Ljfj;->k:[Ll4c;

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    move v6, v3

    move v8, v4

    move/from16 v18, v8

    move-object v9, v5

    move-object v10, v9

    move-object v11, v10

    move-object v12, v11

    move-object v13, v12

    move-object v14, v13

    move-object v15, v14

    move-object/from16 v16, v15

    move-object/from16 v17, v16

    :goto_1c
    if-eqz v6, :cond_a8

    invoke-interface {v1, v0}, Loh5;->p(Lkotlinx/serialization/descriptors/SerialDescriptor;)I

    move-result v7

    packed-switch v7, :pswitch_data_b2

    invoke-static {v7}, Lt3p;->d(I)V

    return-object v5

    :pswitch_29
    const/16 v7, 0x9

    invoke-interface {v1, v0, v7}, Loh5;->C(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Z

    move-result v18

    or-int/lit16 v8, v8, 0x200

    goto :goto_1c

    :pswitch_32
    sget-object v7, Lxhk;->a:Lxhk;

    const/16 v5, 0x8

    invoke-interface {v1, v0, v5, v7}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v17, v5

    check-cast v17, Ljava/lang/String;

    or-int/lit16 v8, v8, 0x100

    :goto_40
    const/4 v5, 0x0

    goto :goto_1c

    :pswitch_42
    const/4 v5, 0x7

    sget-object v7, Lrfj;->a:Lrfj;

    invoke-interface {v1, v0, v5, v7}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v16, v5

    check-cast v16, Ltfj;

    or-int/lit16 v8, v8, 0x80

    goto :goto_40

    :pswitch_50
    const/4 v5, 0x6

    sget-object v7, Lxhk;->a:Lxhk;

    invoke-interface {v1, v0, v5, v7}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v15, v5

    check-cast v15, Ljava/lang/String;

    or-int/lit8 v8, v8, 0x40

    goto :goto_40

    :pswitch_5d
    const/4 v5, 0x5

    aget-object v7, v2, v5

    invoke-interface {v7}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lkotlinx/serialization/KSerializer;

    invoke-interface {v1, v0, v5, v7}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v14, v5

    check-cast v14, Ljava/util/List;

    or-int/lit8 v8, v8, 0x20

    goto :goto_40

    :pswitch_70
    sget-object v5, Lxhk;->a:Lxhk;

    const/4 v7, 0x4

    invoke-interface {v1, v0, v7, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v13, v5

    check-cast v13, Ljava/lang/String;

    or-int/lit8 v8, v8, 0x10

    goto :goto_40

    :pswitch_7d
    const/4 v5, 0x3

    invoke-interface {v1, v0, v5}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v12

    or-int/lit8 v8, v8, 0x8

    goto :goto_40

    :pswitch_85
    sget-object v5, Lxhk;->a:Lxhk;

    const/4 v7, 0x2

    invoke-interface {v1, v0, v7, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v11, v5

    check-cast v11, Ljava/lang/String;

    or-int/lit8 v8, v8, 0x4

    goto :goto_40

    :pswitch_92
    sget-object v5, Lxhk;->a:Lxhk;

    invoke-interface {v1, v0, v3, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v10, v5

    check-cast v10, Ljava/lang/String;

    or-int/lit8 v8, v8, 0x2

    goto :goto_40

    :pswitch_9e
    invoke-interface {v1, v0, v4}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v9

    or-int/lit8 v8, v8, 0x1

    goto :goto_40

    :pswitch_a5
    move v6, v4

    goto/16 :goto_1c

    :cond_a8
    invoke-interface {v1, v0}, Loh5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    new-instance v7, Ljfj;

    invoke-direct/range {v7 .. v18}, Ljfj;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ltfj;Ljava/lang/String;Z)V

    return-object v7

    nop

    :pswitch_data_b2
    .packed-switch -0x1
        :pswitch_a5
        :pswitch_9e
        :pswitch_92
        :pswitch_85
        :pswitch_7d
        :pswitch_70
        :pswitch_5d
        :pswitch_50
        :pswitch_42
        :pswitch_32
        :pswitch_29
    .end packed-switch
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    sget-object p0, Lhfj;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 14

    check-cast p2, Ljfj;

    sget-object p0, Lhfj;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Encoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lph5;

    move-result-object p1

    sget-object v0, Ljfj;->k:[Ll4c;

    iget-object v1, p2, Ljfj;->a:Ljava/lang/String;

    iget-boolean v2, p2, Ljfj;->j:Z

    iget-object v3, p2, Ljfj;->i:Ljava/lang/String;

    iget-object v4, p2, Ljfj;->h:Ltfj;

    iget-object v5, p2, Ljfj;->g:Ljava/lang/String;

    iget-object v6, p2, Ljfj;->f:Ljava/util/List;

    iget-object v7, p2, Ljfj;->e:Ljava/lang/String;

    iget-object v8, p2, Ljfj;->c:Ljava/lang/String;

    iget-object v9, p2, Ljfj;->b:Ljava/lang/String;

    const/4 v10, 0x0

    invoke-interface {p1, p0, v10, v1}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_28

    if-eqz v9, :cond_2e

    :cond_28
    sget-object v1, Lxhk;->a:Lxhk;

    const/4 v10, 0x1

    invoke-interface {p1, p0, v10, v1, v9}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_2e
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_36

    if-eqz v8, :cond_3c

    :cond_36
    sget-object v1, Lxhk;->a:Lxhk;

    const/4 v9, 0x2

    invoke-interface {p1, p0, v9, v1, v8}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_3c
    const/4 v1, 0x3

    iget-object p2, p2, Ljfj;->d:Ljava/lang/String;

    invoke-interface {p1, p0, v1, p2}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_4a

    if-eqz v7, :cond_50

    :cond_4a
    sget-object p2, Lxhk;->a:Lxhk;

    const/4 v1, 0x4

    invoke-interface {p1, p0, v1, p2, v7}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_50
    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_58

    if-eqz v6, :cond_64

    :cond_58
    const/4 p2, 0x5

    aget-object v0, v0, p2

    invoke-interface {v0}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlinx/serialization/KSerializer;

    invoke-interface {p1, p0, p2, v0, v6}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_64
    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_6c

    if-eqz v5, :cond_72

    :cond_6c
    sget-object p2, Lxhk;->a:Lxhk;

    const/4 v0, 0x6

    invoke-interface {p1, p0, v0, p2, v5}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_72
    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_7a

    if-eqz v4, :cond_80

    :cond_7a
    sget-object p2, Lrfj;->a:Lrfj;

    const/4 v0, 0x7

    invoke-interface {p1, p0, v0, p2, v4}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_80
    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_88

    if-eqz v3, :cond_8f

    :cond_88
    sget-object p2, Lxhk;->a:Lxhk;

    const/16 v0, 0x8

    invoke-interface {p1, p0, v0, p2, v3}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_8f
    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_97

    if-eqz v2, :cond_9c

    :cond_97
    const/16 p2, 0x9

    invoke-interface {p1, p0, p2, v2}, Lph5;->y(Lkotlinx/serialization/descriptors/SerialDescriptor;IZ)V

    :cond_9c
    invoke-interface {p1, p0}, Lph5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    return-void
.end method
