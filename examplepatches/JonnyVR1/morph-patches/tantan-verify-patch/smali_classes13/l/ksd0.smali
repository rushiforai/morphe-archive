.class public final synthetic Ll/ksd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$d;


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Landroid/view/View$OnAttachStateChangeListener;

.field public final synthetic c:Lrx/subjects/b;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;Landroid/view/View$OnAttachStateChangeListener;Lrx/subjects/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ksd0;->a:Landroid/view/View;

    iput-object p2, p0, Ll/ksd0;->b:Landroid/view/View$OnAttachStateChangeListener;

    iput-object p3, p0, Ll/ksd0;->c:Lrx/subjects/b;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ksd0;->a:Landroid/view/View;

    iget-object v1, p0, Ll/ksd0;->b:Landroid/view/View$OnAttachStateChangeListener;

    iget-object p0, p0, Ll/ksd0;->c:Lrx/subjects/b;

    check-cast p1, Lrx/c;

    invoke-static {v0, v1, p0, p1}, Ll/psd0;->d(Landroid/view/View;Landroid/view/View$OnAttachStateChangeListener;Lrx/subjects/b;Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
