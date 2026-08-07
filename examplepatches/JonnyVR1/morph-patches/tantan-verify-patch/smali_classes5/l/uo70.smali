.class public final synthetic Ll/uo70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/wo70;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/PicksUser;

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Ll/wo70;Lcom/p1/mobile/putong/core/data/PicksUser;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uo70;->a:Ll/wo70;

    iput-object p2, p0, Ll/uo70;->b:Lcom/p1/mobile/putong/core/data/PicksUser;

    iput-object p3, p0, Ll/uo70;->c:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uo70;->a:Ll/wo70;

    iget-object v1, p0, Ll/uo70;->b:Lcom/p1/mobile/putong/core/data/PicksUser;

    iget-object p0, p0, Ll/uo70;->c:Lcom/p1/mobile/putong/data/User;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, v1, p0, p1}, Ll/wo70;->F(Ll/wo70;Lcom/p1/mobile/putong/core/data/PicksUser;Lcom/p1/mobile/putong/data/User;Ljava/lang/Boolean;)V

    return-void
.end method
