.class public final synthetic Le6l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lsrg;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/util/Set;


# direct methods
.method public synthetic constructor <init>(Ljava/util/Set;B)V
    .registers 3

    iput-byte p2, p0, Le6l;->a:B

    iput-object p1, p0, Le6l;->b:Ljava/util/Set;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Z
    .registers 3

    iget-byte v0, p0, Le6l;->a:B

    iget-object p0, p0, Le6l;->b:Ljava/util/Set;

    packed-switch v0, :pswitch_data_12

    check-cast p1, Lszb;

    :goto_9
    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :pswitch_e
    check-cast p1, Lb2l;

    goto :goto_9

    nop

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method
