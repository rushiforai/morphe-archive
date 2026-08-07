.class public final synthetic Ll/hj7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/e;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/e;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hj7;->a:Lcom/p1/mobile/putong/core/api/e;

    iput-object p2, p0, Ll/hj7;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/hj7;->c:Ljava/lang/String;

    iput-boolean p4, p0, Ll/hj7;->d:Z

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hj7;->a:Lcom/p1/mobile/putong/core/api/e;

    iget-object v1, p0, Ll/hj7;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/hj7;->c:Ljava/lang/String;

    iget-boolean p0, p0, Ll/hj7;->d:Z

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/api/e;->d4(Lcom/p1/mobile/putong/core/api/e;Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;

    move-result-object p0

    return-object p0
.end method
