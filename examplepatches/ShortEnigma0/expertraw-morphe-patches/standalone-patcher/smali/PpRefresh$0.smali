.class public final synthetic Lcom/samsung/android/app/galaxyraw/mod/PpRefresh$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/samsung/android/app/galaxyraw/mod/PpRefresh;"
    method = "lambda$onScanned$0"
    proto = "(Lcom/samsung/android/app/galaxyraw/interfaces/CameraContext;Ljava/lang/String;)V"
.end annotation


# instance fields
.field public final synthetic f$0:Lcom/samsung/android/app/galaxyraw/interfaces/CameraContext;

.field public final synthetic f$1:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/samsung/android/app/galaxyraw/interfaces/CameraContext;Ljava/lang/String;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/samsung/android/app/galaxyraw/mod/PpRefresh$0;->f$0:Lcom/samsung/android/app/galaxyraw/interfaces/CameraContext;

    iput-object p2, p0, Lcom/samsung/android/app/galaxyraw/mod/PpRefresh$0;->f$1:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Lcom/samsung/android/app/galaxyraw/mod/PpRefresh$0;->f$0:Lcom/samsung/android/app/galaxyraw/interfaces/CameraContext;

    iget-object v1, p0, Lcom/samsung/android/app/galaxyraw/mod/PpRefresh$0;->f$1:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/samsung/android/app/galaxyraw/mod/PpRefresh;->lambda$onScanned$0(Lcom/samsung/android/app/galaxyraw/interfaces/CameraContext;Ljava/lang/String;)V

    return-void
.end method
