.class public final synthetic Ll/eab;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/b0;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/b0;ILcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/eab;->a:Lcom/p1/mobile/putong/core/api/b0;

    iput p2, p0, Ll/eab;->b:I

    iput-object p3, p0, Ll/eab;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/eab;->a:Lcom/p1/mobile/putong/core/api/b0;

    iget v1, p0, Ll/eab;->b:I

    iget-object p0, p0, Ll/eab;->c:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/api/b0;->e3(Lcom/p1/mobile/putong/core/api/b0;ILcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
