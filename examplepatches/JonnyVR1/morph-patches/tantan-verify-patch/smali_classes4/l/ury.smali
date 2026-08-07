.class public final synthetic Ll/ury;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:J


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ury;->a:Ljava/util/List;

    iput-wide p2, p0, Ll/ury;->b:J

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ury;->a:Ljava/util/List;

    iget-wide v1, p0, Ll/ury;->b:J

    check-cast p1, Lcom/google/common/base/Optional;

    invoke-static {v0, v1, v2, p1}, Ll/zry;->c(Ljava/util/List;JLcom/google/common/base/Optional;)V

    return-void
.end method
