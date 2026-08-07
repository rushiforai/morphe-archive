.class public final synthetic Ll/zcp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ndp0;

.field public final synthetic b:Landroid/widget/PopupWindow;


# direct methods
.method public synthetic constructor <init>(Ll/ndp0;Landroid/widget/PopupWindow;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zcp0;->a:Ll/ndp0;

    iput-object p2, p0, Ll/zcp0;->b:Landroid/widget/PopupWindow;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zcp0;->a:Ll/ndp0;

    iget-object p0, p0, Ll/zcp0;->b:Landroid/widget/PopupWindow;

    invoke-static {v0, p0, p1}, Ll/ndp0;->U3(Ll/ndp0;Landroid/widget/PopupWindow;Landroid/view/View;)V

    return-void
.end method
