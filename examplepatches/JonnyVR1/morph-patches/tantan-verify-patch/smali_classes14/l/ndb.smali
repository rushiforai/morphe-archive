.class public final synthetic Ll/ndb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Lcom/p1/mobile/putong/data/AppealPostData;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Lcom/p1/mobile/putong/data/AppealPostData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ndb;->a:Ljava/util/List;

    iput-object p2, p0, Ll/ndb;->b:Lcom/p1/mobile/putong/data/AppealPostData;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ndb;->a:Ljava/util/List;

    iget-object p0, p0, Ll/ndb;->b:Lcom/p1/mobile/putong/data/AppealPostData;

    invoke-static {v0, p0}, Ll/dkb;->E4(Ljava/util/List;Lcom/p1/mobile/putong/data/AppealPostData;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
