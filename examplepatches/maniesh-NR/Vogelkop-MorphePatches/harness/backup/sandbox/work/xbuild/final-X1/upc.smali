.class public final synthetic Lupc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lb6j;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lupc;->a:B

    iput-object p1, p0, Lupc;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final b()V
    .registers 4

    iget-byte v0, p0, Lupc;->a:B

    iget-object p0, p0, Lupc;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_4a

    check-cast p0, Lnqe;

    iget-object v0, p0, Lnqe;->f:Lc6j;

    iget-object v0, v0, Lc6j;->b:Ljava/lang/Object;

    check-cast v0, Lnre;

    if-eqz v0, :cond_43

    iget-object v0, v0, Lnre;->b:Ljava/net/URL;

    iget-object v1, p0, Lnqe;->h:Ljava/net/URL;

    if-eqz v1, :cond_41

    invoke-virtual {v1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_41

    iget-object v1, p0, Lnqe;->a:Landroid/content/Context;

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->q()Le59;

    move-result-object v1

    sget-object v2, Ld59;->e:Ld59;

    iget-object v1, v1, Le59;->a:Ljava/util/HashMap;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lc59;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lc59;->f(Z)V

    :cond_41
    iput-object v0, p0, Lnqe;->h:Ljava/net/URL;

    :cond_43
    return-void

    :pswitch_44
    check-cast p0, Lvpc;

    invoke-virtual {p0}, Lvpc;->a()V

    return-void

    :pswitch_data_4a
    .packed-switch 0x0
        :pswitch_44
    .end packed-switch
.end method
