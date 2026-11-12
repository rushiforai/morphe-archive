.class public final Lg2p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Looo;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Laoo;


# direct methods
.method public synthetic constructor <init>(Laoo;B)V
    .registers 3

    iput-byte p2, p0, Lg2p;->a:B

    iput-object p1, p0, Lg2p;->b:Laoo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final j()V
    .registers 1

    return-void
.end method

.method private final k()V
    .registers 1

    return-void
.end method

.method private final l()V
    .registers 1

    return-void
.end method

.method private final m()V
    .registers 1

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    iget-byte v0, p0, Lg2p;->a:B

    packed-switch v0, :pswitch_data_e

    return-void

    :pswitch_6
    iget-object p0, p0, Lg2p;->b:Laoo;

    check-cast p0, Lu2p;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lu2p;->w:Z

    return-void

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final b()V
    .registers 1

    iget-byte p0, p0, Lg2p;->a:B

    return-void
.end method

.method public final c()V
    .registers 3

    iget-byte v0, p0, Lg2p;->a:B

    packed-switch v0, :pswitch_data_14

    iget-object p0, p0, Lg2p;->b:Laoo;

    check-cast p0, Lt8p;

    iget-object p0, p0, Lt8p;->u:Leuo;

    iget v0, p0, Leuo;->a:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_13

    invoke-virtual {p0}, Leuo;->a()V

    :cond_13
    :pswitch_13
    return-void

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_13
    .end packed-switch
.end method

.method public final d()Ljava/lang/Integer;
    .registers 1

    iget-byte p0, p0, Lg2p;->a:B

    const/4 p0, 0x0

    return-object p0
.end method

.method public final e()I
    .registers 1

    iget-byte p0, p0, Lg2p;->a:B

    packed-switch p0, :pswitch_data_a

    const/16 p0, 0x1e

    return p0

    :pswitch_8
    const/4 p0, 0x0

    return p0

    :pswitch_data_a
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method

.method public final f()Z
    .registers 2

    iget-byte v0, p0, Lg2p;->a:B

    packed-switch v0, :pswitch_data_e

    const/4 p0, 0x0

    return p0

    :pswitch_7
    iget-object p0, p0, Lg2p;->b:Laoo;

    check-cast p0, Lu2p;

    iget-boolean p0, p0, Lu2p;->w:Z

    return p0

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_7
    .end packed-switch
.end method

.method public final g()I
    .registers 1

    iget-byte p0, p0, Lg2p;->a:B

    packed-switch p0, :pswitch_data_a

    const/4 p0, 0x0

    return p0

    :pswitch_7
    const/16 p0, 0x3e8

    return p0

    :pswitch_data_a
    .packed-switch 0x0
        :pswitch_7
    .end packed-switch
.end method

.method public final h()I
    .registers 1

    iget-byte p0, p0, Lg2p;->a:B

    packed-switch p0, :pswitch_data_c

    const/16 p0, 0x1e

    return p0

    :pswitch_8
    const/16 p0, 0x32

    return p0

    nop

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method

.method public final i(Landroid/view/View;)V
    .registers 7

    iget-byte v0, p0, Lg2p;->a:B

    const/4 v1, 0x2

    iget-object p0, p0, Lg2p;->b:Laoo;

    packed-switch v0, :pswitch_data_70

    check-cast p0, Lt8p;

    iget-object p1, p0, Lt8p;->u:Leuo;

    iget v0, p1, Leuo;->a:I

    const/4 v2, 0x4

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ne v0, v2, :cond_26

    iget-boolean v2, p1, Leuo;->B:Z

    if-nez v2, :cond_26

    invoke-virtual {p1}, Leuo;->b()V

    iget-object p1, p0, Lt8p;->x:Lwtm;

    const/16 v0, 0x16

    invoke-virtual {p1, v0}, Lwtm;->a(I)V

    iput-boolean v3, p0, Lt8p;->D:Z

    sput-boolean v4, Lt8p;->J:Z

    goto :goto_5c

    :cond_26
    const/4 p1, 0x3

    if-eq v0, p1, :cond_5c

    const/4 p1, -0x1

    if-eq v0, p1, :cond_5c

    const/4 p1, 0x7

    if-eq v0, p1, :cond_5c

    iget-object p1, p0, Lt8p;->z:Lxho;

    if-eqz p1, :cond_5c

    invoke-virtual {p1}, Lxho;->a()Z

    move-result p1

    if-eqz p1, :cond_5c

    sget-object p1, Lh8p;->b:[I

    iget v0, p0, Lt8p;->B:I

    invoke-static {v0}, Lvep;->A(I)I

    move-result v0

    aget p1, p1, v0

    if-eq p1, v4, :cond_4b

    if-ne p1, v1, :cond_5a

    iget p1, p0, Lt8p;->C:I

    if-ne p1, v4, :cond_5a

    :cond_4b
    iget-object p1, p0, Lt8p;->u:Leuo;

    iget-object v0, p0, Lt8p;->z:Lxho;

    iget-object v0, v0, Lxho;->s:Ljava/lang/String;

    iput-object v0, p1, Leuo;->r:Ljava/lang/String;

    invoke-virtual {p1}, Leuo;->c()V

    iput-boolean v4, p0, Lt8p;->H:Z

    sput-boolean v4, Lt8p;->J:Z

    :cond_5a
    iput-boolean v3, p0, Lt8p;->D:Z

    :cond_5c
    :goto_5c
    return-void

    :pswitch_5d
    check-cast p0, Lu2p;

    invoke-virtual {p0, v1}, Laoo;->u(I)V

    iget-object v0, p0, Laoo;->c:Lami;

    invoke-virtual {v0, p1}, Lami;->a(Landroid/view/View;)V

    iget-object p0, p0, Laoo;->o:Lsc;

    if-eqz p0, :cond_6e

    invoke-virtual {p0}, Lsc;->h()V

    :cond_6e
    return-void

    nop

    :pswitch_data_70
    .packed-switch 0x0
        :pswitch_5d
    .end packed-switch
.end method
