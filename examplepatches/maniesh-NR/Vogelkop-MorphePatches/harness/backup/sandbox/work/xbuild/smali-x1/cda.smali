.class public final Lcda;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public b:Z

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(BLjava/lang/Object;Ljava/lang/Object;Z)V
    .registers 5

    .line 53
    iput-byte p1, p0, Lcda;->a:B

    iput-object p3, p0, Lcda;->c:Ljava/lang/Object;

    iput-boolean p4, p0, Lcda;->b:Z

    iput-object p2, p0, Lcda;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lbca;Z)V
    .registers 10

    const/4 v0, 0x0

    iput-byte v0, p0, Lcda;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcda;->c:Ljava/lang/Object;

    iput-boolean p2, p0, Lcda;->b:Z

    new-instance v1, Lyz7;

    if-eqz p2, :cond_14

    invoke-virtual {p1}, Lbca;->G()I

    move-result p2

    :goto_12
    move v4, p2

    goto :goto_18

    :cond_14
    const p2, 0x7f140834

    goto :goto_12

    :goto_18
    const/4 v6, 0x0

    const/4 v3, 0x2

    const v5, 0x7f130021

    move-object v2, p1

    invoke-direct/range {v1 .. v6}, Lyz7;-><init>(Landroidx/recyclerview/widget/d;IIII)V

    iput-object v1, p0, Lcda;->d:Ljava/lang/Object;

    iget-boolean p1, p0, Lcda;->b:Z

    if-nez p1, :cond_2d

    const-wide/16 p1, 0x1f4

    invoke-static {p0, p1, p2}, Lvml;->d(Ljava/lang/Runnable;J)V

    goto :goto_30

    :cond_2d
    invoke-virtual {v1}, Lyz7;->c()V

    :goto_30
    return-void
.end method

.method public constructor <init>(Lcom/opera/android/browser/obml/MiniHttpClient$Call;Z[B)V
    .registers 5

    const/4 v0, 0x2

    iput-byte v0, p0, Lcda;->a:B

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p2, p0, Lcda;->b:Z

    iput-object p3, p0, Lcda;->c:Ljava/lang/Object;

    iput-object p1, p0, Lcda;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lqdc;Locc;)V
    .registers 4

    const/4 v0, 0x3

    iput-byte v0, p0, Lcda;->a:B

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput-object p1, p0, Lcda;->c:Ljava/lang/Object;

    .line 51
    iput-object p2, p0, Lcda;->d:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    iget-byte v0, p0, Lcda;->a:B

    iget-object v1, p0, Lcda;->c:Ljava/lang/Object;

    iget-object v2, p0, Lcda;->d:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_a2

    check-cast v1, Landroid/view/View;

    check-cast v2, Lcom/google/android/material/behavior/SwipeDismissBehavior;

    iget-object v0, v2, Lcom/google/android/material/behavior/SwipeDismissBehavior;->a:Lx5n;

    if-eqz v0, :cond_1b

    invoke-virtual {v0}, Lx5n;->f()Z

    move-result v0

    if-eqz v0, :cond_1b

    invoke-virtual {v1, p0}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    goto :goto_26

    :cond_1b
    iget-boolean p0, p0, Lcda;->b:Z

    if-eqz p0, :cond_26

    iget-object p0, v2, Lcom/google/android/material/behavior/SwipeDismissBehavior;->b:Ltw2;

    if-eqz p0, :cond_26

    invoke-virtual {p0, v1}, Ltw2;->s(Landroid/view/View;)V

    :cond_26
    :goto_26
    return-void

    :pswitch_27
    iget-boolean v0, p0, Lcda;->b:Z

    if-nez v0, :cond_35

    check-cast v1, Lqdc;

    check-cast v2, Locc;

    invoke-virtual {v1, v2}, Lqdc;->e(Locc;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcda;->b:Z

    :cond_35
    return-void

    :pswitch_36
    check-cast v2, Lcom/opera/android/browser/obml/MiniHttpClient$Call;

    iget-boolean p0, p0, Lcda;->b:Z

    check-cast v1, [B

    iget-object v0, v2, Lcom/opera/android/browser/obml/MiniHttpClient$Call;->b:Lpp6;

    if-eqz v0, :cond_53

    if-eqz p0, :cond_53

    if-eqz v1, :cond_53

    :try_start_44
    invoke-static {v1}, Lhzd;->a([B)Lbp;

    move-result-object p0

    iget-object v0, v2, Lcom/opera/android/browser/obml/MiniHttpClient$Call;->b:Lpp6;

    invoke-virtual {v0, p0}, Lpp6;->a(Lbp;)V
    :try_end_4d
    .catch Ljava/io/IOException; {:try_start_44 .. :try_end_4d} :catch_4e

    goto :goto_53

    :catch_4e
    iget-object p0, v2, Lcom/opera/android/browser/obml/MiniHttpClient$Call;->b:Lpp6;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_53
    :goto_53
    invoke-virtual {v2}, Lcom/opera/android/browser/obml/MiniHttpClient$Call;->a()V

    return-void

    :pswitch_57
    iget-boolean v0, p0, Lcda;->b:Z

    check-cast v1, Ltm8;

    check-cast v2, Lzdb;

    iget-object v3, v2, Lzdb;->c:Lorg/chromium/content_public/browser/WebContents;

    if-eqz v3, :cond_87

    invoke-interface {v3}, Lorg/chromium/content_public/browser/WebContents;->isDestroyed()Z

    move-result v3

    if-nez v3, :cond_87

    iget-object v3, v1, Ltm8;->g:Lbp;

    iget-object v3, v3, Lbp;->b:Ljava/lang/Object;

    check-cast v3, Liqh;

    if-eqz v3, :cond_87

    iget-boolean v3, v2, Lzdb;->j:Z

    if-nez v3, :cond_7d

    new-instance v0, Lig;

    const/16 v1, 0xf

    invoke-direct {v0, p0, v1}, Lig;-><init>(Ljava/lang/Object;B)V

    iput-object v0, v2, Lzdb;->h:Lig;

    goto :goto_9a

    :cond_7d
    invoke-virtual {v2, v1, v0}, Lzdb;->d(Ltm8;Z)Lea6;

    move-result-object p0

    iget-object v1, v1, Ltm8;->a:Lorg/chromium/url/GURL;

    invoke-virtual {v2, p0, v1, v0}, Lzdb;->j(Lea6;Lorg/chromium/url/GURL;Z)V

    goto :goto_9a

    :cond_87
    :goto_87
    iget-object p0, v2, Lzdb;->h:Lig;

    if-eqz p0, :cond_9a

    const/4 v0, 0x0

    iput-object v0, p0, Lig;->b:Ljava/lang/Object;

    iput-object v0, v2, Lzdb;->h:Lig;

    iget-object p0, v2, Lzdb;->i:Ld23;

    iput-object v0, v2, Lzdb;->i:Ld23;

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p0, v0}, Ld23;->onResult(Ljava/lang/Object;)V

    goto :goto_87

    :cond_9a
    :goto_9a
    return-void

    :pswitch_9b
    check-cast v2, Lyz7;

    invoke-virtual {v2}, Lyz7;->c()V

    return-void

    nop

    :pswitch_data_a2
    .packed-switch 0x0
        :pswitch_9b
        :pswitch_57
        :pswitch_36
        :pswitch_27
    .end packed-switch
.end method
