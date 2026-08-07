.class public final synthetic Ll/wj3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wj3;->a:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wj3;->a:Ljava/lang/Runnable;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->s(Ljava/lang/Runnable;Landroid/view/View;)V

    return-void
.end method
