.class public final synthetic Lm6e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln5o;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lq6e;


# direct methods
.method public synthetic constructor <init>(Lq6e;B)V
    .registers 3

    iput-byte p2, p0, Lm6e;->a:B

    iput-object p1, p0, Lm6e;->b:Lq6e;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Lm6e;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    iget-object p0, p0, Lm6e;->b:Lq6e;

    packed-switch v0, :pswitch_data_7c

    check-cast p1, Ll6e;

    iget-object v0, p0, Lq6e;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lq6e;->l()V

    return-object v2

    :pswitch_14
    check-cast p1, Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_42

    iget-object v0, p0, Lq6e;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, p1}, Ljava/util/ArrayList;->addAll(ILjava/util/Collection;)Z

    invoke-virtual {p0}, Lq6e;->j()Z

    iget-object p1, p0, Lq6e;->i:Ljbf;

    invoke-virtual {p1}, Lno7;->i()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Libf;

    const/16 v0, 0x200

    invoke-virtual {p1, v0}, Libf;->a(I)Z

    move-result p1

    if-eqz p1, :cond_38

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lq6e;->g(Z)Z

    :cond_38
    invoke-virtual {p0}, Lq6e;->b()Leri;

    move-result-object p1

    invoke-virtual {p0, p1}, Lq6e;->i(Leri;)V

    invoke-virtual {p0}, Lq6e;->l()V

    :cond_42
    return-object v2

    :pswitch_43
    check-cast p1, Ljava/lang/Void;

    iget-object p1, p0, Lq6e;->b:Liri;

    :try_start_47
    iget-object v0, p0, Lq6e;->c:Lwzg;

    iget-object v2, p0, Lq6e;->m:Lp1;

    iget-object v3, p0, Lq6e;->h:Lk6e;

    invoke-virtual {p1, v0, v2, v3}, Liri;->l(Lwzg;Lp1;Lk6e;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_6c

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    move v3, v1

    :cond_5c
    if-ge v3, v2, :cond_6c

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Ll6e;

    iget v4, v4, Ll6e;->h:I

    const/4 v5, 0x5

    if-eq v4, v5, :cond_5c

    goto :goto_73

    :cond_6c
    invoke-virtual {p0, p1}, Lq6e;->h(Liri;)Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Ljava/util/ArrayList;->addAll(ILjava/util/Collection;)Z
    :try_end_73
    .catchall {:try_start_47 .. :try_end_73} :catchall_77

    :goto_73
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteOpenHelper;->close()V

    return-object v0

    :catchall_77
    move-exception p0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteOpenHelper;->close()V

    throw p0

    :pswitch_data_7c
    .packed-switch 0x0
        :pswitch_43
        :pswitch_14
    .end packed-switch
.end method
