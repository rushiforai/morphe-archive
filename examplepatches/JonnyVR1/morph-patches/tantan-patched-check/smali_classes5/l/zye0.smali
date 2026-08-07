.class public final synthetic Ll/zye0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/settings/b;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/settings/b;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zye0;->a:Lcom/p1/mobile/putong/core/ui/settings/b;

    iput-boolean p2, p0, Ll/zye0;->b:Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zye0;->a:Lcom/p1/mobile/putong/core/ui/settings/b;

    iget-boolean p0, p0, Ll/zye0;->b:Z

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/b;->H(Lcom/p1/mobile/putong/core/ui/settings/b;ZLandroid/view/View;)V

    return-void
.end method
