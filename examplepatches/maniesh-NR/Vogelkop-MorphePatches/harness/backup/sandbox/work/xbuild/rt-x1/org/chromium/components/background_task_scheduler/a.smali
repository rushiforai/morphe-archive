.class public final Lorg/chromium/components/background_task_scheduler/a;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public b:Landroid/os/PersistableBundle;

.field public c:I

.field public d:Z

.field public e:Z

.field public f:Z

.field public final g:Lorg/chromium/components/background_task_scheduler/TaskInfo$TimingInfo;


# direct methods
.method public constructor <init>(ILorg/chromium/components/background_task_scheduler/TaskInfo$TimingInfo;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lorg/chromium/components/background_task_scheduler/a;->a:I

    iput-object p2, p0, Lorg/chromium/components/background_task_scheduler/a;->g:Lorg/chromium/components/background_task_scheduler/TaskInfo$TimingInfo;

    return-void
.end method
