.class public final synthetic Ll/t740;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/v740;

.field public final synthetic b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public final synthetic c:Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;


# direct methods
.method public synthetic constructor <init>(Ll/v740;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t740;->a:Ll/v740;

    iput-object p2, p0, Ll/t740;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    iput-object p3, p0, Ll/t740;->c:Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/t740;->a:Ll/v740;

    iget-object v1, p0, Ll/t740;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    iget-object p0, p0, Ll/t740;->c:Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    invoke-static {v0, v1, p0}, Ll/v740;->s(Ll/v740;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;)V

    return-void
.end method
