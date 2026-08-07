.class public final synthetic Ll/x280;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/p380;

.field public final synthetic b:Ll/ict;


# direct methods
.method public synthetic constructor <init>(Ll/p380;Ll/ict;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x280;->a:Ll/p380;

    iput-object p2, p0, Ll/x280;->b:Ll/ict;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/x280;->a:Ll/p380;

    iget-object p0, p0, Ll/x280;->b:Ll/ict;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;

    invoke-static {v0, p0, p1}, Ll/p380;->d4(Ll/p380;Ll/ict;Lcom/p1/mobile/putong/live/base/data/BLivePkInvite;)V

    return-void
.end method
