.class public final synthetic Ll/qye0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/settings/b;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/settings/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qye0;->a:Lcom/p1/mobile/putong/core/ui/settings/b;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qye0;->a:Lcom/p1/mobile/putong/core/ui/settings/b;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/b;->P(Lcom/p1/mobile/putong/core/ui/settings/b;Landroid/view/View;)Z

    move-result p0

    return p0
.end method
