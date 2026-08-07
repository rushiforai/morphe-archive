.class public final synthetic Ll/yts0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/bvs0;

.field public final synthetic b:Ll/avs0;

.field public final synthetic c:Ll/ots0;

.field public final synthetic d:Ljava/util/ArrayList;

.field public final synthetic e:J


# direct methods
.method public synthetic constructor <init>(Ll/bvs0;Ll/avs0;Ll/ots0;Ljava/util/ArrayList;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/yts0;->a:Ll/bvs0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/yts0;->b:Ll/avs0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/yts0;->c:Ll/ots0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/yts0;->d:Ljava/util/ArrayList;

    .line 11
    .line 12
    iput-wide p5, p0, Ll/yts0;->e:J

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/yts0;->a:Ll/bvs0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/yts0;->b:Ll/avs0;

    .line 4
    .line 5
    iget-object v2, p0, Ll/yts0;->c:Ll/ots0;

    .line 6
    .line 7
    iget-object v3, p0, Ll/yts0;->d:Ljava/util/ArrayList;

    .line 8
    .line 9
    iget-wide v4, p0, Ll/yts0;->e:J

    .line 10
    .line 11
    invoke-virtual/range {v0 .. v5}, Ll/bvs0;->i(Ll/avs0;Ll/ots0;Ljava/util/ArrayList;J)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
