.class public final Lgq9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnSystemUiVisibilityChangeListener;


# instance fields
.field public final synthetic a:Lhq9;


# direct methods
.method public constructor <init>(Lhq9;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgq9;->a:Lhq9;

    return-void
.end method


# virtual methods
.method public final onSystemUiVisibilityChange(I)V
    .registers 3

    iget-object p0, p0, Lgq9;->a:Lhq9;

    iget-object v0, p0, Lhq9;->i:Lxy0;

    iget-short p0, p0, Lhq9;->h:S

    if-eq p1, p0, :cond_f

    const/4 p0, 0x3

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeMessages(I)V

    invoke-virtual {v0, p0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    :cond_f
    return-void
.end method
