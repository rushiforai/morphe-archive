.class public final synthetic Ll/nb40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


# instance fields
.field public final synthetic a:Ll/ub40;


# direct methods
.method public synthetic constructor <init>(Ll/ub40;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nb40;->a:Ll/ub40;

    return-void
.end method


# virtual methods
.method public final onFocusChange(Landroid/view/View;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nb40;->a:Ll/ub40;

    invoke-static {p0, p1, p2}, Ll/ub40;->b(Ll/ub40;Landroid/view/View;Z)V

    return-void
.end method
