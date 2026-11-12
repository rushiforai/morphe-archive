.class public final Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage$NativeOffer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj8f;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NativeOffer"
.end annotation


# instance fields
.field public final a:Landroid/net/Uri;

.field public final b:Landroid/net/Uri;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public final f:Ljava/lang/Double;


# direct methods
.method public constructor <init>(Landroid/net/Uri;Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Double;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage$NativeOffer;->a:Landroid/net/Uri;

    iput-object p2, p0, Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage$NativeOffer;->c:Ljava/lang/String;

    iput-object p3, p0, Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage$NativeOffer;->b:Landroid/net/Uri;

    iput-object p4, p0, Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage$NativeOffer;->d:Ljava/lang/String;

    iput-object p5, p0, Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage$NativeOffer;->e:Ljava/lang/String;

    iput-object p6, p0, Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage$NativeOffer;->f:Ljava/lang/Double;

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage$NativeOffer;->d:Ljava/lang/String;

    return-object p0
.end method

.method public final b()Landroid/net/Uri;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage$NativeOffer;->b:Landroid/net/Uri;

    return-object p0
.end method

.method public final c()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage$NativeOffer;->e:Ljava/lang/String;

    return-object p0
.end method

.method public final d()Ljava/lang/Double;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage$NativeOffer;->f:Ljava/lang/Double;

    return-object p0
.end method

.method public final getTitle()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage$NativeOffer;->c:Ljava/lang/String;

    return-object p0
.end method

.method public final getUrl()Landroid/net/Uri;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage$NativeOffer;->a:Landroid/net/Uri;

    return-object p0
.end method
