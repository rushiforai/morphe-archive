.class public final synthetic Ll/nsd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Landroid/view/View$OnAttachStateChangeListener;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;Landroid/view/View$OnAttachStateChangeListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nsd0;->a:Landroid/view/View;

    iput-object p2, p0, Ll/nsd0;->b:Landroid/view/View$OnAttachStateChangeListener;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nsd0;->a:Landroid/view/View;

    iget-object p0, p0, Ll/nsd0;->b:Landroid/view/View$OnAttachStateChangeListener;

    invoke-static {v0, p0}, Ll/psd0;->n(Landroid/view/View;Landroid/view/View$OnAttachStateChangeListener;)V

    return-void
.end method
