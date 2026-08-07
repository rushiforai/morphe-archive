.class public final synthetic Ll/kh9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:J

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/data/Links;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(JILcom/p1/mobile/putong/data/Links;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Ll/kh9;->a:J

    iput p3, p0, Ll/kh9;->b:I

    iput-object p4, p0, Ll/kh9;->c:Lcom/p1/mobile/putong/data/Links;

    iput-object p5, p0, Ll/kh9;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/kh9;->a:J

    iget v2, p0, Ll/kh9;->b:I

    iget-object v3, p0, Ll/kh9;->c:Lcom/p1/mobile/putong/data/Links;

    iget-object p0, p0, Ll/kh9;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3, p0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->L3(JILcom/p1/mobile/putong/data/Links;Ljava/lang/String;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
