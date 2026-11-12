.class public final Lmu3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj6l;


# instance fields
.field public final synthetic a:Lcom/opera/android/BrowserActivity;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmu3;->a:Lcom/opera/android/BrowserActivity;

    return-void
.end method


# virtual methods
.method public final z()V
    .registers 6

    iget-object p0, p0, Lmu3;->a:Lcom/opera/android/BrowserActivity;

    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->C:Lfnh;

    if-nez v0, :cond_9

    sget-object v0, Lv08;->a:Lv08;

    goto :goto_31

    :cond_9
    iget-object v0, v0, Lfnh;->f:Lcom/opera/android/browser/SessionStore;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iget-wide v2, v0, Lcom/opera/android/browser/SessionStore;->a:J

    invoke-static {v2, v3, v1}, LJ/N;->MqkthI77(JLjava/lang/Object;)V

    invoke-interface {v1}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    move-result-object v0

    new-instance v1, Lmn;

    const/16 v2, 0x12

    invoke-direct {v1, v2}, Lmn;-><init>(B)V

    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    move-result-object v0

    invoke-static {}, Ljava/util/stream/Collectors;->toSet()Ljava/util/stream/Collector;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    :goto_31
    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object p0, p0, Ltw3;->a:Lhx3;

    iget-object p0, p0, Lhx3;->s:Lfx3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lu4l;

    new-instance v1, Lmr3;

    const/4 v2, 0x4

    invoke-direct {v1, v2}, Lmr3;-><init>(B)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Llt;

    const/4 v3, 0x1

    invoke-direct {v2, v0, v3}, Llt;-><init>(Ljava/util/Set;B)V

    iget-object v0, p0, Lu4l;->d:Lt4l;

    new-instance v3, Ljbd;

    const/16 v4, 0x18

    invoke-direct {v3, p0, v2, v1, v4}, Ljbd;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v3}, Lldk;->f(Ljava/lang/Runnable;)V

    return-void
.end method
