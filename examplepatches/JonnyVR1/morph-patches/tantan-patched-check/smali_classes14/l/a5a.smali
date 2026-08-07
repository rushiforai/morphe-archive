.class public final synthetic Ll/a5a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/v;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/v;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a5a;->a:Lcom/p1/mobile/putong/core/api/v;

    iput-object p2, p0, Ll/a5a;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/a5a;->c:Z

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/a5a;->a:Lcom/p1/mobile/putong/core/api/v;

    iget-object v1, p0, Ll/a5a;->b:Ljava/lang/String;

    iget-boolean p0, p0, Ll/a5a;->c:Z

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/api/v;->r3(Lcom/p1/mobile/putong/core/api/v;Ljava/lang/String;Z)Lrx/c;

    move-result-object p0

    return-object p0
.end method
