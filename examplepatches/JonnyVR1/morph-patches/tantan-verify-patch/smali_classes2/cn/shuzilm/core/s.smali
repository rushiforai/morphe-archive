.class Lcn/shuzilm/core/s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcn/shuzilm/core/Listener;


# instance fields
.field final synthetic a:Landroid/content/Context;

.field final synthetic b:I

.field final synthetic c:Lcn/shuzilm/core/Listener;


# direct methods
.method public constructor <init>(Landroid/content/Context;ILcn/shuzilm/core/Listener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcn/shuzilm/core/s;->a:Landroid/content/Context;

    .line 2
    .line 3
    iput p2, p0, Lcn/shuzilm/core/s;->b:I

    .line 4
    .line 5
    iput-object p3, p0, Lcn/shuzilm/core/s;->c:Lcn/shuzilm/core/Listener;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public handler(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Lcn/shuzilm/core/DUHelper;->a()Lcn/shuzilm/core/DUHelper;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Lcn/shuzilm/core/s;->a:Landroid/content/Context;

    .line 6
    .line 7
    iget v1, p0, Lcn/shuzilm/core/s;->b:I

    .line 8
    .line 9
    invoke-static {p1, v0, v1}, Lcn/shuzilm/core/DUHelper;->a(Lcn/shuzilm/core/DUHelper;Landroid/content/Context;I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-object p0, p0, Lcn/shuzilm/core/s;->c:Lcn/shuzilm/core/Listener;

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    invoke-interface {p0, p1}, Lcn/shuzilm/core/Listener;->handler(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method
