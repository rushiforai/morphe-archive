.class Lcom/mm/mmfile/AppFrontBackHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mm/mmfile/AppFrontBackHelper$OnAppStatusListener;
    }
.end annotation


# instance fields
.field private activityLifecycleCallbacks:Landroid/app/Application$ActivityLifecycleCallbacks;

.field private mOnAppStatusListener:Lcom/mm/mmfile/AppFrontBackHelper$OnAppStatusListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/mm/mmfile/AppFrontBackHelper$1;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/mm/mmfile/AppFrontBackHelper$1;-><init>(Lcom/mm/mmfile/AppFrontBackHelper;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/mm/mmfile/AppFrontBackHelper;->activityLifecycleCallbacks:Landroid/app/Application$ActivityLifecycleCallbacks;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic access$000(Lcom/mm/mmfile/AppFrontBackHelper;)Lcom/mm/mmfile/AppFrontBackHelper$OnAppStatusListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/mm/mmfile/AppFrontBackHelper;->mOnAppStatusListener:Lcom/mm/mmfile/AppFrontBackHelper$OnAppStatusListener;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public register(Landroid/app/Application;Lcom/mm/mmfile/AppFrontBackHelper$OnAppStatusListener;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/mm/mmfile/AppFrontBackHelper;->mOnAppStatusListener:Lcom/mm/mmfile/AppFrontBackHelper$OnAppStatusListener;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/mm/mmfile/AppFrontBackHelper;->activityLifecycleCallbacks:Landroid/app/Application$ActivityLifecycleCallbacks;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public unRegister(Landroid/app/Application;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/mm/mmfile/AppFrontBackHelper;->activityLifecycleCallbacks:Landroid/app/Application$ActivityLifecycleCallbacks;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
