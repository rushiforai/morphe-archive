.class public final synthetic Ll/bpa0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/loop/a;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/loop/a;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bpa0;->a:Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    iput-object p2, p0, Ll/bpa0;->b:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bpa0;->a:Lcom/p1/mobile/putong/core/ui/profile/loop/a;

    iget-object p0, p0, Ll/bpa0;->b:Lcom/p1/mobile/putong/data/User;

    check-cast p1, Lcom/p1/mobile/putong/core/data/ProfileEditInfo;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/loop/a;->k0(Lcom/p1/mobile/putong/core/ui/profile/loop/a;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/ProfileEditInfo;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
