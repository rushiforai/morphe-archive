.class public final Lj99;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lhxl;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lj99;->a:B

    iput-object p1, p0, Lj99;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a()V
    .registers 1

    return-void
.end method

.method private final b()V
    .registers 1

    return-void
.end method

.method private final c()V
    .registers 1

    return-void
.end method

.method private final d()V
    .registers 1

    return-void
.end method

.method private final e()V
    .registers 1

    return-void
.end method

.method private final f(I)V
    .registers 2

    return-void
.end method


# virtual methods
.method public final i()V
    .registers 3

    iget-byte v0, p0, Lj99;->a:B

    iget-object p0, p0, Lj99;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_36

    return-void

    :pswitch_8
    check-cast p0, Lswf;

    iget-object v0, p0, Lswf;->c:Lbf9;

    invoke-virtual {v0}, Lbf9;->t()Z

    move-result v1

    if-eqz v1, :cond_25

    invoke-virtual {v0}, Lbf9;->r()I

    move-result v0

    const/4 v1, 0x2

    if-lt v0, v1, :cond_25

    iget-object v0, p0, Lswf;->d:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "my_flow_visible"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_25

    const/4 v0, 0x1

    goto :goto_26

    :cond_25
    const/4 v0, 0x0

    :goto_26
    invoke-static {v0}, Lwxe;->C(Z)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lswf;->e:Ljava/util/ArrayList;

    :pswitch_2c
    return-void

    :pswitch_2d
    check-cast p0, Lk99;

    iget-object p0, p0, Lk99;->b:Lfd;

    invoke-virtual {p0}, Lfd;->c()V

    return-void

    nop

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_2d
        :pswitch_2c
        :pswitch_8
    .end packed-switch
.end method

.method public final x(I)V
    .registers 5

    iget-byte v0, p0, Lj99;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x2

    iget-object p0, p0, Lj99;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_3c

    if-ge p1, v2, :cond_10

    check-cast p0, Lmyf;

    invoke-virtual {p0, v1}, Lmyf;->b(I)V

    :cond_10
    return-void

    :pswitch_11
    check-cast p0, Lswf;

    iget-object p1, p0, Lswf;->c:Lbf9;

    invoke-virtual {p1}, Lbf9;->t()Z

    move-result v0

    if-eqz v0, :cond_2c

    invoke-virtual {p1}, Lbf9;->r()I

    move-result p1

    if-lt p1, v2, :cond_2c

    iget-object p1, p0, Lswf;->d:Lcom/opera/android/settings/SettingsManager;

    const-string v0, "my_flow_visible"

    invoke-virtual {p1, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2c

    const/4 v1, 0x1

    :cond_2c
    invoke-static {v1}, Lwxe;->C(Z)Ljava/util/ArrayList;

    move-result-object p1

    iput-object p1, p0, Lswf;->e:Ljava/util/ArrayList;

    return-void

    :pswitch_33
    if-nez p1, :cond_3a

    check-cast p0, Lrma;

    invoke-virtual {p0}, Lrma;->l()V

    :cond_3a
    :pswitch_3a
    return-void

    nop

    :pswitch_data_3c
    .packed-switch 0x0
        :pswitch_3a
        :pswitch_33
        :pswitch_11
    .end packed-switch
.end method

.method public final z()V
    .registers 3

    iget-byte v0, p0, Lj99;->a:B

    packed-switch v0, :pswitch_data_28

    iget-object p0, p0, Lj99;->b:Ljava/lang/Object;

    check-cast p0, Lmyf;

    iget-object v0, p0, Lmyf;->g:Ljava/lang/String;

    iget-object v1, p0, Lmyf;->b:Lbf9;

    if-nez v0, :cond_1d

    invoke-virtual {v1}, Lbf9;->u()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_27

    invoke-virtual {p0, v0}, Lmyf;->c(Ljava/util/List;)V

    goto :goto_27

    :cond_1d
    invoke-virtual {v1, v0}, Lbf9;->l(Ljava/lang/String;)Lpwl;

    move-result-object v0

    if-nez v0, :cond_27

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lmyf;->b(I)V

    :cond_27
    :goto_27
    :pswitch_27
    return-void

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_27
        :pswitch_27
        :pswitch_27
    .end packed-switch
.end method
