.class public final synthetic Le9l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lr9l;


# direct methods
.method public synthetic constructor <init>(Lr9l;B)V
    .registers 3

    iput-byte p2, p0, Le9l;->a:B

    iput-object p1, p0, Le9l;->b:Lr9l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Le9l;->a:B

    iget-object p0, p0, Le9l;->b:Lr9l;

    packed-switch v0, :pswitch_data_44

    check-cast p1, Lqyi;

    invoke-virtual {p0}, Lr9l;->d()V

    return-void

    :pswitch_d
    check-cast p1, Landroid/util/Size;

    invoke-virtual {p0}, Lr9l;->c()V

    return-void

    :pswitch_13
    check-cast p1, Landroid/util/Size;

    invoke-virtual {p0}, Lr9l;->d()V

    return-void

    :pswitch_19
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0}, Lr9l;->c()V

    return-void

    :pswitch_22
    check-cast p1, Landroid/content/res/Configuration;

    invoke-virtual {p0}, Lr9l;->a()Lisj;

    move-result-object p1

    iget-object p1, p1, Lisj;->d:Lhsj;

    if-eqz p1, :cond_31

    iget-object p1, p1, Lhsj;->a:Lgtj;

    invoke-virtual {p1}, Lgtj;->k()V

    :cond_31
    invoke-virtual {p0}, Lr9l;->c()V

    new-instance p1, Lc9l;

    const/4 v0, 0x6

    invoke-direct {p1, p0, v0}, Lc9l;-><init>(Lr9l;B)V

    invoke-virtual {p0, p1}, Lr9l;->q(Lkotlin/jvm/functions/Function0;)V

    return-void

    :pswitch_3e
    check-cast p1, Lb3c;

    invoke-virtual {p0}, Lr9l;->c()V

    return-void

    :pswitch_data_44
    .packed-switch 0x0
        :pswitch_3e
        :pswitch_22
        :pswitch_19
        :pswitch_13
        :pswitch_d
    .end packed-switch
.end method
