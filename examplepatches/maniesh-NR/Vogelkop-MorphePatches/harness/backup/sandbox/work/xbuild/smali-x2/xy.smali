.class public final Lxy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lq8j;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lxy;->a:B

    iput-object p1, p0, Lxy;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 3

    iget-byte v0, p0, Lxy;->a:B

    iget-object v1, p0, Lxy;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_56

    check-cast v1, Laum;

    const/4 p0, 0x0

    iput-object p0, v1, Laum;->b:Lpu8;

    invoke-virtual {v1}, Laum;->a()V

    return-void

    :pswitch_10
    check-cast v1, Llvc;

    iget-object p0, v1, Llvc;->g:Luqe;

    if-eqz p0, :cond_1d

    invoke-static {v1}, Llvc;->a(Llvc;)Lq8j;

    move-result-object v0

    invoke-virtual {p0, v0}, Luqe;->g(Lq8j;)V

    :cond_1d
    return-void

    :pswitch_1e
    check-cast v1, Ljvc;

    iget-object p0, v1, Ljvc;->c:Lfqe;

    invoke-virtual {p0}, Lfqe;->c()Luqe;

    move-result-object p0

    invoke-static {v1}, Ljvc;->R(Ljvc;)Lq8j;

    move-result-object v0

    invoke-virtual {p0, v0}, Luqe;->g(Lq8j;)V

    return-void

    :pswitch_2e
    check-cast v1, Lmw8;

    iget-boolean p0, v1, Lmw8;->x:Z

    if-nez p0, :cond_49

    iget-object p0, v1, Lmw8;->p:Lcom/opera/android/BrowserActivity;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object p0

    invoke-static {v1}, Lmw8;->C(Lmw8;)Lq8j;

    move-result-object v0

    invoke-virtual {p0, v0}, Lfqe;->a(Lq8j;)V

    :cond_49
    return-void

    :pswitch_4a
    check-cast v1, Lyy;

    iget-boolean v0, v1, Lyy;->e:Z

    if-nez v0, :cond_55

    iget-object v0, v1, Lyy;->b:Lfqe;

    invoke-virtual {v0, p0}, Lfqe;->a(Lq8j;)V

    :cond_55
    return-void

    :pswitch_data_56
    .packed-switch 0x0
        :pswitch_4a
        :pswitch_2e
        :pswitch_1e
        :pswitch_10
    .end packed-switch
.end method

.method public final c(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Lxy;->a:B

    iget-object p0, p0, Lxy;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_92

    check-cast p1, Lpu8;

    check-cast p0, Laum;

    iput-object p1, p0, Laum;->b:Lpu8;

    return-void

    :pswitch_e
    check-cast p1, Lnre;

    check-cast p0, Llvc;

    iget-object v0, p0, Llvc;->e:Ljava/lang/String;

    if-eqz p1, :cond_23

    iget-object p1, p1, Lnre;->c:Ll0c;

    if-eqz p1, :cond_23

    iget-object p1, p1, Ll0c;->a:Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p1, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    goto :goto_25

    :cond_23
    const-string p1, ""

    :goto_25
    iput-object p1, p0, Llvc;->e:Ljava/lang/String;

    iget-object v1, p0, Llvc;->f:Lbn7;

    if-eqz v1, :cond_36

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_36

    iget-object p0, p0, Llvc;->f:Lbn7;

    invoke-virtual {p0}, Lbn7;->run()V

    :cond_36
    return-void

    :pswitch_37
    check-cast p1, Lnre;

    check-cast p0, Ljvc;

    iput-object p1, p0, Ljvc;->f:Lnre;

    invoke-virtual {p0}, Ljvc;->T()V

    return-void

    :pswitch_41
    check-cast p1, Ll1c;

    check-cast p0, Lmw8;

    iget-boolean v0, p0, Lmw8;->x:Z

    if-nez v0, :cond_70

    if-eqz p1, :cond_70

    iget-object p1, p1, Ll1c;->c:Ll0c;

    iput-object p1, p0, Lmw8;->v:Ll0c;

    iget-boolean v0, p0, Lnv9;->i:Z

    if-eqz v0, :cond_70

    if-eqz p1, :cond_6d

    iget-object p1, p0, Lmw8;->s:Lcq5;

    invoke-virtual {p1}, Lcq5;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lbef;

    invoke-virtual {p1}, Lbef;->h()Lffb;

    move-result-object p1

    iget-object v0, p0, Lmw8;->v:Ll0c;

    invoke-virtual {v0}, Ll0c;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_70

    :cond_6d
    invoke-virtual {p0}, Lnv9;->w()V

    :cond_70
    return-void

    :pswitch_71
    check-cast p1, Ll1c;

    check-cast p0, Lyy;

    iget-boolean v0, p0, Lyy;->e:Z

    if-nez v0, :cond_90

    if-eqz p1, :cond_90

    iget-object p0, p0, Lyy;->a:Lwy;

    iget-object p1, p1, Ll1c;->c:Ll0c;

    iget-object v0, p1, Ll0c;->a:Ljava/lang/String;

    iget-object p1, p1, Ll0c;->b:Ljava/lang/String;

    iget-object p0, p0, Lwy;->e:Lvzk;

    iget-object p0, p0, Lvzk;->d:Ljava/lang/Object;

    check-cast p0, Li5o;

    iput-object v0, p0, Li5o;->l:Ljava/lang/Object;

    iput-object p1, p0, Li5o;->m:Ljava/lang/Object;

    invoke-virtual {p0}, Li5o;->i()V

    :cond_90
    return-void

    nop

    :pswitch_data_92
    .packed-switch 0x0
        :pswitch_71
        :pswitch_41
        :pswitch_37
        :pswitch_e
    .end packed-switch
.end method
