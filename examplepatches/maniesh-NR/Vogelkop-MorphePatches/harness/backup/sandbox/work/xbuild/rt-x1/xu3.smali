.class public final synthetic Lxu3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltvb;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/BrowserActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/BrowserActivity;B)V
    .registers 3

    iput-byte p2, p0, Lxu3;->a:B

    iput-object p1, p0, Lxu3;->b:Lcom/opera/android/BrowserActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 9

    iget-byte v0, p0, Lxu3;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    iget-object p0, p0, Lxu3;->b:Lcom/opera/android/BrowserActivity;

    packed-switch v0, :pswitch_data_82

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object p0, p0, Ltw3;->a:Lhx3;

    iget-object p0, p0, Lhx3;->f:Lfx3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lul3;

    invoke-virtual {p0}, Lul3;->a()V

    return-void

    :pswitch_1a
    const-class v0, Lwg7;

    invoke-static {v0}, Lzhj;->b(Ljava/lang/Class;)Lzhj;

    move-result-object v0

    invoke-virtual {v0, p0}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    :pswitch_24
    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->P0()Lgjm;

    move-result-object p0

    new-instance v0, Ltca;

    invoke-direct {v0, v3}, Ltca;-><init>(I)V

    invoke-virtual {p0, v0, v3}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_31
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object v0

    if-eqz v0, :cond_4b

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->R()Lzg;

    move-result-object v0

    if-eqz v0, :cond_4b

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->M:Lgbf;

    if-eqz p0, :cond_48

    move-object v2, p0

    :cond_48
    invoke-virtual {v2, v1}, Lgbf;->t(Z)V

    :cond_4b
    return-void

    :pswitch_4c
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object v0

    if-eqz v0, :cond_80

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->C:Lfnh;

    if-nez p0, :cond_59

    move-object p0, v2

    :cond_59
    iget-object v4, p0, Lfnh;->f:Lcom/opera/android/browser/SessionStore;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iget-wide v6, v4, Lcom/opera/android/browser/SessionStore;->a:J

    invoke-static {v6, v7, v5}, LJ/N;->MqkthI77(JLjava/lang/Object;)V

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v4

    :cond_6c
    if-ge v3, v4, :cond_7b

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v3, v3, 0x1

    check-cast v6, Lenh;

    iget-boolean v7, v6, Lenh;->e:Z

    if-eqz v7, :cond_6c

    move-object v2, v6

    :cond_7b
    if-eqz v2, :cond_80

    invoke-virtual {p0, v2, v0, v1}, Lfnh;->b(Lenh;Lb2l;Z)V

    :cond_80
    return-void

    nop

    :pswitch_data_82
    .packed-switch 0x0
        :pswitch_4c
        :pswitch_31
        :pswitch_24
        :pswitch_1a
    .end packed-switch
.end method
