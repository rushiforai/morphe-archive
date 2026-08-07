.class public final synthetic Ll/nek0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nek0;->a:Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;

    iput-object p2, p0, Ll/nek0;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nek0;->a:Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;

    iget-object p0, p0, Ll/nek0;->b:Ljava/lang/String;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;->R(Lcom/p1/mobile/putong/core/ui/greet/head/UserGreetHeadView;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
