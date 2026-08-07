.class public final synthetic Ll/zjf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


# instance fields
.field public final synthetic a:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zjf0;->a:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final onFocusChange(Landroid/view/View;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zjf0;->a:Ljava/lang/Runnable;

    invoke-static {p0, p1, p2}, Ll/rkf0;->q(Ljava/lang/Runnable;Landroid/view/View;Z)V

    return-void
.end method
