.class public final synthetic Lxk6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lyk6;


# direct methods
.method public synthetic constructor <init>(Lyk6;B)V
    .registers 3

    iput-byte p2, p0, Lxk6;->a:B

    iput-object p1, p0, Lxk6;->b:Lyk6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lxk6;->a:B

    iget-object p0, p0, Lxk6;->b:Lyk6;

    packed-switch v0, :pswitch_data_26

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lyk6;->f(Ljava/lang/Boolean;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_f
    check-cast p1, Lkotlin/Unit;

    iget-object p0, p0, Lyk6;->h:Lwjh;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget p1, Leif;->a:I

    iget-object p0, p0, Lwjh;->c:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-static {p0}, Lkfo;->e0(Landroid/content/Context;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method
