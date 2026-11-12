.class public final synthetic La0k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/api/Callback;

.field public final synthetic c:Lnr8;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/api/Callback;Lnr8;)V
    .registers 4

    .line 11
    const/4 v0, 0x1

    iput-byte v0, p0, La0k;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, La0k;->b:Lcom/opera/api/Callback;

    iput-object p2, p0, La0k;->c:Lnr8;

    return-void
.end method

.method public synthetic constructor <init>(Lnr8;Lcom/opera/api/Callback;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, La0k;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, La0k;->c:Lnr8;

    iput-object p2, p0, La0k;->b:Lcom/opera/api/Callback;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 14

    iget-byte v0, p0, La0k;->a:B

    iget-object v1, p0, La0k;->c:Lnr8;

    iget-object p0, p0, La0k;->b:Lcom/opera/api/Callback;

    packed-switch v0, :pswitch_data_78

    check-cast v1, Lcom/opera/android/favorites/e;

    iget-object v0, v1, Lcom/opera/android/favorites/e;->f:Lcom/opera/android/favorites/b;

    invoke-interface {p0, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_11
    move-object v0, v1

    check-cast v0, Lcom/opera/android/favorites/e;

    iget-object v0, v0, Lcom/opera/android/favorites/e;->f:Lcom/opera/android/favorites/b;

    iget-object v0, v0, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v2, 0x0

    move v3, v2

    move v6, v3

    move v7, v6

    move v9, v7

    :goto_21
    if-ge v3, v0, :cond_6d

    move-object v4, v1

    check-cast v4, Lcom/opera/android/favorites/e;

    iget-object v4, v4, Lcom/opera/android/favorites/e;->f:Lcom/opera/android/favorites/b;

    invoke-virtual {v4, v3}, Ltq8;->u(I)Lhq8;

    move-result-object v4

    invoke-virtual {v4}, Lhq8;->j()Z

    move-result v5

    const-string v8, "ofa://ui/synced_speeddials?source=sd_plus"

    if-eqz v5, :cond_58

    add-int/lit8 v7, v7, 0x1

    check-cast v4, Ltq8;

    iget-object v5, v4, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    move v10, v2

    :goto_3f
    if-ge v10, v5, :cond_6a

    invoke-virtual {v4, v10}, Ltq8;->u(I)Lhq8;

    move-result-object v11

    sget-object v12, Lp6l;->a:Lp6l;

    invoke-virtual {v11, v12}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object v11

    sget-object v12, Lhk6;->e:La36;

    invoke-static {v11, v8}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_55

    add-int/lit8 v6, v6, 0x1

    :cond_55
    add-int/lit8 v10, v10, 0x1

    goto :goto_3f

    :cond_58
    sget-object v5, Lp6l;->a:Lp6l;

    invoke-virtual {v4, v5}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lhk6;->e:La36;

    invoke-static {v4, v8}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_6a

    add-int/lit8 v6, v6, 0x1

    add-int/lit8 v9, v9, 0x1

    :cond_6a
    add-int/lit8 v3, v3, 0x1

    goto :goto_21

    :cond_6d
    new-instance v4, Lb0k;

    const/4 v5, 0x0

    const/4 v8, 0x0

    invoke-direct/range {v4 .. v9}, Lb0k;-><init>(IIIII)V

    invoke-interface {p0, v4}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_data_78
    .packed-switch 0x0
        :pswitch_11
    .end packed-switch
.end method
