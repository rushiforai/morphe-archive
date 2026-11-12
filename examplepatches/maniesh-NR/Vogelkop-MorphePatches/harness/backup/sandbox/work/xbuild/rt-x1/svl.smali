.class public final synthetic Lsvl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Luvl;


# direct methods
.method public synthetic constructor <init>(Luvl;B)V
    .registers 3

    iput-byte p2, p0, Lsvl;->a:B

    iput-object p1, p0, Lsvl;->b:Luvl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lsvl;->a:B

    iget-object p0, p0, Lsvl;->b:Luvl;

    packed-switch v0, :pswitch_data_1c

    check-cast p1, Lkl5;

    invoke-virtual {p0}, Luvl;->a()Z

    return-void

    :pswitch_d
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0}, Luvl;->a()Z

    return-void

    :pswitch_16
    check-cast p1, Lmnf;

    invoke-virtual {p0}, Luvl;->a()Z

    return-void

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_16
        :pswitch_d
    .end packed-switch
.end method
