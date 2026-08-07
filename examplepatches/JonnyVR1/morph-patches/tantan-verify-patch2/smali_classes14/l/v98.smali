.class public final synthetic Ll/v98;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v98;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/v98;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/v98;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/v98;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/v98;->e:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/v98;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object v1, p0, Ll/v98;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/v98;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/v98;->d:Ljava/lang/String;

    iget-object p0, p0, Ll/v98;->e:Ll/x20;

    invoke-static {v0, v1, v2, v3, p0}, Lcom/p1/mobile/putong/core/api/g;->Id(Lcom/p1/mobile/putong/core/api/g;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
