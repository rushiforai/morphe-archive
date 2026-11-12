.class public final synthetic Lkgo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln1p;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lkgo;->a:B

    iput-object p1, p0, Lkgo;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Lkgo;->a:B

    iget-object p0, p0, Lkgo;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_52

    check-cast p0, Lo7p;

    check-cast p1, Lt0i;

    iget-object p1, p1, Lt0i;->a:Ljava/lang/Object;

    invoke-static {p1}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p1

    if-eqz p1, :cond_1f

    iget-object p0, p0, Lpxo;->i:Lp7p;

    if-eqz p0, :cond_1f

    sget-object p1, Lp7p;->c:Ljava/util/LinkedHashSet;

    const/4 p1, 0x0

    const/16 v0, 0x232c

    invoke-virtual {p0, v0, p1}, Lp7p;->g(ILjava/lang/String;)V

    :cond_1f
    return-void

    :pswitch_20
    check-cast p0, La3p;

    check-cast p1, Lt5p;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "window.operaBridge.notifyConnectionChange(\'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lt5p;->a()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean p1, p1, Lt5p;->c:Z

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p1, "\')"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, La3p;->g(Ljava/lang/String;)V

    return-void

    :pswitch_49
    check-cast p0, Livo;

    check-cast p1, Lt0i;

    invoke-virtual {p0, p1}, Livo;->invoke(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_52
    .packed-switch 0x0
        :pswitch_49
        :pswitch_20
    .end packed-switch
.end method
