.class public final synthetic Ll/dx7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic b:I

.field public final synthetic c:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/Message;ILl/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dx7;->a:Lcom/p1/mobile/putong/core/data/Message;

    iput p2, p0, Ll/dx7;->b:I

    iput-object p3, p0, Ll/dx7;->c:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dx7;->a:Lcom/p1/mobile/putong/core/data/Message;

    iget v1, p0, Ll/dx7;->b:I

    iget-object p0, p0, Ll/dx7;->c:Ll/y20;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/api/g;->hc(Lcom/p1/mobile/putong/core/data/Message;ILl/y20;)V

    return-void
.end method
