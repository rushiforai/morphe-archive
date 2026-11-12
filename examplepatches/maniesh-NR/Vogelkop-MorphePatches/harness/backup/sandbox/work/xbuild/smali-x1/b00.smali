.class public final synthetic Lb00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Le00;

.field public final synthetic c:Lo8f;


# direct methods
.method public synthetic constructor <init>(Le00;Lo8f;B)V
    .registers 4

    iput-byte p3, p0, Lb00;->a:B

    iput-object p1, p0, Lb00;->b:Le00;

    iput-object p2, p0, Lb00;->c:Lo8f;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    iget-byte v0, p0, Lb00;->a:B

    iget-object v1, p0, Lb00;->c:Lo8f;

    iget-object p0, p0, Lb00;->b:Le00;

    packed-switch v0, :pswitch_data_26

    invoke-virtual {p0}, Le00;->b()Lc00;

    move-result-object p0

    iget-boolean p0, p0, Lc00;->b:Z

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {v1, p0}, Lo8f;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_17
    invoke-virtual {p0}, Le00;->b()Lc00;

    move-result-object p0

    iget-boolean p0, p0, Lc00;->b:Z

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {v1, p0}, Lo8f;->run(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_17
    .end packed-switch
.end method
