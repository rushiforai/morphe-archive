.class public final synthetic Ll/ule0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/vle0;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/School;


# direct methods
.method public synthetic constructor <init>(Ll/vle0;Lcom/p1/mobile/putong/core/data/School;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ule0;->a:Ll/vle0;

    iput-object p2, p0, Ll/ule0;->b:Lcom/p1/mobile/putong/core/data/School;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ule0;->a:Ll/vle0;

    iget-object p0, p0, Ll/ule0;->b:Lcom/p1/mobile/putong/core/data/School;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Ll/vle0;->j0(Ll/vle0;Lcom/p1/mobile/putong/core/data/School;Ljava/lang/Throwable;)V

    return-void
.end method
