.class public final synthetic Ll/rdb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/qcj;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/qcj;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rdb;->a:Ll/qcj;

    iput-object p2, p0, Ll/rdb;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rdb;->a:Ll/qcj;

    iget-object p0, p0, Ll/rdb;->b:Ljava/util/List;

    check-cast p1, Lcom/p1/mobile/putong/data/AppealPostData;

    invoke-static {v0, p0, p1}, Ll/dkb;->r5(Ll/qcj;Ljava/util/List;Lcom/p1/mobile/putong/data/AppealPostData;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
