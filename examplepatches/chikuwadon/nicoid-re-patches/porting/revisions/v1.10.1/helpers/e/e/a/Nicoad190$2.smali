.class Le/e/a/Nicoad190$2;
.super Landroid/webkit/WebChromeClient;
.source "Nicoad190.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/Nicoad190;->open(Landroid/content/Context;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$progress:Landroid/widget/ProgressBar;


# direct methods
.method constructor <init>(Landroid/widget/ProgressBar;)V
    .registers 2

    .line 25
    iput-object p1, p0, Le/e/a/Nicoad190$2;->val$progress:Landroid/widget/ProgressBar;

    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/webkit/WebView;I)V
    .registers 4

    .line 25
    iget-object p1, p0, Le/e/a/Nicoad190$2;->val$progress:Landroid/widget/ProgressBar;

    invoke-virtual {p1, p2}, Landroid/widget/ProgressBar;->setProgress(I)V

    iget-object p1, p0, Le/e/a/Nicoad190$2;->val$progress:Landroid/widget/ProgressBar;

    const/16 v0, 0x64

    if-ne p2, v0, :cond_e

    const/16 p2, 0x8

    goto :goto_f

    :cond_e
    const/4 p2, 0x0

    :goto_f
    invoke-virtual {p1, p2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    return-void
.end method
