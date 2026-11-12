.class public final synthetic Lh55;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnWindowFocusChangeListener;


# instance fields
.field public final synthetic a:Lj55;


# direct methods
.method public synthetic constructor <init>(Lj55;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lh55;->a:Lj55;

    return-void
.end method


# virtual methods
.method public final onWindowFocusChanged(Z)V
    .registers 2

    if-eqz p1, :cond_7

    iget-object p0, p0, Lh55;->a:Lj55;

    invoke-virtual {p0}, Lj55;->onPrimaryClipChanged()V

    :cond_7
    return-void
.end method
