.class public final synthetic Ll/wij;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Landroid/content/Context;

.field public final synthetic b:Ljava/util/ArrayList;

.field public final synthetic c:Z

.field public final synthetic d:J


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Ljava/util/ArrayList;ZJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wij;->a:Landroid/content/Context;

    iput-object p2, p0, Ll/wij;->b:Ljava/util/ArrayList;

    iput-boolean p3, p0, Ll/wij;->c:Z

    iput-wide p4, p0, Ll/wij;->d:J

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/wij;->a:Landroid/content/Context;

    iget-object v1, p0, Ll/wij;->b:Ljava/util/ArrayList;

    iget-boolean v2, p0, Ll/wij;->c:Z

    iget-wide v3, p0, Ll/wij;->d:J

    move-object v5, p1

    check-cast v5, Lcom/google/common/base/Optional;

    invoke-static/range {v0 .. v5}, Ll/cjj;->g(Landroid/content/Context;Ljava/util/ArrayList;ZJLcom/google/common/base/Optional;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
