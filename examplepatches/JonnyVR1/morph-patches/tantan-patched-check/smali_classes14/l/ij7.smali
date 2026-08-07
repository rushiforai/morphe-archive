.class public final synthetic Ll/ij7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/e;

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/e;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ij7;->a:Lcom/p1/mobile/putong/core/api/e;

    iput-boolean p2, p0, Ll/ij7;->b:Z

    iput-object p3, p0, Ll/ij7;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/ij7;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ij7;->a:Lcom/p1/mobile/putong/core/api/e;

    iget-boolean v1, p0, Ll/ij7;->b:Z

    iget-object v2, p0, Ll/ij7;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/ij7;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/api/e;->F4(Lcom/p1/mobile/putong/core/api/e;ZLjava/lang/String;Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
