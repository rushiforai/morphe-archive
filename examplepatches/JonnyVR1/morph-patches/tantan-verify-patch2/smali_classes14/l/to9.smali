.class public final synthetic Ll/to9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/r;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/r;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/to9;->a:Lcom/p1/mobile/putong/core/api/r;

    iput-object p2, p0, Ll/to9;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/to9;->a:Lcom/p1/mobile/putong/core/api/r;

    iget-object p0, p0, Ll/to9;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/api/r;->Y3(Lcom/p1/mobile/putong/core/api/r;Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
