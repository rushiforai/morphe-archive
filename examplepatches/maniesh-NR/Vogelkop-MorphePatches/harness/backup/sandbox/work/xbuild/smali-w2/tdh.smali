.class public final synthetic Ltdh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lvdh;


# direct methods
.method public synthetic constructor <init>(Lvdh;B)V
    .registers 3

    iput-byte p2, p0, Ltdh;->a:B

    iput-object p1, p0, Ltdh;->b:Lvdh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Ltdh;->a:B

    iget-object p0, p0, Ltdh;->b:Lvdh;

    packed-switch v0, :pswitch_data_28

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p1, p0, Lvdh;->n:Lcy;

    invoke-virtual {p0}, Lvdh;->z()Z

    move-result v0

    invoke-virtual {p1, v0}, Lcy;->g(Z)V

    invoke-virtual {p0}, Lu5k;->A()V

    return-void

    :pswitch_19
    check-cast p1, Ljava/util/List;

    iget-object p1, p0, Lvdh;->n:Lcy;

    invoke-virtual {p0}, Lvdh;->z()Z

    move-result v0

    invoke-virtual {p1, v0}, Lcy;->g(Z)V

    invoke-virtual {p0}, Lu5k;->A()V

    return-void

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_19
    .end packed-switch
.end method
