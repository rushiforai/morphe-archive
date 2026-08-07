.class Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->s1(Ljava/util/Map;Z[B)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$m;->a:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;

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
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$m;->a:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->q:Lcom/idv/identity/platform/iOSLoadingView;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity$m;->a:Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->f1()V

    .line 12
    .line 13
    .line 14
    return-void
.end method
