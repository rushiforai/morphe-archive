.class public final synthetic Ll/v1f0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/share/ShareHelper;

.field public final synthetic b:Ll/y20;

.field public final synthetic c:Lcom/p1/mobile/putong/ui/share/ShareHelper$c;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/ui/share/ShareHelper;Ll/y20;Lcom/p1/mobile/putong/ui/share/ShareHelper$c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v1f0;->a:Lcom/p1/mobile/putong/ui/share/ShareHelper;

    iput-object p2, p0, Ll/v1f0;->b:Ll/y20;

    iput-object p3, p0, Ll/v1f0;->c:Lcom/p1/mobile/putong/ui/share/ShareHelper$c;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/v1f0;->a:Lcom/p1/mobile/putong/ui/share/ShareHelper;

    iget-object v1, p0, Ll/v1f0;->b:Ll/y20;

    iget-object p0, p0, Ll/v1f0;->c:Lcom/p1/mobile/putong/ui/share/ShareHelper$c;

    check-cast p1, Lcom/google/common/base/Optional;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->i(Lcom/p1/mobile/putong/ui/share/ShareHelper;Ll/y20;Lcom/p1/mobile/putong/ui/share/ShareHelper$c;Lcom/google/common/base/Optional;)V

    return-void
.end method
