.class public final synthetic Ll/cc9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/n;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/n;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cc9;->a:Lcom/p1/mobile/putong/core/api/n;

    iput-object p2, p0, Ll/cc9;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/cc9;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cc9;->a:Lcom/p1/mobile/putong/core/api/n;

    iget-object v1, p0, Ll/cc9;->b:Lcom/p1/mobile/putong/data/User;

    iget-object p0, p0, Ll/cc9;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/api/n;->r3(Lcom/p1/mobile/putong/core/api/n;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Relationship;

    move-result-object p0

    return-object p0
.end method
