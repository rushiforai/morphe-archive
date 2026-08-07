.class public final synthetic Ll/t3b0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/d4b0;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/d4b0;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t3b0;->a:Ll/d4b0;

    iput-object p2, p0, Ll/t3b0;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/t3b0;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/t3b0;->a:Ll/d4b0;

    iget-object v1, p0, Ll/t3b0;->b:Lcom/p1/mobile/putong/data/User;

    iget-object p0, p0, Ll/t3b0;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Ll/d4b0;->l0(Ll/d4b0;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    return-void
.end method
