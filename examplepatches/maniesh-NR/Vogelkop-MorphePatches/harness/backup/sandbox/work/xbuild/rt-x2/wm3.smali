.class public final Lwm3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/view/View;ZLcom/opera/android/custom_views/StylingTextView;Landroid/view/ViewGroup;)V
    .registers 6

    const/4 v0, 0x2

    iput-byte v0, p0, Lwm3;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwm3;->c:Ljava/lang/Object;

    iput-boolean p2, p0, Lwm3;->b:Z

    iput-object p3, p0, Lwm3;->d:Ljava/lang/Object;

    iput-object p4, p0, Lwm3;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lgn3;Ljava/util/ArrayList;Ljava/lang/String;Z)V
    .registers 6

    const/4 v0, 0x0

    iput-byte v0, p0, Lwm3;->a:B

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lwm3;->c:Ljava/lang/Object;

    iput-object p3, p0, Lwm3;->d:Ljava/lang/Object;

    iput-boolean p4, p0, Lwm3;->b:Z

    iput-object p1, p0, Lwm3;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lp03;ZLll4;Lvr9;)V
    .registers 6

    const/4 v0, 0x1

    iput-byte v0, p0, Lwm3;->a:B

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p2, p0, Lwm3;->b:Z

    iput-object p3, p0, Lwm3;->c:Ljava/lang/Object;

    iput-object p4, p0, Lwm3;->d:Ljava/lang/Object;

    iput-object p1, p0, Lwm3;->e:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 7

    iget-byte v0, p0, Lwm3;->a:B

    iget-object v1, p0, Lwm3;->e:Ljava/lang/Object;

    iget-object v2, p0, Lwm3;->d:Ljava/lang/Object;

    iget-boolean v3, p0, Lwm3;->b:Z

    iget-object p0, p0, Lwm3;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_96

    check-cast p0, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    const/high16 v4, 0x43340000    # 180.0f

    mul-float/2addr v4, v0

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    int-to-float v0, v0

    cmpg-float v0, v0, v4

    const/16 v5, 0x8

    if-ltz v0, :cond_45

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v0

    int-to-float v0, v0

    cmpg-float v0, v0, v4

    if-ltz v0, :cond_45

    if-eqz v3, :cond_44

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v2}, Landroid/view/View;->getBottom()I

    move-result v0

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    if-gt v0, v1, :cond_45

    :cond_44
    const/4 v5, 0x0

    :cond_45
    invoke-virtual {p0, v5}, Landroid/view/View;->setVisibility(I)V

    return-void

    :pswitch_49
    check-cast v1, Lp03;

    iget-boolean v0, v1, Lp03;->b:Z

    if-nez v0, :cond_8b

    if-nez v3, :cond_68

    iget-object v0, v1, Lp03;->c:Lix5;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lujp;->l()Lujp;

    move-result-object v0

    iget v3, v1, Lp03;->a:I

    invoke-static {v3}, Lujp;->n(I)I

    move-result v3

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v0, "Android.BackgroundTaskScheduler.TaskLoadedNative"

    invoke-static {v3, v0}, Lujp;->h(ILjava/lang/String;)V

    :cond_68
    iget-object v0, v1, Lp03;->c:Lix5;

    check-cast p0, Lll4;

    check-cast v2, Lvr9;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lt8;->a:Landroid/content/Context;

    sget-object v3, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    check-cast v3, Lcom/opera/android/OperaApplication;

    iget-object v3, v3, Lcom/opera/android/OperaApplication;->n:Lorg/chromium/base/CommandLine;

    if-nez v3, :cond_80

    const/4 v3, 0x0

    :cond_80
    invoke-static {v1, v3}, Lfsp;->g(Landroid/content/Context;Lorg/chromium/base/CommandLine;)V

    new-instance v3, Ldjf;

    invoke-direct {v3, v0, p0, v2}, Ldjf;-><init>(Lix5;Lll4;Lvr9;)V

    invoke-static {v1, v3}, Le7d;->a(Landroid/content/Context;Lc7d;)V

    :cond_8b
    return-void

    :pswitch_8c
    check-cast v1, Lgn3;

    check-cast p0, Ljava/util/ArrayList;

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v1, p0, v2, v3}, Lgn3;->j(Ljava/util/ArrayList;Ljava/lang/String;Z)V

    return-void

    :pswitch_data_96
    .packed-switch 0x0
        :pswitch_8c
        :pswitch_49
    .end packed-switch
.end method
