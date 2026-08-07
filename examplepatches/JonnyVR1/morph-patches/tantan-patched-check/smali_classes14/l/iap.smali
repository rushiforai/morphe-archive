.class public final synthetic Ll/iap;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/map;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/RecallMembershipData;


# direct methods
.method public synthetic constructor <init>(Ll/map;Lcom/p1/mobile/putong/core/data/RecallMembershipData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/iap;->a:Ll/map;

    iput-object p2, p0, Ll/iap;->b:Lcom/p1/mobile/putong/core/data/RecallMembershipData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/iap;->a:Ll/map;

    iget-object p0, p0, Ll/iap;->b:Lcom/p1/mobile/putong/core/data/RecallMembershipData;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Ll/map;->p(Ll/map;Lcom/p1/mobile/putong/core/data/RecallMembershipData;Ljava/util/List;)V

    return-void
.end method
