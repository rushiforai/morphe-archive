.class public final Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage$Request;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Request"
.end annotation


# instance fields
.field public final a:Lhu5;


# direct methods
.method public constructor <init>(Lhu5;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage$Request;->a:Lhu5;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    const/16 v0, 0x1e

    const-class v1, Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage$NativeOffer;

    const-string v2, "1759515"

    invoke-static {v2, v0, p0, v1}, LJ/N;->Mv3_1ixA(Ljava/lang/Object;ILjava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method
