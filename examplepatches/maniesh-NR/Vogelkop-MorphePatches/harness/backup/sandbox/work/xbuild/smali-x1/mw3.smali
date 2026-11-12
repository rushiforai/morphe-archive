.class public final synthetic Lmw3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ltw3;


# direct methods
.method public synthetic constructor <init>(Ltw3;B)V
    .registers 3

    iput-byte p2, p0, Lmw3;->a:B

    iput-object p1, p0, Lmw3;->b:Ltw3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lmw3;->a:B

    const-class v1, Lrj;

    const/4 v2, 0x0

    iget-object p0, p0, Lmw3;->b:Ltw3;

    packed-switch v0, :pswitch_data_166

    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->O()Leej;

    move-result-object p0

    return-object p0

    :pswitch_11
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lqim;->e:Lysj;

    return-object p0

    :pswitch_1b
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lqim;->c:Lz77;

    return-object p0

    :pswitch_25
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Ldx3;->l:Ltni;

    return-object p0

    :pswitch_2a
    sget v0, Leif;->a:I

    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-static {p0}, Lkfo;->e0(Landroid/content/Context;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_37
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-static {p0}, Ltvg;->t(Landroid/content/Context;)Ltvg;

    move-result-object p0

    return-object p0

    :pswitch_3e
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    const-class v0, Lhxk;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {p0, v0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Lhxk;

    return-object p0

    :pswitch_4b
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-eqz p0, :cond_52

    move-object v2, p0

    :cond_52
    return-object v2

    :pswitch_53
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    return-object p0

    :pswitch_5a
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    const-class v0, Lg0c;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {p0, v0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Lg0c;

    return-object p0

    :pswitch_67
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    const-class v0, Ljt2;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {p0, v0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Ljt2;

    return-object p0

    :pswitch_74
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    const-class v0, Lkxk;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {p0, v0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Lkxk;

    return-object p0

    :pswitch_81
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    const-class v0, Lxln;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {p0, v0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Lxln;

    return-object p0

    :pswitch_8e
    iget-object p0, p0, Ltw3;->a0:Lzv3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ldu5;

    iget-object p0, p0, Ldu5;->d:Ltsd;

    return-object p0

    :pswitch_99
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    const-class v0, Lzwe;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {p0, v0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Lzwe;

    return-object p0

    :pswitch_a6
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {p0, v1}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Lrj;

    return-object p0

    :pswitch_b1
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-eqz p0, :cond_b8

    move-object v2, p0

    :cond_b8
    return-object v2

    :pswitch_b9
    iget-object p0, p0, Ltw3;->l:Lzv3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lit2;

    new-instance v0, Lwub;

    iget-object p0, p0, Lit2;->A:Lks3;

    invoke-direct {v0, p0}, Lwub;-><init>(Ljava/lang/Object;)V

    return-object v0

    :pswitch_c9
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lqim;->c:Lz77;

    return-object p0

    :pswitch_d3
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    const-class v0, Lsyl;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {p0, v0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Lsyl;

    return-object p0

    :pswitch_e0
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Ldx3;->l:Ltni;

    return-object p0

    :pswitch_e5
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lqim;->e:Lysj;

    return-object p0

    :pswitch_ef
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    return-object p0

    :pswitch_f6
    new-instance v0, Lb9g;

    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    new-instance v1, Lhv3;

    invoke-direct {v1, p0}, Lhv3;-><init>(Lcom/opera/android/BrowserActivity;)V

    invoke-direct {v0, v1}, Lb9g;-><init>(Lhv3;)V

    return-object v0

    :pswitch_103
    iget-object p0, p0, Ltw3;->T:Lhw3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzdn;

    new-instance v0, Lrii;

    iget-object p0, p0, Lzdn;->a:Ltah;

    const/16 v1, 0x13

    invoke-direct {v0, p0, v1}, Lrii;-><init>(Ljava/lang/Object;B)V

    return-object v0

    :pswitch_115
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    sget-object v0, Lcom/opera/android/browser/SafeBrowsingBridge;->a:Lvgi;

    if-eqz v0, :cond_139

    invoke-static {p0}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object p0

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwnh;

    const/16 v0, 0x2000

    invoke-virtual {p0, v0}, Lwnh;->b(I)Z

    move-result p0

    if-eqz p0, :cond_139

    sget-object p0, Lcom/opera/android/browser/SafeBrowsingBridge;->a:Lvgi;

    iget-boolean v0, p0, Lvgi;->g:Z

    if-nez v0, :cond_139

    iget-object p0, p0, Lvgi;->f:Ljava/lang/String;

    if-eqz p0, :cond_139

    const/4 p0, 0x1

    goto :goto_13a

    :cond_139
    const/4 p0, 0x0

    :goto_13a
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_13f
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {p0, v1}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Lrj;

    return-object p0

    :pswitch_14a
    new-instance v0, Lv61;

    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-direct {v0, p0}, Lv61;-><init>(Landroid/content/Context;)V

    return-object v0

    :pswitch_152
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-static {p0}, Lxi5;->a(Landroid/content/Context;)Lxi5;

    move-result-object p0

    return-object p0

    :pswitch_159
    iget-object p0, p0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    const-class v0, Lqoj;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {p0, v0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Lqoj;

    return-object p0

    :pswitch_data_166
    .packed-switch 0x0
        :pswitch_159
        :pswitch_152
        :pswitch_14a
        :pswitch_13f
        :pswitch_115
        :pswitch_103
        :pswitch_f6
        :pswitch_ef
        :pswitch_e5
        :pswitch_e0
        :pswitch_d3
        :pswitch_c9
        :pswitch_b9
        :pswitch_b1
        :pswitch_a6
        :pswitch_99
        :pswitch_8e
        :pswitch_81
        :pswitch_74
        :pswitch_67
        :pswitch_5a
        :pswitch_53
        :pswitch_4b
        :pswitch_3e
        :pswitch_37
        :pswitch_2a
        :pswitch_25
        :pswitch_1b
        :pswitch_11
    .end packed-switch
.end method
