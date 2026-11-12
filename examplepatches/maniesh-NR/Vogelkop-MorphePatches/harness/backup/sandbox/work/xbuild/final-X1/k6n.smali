.class public final synthetic Lk6n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lhcb;
.implements Lxjj;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ltjn;


# direct methods
.method public synthetic constructor <init>(Ltjn;B)V
    .registers 3

    iput-byte p2, p0, Lk6n;->a:B

    iput-object p1, p0, Lk6n;->b:Ltjn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final getAsInt()I
    .registers 5

    iget-byte v0, p0, Lk6n;->a:B

    iget-object p0, p0, Lk6n;->b:Ltjn;

    packed-switch v0, :pswitch_data_30

    invoke-interface {p0}, Ltjn;->a()I

    move-result p0

    return p0

    :pswitch_c
    invoke-interface {p0}, Ltjn;->a()I

    move-result p0

    return p0

    :pswitch_11
    invoke-interface {p0}, Ltjn;->a()I

    move-result p0

    return p0

    :pswitch_16
    invoke-interface {p0}, Ltjn;->a()I

    move-result p0

    return p0

    :pswitch_1b
    invoke-interface {p0}, Ltjn;->a()I

    move-result p0

    return p0

    :pswitch_20
    invoke-interface {p0}, Ltjn;->a()I

    move-result p0

    int-to-double v0, p0

    const-wide/high16 v2, 0x3fe8000000000000L    # 0.75

    mul-double/2addr v0, v2

    double-to-int p0, v0

    return p0

    :pswitch_2a
    invoke-interface {p0}, Ltjn;->a()I

    move-result p0

    return p0

    nop

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_2a
        :pswitch_20
        :pswitch_1b
        :pswitch_16
        :pswitch_11
        :pswitch_c
    .end packed-switch
.end method

.method public final i(Ljava/lang/Object;Landroidx/recyclerview/widget/i;)V
    .registers 4

    check-cast p1, Lhkb;

    check-cast p2, Lu6n;

    iget-object p0, p0, Lk6n;->b:Ltjn;

    invoke-interface {p0}, Ltjn;->e()Ljava/lang/String;

    move-result-object p0

    iget-object p1, p1, Ljkb;->a:Laln;

    invoke-interface {p1}, Laln;->getId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p2, Lu6n;->f:Laln;

    iput-boolean p0, p2, Lu6n;->g:Z

    invoke-virtual {p2, p1}, Lu6n;->U(Laln;)V

    return-void
.end method
