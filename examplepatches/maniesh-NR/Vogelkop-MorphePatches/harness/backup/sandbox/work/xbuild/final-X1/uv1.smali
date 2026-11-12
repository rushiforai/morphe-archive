.class public final Luv1;
.super Lgxl;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Luv1;->a:B

    iput-object p1, p0, Luv1;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final i()V
    .registers 3

    iget-byte v0, p0, Luv1;->a:B

    packed-switch v0, :pswitch_data_18

    return-void

    :pswitch_6
    iget-object p0, p0, Luv1;->b:Ljava/lang/Object;

    check-cast p0, Lxv1;

    iget-object p0, p0, Lxv1;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->q()Le59;

    move-result-object p0

    sget-object v0, Ld59;->b:Ld59;

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Le59;->c(Ld59;Z)V

    return-void

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final x(I)V
    .registers 5

    iget-byte v0, p0, Luv1;->a:B

    packed-switch v0, :pswitch_data_24

    return-void

    :pswitch_6
    iget-object p0, p0, Luv1;->b:Ljava/lang/Object;

    check-cast p0, Lfge;

    iget-object v0, p0, Lfge;->t:Lbf9;

    const/4 v1, 0x1

    if-lt p1, v1, :cond_22

    iget-object p1, p0, Lfge;->z:Lbc9;

    iget-object v1, v0, Lbf9;->a:Loji;

    invoke-virtual {v1}, Loji;->u()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p1, Lbc9;->g:Ljava/lang/String;

    if-nez v2, :cond_1d

    iput-object v1, p1, Lbc9;->g:Ljava/lang/String;

    :cond_1d
    iget-object p0, p0, Lfge;->J:Luv1;

    invoke-virtual {v0, p0}, Lbf9;->D(Lhxl;)V

    :cond_22
    return-void

    nop

    :pswitch_data_24
    .packed-switch 0x1
        :pswitch_6
    .end packed-switch
.end method
