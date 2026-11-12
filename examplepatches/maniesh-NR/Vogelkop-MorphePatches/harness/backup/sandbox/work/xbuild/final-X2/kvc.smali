.class public final synthetic Lkvc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ldue;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lkvc;->a:B

    iput-object p1, p0, Lkvc;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final b(Lcue;)V
    .registers 3

    iget-byte v0, p0, Lkvc;->a:B

    iget-object p0, p0, Lkvc;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_22

    check-cast p0, Lwte;

    iget-byte p1, p1, Lcue;->a:B

    const/4 v0, 0x2

    if-ne p1, v0, :cond_10

    const/4 p1, 0x1

    goto :goto_11

    :cond_10
    const/4 p1, 0x0

    :goto_11
    iget-boolean v0, p0, Lwte;->s:Z

    if-eq v0, p1, :cond_1a

    iput-boolean p1, p0, Lwte;->s:Z

    invoke-virtual {p0}, Lwte;->b()V

    :cond_1a
    return-void

    :pswitch_1b
    check-cast p0, Llvc;

    invoke-virtual {p0, p1}, Llvc;->b(Lcue;)V

    return-void

    nop

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_1b
    .end packed-switch
.end method
