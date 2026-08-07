.class public final synthetic Ll/cfq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cfq;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cfq;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;->i0(Lcom/p1/mobile/putong/core/ui/messages/ItemRealShot;Landroid/view/View;)Z

    move-result p0

    return p0
.end method
