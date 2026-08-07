.class public Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# static fields
.field private static final INSTANCE:Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager$a;->INSTANCE:Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager;

    .line 7
    .line 8
    return-void
.end method

.method public static bridge synthetic a()Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager$a;->INSTANCE:Lcom/p1/mobile/android/rx/rxthread/ThreadMonitorManager;

    return-object v0
.end method
