.class public final synthetic Ll/kcd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/SuggestedComplimentItem;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/SuggestedComplimentItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kcd;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/kcd;->b:Lcom/p1/mobile/putong/core/data/SuggestedComplimentItem;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kcd;->a:Ljava/lang/String;

    iget-object p0, p0, Ll/kcd;->b:Lcom/p1/mobile/putong/core/data/SuggestedComplimentItem;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/util/DebugUtil;->J(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/SuggestedComplimentItem;Ll/uxj0;)V

    return-void
.end method
