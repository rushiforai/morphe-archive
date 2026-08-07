.class public final synthetic Ll/kb20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kb20;->a:Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;

    iput-object p2, p0, Ll/kb20;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/kb20;->c:Ll/x20;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kb20;->a:Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;

    iget-object v1, p0, Ll/kb20;->b:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/kb20;->c:Ll/x20;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;->c(Lcom/p1/mobile/putong/core/ui/popup/NameFakeView;Lcom/p1/mobile/android/app/Act;Ll/x20;Landroid/view/View;)V

    return-void
.end method
