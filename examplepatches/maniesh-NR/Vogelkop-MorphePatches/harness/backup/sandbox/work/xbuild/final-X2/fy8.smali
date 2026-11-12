.class public final Lfy8;
.super Lzx8;
.source "SourceFile"


# instance fields
.field public final m:Ljava/util/List;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lmsh;Ljava/util/List;Ljava/lang/String;)V
    .registers 5

    .line 68
    invoke-direct {p0, p2, p1, p4}, Lzx8;-><init>(Lmsh;Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    iput-object p3, p0, Lfy8;->m:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Lmsh;Ljava/util/List;Ljava/lang/String;B)V
    .registers 5

    packed-switch p4, :pswitch_data_10

    .line 70
    const-string p4, "report"

    invoke-direct {p0, p4, p1, p2, p3}, Lfy8;-><init>(Ljava/lang/String;Lmsh;Ljava/util/List;Ljava/lang/String;)V

    return-void

    .line 71
    :pswitch_9
    const-string p4, "not_interested"

    invoke-direct {p0, p4, p1, p2, p3}, Lfy8;-><init>(Ljava/lang/String;Lmsh;Ljava/util/List;Ljava/lang/String;)V

    return-void

    nop

    :pswitch_data_10
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method

.method public constructor <init>(Lorb;Ljava/lang/String;)V
    .registers 7

    invoke-direct {p0, p1, p2}, Lzx8;-><init>(Lorb;Ljava/lang/String;)V

    const-string p2, "feedback_reason"

    invoke-virtual {p1, p2}, Lorb;->h(Ljava/lang/String;)Lvpb;

    move-result-object p1

    if-eqz p1, :cond_43

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lfy8;->m:Ljava/util/List;

    const/4 p2, 0x0

    :goto_13
    iget-object v0, p1, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-ge p2, v0, :cond_43

    invoke-virtual {p1, p2}, Lvpb;->e(I)Lorb;

    move-result-object v0

    if-eqz v0, :cond_2b

    iget-object v1, p0, Lfy8;->m:Ljava/util/List;

    invoke-static {v0}, Ltx8;->a(Lorb;)Ltx8;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_40

    :cond_2b
    invoke-virtual {p1, p2}, Lvpb;->f(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_40

    iget-object v1, p0, Lfy8;->m:Ljava/util/List;

    new-instance v2, Ltx8;

    const/4 v3, 0x0

    invoke-direct {v2, v0, v3, v3}, Ltx8;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_40
    :goto_40
    add-int/lit8 p2, p2, 0x1

    goto :goto_13

    :cond_43
    return-void
.end method


# virtual methods
.method public final a(Lorb;)V
    .registers 8

    invoke-super {p0, p1}, Lzx8;->a(Lorb;)V

    iget-object p0, p0, Lfy8;->m:Ljava/util/List;

    if-eqz p0, :cond_4b

    new-instance v0, Lvpb;

    invoke-direct {v0}, Lvpb;-><init>()V

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_10
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_46

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ltx8;

    new-instance v2, Lorb;

    invoke-direct {v2}, Lorb;-><init>()V

    iget-object v3, v1, Ltx8;->a:Ljava/lang/String;

    iget-object v4, v1, Ltx8;->c:Ljava/lang/String;

    iget-object v1, v1, Ltx8;->b:Ljava/lang/String;

    const-string v5, "id"

    invoke-virtual {v2, v3, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_37

    const-string v3, "value"

    invoke-virtual {v2, v1, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_37
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_42

    const-string v1, "content"

    invoke-virtual {v2, v4, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_42
    invoke-virtual {v0, v2}, Lvpb;->a(Ljava/lang/Object;)V

    goto :goto_10

    :cond_46
    const-string p0, "feedback_reason"

    invoke-virtual {p1, v0, p0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_4b
    return-void
.end method
