.class public final synthetic Ll/fp8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/l4g0;

.field public final synthetic b:Ll/z20;

.field public final synthetic c:Ljava/lang/StringBuilder;

.field public final synthetic d:Lcom/google/android/material/bottomsheet/BottomSheetDialog;


# direct methods
.method public synthetic constructor <init>(Ll/l4g0;Ll/z20;Ljava/lang/StringBuilder;Lcom/google/android/material/bottomsheet/BottomSheetDialog;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fp8;->a:Ll/l4g0;

    iput-object p2, p0, Ll/fp8;->b:Ll/z20;

    iput-object p3, p0, Ll/fp8;->c:Ljava/lang/StringBuilder;

    iput-object p4, p0, Ll/fp8;->d:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fp8;->a:Ll/l4g0;

    iget-object v1, p0, Ll/fp8;->b:Ll/z20;

    iget-object v2, p0, Ll/fp8;->c:Ljava/lang/StringBuilder;

    iget-object p0, p0, Ll/fp8;->d:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->L0(Ll/l4g0;Ll/z20;Ljava/lang/StringBuilder;Lcom/google/android/material/bottomsheet/BottomSheetDialog;Ll/uxj0;)V

    return-void
.end method
