.class public final synthetic Lfu5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lku5;


# direct methods
.method public synthetic constructor <init>(Lku5;B)V
    .registers 3

    iput-byte p2, p0, Lfu5;->a:B

    iput-object p1, p0, Lfu5;->b:Lku5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Lfu5;->a:B

    iget-object p0, p0, Lfu5;->b:Lku5;

    packed-switch v0, :pswitch_data_5e

    check-cast p1, Llu5;

    sget-object v0, Llu5;->b:Llu5;

    if-ne p1, v0, :cond_17

    new-instance p1, Lgu5;

    const/4 v0, 0x2

    invoke-direct {p1, p0, v0}, Lgu5;-><init>(Lku5;B)V

    invoke-virtual {p0, p1}, Lku5;->f(Ljava/lang/Runnable;)V

    goto :goto_26

    :cond_17
    invoke-virtual {p0}, Lku5;->a()Z

    move-result p1

    if-eqz p1, :cond_26

    new-instance p1, Lgu5;

    const/4 v0, 0x3

    invoke-direct {p1, p0, v0}, Lgu5;-><init>(Lku5;B)V

    invoke-virtual {p0, p1}, Lku5;->f(Ljava/lang/Runnable;)V

    :cond_26
    :goto_26
    return-void

    :pswitch_27
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_5c

    iget-object p1, p0, Lku5;->a:Lc5o;

    new-instance v0, Lfu5;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lfu5;-><init>(Lku5;B)V

    iget-object v1, p1, Lc5o;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    if-nez v1, :cond_45

    invoke-virtual {p1}, Lc5o;->s()Llu5;

    move-result-object p1

    invoke-virtual {v0, p1}, Lfu5;->run(Ljava/lang/Object;)V

    goto :goto_48

    :cond_45
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_48
    iget-object p1, p0, Lku5;->b:Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage;

    iget-object p0, p0, Lku5;->h:Leu5;

    iget-object v0, p1, Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage;->a:Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage$EventHandler;

    if-nez v0, :cond_57

    new-instance v0, Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage$EventHandler;

    invoke-direct {v0}, Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage$EventHandler;-><init>()V

    iput-object v0, p1, Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage;->a:Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage$EventHandler;

    :cond_57
    iget-object p1, v0, Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage$EventHandler;->a:Lh7f;

    invoke-virtual {p1, p0}, Lh7f;->b(Ljava/lang/Object;)Z

    :cond_5c
    return-void

    nop

    :pswitch_data_5e
    .packed-switch 0x0
        :pswitch_27
    .end packed-switch
.end method
