.class public final synthetic Ll/jez;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/vez;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/vez;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jez;->a:Ll/vez;

    iput-object p2, p0, Ll/jez;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jez;->a:Ll/vez;

    iget-object p0, p0, Ll/jez;->b:Ljava/util/List;

    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    invoke-static {v0, p0, p1}, Ll/vez;->t0(Ll/vez;Ljava/util/List;Lcom/p1/mobile/putong/core/data/CoreData;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
