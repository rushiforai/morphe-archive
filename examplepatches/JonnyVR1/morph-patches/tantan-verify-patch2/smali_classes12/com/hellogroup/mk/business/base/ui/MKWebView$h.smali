.class Lcom/hellogroup/mk/business/base/ui/MKWebView$h;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hellogroup/mk/business/base/ui/MKWebView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "h"
.end annotation


# instance fields
.field a:Z

.field b:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebView$h;->a:Z

    .line 6
    .line 7
    return-void
.end method

.method public static a(ZLjava/lang/String;)Lcom/hellogroup/mk/business/base/ui/MKWebView$h;
    .locals 1

    .line 1
    new-instance v0, Lcom/hellogroup/mk/business/base/ui/MKWebView$h;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView$h;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-boolean p0, v0, Lcom/hellogroup/mk/business/base/ui/MKWebView$h;->a:Z

    .line 7
    .line 8
    iput-object p1, v0, Lcom/hellogroup/mk/business/base/ui/MKWebView$h;->b:Ljava/lang/String;

    .line 9
    .line 10
    return-object v0
.end method
