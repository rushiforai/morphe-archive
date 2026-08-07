.class public final synthetic Ll/dap;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/map;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/RecallMembershipData;


# direct methods
.method public synthetic constructor <init>(Ll/map;Lcom/p1/mobile/putong/core/data/RecallMembershipData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dap;->a:Ll/map;

    iput-object p2, p0, Ll/dap;->b:Lcom/p1/mobile/putong/core/data/RecallMembershipData;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dap;->a:Ll/map;

    iget-object p0, p0, Ll/dap;->b:Lcom/p1/mobile/putong/core/data/RecallMembershipData;

    invoke-static {v0, p0}, Ll/map;->j(Ll/map;Lcom/p1/mobile/putong/core/data/RecallMembershipData;)V

    return-void
.end method
