.class Lcom/idv/identity/ocr/ui/IDCardResultProActivity$k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->h1()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/idv/identity/ocr/ui/IDCardResultProActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/ocr/ui/IDCardResultProActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$k;->a:Lcom/idv/identity/ocr/ui/IDCardResultProActivity;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity$k;->a:Lcom/idv/identity/ocr/ui/IDCardResultProActivity;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/IDCardResultProActivity;->k:Lcom/idv/identity/platform/iOSLoadingView;

    .line 4
    .line 5
    const/16 v0, 0x8

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
