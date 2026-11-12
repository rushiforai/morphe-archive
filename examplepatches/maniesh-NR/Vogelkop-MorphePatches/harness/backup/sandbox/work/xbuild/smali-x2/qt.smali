.class public final Lqt;
.super Lo93;
.source "SourceFile"


# instance fields
.field public final synthetic c:B

.field public final d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lami;)V
    .registers 3

    const/4 v0, 0x4

    iput-byte v0, p0, Lqt;->c:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lqt;->d:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 12
    iput-byte p2, p0, Lqt;->c:B

    iput-object p1, p0, Lqt;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)Lgtj;
    .registers 8

    iget-byte v0, p0, Lqt;->c:B

    const/4 v1, 0x0

    const/16 v2, 0x1388

    const v3, 0x7f1410cd

    iget-object v4, p0, Lqt;->d:Ljava/lang/Object;

    const/16 v5, 0x9c4

    packed-switch v0, :pswitch_data_7c

    const p0, 0x7f14137b

    invoke-static {p1, p0, v5}, Lgtj;->c(Landroid/view/View;II)Lgtj;

    move-result-object p0

    check-cast v4, Lpkm;

    invoke-virtual {p0, v3, v4}, Lgtj;->f(ILandroid/view/View$OnClickListener;)V

    return-object p0

    :pswitch_1c
    check-cast v4, Lami;

    iget-object p0, v4, Lami;->e:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-static {p1, p0, v2}, Lgtj;->e(Landroid/view/View;Ljava/lang/CharSequence;I)Lgtj;

    move-result-object p0

    iput-object p0, v4, Lami;->c:Ljava/lang/Object;

    invoke-virtual {v4, p0}, Lami;->A(Lgtj;)V

    iget-object p0, v4, Lami;->c:Ljava/lang/Object;

    check-cast p0, Lgtj;

    iget-object p1, v4, Lami;->h:Ljava/lang/Object;

    check-cast p1, Lpt;

    iget-object p0, p0, Lgtj;->a:Lasj;

    invoke-virtual {p0, p1}, Lna3;->a(Lzrj;)V

    iget-object p0, v4, Lami;->c:Ljava/lang/Object;

    check-cast p0, Lgtj;

    return-object p0

    :pswitch_3d
    const v0, 0x7f140f34

    invoke-static {p1, v0, v5}, Lgtj;->c(Landroid/view/View;II)Lgtj;

    move-result-object p1

    new-instance v0, Lh4i;

    const/4 v1, 0x6

    invoke-direct {v0, p0, v1}, Lh4i;-><init>(Ljava/lang/Object;B)V

    const p0, 0x7f141364

    invoke-virtual {p1, p0, v0}, Lgtj;->f(ILandroid/view/View$OnClickListener;)V

    return-object p1

    :pswitch_51
    check-cast v4, Lqxh;

    invoke-static {p1, v4, v5, v1}, Lgtj;->d(Landroid/view/View;Lpxh;ILandroid/view/View;)Lgtj;

    move-result-object p0

    return-object p0

    :pswitch_58
    const v0, 0x7f1401a6

    invoke-static {p1, v0, v2}, Lgtj;->c(Landroid/view/View;II)Lgtj;

    move-result-object p1

    new-instance v0, Lgf;

    const/16 v1, 0xc

    invoke-direct {v0, p0, v1}, Lgf;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v3, v0}, Lgtj;->f(ILandroid/view/View$OnClickListener;)V

    return-object p1

    :pswitch_6a
    check-cast v4, Lrxh;

    invoke-static {p1, v4, v5, v1}, Lgtj;->d(Landroid/view/View;Lpxh;ILandroid/view/View;)Lgtj;

    move-result-object p1

    new-instance v0, Lpt;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lpt;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p1, Lgtj;->a:Lasj;

    invoke-virtual {p0, v0}, Lna3;->a(Lzrj;)V

    return-object p1

    :pswitch_data_7c
    .packed-switch 0x0
        :pswitch_6a
        :pswitch_58
        :pswitch_51
        :pswitch_3d
        :pswitch_1c
    .end packed-switch
.end method
