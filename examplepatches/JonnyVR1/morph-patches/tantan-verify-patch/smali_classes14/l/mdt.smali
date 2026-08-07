.class public final synthetic Ll/mdt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/PushMessage;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/PushMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mdt;->a:Lcom/p1/mobile/putong/data/PushMessage;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mdt;->a:Lcom/p1/mobile/putong/data/PushMessage;

    check-cast p1, Landroid/app/Activity;

    invoke-static {p0, p1}, Ll/odt;->b(Lcom/p1/mobile/putong/data/PushMessage;Landroid/app/Activity;)V

    return-void
.end method
