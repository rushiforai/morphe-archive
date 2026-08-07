.class public final synthetic Ll/k1b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreSuggested;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k1b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iput-object p2, p0, Ll/k1b;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/k1b;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    iput-boolean p4, p0, Ll/k1b;->d:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/k1b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iget-object v1, p0, Ll/k1b;->b:Lcom/p1/mobile/putong/data/User;

    iget-object v2, p0, Ll/k1b;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    iget-boolean p0, p0, Ll/k1b;->d:Z

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->F4(Lcom/p1/mobile/putong/core/api/CoreSuggested;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;ZLcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Relationship;

    move-result-object p0

    return-object p0
.end method
