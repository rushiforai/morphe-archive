.class public final Lyzj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lgq8;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lyzj;->a:B

    iput-object p1, p0, Lyzj;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final Q(Lhq8;)V
    .registers 3

    iget-byte v0, p0, Lyzj;->a:B

    packed-switch v0, :pswitch_data_22

    invoke-virtual {p1, p0}, Lhq8;->o(Lgq8;)V

    return-void

    :pswitch_9
    iget-object p0, p0, Lyzj;->b:Ljava/lang/Object;

    check-cast p0, Lzzj;

    invoke-virtual {p1}, Lhq8;->j()Z

    move-result v0

    if-nez v0, :cond_21

    iget-object v0, p0, Lzzj;->c:Ljava/util/LinkedHashSet;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object p0, p0, Lzzj;->a:Lvnj;

    invoke-static {p1}, Lzzj;->a(Lhq8;)Lknj;

    move-result-object p1

    invoke-virtual {p0, p1}, Lvnj;->j(Lknj;)V

    :cond_21
    return-void

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method

.method public final r(ILhq8;)V
    .registers 5

    iget-byte v0, p0, Lyzj;->a:B

    iget-object v1, p0, Lyzj;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_30

    const/4 v0, 0x7

    if-ne p1, v0, :cond_1c

    invoke-virtual {p2}, Lhq8;->g()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_1c

    invoke-virtual {p2, p0}, Lhq8;->o(Lgq8;)V

    check-cast v1, Lcpk;

    invoke-virtual {v1}, Lcpk;->a()V

    :cond_1c
    return-void

    :pswitch_1d
    invoke-virtual {p2}, Lhq8;->j()Z

    move-result p0

    if-nez p0, :cond_2e

    check-cast v1, Lzzj;

    iget-object p0, v1, Lzzj;->a:Lvnj;

    invoke-static {p2}, Lzzj;->a(Lhq8;)Lknj;

    move-result-object p1

    invoke-virtual {p0, p1}, Lvnj;->m(Lknj;)V

    :cond_2e
    return-void

    nop

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_1d
    .end packed-switch
.end method
