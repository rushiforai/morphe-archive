.class public final synthetic Ll/u0a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/data/Channel;


# direct methods
.method public synthetic constructor <init>(Ll/y20;Ljava/lang/String;Lcom/p1/mobile/putong/data/Channel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u0a;->a:Ll/y20;

    iput-object p2, p0, Ll/u0a;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/u0a;->c:Lcom/p1/mobile/putong/data/Channel;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/u0a;->a:Ll/y20;

    iget-object v1, p0, Ll/u0a;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/u0a;->c:Lcom/p1/mobile/putong/data/Channel;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, v1, p0, p1}, Ll/j1a;->e(Ll/y20;Ljava/lang/String;Lcom/p1/mobile/putong/data/Channel;Ljava/lang/Throwable;)V

    return-void
.end method
