.class public final synthetic Lswa;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Li16;


# direct methods
.method public synthetic constructor <init>(Li16;B)V
    .registers 3

    iput-byte p2, p0, Lswa;->a:B

    iput-object p1, p0, Lswa;->b:Li16;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 9

    iget-byte p1, p0, Lswa;->a:B

    iget-object p0, p0, Lswa;->b:Li16;

    packed-switch p1, :pswitch_data_78

    sget-object p1, Lywa;->g:[Lxtb;

    iget-object p0, p0, Li16;->b:Ljava/lang/Object;

    check-cast p0, Lzba;

    iget-object p1, p0, Lzba;->b:Lnrl;

    iget v0, p0, Lzba;->c:I

    iget-object v1, p0, Lzba;->a:Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ge v0, v2, :cond_2d

    iget v0, p0, Lzba;->c:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lzba;->c:I

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lxba;

    invoke-virtual {p1, p0}, Lnrl;->h(Lxba;)V

    invoke-virtual {p1}, Lnrl;->A()V

    :cond_2d
    return-void

    :pswitch_2e
    sget-object p1, Lywa;->g:[Lxtb;

    iget-object p0, p0, Li16;->b:Ljava/lang/Object;

    check-cast p0, Lzba;

    iget-object p1, p0, Lzba;->b:Lnrl;

    iget v0, p0, Lzba;->c:I

    if-ltz v0, :cond_76

    iget-object v1, p0, Lzba;->a:Ljava/util/ArrayList;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lxba;

    iget-object v1, v0, Lxba;->b:Landroid/os/Parcelable;

    iget-object v0, v0, Lxba;->a:Lwba;

    sget-object v2, Lwba;->c:Lwba;

    if-ne v0, v2, :cond_5f

    new-instance v2, Lxba;

    check-cast v1, Lcya;

    iget-object v3, v1, Lcya;->d:Ljava/lang/Object;

    iget-object v4, v1, Lcya;->c:Ljava/lang/Object;

    iget-object v5, v1, Lcya;->a:Lfya;

    iget v1, v1, Lcya;->b:I

    new-instance v6, Lcya;

    invoke-direct {v6, v5, v1, v3, v4}, Lcya;-><init>(Lfya;ILjava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {v2, v0, v6}, Lxba;-><init>(Lwba;Landroid/os/Parcelable;)V

    goto :goto_6a

    :cond_5f
    new-instance v2, Lxba;

    sget-object v3, Lwba;->a:Lwba;

    if-ne v0, v3, :cond_67

    sget-object v3, Lwba;->b:Lwba;

    :cond_67
    invoke-direct {v2, v3, v1}, Lxba;-><init>(Lwba;Landroid/os/Parcelable;)V

    :goto_6a
    iget v0, p0, Lzba;->c:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lzba;->c:I

    invoke-virtual {p1, v2}, Lnrl;->h(Lxba;)V

    invoke-virtual {p1}, Lnrl;->A()V

    :cond_76
    return-void

    nop

    :pswitch_data_78
    .packed-switch 0x0
        :pswitch_2e
    .end packed-switch
.end method
