.class public final synthetic Ll/v050;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/x150;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/settings/notification/TeamAccountSelectView;


# direct methods
.method public synthetic constructor <init>(Ll/x150;Lcom/p1/mobile/putong/core/ui/settings/notification/TeamAccountSelectView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v050;->a:Ll/x150;

    iput-object p2, p0, Ll/v050;->b:Lcom/p1/mobile/putong/core/ui/settings/notification/TeamAccountSelectView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v050;->a:Ll/x150;

    iget-object p0, p0, Ll/v050;->b:Lcom/p1/mobile/putong/core/ui/settings/notification/TeamAccountSelectView;

    invoke-static {v0, p0}, Ll/x150;->k(Ll/x150;Lcom/p1/mobile/putong/core/ui/settings/notification/TeamAccountSelectView;)V

    return-void
.end method
