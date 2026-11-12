.class public final Lvb9;
.super Lcej;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lja2;


# direct methods
.method public synthetic constructor <init>(Lxb9;Lja2;B)V
    .registers 4

    iput-byte p3, p0, Lvb9;->a:B

    iput-object p2, p0, Lvb9;->b:Lja2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final createSheet(Lmej;Lb2l;)Ldej;
    .registers 4

    iget-byte p2, p0, Lvb9;->a:B

    packed-switch p2, :pswitch_data_1c

    new-instance p2, Lfwd;

    iget-object p0, p0, Lvb9;->b:Lja2;

    check-cast p0, Llb9;

    const/4 v0, 0x1

    invoke-direct {p2, p1, p0, v0}, Lfwd;-><init>(Lmej;Lhb9;B)V

    return-object p2

    :pswitch_10
    new-instance p2, Lfwd;

    iget-object p0, p0, Lvb9;->b:Lja2;

    check-cast p0, Lkb9;

    const/4 v0, 0x0

    invoke-direct {p2, p1, p0, v0}, Lfwd;-><init>(Lmej;Lhb9;B)V

    return-object p2

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_10
    .end packed-switch
.end method
