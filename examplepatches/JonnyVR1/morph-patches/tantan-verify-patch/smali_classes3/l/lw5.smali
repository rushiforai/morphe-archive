.class public final synthetic Ll/lw5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/z20;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/remote_config/a;


# direct methods
.method public synthetic constructor <init>(Ll/z20;Ljava/lang/String;Lcom/p1/mobile/putong/remote_config/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lw5;->a:Ll/z20;

    iput-object p2, p0, Ll/lw5;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/lw5;->c:Lcom/p1/mobile/putong/remote_config/a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lw5;->a:Ll/z20;

    iget-object v1, p0, Ll/lw5;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/lw5;->c:Lcom/p1/mobile/putong/remote_config/a;

    invoke-static {v0, v1, p0, p1}, Ll/nw5;->a(Ll/z20;Ljava/lang/String;Lcom/p1/mobile/putong/remote_config/a;Ljava/lang/Object;)V

    return-void
.end method
