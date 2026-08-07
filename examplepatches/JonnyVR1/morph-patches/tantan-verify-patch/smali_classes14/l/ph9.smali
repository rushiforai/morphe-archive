.class public final synthetic Ll/ph9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreLikers;

.field public final synthetic b:J


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreLikers;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ph9;->a:Lcom/p1/mobile/putong/core/api/CoreLikers;

    iput-wide p2, p0, Ll/ph9;->b:J

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ph9;->a:Lcom/p1/mobile/putong/core/api/CoreLikers;

    iget-wide v1, p0, Ll/ph9;->b:J

    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/core/api/CoreLikers;->H4(Lcom/p1/mobile/putong/core/api/CoreLikers;J)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
