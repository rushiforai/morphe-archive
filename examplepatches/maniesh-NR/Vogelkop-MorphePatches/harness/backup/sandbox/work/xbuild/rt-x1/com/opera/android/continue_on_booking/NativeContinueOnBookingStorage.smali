.class public final Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage$Request;,
        Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage$NativeOffer;,
        Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage$EventHandler;
    }
.end annotation


# instance fields
.field public a:Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage$EventHandler;


# direct methods
.method public static createOffer(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;DD)Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage$NativeOffer;
    .registers 13
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    new-instance p0, Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage$NativeOffer;

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-static {p4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p4

    const/4 p9, 0x0

    if-eqz p4, :cond_13

    move-object p4, p9

    goto :goto_14

    :cond_13
    move-object p4, p5

    :goto_14
    invoke-static {p6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p5

    if-eqz p5, :cond_1c

    move-object p5, p9

    goto :goto_1d

    :cond_1c
    move-object p5, p6

    :goto_1d
    const-wide/16 v0, 0x0

    cmpl-double p6, p7, v0

    if-ltz p6, :cond_27

    invoke-static {p7, p8}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p9

    :cond_27
    move-object p6, p3

    move-object p3, p2

    move-object p2, p6

    move-object p6, p9

    invoke-direct/range {p0 .. p6}, Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage$NativeOffer;-><init>(Landroid/net/Uri;Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Double;)V

    return-object p0
.end method

.method public static response(Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage$Request;[Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage$NativeOffer;)V
    .registers 2
    .param p0    # Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage$Request;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # [Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage$NativeOffer;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    iget-object p0, p0, Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage$Request;->a:Lhu5;

    invoke-virtual {p0, p1}, Lhu5;->run(Ljava/lang/Object;)V

    return-void
.end method
