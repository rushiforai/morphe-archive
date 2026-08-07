.class public final synthetic Ll/tub;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/s26;


# instance fields
.field public final synthetic a:Ll/sni0;

.field public final synthetic b:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final synthetic c:Ll/ig4;


# direct methods
.method public synthetic constructor <init>(Ll/sni0;Ljava/util/concurrent/atomic/AtomicBoolean;Ll/ig4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tub;->a:Ll/sni0;

    iput-object p2, p0, Ll/tub;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-object p3, p0, Ll/tub;->c:Ll/ig4;

    return-void
.end method


# virtual methods
.method public final then(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tub;->a:Ll/sni0;

    iget-object v1, p0, Ll/tub;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    iget-object p0, p0, Ll/tub;->c:Ll/ig4;

    invoke-static {v0, v1, p0, p1}, Lcom/google/firebase/crashlytics/internal/concurrency/CrashlyticsTasks;->a(Ll/sni0;Ljava/util/concurrent/atomic/AtomicBoolean;Ll/ig4;Lcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method
