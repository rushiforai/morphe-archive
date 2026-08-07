.class Ll/ed00$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xpy$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ed00;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/xpy$c<",
        "Lcom/hellogroup/mk/business/base/ui/MKWebView;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Ll/ed00;


# direct methods
.method public constructor <init>(Ll/ed00;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ed00$a;->a:Ll/ed00;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ed00$a;->b(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public b(Lcom/hellogroup/mk/business/base/ui/MKWebView;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->e()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method
