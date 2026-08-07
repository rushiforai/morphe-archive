.class public final synthetic Ll/w98;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:J


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w98;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-wide p2, p0, Ll/w98;->b:J

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/w98;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-wide v1, p0, Ll/w98;->b:J

    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/core/api/g;->A5(Lcom/p1/mobile/putong/core/api/g;J)V

    return-void
.end method
