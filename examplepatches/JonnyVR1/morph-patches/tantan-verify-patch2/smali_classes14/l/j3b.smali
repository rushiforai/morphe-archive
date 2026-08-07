.class public final synthetic Ll/j3b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreSuggested;ILcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j3b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iput p2, p0, Ll/j3b;->b:I

    iput-object p3, p0, Ll/j3b;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/j3b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iget v1, p0, Ll/j3b;->b:I

    iget-object p0, p0, Ll/j3b;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->B3(Lcom/p1/mobile/putong/core/api/CoreSuggested;ILcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
