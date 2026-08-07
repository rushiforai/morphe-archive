.class public final synthetic Ll/fle0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/SelectContactAct;

.field public final synthetic b:Landroid/content/Intent;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/SelectContactAct;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fle0;->a:Lcom/p1/mobile/putong/core/ui/messages/SelectContactAct;

    iput-object p2, p0, Ll/fle0;->b:Landroid/content/Intent;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fle0;->a:Lcom/p1/mobile/putong/core/ui/messages/SelectContactAct;

    iget-object p0, p0, Ll/fle0;->b:Landroid/content/Intent;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/SelectContactAct;->Y1(Lcom/p1/mobile/putong/core/ui/messages/SelectContactAct;Landroid/content/Intent;Ljava/lang/String;)V

    return-void
.end method
