.class public final Lzg7;
.super Lzsi;
.source "SourceFile"


# instance fields
.field public final synthetic l:B

.field public final m:Lati;

.field public final n:Lorm;


# direct methods
.method public constructor <init>(Lah7;Lorm;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Lzg7;->l:B

    .line 20
    sget-object v0, Lyg7;->e:Lyg7;

    .line 21
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    .line 22
    invoke-direct {p0, p1, v0, v1}, Lzsi;-><init>(Lati;Lshf;Ljava/util/Locale;)V

    .line 23
    iput-object p1, p0, Lzg7;->m:Lati;

    .line 24
    iput-object p2, p0, Lzg7;->n:Lorm;

    return-void
.end method

.method public constructor <init>(Lghf;Lorm;)V
    .registers 5

    const/4 v0, 0x2

    iput-byte v0, p0, Lzg7;->l:B

    new-instance v0, Lshf;

    invoke-direct {v0}, Lshf;-><init>()V

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-direct {p0, p1, v0, v1}, Lzsi;-><init>(Lati;Lshf;Ljava/util/Locale;)V

    iput-object p1, p0, Lzg7;->m:Lati;

    iput-object p2, p0, Lzg7;->n:Lorm;

    return-void
.end method

.method public constructor <init>(Lv8f;Lx5f;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lzg7;->l:B

    .line 25
    sget-object v0, Lu8f;->e:Lu8f;

    .line 26
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    .line 27
    invoke-direct {p0, p1, v0, v1}, Lzsi;-><init>(Lati;Lshf;Ljava/util/Locale;)V

    .line 28
    iput-object p1, p0, Lzg7;->m:Lati;

    .line 29
    iput-object p2, p0, Lzg7;->n:Lorm;

    return-void
.end method


# virtual methods
.method public final d(Ljava/lang/Object;)Ljava/util/List;
    .registers 2

    iget-byte p0, p0, Lzg7;->l:B

    packed-switch p0, :pswitch_data_2e

    check-cast p1, Lw3g;

    iget-object p0, p1, Lw3g;->c:Ljava/lang/String;

    iget-object p1, p1, Lw3g;->f:Ljava/lang/String;

    filled-new-array {p0, p1}, [Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :pswitch_14
    check-cast p1, Lilh;

    iget-object p0, p1, Lilh;->c:Ljava/lang/String;

    iget-object p1, p1, Lilh;->b:Ljava/lang/String;

    filled-new-array {p0, p1}, [Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :pswitch_23
    check-cast p1, Lre7;

    invoke-virtual {p1}, Lre7;->f()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_23
        :pswitch_14
    .end packed-switch
.end method

.method public final h()V
    .registers 2

    iget-byte v0, p0, Lzg7;->l:B

    packed-switch v0, :pswitch_data_20

    const/4 v0, 0x5

    iget-object p0, p0, Lzg7;->n:Lorm;

    check-cast p0, Lx5f;

    invoke-virtual {p0, v0}, Lx5f;->S(I)V

    return-void

    :pswitch_e
    iget-object p0, p0, Lzg7;->n:Lorm;

    check-cast p0, Lx5f;

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lx5f;->S(I)V

    return-void

    :pswitch_17
    const/4 v0, 0x6

    iget-object p0, p0, Lzg7;->n:Lorm;

    check-cast p0, Lx5f;

    invoke-virtual {p0, v0}, Lx5f;->S(I)V

    return-void

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_17
        :pswitch_e
    .end packed-switch
.end method

.method public final m()V
    .registers 3

    iget-object p0, p0, Lzg7;->m:Lati;

    check-cast p0, Lghf;

    iget-object v0, p0, Lghf;->b:Ljava/lang/Object;

    check-cast v0, Lx5g;

    iget-object p0, p0, Lghf;->d:Ljava/lang/Object;

    check-cast p0, Lz5g;

    iget-object v1, v0, Lx5g;->b:Li7f;

    invoke-virtual {v1, p0}, Li7f;->c(Ljava/lang/Object;)Z

    iget-object p0, v0, Lx5g;->e:La4g;

    if-eqz p0, :cond_18

    invoke-virtual {p0}, La4g;->a()V

    :cond_18
    const/4 p0, 0x0

    iput-object p0, v0, Lx5g;->e:La4g;

    iget-object v1, v0, Lx5g;->f:La4g;

    if-eqz v1, :cond_22

    invoke-virtual {v1}, La4g;->a()V

    :cond_22
    iput-object p0, v0, Lx5g;->f:La4g;

    iget-object v1, v0, Lx5g;->c:Lcom/opera/android/autofill/PasswordDataMonitor;

    if-eqz v1, :cond_2b

    invoke-virtual {v1}, Lcom/opera/android/autofill/PasswordDataMonitor;->a()V

    :cond_2b
    iput-object p0, v0, Lx5g;->c:Lcom/opera/android/autofill/PasswordDataMonitor;

    return-void
.end method
