.class public final synthetic Ll/mnp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:[Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

.field public final synthetic b:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>([Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mnp0;->a:[Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    iput-object p2, p0, Ll/mnp0;->b:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mnp0;->a:[Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    iget-object p0, p0, Ll/mnp0;->b:Landroid/view/View;

    invoke-static {v0, p0}, Ll/qnp0;->U0([Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;Landroid/view/View;)V

    return-void
.end method
