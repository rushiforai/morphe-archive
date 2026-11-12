.class public final synthetic Lcnj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lvnj;

.field public final synthetic c:Llnj;


# direct methods
.method public synthetic constructor <init>(Lvnj;Llnj;B)V
    .registers 4

    iput-byte p3, p0, Lcnj;->a:B

    iput-object p1, p0, Lcnj;->b:Lvnj;

    iput-object p2, p0, Lcnj;->c:Llnj;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    iget-byte v0, p0, Lcnj;->a:B

    iget-object v1, p0, Lcnj;->c:Llnj;

    iget-object p0, p0, Lcnj;->b:Lvnj;

    packed-switch v0, :pswitch_data_22

    invoke-virtual {p0, v1}, Lvnj;->k(Llnj;)V

    return-void

    :pswitch_d
    sget-object v0, Lv08;->a:Lv08;

    invoke-static {v1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lvnj;->n(Ljava/util/Set;Ljava/util/Set;)V

    return-void

    :pswitch_17
    sget-object v0, Lv08;->a:Lv08;

    invoke-static {v1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lvnj;->n(Ljava/util/Set;Ljava/util/Set;)V

    return-void

    nop

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_17
        :pswitch_d
    .end packed-switch
.end method
