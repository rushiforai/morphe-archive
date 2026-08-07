.class public final synthetic Ll/mn8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ljava/util/Set;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/l4g0;

.field public final synthetic e:Ll/z20;

.field public final synthetic f:Lcom/google/android/material/bottomsheet/BottomSheetDialog;


# direct methods
.method public synthetic constructor <init>(Ljava/util/Set;Ljava/lang/String;Ljava/lang/String;Ll/l4g0;Ll/z20;Lcom/google/android/material/bottomsheet/BottomSheetDialog;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mn8;->a:Ljava/util/Set;

    iput-object p2, p0, Ll/mn8;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/mn8;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/mn8;->d:Ll/l4g0;

    iput-object p5, p0, Ll/mn8;->e:Ll/z20;

    iput-object p6, p0, Ll/mn8;->f:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/mn8;->a:Ljava/util/Set;

    iget-object v1, p0, Ll/mn8;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/mn8;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/mn8;->d:Ll/l4g0;

    iget-object v4, p0, Ll/mn8;->e:Ll/z20;

    iget-object v5, p0, Ll/mn8;->f:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    move-object v6, p1

    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->Z0(Ljava/util/Set;Ljava/lang/String;Ljava/lang/String;Ll/l4g0;Ll/z20;Lcom/google/android/material/bottomsheet/BottomSheetDialog;Landroid/view/View;)V

    return-void
.end method
