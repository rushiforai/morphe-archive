.class public final Lyfd;
.super Lozb;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic i:B

.field public final synthetic j:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;B)V
    .registers 3

    iput-byte p2, p0, Lyfd;->i:B

    iput-object p1, p0, Lyfd;->j:Landroid/content/Context;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lozb;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lyfd;->i:B

    packed-switch v0, :pswitch_data_26

    check-cast p1, Landroid/content/Context;

    new-instance p1, Lbwl;

    iget-object p0, p0, Lyfd;->j:Landroid/content/Context;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v0}, Lbwl;-><init>(Landroid/content/Context;B)V

    return-object p1

    :pswitch_10
    check-cast p1, Landroid/content/Context;

    new-instance p1, Lbwl;

    iget-object p0, p0, Lyfd;->j:Landroid/content/Context;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lbwl;-><init>(Landroid/content/Context;B)V

    return-object p1

    :pswitch_1b
    check-cast p1, Landroid/content/Context;

    new-instance p1, Lzfd;

    iget-object p0, p0, Lyfd;->j:Landroid/content/Context;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lzfd;-><init>(Landroid/content/Context;B)V

    return-object p1

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_1b
        :pswitch_10
    .end packed-switch
.end method
