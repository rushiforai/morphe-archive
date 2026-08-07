.class public Lcom/hihonor/push/sdk/l;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final e:Lcom/hihonor/push/sdk/l;


# instance fields
.field public a:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field public volatile b:Z

.field public volatile c:Z

.field public d:Lcom/hihonor/push/sdk/s;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/hihonor/push/sdk/l;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/hihonor/push/sdk/l;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/hihonor/push/sdk/l;->e:Lcom/hihonor/push/sdk/l;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/hihonor/push/sdk/l;->b:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/hihonor/push/sdk/l;->c:Z

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a(Lcom/hihonor/push/sdk/l;Z)Z
    .locals 0

    .line 15
    iput-boolean p1, p0, Lcom/hihonor/push/sdk/l;->b:Z

    return p1
.end method

.method public static synthetic b(Lcom/hihonor/push/sdk/l;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/hihonor/push/sdk/l;->c:Z

    .line 2
    .line 3
    return p1
.end method


# virtual methods
.method public a()Landroid/content/Context;
    .locals 0

    .line 16
    iget-object p0, p0, Lcom/hihonor/push/sdk/l;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/Context;

    return-object p0
.end method

.method public final a(Ljava/lang/Runnable;Lcom/hihonor/push/sdk/HonorPushCallback;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Runnable;",
            "Lcom/hihonor/push/sdk/HonorPushCallback<",
            "*>;)V"
        }
    .end annotation

    .line 17
    new-instance v0, Lcom/hihonor/push/sdk/l$a;

    invoke-direct {v0, p0, p1, p2}, Lcom/hihonor/push/sdk/l$a;-><init>(Lcom/hihonor/push/sdk/l;Ljava/lang/Runnable;Lcom/hihonor/push/sdk/HonorPushCallback;)V

    invoke-static {v0}, Lcom/hihonor/push/sdk/b1;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public a(Landroid/content/Context;)Z
    .locals 0

    .line 1
    sget-object p0, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->SUCCESS:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 2
    .line 3
    iget p0, p0, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->statusCode:I

    .line 4
    .line 5
    invoke-static {p1}, Lcom/hihonor/push/sdk/b;->b(Landroid/content/Context;)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-ne p0, p1, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method
