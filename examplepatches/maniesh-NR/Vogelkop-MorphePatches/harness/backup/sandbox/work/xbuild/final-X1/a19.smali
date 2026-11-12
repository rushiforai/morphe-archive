.class public final La19;
.super Lma;
.source "SourceFile"


# instance fields
.field public final d:Lhda;


# direct methods
.method public constructor <init>(Lhda;)V
    .registers 2

    invoke-direct {p0}, Lma;-><init>()V

    iput-object p1, p0, La19;->d:Lhda;

    return-void
.end method


# virtual methods
.method public final onShowFileChooser(Landroid/webkit/WebView;Landroid/webkit/ValueCallback;Landroid/webkit/WebChromeClient$FileChooserParams;)Z
    .registers 4

    iget-object p0, p0, La19;->d:Lhda;

    invoke-virtual {p3}, Landroid/webkit/WebChromeClient$FileChooserParams;->createIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p2, p1}, Lhda;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p0, 0x1

    return p0
.end method
