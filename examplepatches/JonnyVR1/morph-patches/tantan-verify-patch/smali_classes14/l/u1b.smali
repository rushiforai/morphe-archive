.class public final synthetic Ll/u1b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreSuggested;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreSuggested;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u1b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u1b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    check-cast p1, Lcom/p1/mobile/putong/core/data/SuperLikeCount;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->y4(Lcom/p1/mobile/putong/core/api/CoreSuggested;Lcom/p1/mobile/putong/core/data/SuperLikeCount;)V

    return-void
.end method
