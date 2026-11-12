.class public final synthetic Lpv1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lpv1;->a:B

    iput-object p1, p0, Lpv1;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .registers 26

    move-object/from16 v0, p0

    iget-byte v1, v0, Lpv1;->a:B

    iget-object v0, v0, Lpv1;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_e0

    check-cast v0, Ljava/util/ArrayList;

    move-object/from16 v1, p1

    check-cast v1, Laln;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :pswitch_13
    check-cast v0, Lujn;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Lujn;->P(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_23

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/d;->notifyItemChanged(I)V

    :cond_23
    return-void

    :pswitch_24
    check-cast v0, Lk6l;

    move-object/from16 v1, p1

    check-cast v1, Lb2l;

    invoke-virtual {v0, v1}, Lk6l;->k(Lb2l;)V

    return-void

    :pswitch_2e
    check-cast v0, Lxg;

    move-object/from16 v1, p1

    check-cast v1, Ltch;

    iget-object v2, v0, Lxg;->c:Ljava/lang/Object;

    check-cast v2, Ljava/util/LinkedHashSet;

    invoke-interface {v2, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v0, v0, Lxg;->b:Ljava/lang/Iterable;

    check-cast v0, Li7f;

    new-instance v2, Lg7f;

    invoke-direct {v2, v0}, Lg7f;-><init>(Li7f;)V

    :goto_44
    invoke-virtual {v2}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_54

    invoke-virtual {v2}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfj3;

    invoke-virtual {v0, v1}, Lfj3;->a(Ltch;)V

    goto :goto_44

    :cond_54
    return-void

    :pswitch_55
    move-object v3, v0

    check-cast v3, Lbeg;

    move-object/from16 v0, p1

    check-cast v0, Landroid/view/Display;

    iget-object v0, v3, Lbeg;->A:Landroid/view/Display;

    invoke-static {v0}, Lbeg;->f(Landroid/view/Display;)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v20

    invoke-static {v0}, Lbeg;->e(Landroid/view/Display;)Ljava/lang/Float;

    move-result-object v21

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    invoke-virtual/range {v3 .. v23}, Lfb7;->c(Ljava/lang/String;Landroid/graphics/Rect;Landroid/graphics/Rect;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Float;Landroid/view/Display$Mode;Ljava/util/List;Ljava/lang/Boolean;Ljava/lang/Float;Ljava/lang/Boolean;Ldb7;)V

    return-void

    :pswitch_86
    check-cast v0, Ljava/util/List;

    move-object/from16 v1, p1

    check-cast v1, Lq9g;

    invoke-interface {v1, v0}, Lq9g;->d(Ljava/util/List;)V

    return-void

    :pswitch_90
    check-cast v0, Lcom/opera/android/favorites/FavoritesBridge$Folder;

    move-object/from16 v1, p1

    check-cast v1, Lhq8;

    check-cast v1, Lcom/opera/android/favorites/a;

    iget-object v1, v1, Lcom/opera/android/favorites/a;->f:Lcom/opera/android/favorites/FavoritesBridge$Favorite;

    iget-wide v2, v0, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    iget-wide v0, v1, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    invoke-static {v2, v3, v0, v1}, LJ/N;->MPjvJx9a(JJ)V

    return-void

    :pswitch_a2
    check-cast v0, Lms7;

    move-object/from16 v1, p1

    check-cast v1, Landroid/location/Location;

    invoke-virtual {v0, v1}, Lms7;->accept(Ljava/lang/Object;)V

    return-void

    :pswitch_ac
    check-cast v0, Lzie;

    move-object/from16 v1, p1

    check-cast v1, Lej3;

    iget-object v1, v1, Lej3;->a:Lij3;

    iget-object v1, v1, Lij3;->f:Lkze;

    invoke-virtual {v1, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_ba
    check-cast v0, Lxv1;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/String;

    const/16 v2, 0x1b

    invoke-static {v2, v1}, Lks3;->I(ILjava/lang/String;)V

    iget-object v0, v0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->d:Lx5f;

    iget-object v2, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    invoke-virtual {v3, v2}, Lx56;->O(Lzpa;)Le66;

    move-result-object v2

    const/16 v4, 0xf

    invoke-virtual {v2, v4, v1}, Le66;->y(ILjava/lang/String;)V

    invoke-virtual {v0, v3}, Lx5f;->U0(Lx56;)V

    return-void

    :pswitch_data_e0
    .packed-switch 0x0
        :pswitch_ba
        :pswitch_ac
        :pswitch_a2
        :pswitch_90
        :pswitch_86
        :pswitch_55
        :pswitch_2e
        :pswitch_24
        :pswitch_13
    .end packed-switch
.end method
