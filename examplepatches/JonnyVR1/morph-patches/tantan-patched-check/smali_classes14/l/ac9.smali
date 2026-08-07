.class public final synthetic Ll/ac9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/n;

.field public final synthetic b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/n;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ac9;->a:Lcom/p1/mobile/putong/core/api/n;

    iput-object p2, p0, Ll/ac9;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ac9;->a:Lcom/p1/mobile/putong/core/api/n;

    iget-object p0, p0, Ll/ac9;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    check-cast p1, Lcom/p1/mobile/putong/data/Relationship;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/api/n;->c3(Lcom/p1/mobile/putong/core/api/n;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method
