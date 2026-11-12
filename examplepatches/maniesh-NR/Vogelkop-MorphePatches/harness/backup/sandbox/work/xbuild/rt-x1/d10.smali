.class public abstract Ld10;
.super Lg10;
.source "SourceFile"


# instance fields
.field public final H:Ljava/util/ArrayList;

.field public final I:Landroid/util/SparseArray;

.field public final J:Leme;

.field public K:I


# direct methods
.method public constructor <init>(Landroid/view/View;Lkze;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lg10;-><init>(Landroid/view/View;Lkze;)V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Ld10;->H:Ljava/util/ArrayList;

    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Ld10;->I:Landroid/util/SparseArray;

    new-instance p1, Leme;

    const/4 p2, 0x6

    invoke-direct {p1, p2}, Leme;-><init>(B)V

    iput-object p1, p0, Ld10;->J:Leme;

    iget-object p1, p0, Lxv8;->i:Landroid/view/ViewGroup;

    invoke-static {p1}, Lg10;->n0(Landroid/view/View;)V

    iget-object p1, p0, Lxv8;->m:Landroid/widget/TextView;

    invoke-static {p1}, Lg10;->n0(Landroid/view/View;)V

    iget-object p1, p0, Lxv8;->n:Landroid/widget/TextView;

    iget-object p2, p0, Lxv8;->m:Landroid/widget/TextView;

    invoke-virtual {p2}, Landroid/view/View;->getId()I

    move-result p2

    invoke-static {p2, p1}, Lg10;->p0(ILandroid/view/View;)V

    iget-object p1, p0, Lxv8;->j:Landroid/widget/FrameLayout;

    iget-object p2, p0, Lxv8;->o:Landroid/widget/TextView;

    invoke-virtual {p2}, Landroid/view/View;->getId()I

    move-result p2

    invoke-static {p2, p1}, Lg10;->p0(ILandroid/view/View;)V

    iget-object p1, p0, Lxv8;->q:Landroid/view/View;

    iget-object p0, p0, Lxv8;->j:Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result p0

    invoke-static {p0, p1}, Lg10;->p0(ILandroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final A0()V
    .registers 11

    iget-object v0, p0, Ld10;->J:Leme;

    iget-object v1, v0, Leme;->a:Ljava/lang/Object;

    check-cast v1, Lorg/json/JSONArray;

    iget-object v0, v0, Leme;->a:Ljava/lang/Object;

    check-cast v0, Lorg/json/JSONArray;

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-eqz v1, :cond_8b

    const/4 v1, 0x0

    move v2, v1

    :goto_12
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_21

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    if-eqz v3, :cond_8b

    add-int/lit8 v2, v2, 0x1

    goto :goto_12

    :cond_21
    invoke-virtual {p0}, Ll00;->l0()Lw10;

    move-result-object v2

    iget-object v2, v2, Lw10;->u:Lcie;

    const/4 v3, 0x5

    invoke-static {v2, v3}, Lcs5;->q0(Lcie;I)V

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "respInfo"

    invoke-virtual {v2, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {p0}, Ll00;->l0()Lw10;

    move-result-object v3

    iget-object v3, v3, Lw10;->u:Lcie;

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v6

    iget-object v2, v3, Lcie;->N:Ljava/util/ArrayList;

    if-eqz v2, :cond_76

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_76

    iget-object v2, v3, Lcie;->N:Ljava/util/ArrayList;

    new-instance v9, Lz0c;

    const/16 v4, 0x19

    invoke-direct {v9, v3, v6, v4}, Lz0c;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    :goto_56
    if-ge v1, v3, :cond_76

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v1, v1, 0x1

    move-object v5, v4

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Landroid/webkit/URLUtil;->isNetworkUrl(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_6b

    invoke-static {v9}, Lhyg;->b(Lmjo;)V

    goto :goto_56

    :cond_6b
    new-instance v4, Ljro;

    const/4 v7, 0x0

    const/4 v8, 0x1

    invoke-direct/range {v4 .. v9}, Ljro;-><init>(Ljava/lang/String;Ljava/lang/String;IILmjo;)V

    invoke-static {v4}, Lhyg;->c(Ljro;)V

    goto :goto_56

    :cond_76
    invoke-virtual {p0}, Ll00;->m0()Lx10;

    move-result-object p0

    invoke-virtual {p0}, Lx10;->o()V

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result p0

    add-int/lit8 p0, p0, -0x1

    :goto_83
    if-ltz p0, :cond_8b

    invoke-virtual {v0, p0}, Lorg/json/JSONArray;->remove(I)Ljava/lang/Object;

    add-int/lit8 p0, p0, -0x1

    goto :goto_83

    :cond_8b
    return-void
.end method

.method public final V(Lja2;Z)V
    .registers 6

    invoke-super {p0, p1, p2}, Lg10;->V(Lja2;Z)V

    if-eqz p2, :cond_6

    return-void

    :cond_6
    invoke-virtual {p0}, Ll00;->l0()Lw10;

    move-result-object p1

    iget-object p1, p1, Lw10;->u:Lcie;

    invoke-virtual {p0, p1}, Ld10;->u0(Lcie;)Ljava/util/List;

    move-result-object p2

    iget-object p0, p0, Ld10;->H:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_38

    iget-object p2, p1, Lbzo;->d:Lw06;

    sget-object v0, Lw06;->p:Lw06;

    if-ne p2, v0, :cond_23

    const/4 p2, 0x2

    goto :goto_24

    :cond_23
    const/4 p2, 0x1

    :goto_24
    new-instance v0, Llgh;

    iget-object v1, p1, Lcie;->r:Ljava/lang/String;

    iget-object p1, p1, Lcie;->A:Ljava/util/ArrayList;

    sget-object v2, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    if-nez p1, :cond_2f

    move-object p1, v2

    :cond_2f
    check-cast p1, Ljava/util/List;

    invoke-direct {v0, p2, v1, p1}, Llgh;-><init>(ILjava/lang/String;Ljava/util/List;)V

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :cond_38
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    return-void
.end method

.method public final onClick(Landroid/view/View;)V
    .registers 8

    iget-object v0, p0, Ld10;->I:Landroid/util/SparseArray;

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lc10;

    if-nez v0, :cond_62

    iget-object v0, p0, Lxv8;->x:Landroid/widget/TextView;

    if-ne p1, v0, :cond_63

    invoke-virtual {p0}, Ll00;->l0()Lw10;

    move-result-object p1

    iget-object p1, p1, Lw10;->u:Lcie;

    iget v0, p0, Ld10;->K:I

    iget-object v1, p0, Ld10;->H:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_53

    iget v0, p0, Ld10;->K:I

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Llgh;

    invoke-virtual {p0}, Ld10;->t0()Ljava/util/ArrayList;

    move-result-object v2

    iget v3, p0, Ld10;->K:I

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x1

    sub-int/2addr v4, v5

    if-ne v3, v4, :cond_3a

    move v4, v5

    goto :goto_3b

    :cond_3a
    const/4 v4, 0x0

    :goto_3b
    invoke-virtual {p0, v0, v3, v2, v4}, Ld10;->x0(Llgh;ILjava/util/List;Z)V

    iget v0, p0, Ld10;->K:I

    add-int/2addr v0, v5

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_4f

    const/4 v1, 0x6

    invoke-static {p1, v1}, Lcs5;->q0(Lcie;I)V

    invoke-virtual {p0, v0}, Ld10;->y0(I)Llgh;

    return-void

    :cond_4f
    invoke-virtual {p0}, Ld10;->z0()V

    return-void

    :cond_53
    const/4 p0, 0x4

    invoke-static {p1, p0}, Lcs5;->q0(Lcie;I)V

    iget-object p0, p1, Lcie;->P:Ljsd;

    if-eqz p0, :cond_62

    iget-object p1, p1, Lcie;->w0:Laoo;

    if-eqz p1, :cond_62

    invoke-virtual {p1, p0}, Laoo;->j(Landroid/view/View;)V

    :cond_62
    return-void

    :cond_63
    invoke-super {p0, p1}, Lxv8;->onClick(Landroid/view/View;)V

    return-void
.end method

.method public final q0(Landroid/os/Bundle;)V
    .registers 9

    const-string v0, "answers"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    const-string v1, "question"

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    const-string v3, "responses"

    const-string v4, ""

    invoke-virtual {p1, v3, v4}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object v3, p0, Ld10;->J:Leme;

    iget-object v4, v3, Leme;->a:Ljava/lang/Object;

    check-cast v4, Lorg/json/JSONArray;

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    :goto_21
    if-ltz v5, :cond_29

    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->remove(I)Ljava/lang/Object;

    add-int/lit8 v5, v5, -0x1

    goto :goto_21

    :cond_29
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_49

    :try_start_2f
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4, p1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    move p1, v2

    :goto_35
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge p1, v5, :cond_49

    iget-object v5, v3, Leme;->a:Ljava/lang/Object;

    check-cast v5, Lorg/json/JSONArray;

    invoke-virtual {v4, p1}, Lorg/json/JSONArray;->opt(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, p1, v6}, Lorg/json/JSONArray;->put(ILjava/lang/Object;)Lorg/json/JSONArray;
    :try_end_46
    .catch Lorg/json/JSONException; {:try_start_2f .. :try_end_46} :catch_49

    add-int/lit8 p1, p1, 0x1

    goto :goto_35

    :catch_49
    :cond_49
    iget-object p1, p0, Ld10;->H:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lt v1, p1, :cond_55

    invoke-virtual {p0}, Ld10;->z0()V

    return-void

    :cond_55
    invoke-virtual {p0, v1}, Ld10;->y0(I)Llgh;

    invoke-virtual {p0}, Ld10;->v0()Z

    move-result p1

    move v1, v2

    :goto_5d
    iget-object v3, p0, Ld10;->I:Landroid/util/SparseArray;

    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    move-result v4

    if-ge v1, v4, :cond_7b

    invoke-virtual {v3, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lc10;

    if-eqz v0, :cond_78

    iget-object v4, v3, Lc10;->a:Ljava/lang/String;

    invoke-interface {v0, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    xor-int/lit8 v5, p1, 0x1

    invoke-virtual {v3, v2, v4, v5}, Lc10;->a(ZZZ)V

    :cond_78
    add-int/lit8 v1, v1, 0x1

    goto :goto_5d

    :cond_7b
    invoke-virtual {p0}, Ld10;->t0()Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    iget-object p0, p0, Lxv8;->x:Landroid/widget/TextView;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setEnabled(Z)V

    return-void
.end method

.method public final r0(Landroid/os/Bundle;)V
    .registers 5

    invoke-virtual {p0}, Ld10;->t0()Ljava/util/ArrayList;

    move-result-object v0

    new-instance v1, Lb10;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lb10;-><init>(B)V

    invoke-static {v1, v0}, Lnb6;->W(Lxq9;Ljava/util/List;)Ljava/util/AbstractList;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1d

    const-string v1, "answers"

    invoke-static {v0}, Lnb6;->J(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    :cond_1d
    const-string v0, "question"

    iget v1, p0, Ld10;->K:I

    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    iget-object p0, p0, Ld10;->J:Leme;

    iget-object p0, p0, Leme;->a:Ljava/lang/Object;

    check-cast p0, Lorg/json/JSONArray;

    invoke-virtual {p0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "responses"

    invoke-virtual {p1, v0, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final t0()Ljava/util/ArrayList;
    .registers 5

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    :goto_6
    iget-object v2, p0, Ld10;->I:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v3

    if-ge v1, v3, :cond_24

    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lc10;

    iget-object v3, v2, Lc10;->c:Landroid/widget/TextView;

    check-cast v3, Landroid/widget/Checkable;

    invoke-interface {v3}, Landroid/widget/Checkable;->isChecked()Z

    move-result v3

    if-eqz v3, :cond_21

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_21
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    :cond_24
    return-object v0
.end method

.method public u0(Lcie;)Ljava/util/List;
    .registers 4

    new-instance p0, Llgh;

    iget-object v0, p1, Lcie;->r:Ljava/lang/String;

    iget-object p1, p1, Lcie;->A:Ljava/util/ArrayList;

    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    if-nez p1, :cond_b

    move-object p1, v1

    :cond_b
    check-cast p1, Ljava/util/List;

    const/4 v1, 0x1

    invoke-direct {p0, v1, v0, p1}, Llgh;-><init>(ILjava/lang/String;Ljava/util/List;)V

    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public v0()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public w0(Llgh;Ljava/lang/String;)Lc10;
    .registers 5

    new-instance v0, Lc10;

    iget p1, p1, Llgh;->a:I

    const/4 v1, 0x1

    if-ne p1, v1, :cond_b

    const p1, 0x7f0d0158

    goto :goto_e

    :cond_b
    const p1, 0x7f0d0157

    :goto_e
    const/4 v1, 0x0

    iget-object p0, p0, Lg10;->E:Landroid/widget/LinearLayout;

    invoke-static {p0, p1, v1}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p0

    invoke-direct {v0, p0, p2}, Lc10;-><init>(Landroid/view/View;Ljava/lang/String;)V

    return-object v0
.end method

.method public final x0(Llgh;ILjava/util/List;Z)V
    .registers 12

    invoke-interface {p3}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_71

    :try_start_6
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "qType"

    iget v2, p1, Llgh;->a:I

    invoke-static {v2}, Lv0g;->d(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "qIndex"

    invoke-virtual {v0, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v1, "qDesc"

    iget-object v2, p1, Llgh;->b:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_2b
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_54

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lc10;

    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    const-string v4, "cIndex"

    iget-object v5, p1, Llgh;->c:Ljava/util/List;

    iget-object v6, v2, Lc10;->a:Ljava/lang/String;

    invoke-interface {v5, v6}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v4, "cDesc"

    iget-object v2, v2, Lc10;->a:Ljava/lang/String;

    invoke-virtual {v3, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_2b

    :cond_54
    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    const-string p3, "question"

    invoke-virtual {p1, p3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p3, "choices"

    invoke-virtual {p1, p3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object p3, p0, Ld10;->J:Leme;

    iget-object p3, p3, Leme;->a:Ljava/lang/Object;

    check-cast p3, Lorg/json/JSONArray;

    invoke-virtual {p3, p2, p1}, Lorg/json/JSONArray;->put(ILjava/lang/Object;)Lorg/json/JSONArray;

    if-eqz p4, :cond_71

    invoke-virtual {p0}, Ld10;->A0()V
    :try_end_71
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_71} :catch_71

    :catch_71
    :cond_71
    return-void
.end method

.method public y0(I)Llgh;
    .registers 14

    iput p1, p0, Ld10;->K:I

    iget-object v0, p0, Ld10;->H:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Llgh;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget-object v1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-object v2, p0, Lg10;->E:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->removeAllViews()V

    iget-object v3, p0, Ld10;->I:Landroid/util/SparseArray;

    invoke-virtual {v3}, Landroid/util/SparseArray;->clear()V

    const/16 v4, 0x8

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-le v0, v6, :cond_26

    move v7, v5

    goto :goto_27

    :cond_26
    move v7, v4

    :goto_27
    iget-object v8, p0, Lxv8;->l:Landroid/widget/TextView;

    invoke-virtual {v8, v7}, Landroid/view/View;->setVisibility(I)V

    iget v7, p0, Ld10;->K:I

    add-int/2addr v7, v6

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    filled-new-array {v7, v9}, [Ljava/lang/Object;

    move-result-object v7

    const v9, 0x7f14077e

    invoke-virtual {v1, v9, v7}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v8, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p1, Llgh;->b:Ljava/lang/String;

    iget-object v7, p1, Llgh;->c:Ljava/util/List;

    invoke-virtual {p0}, Ll00;->l0()Lw10;

    move-result-object v8

    iget-object v8, v8, Lw10;->u:Lcie;

    iget-object v8, v8, Lcie;->r:Ljava/lang/String;

    invoke-static {v1, v8}, Laik;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v8, p0, Lxv8;->n:Landroid/widget/TextView;

    invoke-virtual {v8, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v8, v5}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, p0, Lxv8;->p:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v8

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_6b

    move v8, v4

    goto :goto_6c

    :cond_6b
    move v8, v5

    :goto_6c
    invoke-virtual {v1, v8}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Lxv8;->i0()V

    move v1, v5

    :goto_73
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v8

    if-ge v1, v8, :cond_b0

    invoke-interface {v7, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_ad

    invoke-virtual {p0, p1, v8}, Ld10;->w0(Llgh;Ljava/lang/String;)Lc10;

    move-result-object v9

    iget-object v10, v9, Lc10;->c:Landroid/widget/TextView;

    sget-object v11, Lq9n;->c:Ll5b;

    invoke-static {}, Landroid/view/View;->generateViewId()I

    move-result v11

    invoke-virtual {v10, v11}, Landroid/view/View;->setId(I)V

    invoke-virtual {v10, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v8, Lgf;

    const/16 v11, 0xb

    invoke-direct {v8, p0, v11}, Lgf;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v10, v8}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v8, v9, Lc10;->b:Landroid/view/View;

    invoke-virtual {v2, v8}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-virtual {v10}, Landroid/view/View;->getId()I

    move-result v8

    invoke-virtual {v3, v8, v9}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    :cond_ad
    add-int/lit8 v1, v1, 0x1

    goto :goto_73

    :cond_b0
    iget-object v1, p0, Lxv8;->x:Landroid/widget/TextView;

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setEnabled(Z)V

    invoke-virtual {p0}, Ld10;->v0()Z

    move-result v2

    if-eqz v2, :cond_bf

    return-object p1

    :cond_bf
    iget p0, p0, Ld10;->K:I

    sub-int/2addr v0, v6

    if-ne p0, v0, :cond_cb

    const p0, 0x7f140769

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(I)V

    goto :goto_d1

    :cond_cb
    const p0, 0x7f140b36

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(I)V

    :goto_d1
    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    return-object p1
.end method

.method public final z0()V
    .registers 5

    iget-object v0, p0, Ld10;->H:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iput v0, p0, Ld10;->K:I

    iget-object v0, p0, Lg10;->E:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    iget-object v0, p0, Ld10;->I:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    iget-object v0, p0, Lxv8;->l:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Ll00;->l0()Lw10;

    move-result-object v0

    iget-object v2, p0, Lxv8;->B:Lwv8;

    invoke-interface {v2, v0}, Lwv8;->e(Lyz;)Ljava/lang/CharSequence;

    move-result-object v2

    iget-object v3, p0, Lxv8;->x:Landroid/widget/TextView;

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_30

    const/4 v2, 0x0

    goto :goto_31

    :cond_30
    move v2, v1

    :goto_31
    invoke-virtual {v3, v2}, Landroid/view/View;->setVisibility(I)V

    const/4 v2, 0x1

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setEnabled(Z)V

    iget-object v2, p0, Lxv8;->n:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v2, p0, Lxv8;->p:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v2, p0, Lxv8;->q:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, v0, Lw10;->u:Lcie;

    invoke-virtual {p0, v0}, Lg10;->s0(Lcie;)V

    return-void
.end method
