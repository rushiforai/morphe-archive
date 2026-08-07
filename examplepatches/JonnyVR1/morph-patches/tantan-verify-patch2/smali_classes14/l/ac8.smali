.class public final synthetic Ll/ac8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:D


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;D)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ac8;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-wide p2, p0, Ll/ac8;->b:D

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ac8;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-wide v1, p0, Ll/ac8;->b:D

    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/core/api/g;->La(Lcom/p1/mobile/putong/core/api/g;D)V

    return-void
.end method
