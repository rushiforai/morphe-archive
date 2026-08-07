.class public abstract Lcom/tencent/open/c;
.super Landroid/app/Dialog;
.source "SourceFile"


# instance fields
.field protected a:Lcom/tencent/open/b;

.field protected final b:Landroid/webkit/WebChromeClient;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/tencent/open/c$1;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Lcom/tencent/open/c$1;-><init>(Lcom/tencent/open/c;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/tencent/open/c;->b:Landroid/webkit/WebChromeClient;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public abstract a(Ljava/lang/String;)V
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/tencent/open/b;

    .line 5
    .line 6
    invoke-direct {p1}, Lcom/tencent/open/b;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/tencent/open/c;->a:Lcom/tencent/open/b;

    .line 10
    .line 11
    return-void
.end method
