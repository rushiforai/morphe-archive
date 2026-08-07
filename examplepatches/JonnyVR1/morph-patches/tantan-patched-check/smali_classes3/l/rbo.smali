.class public final synthetic Ll/rbo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/tasks/OnCompleteListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/location/IntlLocationProvider;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/location/IntlLocationProvider;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rbo;->a:Lcom/p1/mobile/putong/location/IntlLocationProvider;

    return-void
.end method


# virtual methods
.method public final onComplete(Lcom/google/android/gms/tasks/Task;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rbo;->a:Lcom/p1/mobile/putong/location/IntlLocationProvider;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/location/IntlLocationProvider;->C(Lcom/p1/mobile/putong/location/IntlLocationProvider;Lcom/google/android/gms/tasks/Task;)V

    return-void
.end method
