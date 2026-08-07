.class public final synthetic Ll/ci9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreLikers;

.field public final synthetic b:J

.field public final synthetic c:I

.field public final synthetic d:Lcom/p1/mobile/putong/data/Links;

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreLikers;JILcom/p1/mobile/putong/data/Links;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ci9;->a:Lcom/p1/mobile/putong/core/api/CoreLikers;

    iput-wide p2, p0, Ll/ci9;->b:J

    iput p4, p0, Ll/ci9;->c:I

    iput-object p5, p0, Ll/ci9;->d:Lcom/p1/mobile/putong/data/Links;

    iput-object p6, p0, Ll/ci9;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/ci9;->a:Lcom/p1/mobile/putong/core/api/CoreLikers;

    iget-wide v1, p0, Ll/ci9;->b:J

    iget v3, p0, Ll/ci9;->c:I

    iget-object v4, p0, Ll/ci9;->d:Lcom/p1/mobile/putong/data/Links;

    iget-object v5, p0, Ll/ci9;->e:Ljava/lang/String;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/CoreLikers;->h3(Lcom/p1/mobile/putong/core/api/CoreLikers;JILcom/p1/mobile/putong/data/Links;Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
