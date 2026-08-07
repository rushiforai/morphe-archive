.class public final synthetic Ll/p740;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/c;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/c;Ljava/util/List;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p740;->a:Lcom/p1/mobile/putong/core/newui/home/c;

    iput-object p2, p0, Ll/p740;->b:Ljava/util/List;

    iput-object p3, p0, Ll/p740;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p740;->a:Lcom/p1/mobile/putong/core/newui/home/c;

    iget-object v1, p0, Ll/p740;->b:Ljava/util/List;

    iget-object p0, p0, Ll/p740;->c:Ljava/util/List;

    check-cast p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/home/c;->s(Lcom/p1/mobile/putong/core/newui/home/c;Ljava/util/List;Ljava/util/List;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    return-void
.end method
