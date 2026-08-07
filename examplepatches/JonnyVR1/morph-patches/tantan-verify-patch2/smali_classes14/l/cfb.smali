.class public final synthetic Ll/cfb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/dkb;

.field public final synthetic b:Lcom/p1/mobile/putong/data/AppealPostData;

.field public final synthetic c:Lcom/p1/mobile/putong/data/AppealPostData;


# direct methods
.method public synthetic constructor <init>(Ll/dkb;Lcom/p1/mobile/putong/data/AppealPostData;Lcom/p1/mobile/putong/data/AppealPostData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cfb;->a:Ll/dkb;

    iput-object p2, p0, Ll/cfb;->b:Lcom/p1/mobile/putong/data/AppealPostData;

    iput-object p3, p0, Ll/cfb;->c:Lcom/p1/mobile/putong/data/AppealPostData;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cfb;->a:Ll/dkb;

    iget-object v1, p0, Ll/cfb;->b:Lcom/p1/mobile/putong/data/AppealPostData;

    iget-object p0, p0, Ll/cfb;->c:Lcom/p1/mobile/putong/data/AppealPostData;

    invoke-static {v0, v1, p0}, Ll/dkb;->m4(Ll/dkb;Lcom/p1/mobile/putong/data/AppealPostData;Lcom/p1/mobile/putong/data/AppealPostData;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
