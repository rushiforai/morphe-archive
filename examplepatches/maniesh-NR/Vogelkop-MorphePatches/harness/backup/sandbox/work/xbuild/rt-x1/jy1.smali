.class public final synthetic Ljy1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lky1;


# direct methods
.method public synthetic constructor <init>(Lky1;B)V
    .registers 3

    iput-byte p2, p0, Ljy1;->a:B

    iput-object p1, p0, Ljy1;->b:Lky1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Ljy1;->a:B

    iget-object p0, p0, Ljy1;->b:Lky1;

    packed-switch v0, :pswitch_data_34

    iget-object p0, p0, Lky1;->a:Landroidx/fragment/app/r;

    invoke-virtual {p0}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object p0

    invoke-static {p0}, Lxih;->u(Landroidx/fragment/app/w;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_13
    iget-object p0, p0, Lky1;->j:Lzv3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lq52;

    iget-object p0, p0, Lq52;->c:Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lo52;

    instance-of v0, p0, Ll52;

    if-nez v0, :cond_2d

    instance-of p0, p0, Lj52;

    if-nez p0, :cond_2d

    const/4 p0, 0x0

    goto :goto_2e

    :cond_2d
    const/4 p0, 0x1

    :goto_2e
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_34
    .packed-switch 0x0
        :pswitch_13
    .end packed-switch
.end method
