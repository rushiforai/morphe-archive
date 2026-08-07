.class public final synthetic Ll/u800;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/a$a;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u800;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    iput-object p2, p0, Ll/u800;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a(IILandroid/content/Intent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u800;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    iget-object p0, p0, Ll/u800;->b:Ljava/lang/String;

    invoke-static {v0, p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->b2(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;Ljava/lang/String;IILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method
