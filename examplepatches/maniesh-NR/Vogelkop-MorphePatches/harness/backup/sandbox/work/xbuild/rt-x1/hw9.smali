.class public final synthetic Lhw9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrwf;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lhw9;->a:B

    iput-object p1, p0, Lhw9;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 4

    iget-byte v0, p0, Lhw9;->a:B

    iget-object p0, p0, Lhw9;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_20

    check-cast p0, Lswf;

    iget-object p1, p0, Lswf;->a:Lni6;

    iget-object v0, p0, Lswf;->e:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lswf;->a()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lni6;->c(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    invoke-virtual {p0}, Lswf;->b()Z

    return-void

    :pswitch_18
    check-cast p0, Liw9;

    if-eqz p1, :cond_1f

    invoke-virtual {p0}, Liw9;->h()V

    :cond_1f
    return-void

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_18
    .end packed-switch
.end method
