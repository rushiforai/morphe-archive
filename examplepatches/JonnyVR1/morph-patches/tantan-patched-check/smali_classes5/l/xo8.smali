.class public final synthetic Ll/xo8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ll/jl80;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;Lcom/p1/mobile/android/app/Act;Ll/jl80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xo8;->a:Landroid/view/View;

    iput-object p2, p0, Ll/xo8;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/xo8;->c:Ll/jl80;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xo8;->a:Landroid/view/View;

    iget-object v1, p0, Ll/xo8;->b:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/xo8;->c:Ll/jl80;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->f0(Landroid/view/View;Lcom/p1/mobile/android/app/Act;Ll/jl80;Landroid/view/View;)V

    return-void
.end method
