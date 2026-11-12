.class public final synthetic Lcch;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ldch;


# direct methods
.method public synthetic constructor <init>(Ldch;B)V
    .registers 3

    iput-byte p2, p0, Lcch;->a:B

    iput-object p1, p0, Lcch;->b:Ldch;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    iget-byte v0, p0, Lcch;->a:B

    iget-object p0, p0, Lcch;->b:Ldch;

    packed-switch v0, :pswitch_data_36

    iget-object v0, p0, Ldch;->g:Lech;

    iget p0, p0, Ldch;->f:I

    invoke-virtual {v0, p0}, Lech;->a(I)V

    return-void

    :pswitch_f
    iget-object v0, p0, Ldch;->e:Ljava/util/HashMap;

    monitor-enter v0

    :try_start_12
    iget-object p0, p0, Ldch;->e:Ljava/util/HashMap;

    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_24

    monitor-exit v0

    return-void

    :cond_24
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    if-nez p0, :cond_2c

    const/4 p0, 0x0

    throw p0

    :cond_2c
    new-instance p0, Ljava/lang/ClassCastException;

    invoke-direct {p0}, Ljava/lang/ClassCastException;-><init>()V

    throw p0

    :goto_32
    monitor-exit v0
    :try_end_33
    .catchall {:try_start_12 .. :try_end_33} :catchall_34

    throw p0

    :catchall_34
    move-exception p0

    goto :goto_32

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method
