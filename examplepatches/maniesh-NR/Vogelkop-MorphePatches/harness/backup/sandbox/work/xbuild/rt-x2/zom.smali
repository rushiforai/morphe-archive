.class public final synthetic Lzom;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyyk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lks3;

.field public final synthetic c:Ldp2;


# direct methods
.method public synthetic constructor <init>(Lks3;Ldp2;B)V
    .registers 4

    iput-byte p3, p0, Lzom;->a:B

    iput-object p1, p0, Lzom;->b:Lks3;

    iput-object p2, p0, Lzom;->c:Ldp2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final execute()Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lzom;->a:B

    iget-object v1, p0, Lzom;->c:Ldp2;

    iget-object p0, p0, Lzom;->b:Lks3;

    packed-switch v0, :pswitch_data_34

    iget-object p0, p0, Lks3;->c:Ljava/lang/Object;

    check-cast p0, Lydi;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Ludi;

    const/4 v2, 0x1

    invoke-direct {v0, p0, v1, v2}, Ludi;-><init>(Lydi;Ldp2;B)V

    invoke-virtual {p0, v0}, Lydi;->l(Lwdi;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Iterable;

    return-object p0

    :pswitch_1d
    iget-object p0, p0, Lks3;->c:Ljava/lang/Object;

    check-cast p0, Lydi;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Ludi;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Ludi;-><init>(Lydi;Ldp2;B)V

    invoke-virtual {p0, v0}, Lydi;->l(Lwdi;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    return-object p0

    :pswitch_data_34
    .packed-switch 0x0
        :pswitch_1d
    .end packed-switch
.end method
