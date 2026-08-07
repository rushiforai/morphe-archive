.class public Lcom/p1/mobile/putong/ui/share/ShareHelper$a;
.super Ll/rx3;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/ui/share/ShareHelper;->z0(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Ljava/lang/Runnable;Ll/q1e;Ljava/lang/String;Lcom/p1/mobile/putong/data/LinkIntent;)Lcom/p1/mobile/android/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/p1/mobile/putong/ui/share/ShareHelper;

.field final synthetic val$progressBar:Landroid/widget/ProgressBar;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/ui/share/ShareHelper;Landroid/content/Context;Landroid/widget/ProgressBar;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper$a;->this$0:Lcom/p1/mobile/putong/ui/share/ShareHelper;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper$a;->val$progressBar:Landroid/widget/ProgressBar;

    .line 4
    .line 5
    invoke-direct {p0, p2}, Ll/rx3;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onPageFinishedX(Lcom/p1/mobile/putong/app/web/WebViewX;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/rx3;->onPageFinishedX(Lcom/p1/mobile/putong/app/web/WebViewX;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper$a;->val$progressBar:Landroid/widget/ProgressBar;

    .line 5
    .line 6
    const/16 p1, 0x8

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
