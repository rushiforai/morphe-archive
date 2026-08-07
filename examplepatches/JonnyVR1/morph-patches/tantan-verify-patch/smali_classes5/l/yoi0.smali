.class public final synthetic Ll/yoi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/settings/notification/TeamAccountSelectView;

.field public final synthetic b:Landroid/view/ViewGroup;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/settings/notification/TeamAccountSelectView;Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yoi0;->a:Lcom/p1/mobile/putong/core/ui/settings/notification/TeamAccountSelectView;

    iput-object p2, p0, Ll/yoi0;->b:Landroid/view/ViewGroup;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yoi0;->a:Lcom/p1/mobile/putong/core/ui/settings/notification/TeamAccountSelectView;

    iget-object p0, p0, Ll/yoi0;->b:Landroid/view/ViewGroup;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/notification/TeamAccountSelectView;->b(Lcom/p1/mobile/putong/core/ui/settings/notification/TeamAccountSelectView;Landroid/view/ViewGroup;Landroid/view/View;)V

    return-void
.end method
