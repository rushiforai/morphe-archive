.class public final synthetic Laz4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:J

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;JB)V
    .registers 5

    iput-byte p4, p0, Laz4;->a:B

    iput-object p1, p0, Laz4;->c:Ljava/lang/Object;

    iput-wide p2, p0, Laz4;->b:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 11

    iget-byte v0, p0, Laz4;->a:B

    iget-wide v1, p0, Laz4;->b:J

    iget-object p0, p0, Laz4;->c:Ljava/lang/Object;

    const/4 v3, 0x0

    packed-switch v0, :pswitch_data_d4

    check-cast p0, Lv8f;

    check-cast p1, Lilh;

    iget-object v0, p0, Lv8f;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    move v5, v3

    :goto_15
    const/4 v6, -0x1

    if-ge v5, v4, :cond_29

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v5, v5, 0x1

    check-cast v7, Lilh;

    iget-wide v7, v7, Lilh;->a:J

    cmp-long v7, v7, v1

    if-eqz v7, :cond_2a

    add-int/lit8 v3, v3, 0x1

    goto :goto_15

    :cond_29
    move v3, v6

    :cond_2a
    if-eq v3, v6, :cond_34

    invoke-virtual {v0, v3, p1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lv8f;->b:Lode;

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    :cond_34
    return-void

    :pswitch_35
    check-cast p0, Lrma;

    check-cast p1, Lze9;

    iget-object v0, p0, Lrma;->f:Ljava/lang/Object;

    check-cast v0, Lcd9;

    iget v4, p0, Lrma;->b:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_c7

    iput v3, p0, Lrma;->b:I

    const/4 v4, 0x0

    iput-object v4, p0, Lrma;->i:Ljava/lang/Object;

    if-nez p1, :cond_4e

    invoke-virtual {v0, v5}, Lcd9;->A0(I)V

    goto/16 :goto_c7

    :cond_4e
    iget-wide v6, p1, Lze9;->b:J

    add-long/2addr v1, v6

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v6

    sub-long/2addr v1, v6

    iget-object p1, p1, Lze9;->a:Ljava/lang/String;

    const-string v6, "https://opera.com/connect"

    invoke-static {v6}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {v6}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v6

    const-string v7, "id"

    invoke-virtual {v6, v7, p1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    const-string v6, "type"

    const-string v7, "sync"

    invoke-virtual {p1, v6, v7}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcd9;->C0(Ljava/lang/String;)V

    iget-object p1, p0, Lrma;->g:Ljava/lang/Object;

    check-cast p1, Lq65;

    iget-object v0, p0, Lrma;->e:Ljava/lang/Object;

    check-cast v0, Lumi;

    const-wide/16 v6, 0x7530

    invoke-static {v1, v2, v6, v7}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, v0, v1, v2, v6}, Ln1;->B0(Ltcl;JLjava/util/concurrent/TimeUnit;)V

    iget-object p1, p0, Lrma;->d:Ljava/lang/Object;

    check-cast p1, Lbf9;

    new-instance v0, Lzc9;

    invoke-direct {v0, p0, v3}, Lzc9;-><init>(Lrma;B)V

    invoke-virtual {p1}, Lbf9;->r()I

    move-result v1

    if-lt v1, v5, :cond_bd

    iget-object v1, p1, Lbf9;->n:Lzd2;

    if-nez v1, :cond_bd

    iget-object v1, p1, Lbf9;->u:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-boolean v1, p1, Lbf9;->v:Z

    if-nez v1, :cond_b5

    iput-boolean v5, p1, Lbf9;->v:Z

    new-instance v1, Lwe9;

    invoke-direct {v1, p1, v3}, Lwe9;-><init>(Lbf9;B)V

    const-wide/16 v2, 0x2710

    invoke-static {v1, v2, v3}, Lvml;->d(Ljava/lang/Runnable;J)V

    :cond_b5
    new-instance v1, Lge5;

    const/16 v2, 0x17

    invoke-direct {v1, p1, v0, v2}, Lge5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    goto :goto_c2

    :cond_bd
    invoke-virtual {v0, v4}, Lzc9;->run(Ljava/lang/Object;)V

    sget-object v1, Lbf9;->A:Lbxl;

    :goto_c2
    const/4 p1, 0x2

    iput p1, p0, Lrma;->b:I

    iput-object v1, p0, Lrma;->i:Ljava/lang/Object;

    :cond_c7
    :goto_c7
    return-void

    :pswitch_c8
    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContent;

    check-cast p1, Ljava/lang/String;

    sget-object v0, Lcom/opera/android/browser/chromium/ChromiumContent;->V:Lorg/chromium/url/GURL;

    iget-wide v3, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->n:J

    invoke-static {v3, v4, p1, v1, v2}, LJ/N;->MYhVVL5A(JLjava/lang/Object;J)V

    return-void

    :pswitch_data_d4
    .packed-switch 0x0
        :pswitch_c8
        :pswitch_35
    .end packed-switch
.end method
