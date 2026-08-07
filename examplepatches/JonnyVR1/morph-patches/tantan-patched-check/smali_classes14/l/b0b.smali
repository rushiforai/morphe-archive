.class public final synthetic Ll/b0b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/z;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/z;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b0b;->a:Lcom/p1/mobile/putong/core/api/z;

    iput-object p2, p0, Ll/b0b;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/b0b;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/b0b;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/b0b;->a:Lcom/p1/mobile/putong/core/api/z;

    iget-object v1, p0, Ll/b0b;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/b0b;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/b0b;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/api/z;->e3(Lcom/p1/mobile/putong/core/api/z;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
