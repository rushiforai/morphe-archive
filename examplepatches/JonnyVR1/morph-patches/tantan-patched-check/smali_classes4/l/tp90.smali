.class public final synthetic Ll/tp90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/wp90;

.field public final synthetic b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/home/VirtualCard;


# direct methods
.method public synthetic constructor <init>(Ll/wp90;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/core/ui/home/VirtualCard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tp90;->a:Ll/wp90;

    iput-object p2, p0, Ll/tp90;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    iput-object p3, p0, Ll/tp90;->c:Lcom/p1/mobile/putong/core/ui/home/VirtualCard;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tp90;->a:Ll/wp90;

    iget-object v1, p0, Ll/tp90;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    iget-object p0, p0, Ll/tp90;->c:Lcom/p1/mobile/putong/core/ui/home/VirtualCard;

    invoke-static {v0, v1, p0}, Ll/wp90;->n(Ll/wp90;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/core/ui/home/VirtualCard;)V

    return-void
.end method
