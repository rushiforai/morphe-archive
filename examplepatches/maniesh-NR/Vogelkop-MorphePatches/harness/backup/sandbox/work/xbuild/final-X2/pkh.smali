.class public final Lpkh;
.super Lo5o;
.source "SourceFile"


# instance fields
.field public final a:Lj4c;

.field public final b:Lj4c;


# direct methods
.method public constructor <init>(Lj4c;Lj4c;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpkh;->a:Lj4c;

    iput-object p2, p0, Lpkh;->b:Lj4c;

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;Ljava/lang/String;Landroidx/work/WorkerParameters;)Lajc;
    .registers 5

    const-class v0, Lcom/opera/android/readlater/MigrationWorker;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_16

    new-instance p2, Lcom/opera/android/readlater/MigrationWorker;

    iget-object v0, p0, Lpkh;->a:Lj4c;

    iget-object p0, p0, Lpkh;->b:Lj4c;

    invoke-direct {p2, p1, p3, v0, p0}, Lcom/opera/android/readlater/MigrationWorker;-><init>(Landroid/content/Context;Landroidx/work/WorkerParameters;Lesk;Lesk;)V

    return-object p2

    :cond_16
    const/4 p0, 0x0

    return-object p0
.end method
