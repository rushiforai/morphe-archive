.class public final Lnlj;
.super Lsi;
.source "SourceFile"


# instance fields
.field public final a:Lk06;

.field public final b:Ljava/util/HashMap;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:J


# direct methods
.method public constructor <init>(Lk06;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;J)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnlj;->a:Lk06;

    iput-object p2, p0, Lnlj;->b:Ljava/util/HashMap;

    iput-object p3, p0, Lnlj;->c:Ljava/lang/String;

    if-eqz p4, :cond_17

    const-string p1, "{choiceId}"

    invoke-virtual {p4, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p1

    if-gez p1, :cond_17

    const/4 p1, 0x0

    iput-object p1, p0, Lnlj;->d:Ljava/lang/String;

    goto :goto_19

    :cond_17
    iput-object p4, p0, Lnlj;->d:Ljava/lang/String;

    :goto_19
    iput-wide p5, p0, Lnlj;->e:J

    return-void
.end method

.method public static b(Lorb;J)Lnlj;
    .registers 17

    const-string v0, "creative"

    invoke-virtual {p0, v0}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v0

    const-string v1, "creativeType"

    invoke-virtual {v0, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, -0x1

    sparse-switch v2, :sswitch_data_10e

    goto :goto_33

    :sswitch_16
    const-string v2, "BIG_CARD"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_33

    const/4 v4, 0x2

    goto :goto_33

    :sswitch_20
    const-string v2, "video"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_33

    const/4 v4, 0x1

    goto :goto_33

    :sswitch_2a
    const-string v2, "image"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_33

    move v4, v3

    :cond_33
    :goto_33
    const/4 v1, 0x0

    packed-switch v4, :pswitch_data_11c

    const-string p0, "Unexpected creative type"

    invoke-static {p0}, Lcom/appsflyer/internal/o;->a(Ljava/lang/String;)V

    return-object v1

    :pswitch_3d
    new-instance v2, Lh06;

    invoke-direct {v2, v0}, Lh06;-><init>(Lorb;)V

    :goto_42
    move-object v6, v2

    goto :goto_5a

    :pswitch_44
    new-instance v2, Lj06;

    invoke-direct {v2, v3}, Lj06;-><init>(B)V

    const-string v4, "videoUrl"

    invoke-virtual {v0, v4}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    goto :goto_42

    :pswitch_4f
    new-instance v2, Li06;

    invoke-direct {v2, v3}, Li06;-><init>(B)V

    const-string v4, "imageUrl"

    invoke-virtual {v0, v4}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    goto :goto_42

    :goto_5a
    const-string v0, "eventTrackers"

    invoke-virtual {p0, v0}, Lorb;->b(Ljava/lang/String;)Lvpb;

    move-result-object v0

    iget-object v2, v0, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v2

    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7, v2}, Ljava/util/HashMap;-><init>(I)V

    move v4, v3

    :goto_6c
    if-ge v4, v2, :cond_cb

    invoke-virtual {v0, v4}, Lvpb;->c(I)Lorb;

    move-result-object v5

    const-string v8, "eventType"

    invoke-virtual {v5, v8}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {}, Lmd8;->values()[Lmd8;

    move-result-object v9

    array-length v10, v9

    move v11, v3

    :goto_7e
    if-ge v11, v10, :cond_8d

    aget-object v12, v9, v11

    iget-object v13, v12, Lmd8;->a:Ljava/lang/String;

    invoke-virtual {v13, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_8e

    add-int/lit8 v11, v11, 0x1

    goto :goto_7e

    :cond_8d
    move-object v12, v1

    :cond_8e
    if-eqz v12, :cond_b4

    const-string v8, "urls"

    invoke-virtual {v5, v8}, Lorb;->b(Ljava/lang/String;)Lvpb;

    move-result-object v5

    iget-object v8, v5, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v8

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9, v8}, Ljava/util/ArrayList;-><init>(I)V

    move v10, v3

    :goto_a2
    if-ge v10, v8, :cond_ae

    invoke-virtual {v5, v10}, Lvpb;->d(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v10, v10, 0x1

    goto :goto_a2

    :cond_ae
    invoke-virtual {v7, v12, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-nez v5, :cond_b7

    :cond_b4
    add-int/lit8 v4, v4, 0x1

    goto :goto_6c

    :cond_b7
    new-instance p0, Lorg/json/JSONException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Duplicate event type: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_cb
    sget-object v0, Lmd8;->b:Lmd8;

    invoke-virtual {v7, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_107

    sget-object v0, Lmd8;->c:Lmd8;

    invoke-virtual {v7, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_107

    const-string v0, "clickUrl"

    invoke-virtual {p0, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iget-object v0, p0, Lorb;->a:Lorg/json/JSONObject;

    const-string v2, "adChoiceUrl"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_ef

    invoke-virtual {p0, v2}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_ef
    if-eqz v1, :cond_ff

    const-string p0, "%7BchoiceId%7D"

    const-string v0, "{choiceId}"

    invoke-virtual {v1, p0, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v1, "%7bchoiceId%7d"

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    :cond_ff
    move-object v9, v1

    new-instance v5, Lnlj;

    move-wide v10, p1

    invoke-direct/range {v5 .. v11}, Lnlj;-><init>(Lk06;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/String;J)V

    return-object v5

    :cond_107
    const-string p0, "Missing non-optional event type(s)"

    invoke-static {p0}, Lcom/appsflyer/internal/o;->a(Ljava/lang/String;)V

    return-object v1

    nop

    :sswitch_data_10e
    .sparse-switch
        0x5faa95b -> :sswitch_2a
        0x6b0147b -> :sswitch_20
        0x5c36b70f -> :sswitch_16
    .end sparse-switch

    :pswitch_data_11c
    .packed-switch 0x0
        :pswitch_4f
        :pswitch_44
        :pswitch_3d
    .end packed-switch
.end method


# virtual methods
.method public final a(Lez;Lami;I)Lyz;
    .registers 17

    iget-object v0, p0, Lnlj;->a:Lk06;

    invoke-interface {v0}, Lk06;->c()Z

    move-result v1

    if-eqz v1, :cond_af

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p2}, Ljava/lang/Object;->hashCode()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v2, v3}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v2, p3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v0}, Lk06;->f()Lh06;

    move-result-object v4

    new-instance v2, Lgu9;

    sget-object v0, Lmd8;->c:Lmd8;

    iget-object v1, p0, Lnlj;->b:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Ljava/util/List;

    sget-object v0, Lmd8;->b:Lmd8;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Ljava/util/List;

    iget-object v0, p0, Lnlj;->d:Ljava/lang/String;

    if-nez v0, :cond_58

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :goto_56
    move-object v9, v0

    goto :goto_a5

    :cond_58
    const-string v1, "{choiceId}"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v3, -0x1

    if-ne v1, v3, :cond_64

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    goto :goto_56

    :cond_64
    new-instance v3, Lri;

    const-string v7, "1"

    invoke-static {v1, v0, v7}, Lp37;->v0(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    sget-object v8, Lwz;->a:Lwz;

    invoke-direct {v3, v8, v7}, Lri;-><init>(Lwz;Ljava/lang/String;)V

    new-instance v7, Lri;

    const-string v8, "2"

    invoke-static {v1, v0, v8}, Lp37;->v0(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    sget-object v9, Lwz;->d:Lwz;

    invoke-direct {v7, v9, v8}, Lri;-><init>(Lwz;Ljava/lang/String;)V

    new-instance v8, Lri;

    const-string v9, "3"

    invoke-static {v1, v0, v9}, Lp37;->v0(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    sget-object v11, Lwz;->b:Lwz;

    invoke-direct {v8, v11, v9}, Lri;-><init>(Lwz;Ljava/lang/String;)V

    new-instance v9, Lri;

    const-string v11, "4"

    invoke-static {v1, v0, v11}, Lp37;->v0(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lwz;->c:Lwz;

    invoke-direct {v9, v1, v0}, Lri;-><init>(Lwz;Ljava/lang/String;)V

    filled-new-array {v3, v7, v8, v9}, [Lri;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    goto :goto_56

    :goto_a5
    iget-object v8, p0, Lnlj;->c:Ljava/lang/String;

    iget-wide v11, p0, Lnlj;->e:J

    move-object v3, p1

    move-object v7, p2

    invoke-direct/range {v2 .. v12}, Lgu9;-><init>(Lez;Lh06;Ljava/util/List;Ljava/util/List;Lami;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;J)V

    return-object v2

    :cond_af
    invoke-static {}, Lt3p;->o()V

    const/4 p0, 0x0

    return-object p0
.end method
