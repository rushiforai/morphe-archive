.class public final synthetic Ll/v7x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


# instance fields
.field public final synthetic a:Ll/y7x;

.field public final synthetic b:Landroid/view/View$OnClickListener;


# direct methods
.method public synthetic constructor <init>(Ll/y7x;Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v7x;->a:Ll/y7x;

    iput-object p2, p0, Ll/v7x;->b:Landroid/view/View$OnClickListener;

    return-void
.end method


# virtual methods
.method public final onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v7x;->a:Ll/y7x;

    iget-object p0, p0, Ll/v7x;->b:Landroid/view/View$OnClickListener;

    invoke-static {v0, p0, p1, p2, p3}, Ll/y7x;->b(Ll/y7x;Landroid/view/View$OnClickListener;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method
