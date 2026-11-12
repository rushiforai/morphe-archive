.class public final synthetic Lds8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Les8;


# direct methods
.method public synthetic constructor <init>(Les8;B)V
    .registers 3

    iput-byte p2, p0, Lds8;->a:B

    iput-object p1, p0, Lds8;->b:Les8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    iget-byte v0, p0, Lds8;->a:B

    iget-object p0, p0, Lds8;->b:Les8;

    packed-switch v0, :pswitch_data_3c

    invoke-virtual {p0}, Les8;->X()V

    sget-boolean v0, Les8;->e:Z

    if-nez v0, :cond_36

    iget-object v0, p0, Les8;->b:Lfr8;

    invoke-virtual {v0}, Lfr8;->d()Z

    move-result v0

    if-eqz v0, :cond_36

    const/4 v0, 0x1

    sput-boolean v0, Les8;->e:Z

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Les8;->U(Ljava/lang/StringBuilder;)V

    const-string p0, "debug_fav_placeholder"

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object p0

    new-instance v0, Lyo8;

    const-string v1, "Stuck placeholders"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lyo8;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0, p0}, Lks3;->E(Ljava/lang/Throwable;Ljava/util/Map;)V

    :cond_36
    return-void

    :pswitch_37
    invoke-virtual {p0}, Les8;->X()V

    return-void

    nop

    :pswitch_data_3c
    .packed-switch 0x0
        :pswitch_37
    .end packed-switch
.end method
