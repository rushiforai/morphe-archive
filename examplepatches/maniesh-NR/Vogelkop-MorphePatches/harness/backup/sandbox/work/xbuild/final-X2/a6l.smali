.class public final synthetic La6l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lp77;


# direct methods
.method public synthetic constructor <init>(Lp77;B)V
    .registers 3

    iput-byte p2, p0, La6l;->a:B

    iput-object p1, p0, La6l;->b:Lp77;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 5

    iget-byte v0, p0, La6l;->a:B

    iget-object p0, p0, La6l;->b:Lp77;

    packed-switch v0, :pswitch_data_32

    check-cast p1, Landroidx/recyclerview/widget/i;

    sget-object v0, Lc6l;->a:Lc6l;

    new-instance v1, Ldnj;

    const/16 v2, 0x1b

    invoke-direct {v1, p1, v2}, Ldnj;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v0, v1}, Lp77;->f(Lc6l;Lkotlin/jvm/functions/Function0;)V

    return-void

    :pswitch_16
    check-cast p1, Ljava/util/Set;

    sget-object v0, Lc6l;->d:Lc6l;

    new-instance v1, Lb6l;

    const/4 v2, 0x1

    invoke-direct {v1, p1, v2}, Lb6l;-><init>(Ljava/util/Set;B)V

    invoke-virtual {p0, v0, v1}, Lp77;->f(Lc6l;Lkotlin/jvm/functions/Function0;)V

    return-void

    :pswitch_24
    check-cast p1, Ljava/util/Set;

    sget-object v0, Lc6l;->b:Lc6l;

    new-instance v1, Lb6l;

    const/4 v2, 0x0

    invoke-direct {v1, p1, v2}, Lb6l;-><init>(Ljava/util/Set;B)V

    invoke-virtual {p0, v0, v1}, Lp77;->f(Lc6l;Lkotlin/jvm/functions/Function0;)V

    return-void

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_24
        :pswitch_16
    .end packed-switch
.end method
