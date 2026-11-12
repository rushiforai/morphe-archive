.class public final synthetic Ls5l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lz5l;


# direct methods
.method public synthetic constructor <init>(Lz5l;B)V
    .registers 3

    iput-byte p2, p0, Ls5l;->a:B

    iput-object p1, p0, Ls5l;->b:Lz5l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Ls5l;->a:B

    iget-object p0, p0, Ls5l;->b:Lz5l;

    packed-switch v0, :pswitch_data_52

    iget-object p0, p0, Lz5l;->d:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_11

    const/4 p0, 0x1

    goto :goto_12

    :cond_11
    const/4 p0, 0x0

    :goto_12
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_17
    iget-object p0, p0, Lz5l;->v:Lx2l;

    iget-object p0, p0, Lx2l;->o:Lo2l;

    iget-object p0, p0, Lo2l;->f:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_2c
    iget-object p0, p0, Lz5l;->v:Lx2l;

    iget-object p0, p0, Lx2l;->o:Lo2l;

    iget-object p0, p0, Lo2l;->f:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_41
    iget-object p0, p0, Lz5l;->w:Lqsh;

    return-object p0

    :pswitch_44
    iget-object p0, p0, Lz5l;->w:Lqsh;

    return-object p0

    :pswitch_47
    iget-object p0, p0, Lz5l;->w:Lqsh;

    return-object p0

    :pswitch_4a
    iget-object p0, p0, Lz5l;->B:Lev7;

    iget-object p0, p0, Lev7;->k:Ljava/lang/Object;

    check-cast p0, Lpde;

    return-object p0

    nop

    :pswitch_data_52
    .packed-switch 0x0
        :pswitch_4a
        :pswitch_47
        :pswitch_44
        :pswitch_41
        :pswitch_2c
        :pswitch_17
    .end packed-switch
.end method
