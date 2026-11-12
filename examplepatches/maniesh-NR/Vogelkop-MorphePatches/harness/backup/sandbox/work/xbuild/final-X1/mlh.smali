.class public final Lmlh;
.super Lxph;
.source "SourceFile"


# instance fields
.field public final synthetic c:B


# direct methods
.method public synthetic constructor <init>(Landroidx/recyclerview/widget/d;B)V
    .registers 3

    iput-byte p2, p0, Lmlh;->c:B

    invoke-direct {p0, p1}, Lxph;-><init>(Landroidx/recyclerview/widget/d;)V

    return-void
.end method


# virtual methods
.method public final a(I)Z
    .registers 2

    iget-byte p0, p0, Lmlh;->c:B

    packed-switch p0, :pswitch_data_a

    const/4 p0, 0x0

    return p0

    :pswitch_7
    const/4 p0, 0x1

    return p0

    nop

    :pswitch_data_a
    .packed-switch 0x0
        :pswitch_7
    .end packed-switch
.end method
