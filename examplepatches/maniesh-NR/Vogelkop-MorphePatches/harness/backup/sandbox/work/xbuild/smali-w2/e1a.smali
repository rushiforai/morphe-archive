.class public final Le1a;
.super Lh6e;
.source "SourceFile"


# instance fields
.field public final synthetic d:B


# direct methods
.method public synthetic constructor <init>(Lpqk;IB)V
    .registers 4

    iput-byte p3, p0, Le1a;->d:B

    invoke-direct {p0, p1, p2}, Lh6e;-><init>(Lpqk;I)V

    return-void
.end method


# virtual methods
.method public final g(Lvpb;IZ)Ldri;
    .registers 13

    iget-byte p0, p0, Le1a;->d:B

    packed-switch p0, :pswitch_data_84

    invoke-static {p1, p2}, Lvsi;->e(Lvpb;I)Ldri;

    move-result-object p0

    return-object p0

    :pswitch_a
    iget-object p0, p1, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {p0, p2}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object p0

    const/4 p1, 0x2

    invoke-virtual {p0, p1}, Lorg/json/JSONArray;->optJSONArray(I)Lorg/json/JSONArray;

    move-result-object p1

    const/4 p2, 0x0

    if-nez p1, :cond_1a

    move-object p3, p2

    goto :goto_1f

    :cond_1a
    new-instance p3, Lvpb;

    invoke-direct {p3, p1}, Lvpb;-><init>(Lorg/json/JSONArray;)V

    :goto_1f
    if-eqz p3, :cond_82

    iget-object p1, p3, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result p3

    const/4 v0, 0x0

    move v1, v0

    :goto_29
    if-ge v1, p3, :cond_82

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONArray;->optInt(II)I

    move-result v2

    const/16 v3, 0x1ee

    if-ne v2, v3, :cond_7f

    :try_start_33
    invoke-virtual {p0, v0}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    sget-object p3, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    if-eq p1, p3, :cond_68

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    new-instance p1, Lorb;

    const/4 p3, 0x3

    invoke-virtual {p0, p3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object p0

    invoke-direct {p1, p0}, Lorb;-><init>(Lorg/json/JSONObject;)V

    const-string p0, "b"

    invoke-virtual {p1, p0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    sget-object p1, Laik;->a:[Ljava/lang/String;

    invoke-static {p0, v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;I)Landroid/text/Spanned;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v1, Ldri;

    const-string v4, ""

    const-string v5, ""

    const-string v8, ""

    const/4 v7, 0x0

    const/4 v6, 0x2

    invoke-direct/range {v1 .. v8}, Ldri;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;)V

    move-object p2, v1

    goto :goto_82

    :cond_68
    new-instance p0, Lorg/json/JSONException;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, " is null"

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_7f
    .catch Lorg/json/JSONException; {:try_start_33 .. :try_end_7f} :catch_82

    :cond_7f
    add-int/lit8 v1, v1, 0x1

    goto :goto_29

    :catch_82
    :cond_82
    :goto_82
    return-object p2

    nop

    :pswitch_data_84
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method
