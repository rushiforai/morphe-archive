.class public final Ldx9;
.super Lslm;
.source "SourceFile"


# instance fields
.field public final synthetic b:B

.field public c:Luik;


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Ldx9;->b:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lbp;I)V
    .registers 6

    iget-byte v0, p0, Ldx9;->b:B

    const/4 v1, 0x0

    const/16 v2, 0x10

    packed-switch v0, :pswitch_data_42

    invoke-virtual {p1, v2, p2}, Lbp;->y(II)V

    iget-byte v0, p0, Lslm;->a:B

    add-int/lit8 v2, p2, 0x4

    invoke-virtual {p1, v0, v2}, Lbp;->y(II)V

    iget-byte v0, p0, Lslm;->a:B

    if-nez v0, :cond_1f

    iget-object p0, p0, Ldx9;->c:Luik;

    check-cast p0, Lkgh;

    add-int/lit8 p2, p2, 0x8

    invoke-virtual {p1, p0, p2, v1}, Lbp;->J(Luik;IZ)V

    :cond_1f
    return-void

    :pswitch_20
    invoke-virtual {p1, v2, p2}, Lbp;->y(II)V

    iget-byte v0, p0, Lslm;->a:B

    add-int/lit8 v2, p2, 0x4

    invoke-virtual {p1, v0, v2}, Lbp;->y(II)V

    iget-byte v0, p0, Lslm;->a:B

    if-eqz v0, :cond_38

    const/4 p0, 0x1

    if-ne v0, p0, :cond_41

    const/4 p0, 0x0

    add-int/lit8 p2, p2, 0x8

    invoke-virtual {p1, p0, p2, v1}, Lbp;->J(Luik;IZ)V

    goto :goto_41

    :cond_38
    iget-object p0, p0, Ldx9;->c:Luik;

    check-cast p0, Lsw9;

    add-int/lit8 p2, p2, 0x8

    invoke-virtual {p1, p0, p2, v1}, Lbp;->J(Luik;IZ)V

    :cond_41
    :goto_41
    return-void

    :pswitch_data_42
    .packed-switch 0x0
        :pswitch_20
    .end packed-switch
.end method
