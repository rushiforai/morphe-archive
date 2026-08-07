.class Lcom/flipboard/bottomsheet/BottomSheetLayout$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flipboard/bottomsheet/BottomSheetLayout;->D(Landroid/view/View;Ll/nml0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/view/View;

.field final synthetic b:Ll/nml0;

.field final synthetic c:Lcom/flipboard/bottomsheet/BottomSheetLayout;


# direct methods
.method public constructor <init>(Lcom/flipboard/bottomsheet/BottomSheetLayout;Landroid/view/View;Ll/nml0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$d;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$d;->a:Landroid/view/View;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$d;->b:Ll/nml0;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$d;->c:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$d;->a:Landroid/view/View;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$d;->b:Ll/nml0;

    .line 6
    .line 7
    invoke-virtual {v0, v1, p0}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->D(Landroid/view/View;Ll/nml0;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
