.class public final synthetic Ll/ac7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/api/a;

.field public final synthetic b:Ll/pcj;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/api/a;Ll/pcj;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ac7;->a:Lcom/p1/mobile/putong/feed/api/a;

    iput-object p2, p0, Ll/ac7;->b:Ll/pcj;

    iput-object p3, p0, Ll/ac7;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ac7;->a:Lcom/p1/mobile/putong/feed/api/a;

    iget-object v1, p0, Ll/ac7;->b:Ll/pcj;

    iget-object p0, p0, Ll/ac7;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/feed/api/a;->T0(Lcom/p1/mobile/putong/feed/api/a;Ll/pcj;Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
