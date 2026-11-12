.class public final synthetic Lqpm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcbk;

.field public final synthetic c:Lcom/opera/android/favorites/PushedSpeedDialFavorite;


# direct methods
.method public synthetic constructor <init>(Lcbk;Lcom/opera/android/favorites/PushedSpeedDialFavorite;B)V
    .registers 4

    iput-byte p3, p0, Lqpm;->a:B

    iput-object p1, p0, Lqpm;->b:Lcbk;

    iput-object p2, p0, Lqpm;->c:Lcom/opera/android/favorites/PushedSpeedDialFavorite;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    iget-byte v0, p0, Lqpm;->a:B

    iget-object v1, p0, Lqpm;->c:Lcom/opera/android/favorites/PushedSpeedDialFavorite;

    iget-object p0, p0, Lqpm;->b:Lcbk;

    packed-switch v0, :pswitch_data_32

    iget-object p0, p0, Lcbk;->e:Ljava/lang/Object;

    check-cast p0, Llgf;

    iget-object v0, p0, Llgf;->h:Ljava/lang/Object;

    check-cast v0, Lqdh;

    iget-object v2, v1, Lcom/opera/android/favorites/PushedSpeedDialFavorite;->e:Ltqi;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v3, Lidh;->a:Lidh;

    invoke-virtual {v0, v2, v3}, Lqdh;->a(Ltqi;Lidh;)V

    iget-object p0, p0, Llgf;->i:Ljava/lang/Object;

    check-cast p0, Lcul;

    invoke-virtual {p0, v1}, Lcul;->c(Lhq8;)V

    return-void

    :pswitch_23
    iget-object p0, p0, Lcbk;->e:Ljava/lang/Object;

    check-cast p0, Llgf;

    iget-object p0, p0, Llgf;->h:Ljava/lang/Object;

    check-cast p0, Lqdh;

    iget-object v0, v1, Lcom/opera/android/favorites/PushedSpeedDialFavorite;->e:Ltqi;

    invoke-virtual {p0, v0}, Lqdh;->b(Ltqi;)V

    return-void

    nop

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_23
    .end packed-switch
.end method
