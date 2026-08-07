.class public final synthetic Ll/q740;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/s740;

.field public final synthetic b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public final synthetic c:Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;


# direct methods
.method public synthetic constructor <init>(Ll/s740;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q740;->a:Ll/s740;

    iput-object p2, p0, Ll/q740;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    iput-object p3, p0, Ll/q740;->c:Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q740;->a:Ll/s740;

    iget-object v1, p0, Ll/q740;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    iget-object p0, p0, Ll/q740;->c:Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;

    invoke-static {v0, v1, p0}, Ll/s740;->t(Ll/s740;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard;)V

    return-void
.end method
