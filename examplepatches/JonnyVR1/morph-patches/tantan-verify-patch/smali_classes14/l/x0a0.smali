.class public final synthetic Ll/x0a0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeBaseAct;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeBaseAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x0a0;->a:Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeBaseAct;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x0a0;->a:Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeBaseAct;

    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/breaking/ProfileLikeBaseAct;->finish()V

    return-void
.end method
