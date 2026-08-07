.class Lcn/shuzilm/core/r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:I

.field final synthetic b:Lcn/shuzilm/core/DUHelper;


# direct methods
.method public constructor <init>(Lcn/shuzilm/core/DUHelper;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcn/shuzilm/core/r;->b:Lcn/shuzilm/core/DUHelper;

    .line 2
    .line 3
    iput p2, p0, Lcn/shuzilm/core/r;->a:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 1
    :try_start_0
    sget-object v0, Lcn/shuzilm/core/DUHelper;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    const-string v1, "NA"

    .line 4
    .line 5
    const-string v2, ""

    .line 6
    .line 7
    iget p0, p0, Lcn/shuzilm/core/r;->a:I

    .line 8
    .line 9
    add-int/lit8 v6, p0, 0x64

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    const/4 v4, 0x1

    .line 13
    const/4 v5, 0x0

    .line 14
    invoke-static/range {v0 .. v6}, Lcn/shuzilm/core/DUHelper;->getQueryID(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZILcn/shuzilm/core/Listener;I)Ljava/util/Map;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :catchall_0
    move-exception v0

    .line 19
    move-object p0, v0

    .line 20
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 21
    .line 22
    .line 23
    return-void
.end method
