.class public final synthetic Ll/qra0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/a$a;


# instance fields
.field public final synthetic a:Ll/tra0;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Ll/tra0;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qra0;->a:Ll/tra0;

    iput-object p2, p0, Ll/qra0;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    iput-object p3, p0, Ll/qra0;->c:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final a(IILandroid/content/Intent;)Z
    .locals 6

    .line 1
    iget-object v0, p0, Ll/qra0;->a:Ll/tra0;

    iget-object v1, p0, Ll/qra0;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    iget-object v2, p0, Ll/qra0;->c:Lcom/p1/mobile/putong/data/User;

    move v3, p1

    move v4, p2

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Ll/tra0;->i(Ll/tra0;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/putong/data/User;IILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method
