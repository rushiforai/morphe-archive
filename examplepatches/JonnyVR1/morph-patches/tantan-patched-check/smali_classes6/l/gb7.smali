.class public final synthetic Ll/gb7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/api/a;

.field public final synthetic b:Ll/pcj;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/api/a;Ll/pcj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gb7;->a:Lcom/p1/mobile/putong/feed/api/a;

    iput-object p2, p0, Ll/gb7;->b:Ll/pcj;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gb7;->a:Lcom/p1/mobile/putong/feed/api/a;

    iget-object p0, p0, Ll/gb7;->b:Ll/pcj;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/feed/api/a;->e1(Lcom/p1/mobile/putong/feed/api/a;Ll/pcj;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
