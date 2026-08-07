.class public final Ll/xxg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltech/sud/gip/core/ISudFSMStateHandle;


# instance fields
.field public final a:Ll/gfg0;

.field public final b:Ll/bsg0;

.field public final synthetic c:Ll/wyg0;


# direct methods
.method public constructor <init>(Ll/wyg0;Ll/gfg0;Ll/bsg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xxg0;->c:Ll/wyg0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/xxg0;->a:Ll/gfg0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/xxg0;->b:Ll/bsg0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final failure(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/xxg0;->a:Ll/gfg0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/gfg0;->failure(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/xxg0;->b:Ll/bsg0;

    .line 7
    .line 8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    iput-wide v0, p1, Ll/bsg0;->c:J

    .line 13
    .line 14
    iget-wide v2, p1, Ll/bsg0;->b:J

    .line 15
    .line 16
    sub-long/2addr v0, v2

    .line 17
    iput-wide v0, p1, Ll/bsg0;->d:J

    .line 18
    .line 19
    iget-object p1, p0, Ll/xxg0;->c:Ll/wyg0;

    .line 20
    .line 21
    iget-object p0, p0, Ll/xxg0;->b:Ll/bsg0;

    .line 22
    .line 23
    invoke-virtual {p1, p0}, Ll/wyg0;->b(Ll/bsg0;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final success(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/xxg0;->a:Ll/gfg0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/gfg0;->success(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/xxg0;->b:Ll/bsg0;

    .line 7
    .line 8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    iput-wide v0, p1, Ll/bsg0;->c:J

    .line 13
    .line 14
    iget-wide v2, p1, Ll/bsg0;->b:J

    .line 15
    .line 16
    sub-long/2addr v0, v2

    .line 17
    iput-wide v0, p1, Ll/bsg0;->d:J

    .line 18
    .line 19
    iget-object p1, p0, Ll/xxg0;->c:Ll/wyg0;

    .line 20
    .line 21
    iget-object p0, p0, Ll/xxg0;->b:Ll/bsg0;

    .line 22
    .line 23
    invoke-virtual {p1, p0}, Ll/wyg0;->b(Ll/bsg0;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
