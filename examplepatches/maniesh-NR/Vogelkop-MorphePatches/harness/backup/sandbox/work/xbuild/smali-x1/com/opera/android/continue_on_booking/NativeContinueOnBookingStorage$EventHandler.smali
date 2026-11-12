.class public final Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage$EventHandler;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "EventHandler"
.end annotation


# instance fields
.field public final a:Lh7f;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lh7f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage$EventHandler;->a:Lh7f;

    invoke-static {p0}, LJ/N;->MtZj_NMZ(Ljava/lang/Object;)J

    return-void
.end method


# virtual methods
.method public final onDataChanged()V
    .registers 4

    iget-object p0, p0, Lcom/opera/android/continue_on_booking/NativeContinueOnBookingStorage$EventHandler;->a:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_6
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1e

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Leu5;

    iget-object v0, v0, Leu5;->a:Lku5;

    new-instance v1, Lgu5;

    const/4 v2, 0x2

    invoke-direct {v1, v0, v2}, Lgu5;-><init>(Lku5;B)V

    invoke-virtual {v0, v1}, Lku5;->f(Ljava/lang/Runnable;)V

    goto :goto_6

    :cond_1e
    return-void
.end method
