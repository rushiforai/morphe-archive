.class public final synthetic Ln6e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln5o;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lq6e;

.field public final synthetic c:Ll6e;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lq6e;Ll6e;Ljava/lang/String;B)V
    .registers 5

    iput-byte p4, p0, Ln6e;->a:B

    iput-object p1, p0, Ln6e;->b:Lq6e;

    iput-object p2, p0, Ln6e;->c:Ll6e;

    iput-object p3, p0, Ln6e;->d:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 16

    iget-byte v0, p0, Ln6e;->a:B

    iget-object v1, p0, Ln6e;->c:Ll6e;

    iget-object v2, p0, Ln6e;->b:Lq6e;

    packed-switch v0, :pswitch_data_c2

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_a7

    iget-object p1, v2, Lq6e;->a:Ljava/util/ArrayList;

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    const/4 v3, -0x1

    if-eq v0, v3, :cond_a7

    invoke-virtual {v1}, Ll6e;->q()V

    iget-object v3, v2, Lq6e;->h:Lk6e;

    iget-object v6, v1, Ll6e;->c:Ljava/lang/String;

    iget-object v7, v1, Ll6e;->d:Ljava/lang/String;

    iget-object v9, v1, Ll6e;->f:Ljava/lang/String;

    iget v5, v1, Ll6e;->h:I

    iget-object v8, p0, Ln6e;->d:Ljava/lang/String;

    const/4 p0, 0x5

    if-eq v5, p0, :cond_70

    invoke-static {v7}, Ll6e;->p(Ljava/lang/String;)Z

    move-result v4

    const/4 v10, 0x0

    if-eqz v4, :cond_4e

    new-instance v4, Lf1a;

    move v11, v10

    new-instance v10, Li6e;

    invoke-direct {v10, v3, v11}, Li6e;-><init>(Lk6e;B)V

    new-instance v11, Li6e;

    const/4 p0, 0x1

    invoke-direct {v11, v3, p0}, Li6e;-><init>(Lk6e;B)V

    move-object v13, v9

    move v9, v5

    move-object v5, v6

    move-object v6, v7

    move-object v7, v8

    move-object v8, v13

    invoke-direct/range {v4 .. v11}, Lf1a;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILi6e;Li6e;)V

    goto :goto_95

    :cond_4e
    sget-object v3, Lwqm;->a:[Ljava/lang/String;

    invoke-static {v7}, Laik;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "\\."

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    array-length v4, v3

    :goto_5b
    if-ge v10, v4, :cond_70

    aget-object v11, v3, v10

    const-string v12, "yandex"

    invoke-virtual {v12, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_6d

    new-instance v4, Lfco;

    invoke-direct/range {v4 .. v9}, Ll6e;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_95

    :cond_6d
    add-int/lit8 v10, v10, 0x1

    goto :goto_5b

    :cond_70
    if-eq v5, p0, :cond_90

    sget-object p0, Ll6e;->k:Lhr5;

    const-string p0, "opera-aria://ui/"

    invoke-virtual {v7, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_82

    new-instance v4, Ll42;

    invoke-direct/range {v4 .. v9}, Ll6e;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_95

    :cond_82
    const-string p0, "https://chatgpt.com/?q"

    invoke-virtual {v7, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_90

    new-instance v4, Liu4;

    invoke-direct/range {v4 .. v9}, Ll6e;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_95

    :cond_90
    new-instance v4, Ll6e;

    invoke-direct/range {v4 .. v9}, Ll6e;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_95
    iget-object p0, v1, Ll6e;->i:Lwzg;

    iput-object p0, v4, Ll6e;->i:Lwzg;

    iget-object p0, v1, Ll6e;->g:Lpqk;

    iput-object p0, v4, Ll6e;->g:Lpqk;

    iget-wide v5, v1, Ll6e;->b:J

    iput-wide v5, v4, Ll6e;->b:J

    invoke-virtual {p1, v0, v4}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v2}, Lq6e;->l()V

    :cond_a7
    const/4 p0, 0x0

    return-object p0

    :pswitch_a9
    iget-object p0, p0, Ln6e;->d:Ljava/lang/String;

    check-cast p1, Ljava/lang/Void;

    iget-object p1, v2, Lq6e;->b:Liri;

    :try_start_af
    invoke-virtual {p1, v1, p0}, Liri;->q(Ll6e;Ljava/lang/String;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0
    :try_end_b7
    .catchall {:try_start_af .. :try_end_b7} :catchall_bb

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteOpenHelper;->close()V

    return-object p0

    :catchall_bb
    move-exception v0

    move-object p0, v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteOpenHelper;->close()V

    throw p0

    nop

    :pswitch_data_c2
    .packed-switch 0x0
        :pswitch_a9
    .end packed-switch
.end method
