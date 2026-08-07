.class public final synthetic Ll/zkf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/clf;

.field public final synthetic b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/clf;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zkf;->a:Ll/clf;

    iput-object p2, p0, Ll/zkf;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    iput-object p3, p0, Ll/zkf;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zkf;->a:Ll/clf;

    iget-object v1, p0, Ll/zkf;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    iget-object p0, p0, Ll/zkf;->c:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/data/Detect;

    invoke-static {v0, v1, p0, p1}, Ll/clf;->i0(Ll/clf;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ljava/lang/String;Lcom/p1/mobile/putong/data/Detect;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
