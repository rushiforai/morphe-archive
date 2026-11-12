.class public final synthetic Lls;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln5o;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lns;


# direct methods
.method public synthetic constructor <init>(Lns;B)V
    .registers 3

    iput-byte p2, p0, Lls;->a:B

    iput-object p1, p0, Lls;->b:Lns;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lls;->a:B

    iget-object p0, p0, Lls;->b:Lns;

    packed-switch v0, :pswitch_data_36

    iget-object p0, p0, Lns;->d:Lkotlin/jvm/functions/Function1;

    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_f
    check-cast p1, Lms;

    iget-object v0, p1, Lms;->a:Ljava/lang/Object;

    iget-object v1, p1, Lms;->b:Ljava/util/Set;

    iget p1, p1, Lms;->c:I

    invoke-virtual {p0, v0, v1, p1}, Lns;->a(Ljava/lang/Object;Ljava/util/Set;I)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_1c
    iput-object p1, p0, Lns;->g:Ljava/lang/Object;

    iget-boolean v0, p0, Lns;->f:Z

    if-eqz v0, :cond_2a

    if-eqz p1, :cond_2a

    const/4 v0, 0x0

    iput-boolean v0, p0, Lns;->f:Z

    invoke-virtual {p0, p1}, Lns;->c(Ljava/lang/Object;)V

    :cond_2a
    invoke-virtual {p0, p1}, Lns;->c(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_30
    invoke-virtual {p0, p1}, Lns;->b(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_30
        :pswitch_1c
        :pswitch_f
    .end packed-switch
.end method
