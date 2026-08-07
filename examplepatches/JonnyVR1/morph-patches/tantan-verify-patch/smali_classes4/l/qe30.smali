.class public final synthetic Ll/qe30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/od2$b;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/main/a;

.field public final synthetic b:Lcom/p1/mobile/putong/newui/main/base/TabName;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/main/a;Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qe30;->a:Lcom/p1/mobile/putong/core/newui/main/a;

    iput-object p2, p0, Ll/qe30;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qe30;->a:Lcom/p1/mobile/putong/core/newui/main/a;

    iget-object p0, p0, Ll/qe30;->b:Lcom/p1/mobile/putong/newui/main/base/TabName;

    check-cast p2, Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;

    invoke-static {v0, p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/main/a;->A2(Lcom/p1/mobile/putong/core/newui/main/a;Lcom/p1/mobile/putong/newui/main/base/TabName;Landroid/view/View;Lcom/p1/mobile/putong/core/api/CoreInnerPush$a;)V

    return-void
.end method
