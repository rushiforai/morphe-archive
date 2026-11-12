.class public final synthetic Lopc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lvmc;

.field public final synthetic c:Li16;


# direct methods
.method public synthetic constructor <init>(Lvmc;Li16;B)V
    .registers 4

    iput-byte p3, p0, Lopc;->a:B

    iput-object p1, p0, Lopc;->b:Lvmc;

    iput-object p2, p0, Lopc;->c:Li16;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lopc;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Lopc;->c:Li16;

    iget-object p0, p0, Lopc;->b:Lvmc;

    packed-switch v0, :pswitch_data_48

    iget-object p0, p0, Lvmc;->b:Lymc;

    iget-object v0, v2, Li16;->c:Ljava/lang/Object;

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-interface {v0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lzmc;

    if-eqz v0, :cond_22

    invoke-interface {v0}, Lzmc;->a()Llmc;

    move-result-object v0

    if-eqz v0, :cond_22

    iget-object v0, v0, Llmc;->c:Lvmc;

    iget-object v1, v0, Lvmc;->b:Lymc;

    :cond_22
    invoke-virtual {p0, v1}, Lymc;->equals(Ljava/lang/Object;)Z

    move-result p0

    :goto_26
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_2b
    iget-object p0, p0, Lvmc;->a:Lymc;

    iget-object v0, v2, Li16;->c:Ljava/lang/Object;

    check-cast v0, Lkotlin/jvm/functions/Function0;

    invoke-interface {v0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lzmc;

    if-eqz v0, :cond_43

    invoke-interface {v0}, Lzmc;->a()Llmc;

    move-result-object v0

    if-eqz v0, :cond_43

    iget-object v0, v0, Llmc;->c:Lvmc;

    iget-object v1, v0, Lvmc;->a:Lymc;

    :cond_43
    invoke-virtual {p0, v1}, Lymc;->equals(Ljava/lang/Object;)Z

    move-result p0

    goto :goto_26

    :pswitch_data_48
    .packed-switch 0x0
        :pswitch_2b
    .end packed-switch
.end method
