.class public final synthetic Lry1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lii;


# direct methods
.method public synthetic constructor <init>(Lii;B)V
    .registers 3

    iput-byte p2, p0, Lry1;->a:B

    iput-object p1, p0, Lry1;->b:Lii;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Lry1;->a:B

    const/4 v1, 0x1

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    iget-object p0, p0, Lry1;->b:Lii;

    packed-switch v0, :pswitch_data_5a

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lt9f;

    invoke-virtual {p0}, Lt9f;->b()Ls9f;

    move-result-object p0

    sget-wide v3, Lehj;->i:J

    invoke-static {v3, v4}, Lpn7;->f(J)J

    move-result-wide v5

    invoke-virtual {p0, v5, v6, v2}, Ls9f;->a(JLjava/util/concurrent/TimeUnit;)V

    invoke-static {v3, v4}, Lpn7;->f(J)J

    move-result-wide v3

    invoke-virtual {p0, v3, v4, v2}, Ls9f;->b(JLjava/util/concurrent/TimeUnit;)V

    iput-boolean v1, p0, Ls9f;->i:Z

    new-instance v0, Lt9f;

    invoke-direct {v0, p0}, Lt9f;-><init>(Ls9f;)V

    return-object v0

    :pswitch_2c
    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lt9f;

    invoke-virtual {p0}, Lt9f;->b()Ls9f;

    move-result-object p0

    sget-wide v3, Ldz1;->h:J

    invoke-static {v3, v4}, Lpn7;->f(J)J

    move-result-wide v5

    invoke-virtual {p0, v5, v6, v2}, Ls9f;->a(JLjava/util/concurrent/TimeUnit;)V

    invoke-static {v3, v4}, Lpn7;->f(J)J

    move-result-wide v5

    invoke-virtual {p0, v5, v6, v2}, Ls9f;->b(JLjava/util/concurrent/TimeUnit;)V

    invoke-static {v3, v4}, Lpn7;->f(J)J

    move-result-wide v3

    const-string v0, "timeout"

    invoke-static {v0, v3, v4, v2}, Lokhttp3/internal/_UtilJvmKt;->checkDuration(Ljava/lang/String;JLjava/util/concurrent/TimeUnit;)I

    move-result v0

    iput v0, p0, Ls9f;->A:I

    iput-boolean v1, p0, Ls9f;->i:Z

    new-instance v0, Lt9f;

    invoke-direct {v0, p0}, Lt9f;-><init>(Ls9f;)V

    return-object v0

    :pswitch_data_5a
    .packed-switch 0x0
        :pswitch_2c
    .end packed-switch
.end method
