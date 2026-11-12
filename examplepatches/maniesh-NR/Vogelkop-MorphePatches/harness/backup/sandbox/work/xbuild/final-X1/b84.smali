.class public final synthetic Lb84;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:Lf84;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:I

.field public final synthetic d:I

.field public final synthetic e:Liyk;


# direct methods
.method public synthetic constructor <init>(Lf84;Ljava/lang/String;IILiyk;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lb84;->a:Lf84;

    iput-object p2, p0, Lb84;->b:Ljava/lang/String;

    iput p3, p0, Lb84;->c:I

    iput p4, p0, Lb84;->d:I

    iput-object p5, p0, Lb84;->e:Liyk;

    return-void
.end method


# virtual methods
.method public final a(Lc84;)V
    .registers 11

    iget-object v0, p0, Lb84;->a:Lf84;

    iget-object v1, v0, Lf84;->a:Lesg;

    const/4 v2, 0x0

    iget-object v3, p0, Lb84;->b:Ljava/lang/String;

    iget v4, p0, Lb84;->c:I

    iget v5, p0, Lb84;->d:I

    iget-object p0, p0, Lb84;->e:Liyk;

    if-eqz p1, :cond_3b

    iget-object v6, p1, Lc84;->b:Landroid/graphics/Bitmap;

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v7

    if-eqz v7, :cond_19

    move-object v7, v2

    goto :goto_1a

    :cond_19
    move-object v7, v6

    :goto_1a
    if-eqz v7, :cond_3b

    invoke-virtual {v7}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v8

    if-ne v8, v4, :cond_3b

    invoke-virtual {v7}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    if-ne v7, v5, :cond_3b

    iget-object p1, p1, Lc84;->a:Ljava/lang/String;

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3b

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result p1

    if-nez p1, :cond_37

    move-object v2, v6

    :cond_37
    invoke-virtual {p0, v2}, Liyk;->run(Ljava/lang/Object;)V

    return-void

    :cond_3b
    iget-object p1, v1, Lesg;->b:Ljava/lang/Object;

    check-cast p1, Ld84;

    iput-object v2, p1, Ld84;->a:Lc84;

    iget-object p1, v1, Lesg;->c:Ljava/lang/Object;

    check-cast p1, Lr9i;

    iget-object v6, p1, Lr9i;->c:Ljava/lang/Object;

    check-cast v6, Le84;

    iget-object v6, v6, Le84;->a:Lb59;

    invoke-virtual {v6}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/content/SharedPreferences;

    const-string v7, "image_url"

    invoke-static {v6, v7}, Lcom/appsflyer/internal/j;->a(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    iget-object v6, p1, Lr9i;->d:Ljava/lang/Object;

    check-cast v6, Lumi;

    new-instance v7, Lfv2;

    const/16 v8, 0x1b

    invoke-direct {v7, p1, v8}, Lfv2;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v6, v7}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object v6

    new-instance v7, Loml;

    invoke-direct {v7, v6}, Loml;-><init>(Lnml;)V

    iget-object p1, p1, Lr9i;->e:Ljava/lang/Object;

    check-cast p1, Lqie;

    invoke-virtual {p1, v7, v2}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    new-instance v8, Ll45;

    new-instance p1, Lwx;

    const/16 v2, 0x18

    invoke-direct {p1, v0, p0, v2}, Lwx;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const/4 p0, 0x0

    invoke-direct {v8, p0, v1, v3, p1}, Ll45;-><init>(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object p0, v0, Lf84;->b:Lydp;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v6, 0x1c80

    const/4 v7, 0x0

    invoke-static/range {v3 .. v8}, Loya;->b(Ljava/lang/String;IIIILmya;)Lnya;

    return-void
.end method
