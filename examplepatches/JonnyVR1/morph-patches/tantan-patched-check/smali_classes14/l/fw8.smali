.class public final synthetic Ll/fw8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/j;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/j;Ljava/lang/String;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fw8;->a:Lcom/p1/mobile/putong/core/api/j;

    iput-object p2, p0, Ll/fw8;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/fw8;->c:Z

    iput-boolean p4, p0, Ll/fw8;->d:Z

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fw8;->a:Lcom/p1/mobile/putong/core/api/j;

    iget-object v1, p0, Ll/fw8;->b:Ljava/lang/String;

    iget-boolean v2, p0, Ll/fw8;->c:Z

    iget-boolean p0, p0, Ll/fw8;->d:Z

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/api/j;->n3(Lcom/p1/mobile/putong/core/api/j;Ljava/lang/String;ZZ)Lrx/c;

    move-result-object p0

    return-object p0
.end method
