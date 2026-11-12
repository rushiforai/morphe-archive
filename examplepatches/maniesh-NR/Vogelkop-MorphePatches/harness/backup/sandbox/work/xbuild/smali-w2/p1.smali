.class public final Lp1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmo7;
.implements Lpqk;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(BLjava/lang/Object;Ljava/lang/Object;Z)V
    .registers 5

    .line 29
    iput-byte p1, p0, Lp1;->a:B

    iput-object p2, p0, Lp1;->c:Ljava/lang/Object;

    iput-object p3, p0, Lp1;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 24
    iput-byte p3, p0, Lp1;->a:B

    iput-object p1, p0, Lp1;->b:Ljava/lang/Object;

    iput-object p2, p0, Lp1;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljbf;)V
    .registers 3

    const/4 v0, 0x7

    iput-byte v0, p0, Lp1;->a:B

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    new-instance v0, Landroid/util/SparseBooleanArray;

    invoke-direct {v0}, Landroid/util/SparseBooleanArray;-><init>()V

    iput-object v0, p0, Lp1;->c:Ljava/lang/Object;

    .line 27
    iput-object p1, p0, Lp1;->b:Ljava/lang/Object;

    .line 28
    invoke-virtual {p1, p0}, Lno7;->g(Lmo7;)V

    return-void
.end method

.method public constructor <init>(Llld;)V
    .registers 3

    const/16 v0, 0x8

    iput-byte v0, p0, Lp1;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lp1;->c:Ljava/lang/Object;

    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lp1;->b:Ljava/lang/Object;

    iget-object p1, p1, Llld;->b:Ljava/lang/Object;

    check-cast p1, Lno7;

    invoke-virtual {p1, p0}, Lno7;->g(Lmo7;)V

    return-void
.end method

.method public constructor <init>(Lxnh;Lx5f;)V
    .registers 4

    const/4 v0, 0x2

    iput-byte v0, p0, Lp1;->a:B

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lp1;->b:Ljava/lang/Object;

    .line 32
    iput-object p2, p0, Lp1;->c:Ljava/lang/Object;

    .line 33
    invoke-virtual {p1, p0}, Lno7;->g(Lmo7;)V

    return-void
.end method


# virtual methods
.method public final i(I)Z
    .registers 3

    iget-object p0, p0, Lp1;->c:Ljava/lang/Object;

    check-cast p0, Landroid/util/SparseBooleanArray;

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Landroid/util/SparseBooleanArray;->get(IZ)Z

    move-result p0

    return p0
.end method

.method public final o(Z)V
    .registers 8

    iget-byte v0, p0, Lp1;->a:B

    const/4 v1, 0x4

    const/4 v2, 0x2

    const/4 v3, 0x1

    iget-object v4, p0, Lp1;->b:Ljava/lang/Object;

    iget-object v5, p0, Lp1;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_186

    check-cast v5, Lx5f;

    check-cast v4, Lbml;

    invoke-virtual {v4}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Laml;

    iget p0, p0, Laml;->b:I

    iget-object p1, v5, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    invoke-virtual {v0, p1}, Lx56;->M(Lzpa;)Lls0;

    move-result-object p1

    const/16 v1, 0x8

    invoke-virtual {p1, v1, v3, p0}, Ljf0;->o(III)V

    invoke-virtual {v5, v0}, Lx5f;->U0(Lx56;)V

    return-void

    :pswitch_2b
    check-cast v4, Lv1;

    invoke-virtual {v4}, Lv1;->y()Z

    move-result p1

    if-eqz p1, :cond_3f

    invoke-virtual {v4, p0}, Lno7;->p(Lmo7;)V

    check-cast v5, Ltt2;

    invoke-virtual {v4}, Lv1;->x()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v5, p0}, Ltt2;->run(Ljava/lang/Object;)V

    :cond_3f
    return-void

    :pswitch_40
    check-cast v4, Ldj9;

    invoke-virtual {v4}, Lno7;->i()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcj9;

    iget-object p1, p1, Lcj9;->a:Ljava/lang/String;

    if-eqz p1, :cond_54

    invoke-virtual {v4, p0}, Lno7;->p(Lmo7;)V

    check-cast v5, Ltt2;

    invoke-virtual {v5, p1}, Ltt2;->run(Ljava/lang/Object;)V

    :cond_54
    return-void

    :pswitch_55
    check-cast v5, Llld;

    iget-object v0, v5, Llld;->b:Ljava/lang/Object;

    check-cast v0, Lno7;

    if-nez p1, :cond_82

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lffd;

    invoke-interface {p1}, Lffd;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_82

    invoke-virtual {v0, p0}, Lno7;->p(Lmo7;)V

    check-cast v4, Ljava/util/LinkedHashSet;

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_72
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_82

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/api/Callback;

    invoke-interface {v0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_72

    :cond_82
    return-void

    :pswitch_83
    check-cast v4, Ljbf;

    invoke-virtual {v4}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Libf;

    check-cast v5, Landroid/util/SparseBooleanArray;

    invoke-virtual {p0, v2}, Libf;->a(I)Z

    move-result p1

    xor-int/2addr p1, v3

    invoke-virtual {v5, v3, p1}, Landroid/util/SparseBooleanArray;->put(IZ)V

    invoke-virtual {p0, v1}, Libf;->a(I)Z

    move-result p0

    xor-int/2addr p0, v3

    invoke-virtual {v5, v2, p0}, Landroid/util/SparseBooleanArray;->put(IZ)V

    return-void

    :pswitch_9e
    check-cast v4, Lno7;

    invoke-virtual {v4, p0}, Lno7;->p(Lmo7;)V

    check-cast v5, Lnh4;

    invoke-virtual {v5}, Lnh4;->r()Ljava/lang/Object;

    move-result-object p0

    instance-of p0, p0, Lc0f;

    if-eqz p0, :cond_b6

    sget-object p0, Lt0i;->b:Lp0i;

    invoke-virtual {v4}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v5, p0}, Lnh4;->resumeWith(Ljava/lang/Object;)V

    :cond_b6
    return-void

    :pswitch_b7
    check-cast v5, Lno7;

    iget-object p1, v5, Lno7;->e:Li7f;

    invoke-virtual {p1, p0}, Li7f;->c(Ljava/lang/Object;)Z

    check-cast v4, Ljava/lang/Runnable;

    invoke-interface {v4}, Ljava/lang/Runnable;->run()V

    return-void

    :pswitch_c4
    check-cast v4, Lpjn;

    iget-object p1, v4, Lpjn;->b:Ljava/lang/Object;

    check-cast p1, Le3j;

    invoke-virtual {p1, p0}, Lno7;->p(Lmo7;)V

    check-cast v5, Lcom/opera/api/Callback;

    invoke-virtual {p1}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ld3j;

    invoke-virtual {p0, v1}, Ld3j;->b(I)Lqsh;

    move-result-object p0

    const/4 p1, 0x0

    if-eqz p0, :cond_eb

    iget-object p0, p0, Lqsh;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_eb

    new-instance p1, Lz45;

    invoke-direct {p1, p0}, Lz45;-><init>(Ljava/lang/String;)V

    :cond_eb
    invoke-interface {v5, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_ef
    check-cast v4, Le3j;

    invoke-virtual {v4, p0}, Lno7;->p(Lmo7;)V

    invoke-virtual {v4}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ld3j;

    const/16 p1, 0xb

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Ld3j;->d(IZ)Lc3j;

    move-result-object p0

    check-cast v5, Lcom/opera/api/Callback;

    if-eqz p0, :cond_10a

    iget-object p0, p0, Lc3j;->d:Ljava/lang/Comparable;

    check-cast p0, Ljava/lang/String;

    goto :goto_10c

    :cond_10a
    const-string p0, "subscriptions.opera.com"

    :goto_10c
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "https://"

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "/"

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    invoke-interface {v5, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_127
    check-cast v5, Lx5f;

    check-cast v4, Lxnh;

    invoke-virtual {v4}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwnh;

    invoke-virtual {p0, v2}, Lwnh;->a(I)Z

    move-result p0

    xor-int/2addr p0, v3

    iget-object p1, v5, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    invoke-virtual {v0, p1}, Lx56;->L(Lzpa;)Lrr0;

    move-result-object p1

    const/16 v1, 0x10

    invoke-virtual {p1, v1, v3, p0}, Ljf0;->r(IIZ)V

    invoke-virtual {v5, v0}, Lx5f;->U0(Lx56;)V

    return-void

    :pswitch_149
    check-cast v4, Lxnh;

    invoke-virtual {v4, p0}, Lno7;->p(Lmo7;)V

    check-cast v5, Lcom/opera/android/autofill/AddressEditorManager;

    invoke-virtual {v4}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwnh;

    iget-object p0, p0, Lwnh;->e:Ljava/lang/String;

    iget-boolean p1, v5, Lcom/opera/android/autofill/AddressEditorManager;->b:Z

    if-nez p1, :cond_16b

    if-nez p0, :cond_160

    const-string p0, ""

    :cond_160
    invoke-static {p0}, LJ/N;->MVNOhSNx(Ljava/lang/Object;)J

    move-result-wide p0

    iput-wide p0, v5, Lcom/opera/android/autofill/AddressEditorManager;->c:J

    iget-object p0, v5, Lcom/opera/android/autofill/AddressEditorManager;->a:Lnrl;

    invoke-virtual {p0}, Lnrl;->K()V

    :cond_16b
    return-void

    :pswitch_16c
    check-cast v4, Lpjn;

    iget-object p1, v4, Lpjn;->b:Ljava/lang/Object;

    check-cast p1, Lv1;

    invoke-virtual {p1}, Lv1;->y()Z

    move-result v0

    if-eqz v0, :cond_184

    invoke-virtual {p1, p0}, Lno7;->p(Lmo7;)V

    check-cast v5, Lcom/opera/api/Callback;

    invoke-virtual {p1}, Lv1;->x()Ljava/lang/String;

    move-result-object p0

    invoke-interface {v5, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :cond_184
    return-void

    nop

    :pswitch_data_186
    .packed-switch 0x0
        :pswitch_16c
        :pswitch_149
        :pswitch_127
        :pswitch_ef
        :pswitch_c4
        :pswitch_b7
        :pswitch_9e
        :pswitch_83
        :pswitch_55
        :pswitch_40
        :pswitch_2b
    .end packed-switch
.end method
