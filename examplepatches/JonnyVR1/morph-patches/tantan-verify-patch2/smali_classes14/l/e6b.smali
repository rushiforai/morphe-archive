.class public final synthetic Ll/e6b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/a0;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/a0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e6b;->a:Lcom/p1/mobile/putong/core/api/a0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e6b;->a:Lcom/p1/mobile/putong/core/api/a0;

    check-cast p1, Lcom/p1/mobile/putong/core/data/HideSpecialUserList;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/api/a0;->b(Lcom/p1/mobile/putong/core/api/a0;Lcom/p1/mobile/putong/core/data/HideSpecialUserList;)V

    return-void
.end method
