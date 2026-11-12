.class public final Lz5g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw5g;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lz5g;->a:B

    iput-object p1, p0, Lz5g;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    iget-byte v0, p0, Lz5g;->a:B

    iget-object p0, p0, Lz5g;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_2c

    check-cast p0, Lk6g;

    invoke-virtual {p0}, Lk6g;->a()V

    return-void

    :pswitch_d
    check-cast p0, Lghf;

    iget-object v0, p0, Lghf;->c:Ljava/lang/Object;

    check-cast v0, Lode;

    iget-object p0, p0, Lghf;->b:Ljava/lang/Object;

    check-cast p0, Lx5g;

    iget-object p0, p0, Lx5g;->e:La4g;

    if-eqz p0, :cond_22

    iget-object p0, p0, La4g;->a:Ljava/util/List;

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    goto :goto_23

    :cond_22
    const/4 p0, 0x0

    :goto_23
    if-nez p0, :cond_27

    sget-object p0, Ll08;->a:Ll08;

    :cond_27
    invoke-virtual {v0, p0}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
