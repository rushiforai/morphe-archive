.class public final synthetic Lncb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcdb;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lp12;

.field public final synthetic c:[I


# direct methods
.method public synthetic constructor <init>(Lp12;[IB)V
    .registers 4

    iput-byte p3, p0, Lncb;->a:B

    iput-object p1, p0, Lncb;->b:Lp12;

    iput-object p2, p0, Lncb;->c:[I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final execute()V
    .registers 6

    iget-byte v0, p0, Lncb;->a:B

    const/4 v1, 0x0

    const-class v2, Ld8j;

    iget-object v3, p0, Lncb;->c:[I

    iget-object p0, p0, Lncb;->b:Lp12;

    packed-switch v0, :pswitch_data_62

    iget-object p0, p0, Lp12;->e:Ljava/lang/Object;

    check-cast p0, Lwub;

    invoke-virtual {p0, v2}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Ld8j;

    check-cast p0, Lg8j;

    invoke-virtual {p0, v3}, Lg8j;->b([I)V

    return-void

    :pswitch_1c
    iget-object p0, p0, Lp12;->e:Ljava/lang/Object;

    check-cast p0, Lwub;

    invoke-virtual {p0, v2}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Ld8j;

    check-cast p0, Lg8j;

    invoke-virtual {p0, v3}, Lg8j;->d([I)V

    return-void

    :pswitch_2c
    iget-object p0, p0, Lp12;->e:Ljava/lang/Object;

    check-cast p0, Lwub;

    invoke-virtual {p0, v2}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Ld8j;

    check-cast p0, Lg8j;

    invoke-virtual {p0, v3}, Lg8j;->g([I)V

    return-void

    :pswitch_3c
    iget-object p0, p0, Lp12;->b:Ljava/lang/Object;

    check-cast p0, Lgjm;

    new-instance v0, Lqk;

    new-instance v2, Loba;

    invoke-direct {v2, v3}, Loba;-><init>([I)V

    invoke-direct {v0, v2}, Lqk;-><init>(Loba;)V

    invoke-virtual {p0, v0, v1}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_4e
    iget-object p0, p0, Lp12;->b:Ljava/lang/Object;

    check-cast p0, Lgjm;

    new-instance v0, Lm7k;

    sget-object v2, Lc8j;->e:Lc8j;

    new-instance v4, Loba;

    invoke-direct {v4, v3}, Loba;-><init>([I)V

    invoke-direct {v0, v2, v4}, Lm7k;-><init>(Lc8j;Loba;)V

    invoke-virtual {p0, v0, v1}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_data_62
    .packed-switch 0x0
        :pswitch_4e
        :pswitch_3c
        :pswitch_2c
        :pswitch_1c
    .end packed-switch
.end method
