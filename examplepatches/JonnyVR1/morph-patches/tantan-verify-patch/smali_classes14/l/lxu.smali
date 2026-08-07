.class public final synthetic Ll/lxu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/PopupWindow$OnDismissListener;


# instance fields
.field public final synthetic a:Ll/jxu$b;

.field public final synthetic b:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Ll/jxu$b;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lxu;->a:Ll/jxu$b;

    iput-object p2, p0, Ll/lxu;->b:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final onDismiss()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lxu;->a:Ll/jxu$b;

    iget-object p0, p0, Ll/lxu;->b:Landroid/view/View;

    invoke-static {v0, p0}, Ll/mxu;->b(Ll/jxu$b;Landroid/view/View;)V

    return-void
.end method
