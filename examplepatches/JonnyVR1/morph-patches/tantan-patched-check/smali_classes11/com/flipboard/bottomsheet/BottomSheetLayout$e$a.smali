.class Lcom/flipboard/bottomsheet/BottomSheetLayout$e$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flipboard/bottomsheet/BottomSheetLayout$e;->onPreDraw()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/flipboard/bottomsheet/BottomSheetLayout$e;


# direct methods
.method public constructor <init>(Lcom/flipboard/bottomsheet/BottomSheetLayout$e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$e$a;->a:Lcom/flipboard/bottomsheet/BottomSheetLayout$e;

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
    iget-object v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$e$a;->a:Lcom/flipboard/bottomsheet/BottomSheetLayout$e;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/flipboard/bottomsheet/BottomSheetLayout$e;->a:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->getSheetView()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$e$a;->a:Lcom/flipboard/bottomsheet/BottomSheetLayout$e;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$e;->a:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->B()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method
