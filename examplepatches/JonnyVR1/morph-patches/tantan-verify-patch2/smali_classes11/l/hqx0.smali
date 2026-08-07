.class public final Ll/hqx0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/List;

.field public final b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(IILl/gqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/rpx0;->c(I)Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/hqx0;->a:Ljava/util/List;

    .line 9
    .line 10
    invoke-static {p2}, Ll/rpx0;->c(I)Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Ll/hqx0;->b:Ljava/util/List;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final a(Ll/dqx0;)Ll/hqx0;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hqx0;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public final b(Ll/dqx0;)Ll/hqx0;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hqx0;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public final c()Ll/iqx0;
    .locals 3

    .line 1
    new-instance v0, Ll/iqx0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/hqx0;->a:Ljava/util/List;

    .line 4
    .line 5
    iget-object p0, p0, Ll/hqx0;->b:Ljava/util/List;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-direct {v0, v1, p0, v2}, Ll/iqx0;-><init>(Ljava/util/List;Ljava/util/List;Ll/gqx0;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method
