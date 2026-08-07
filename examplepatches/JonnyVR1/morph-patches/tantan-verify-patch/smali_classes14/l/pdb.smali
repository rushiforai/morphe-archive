.class public final synthetic Ll/pdb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/dkb;

.field public final synthetic b:Lcom/p1/mobile/putong/data/AppealPostData;


# direct methods
.method public synthetic constructor <init>(Ll/dkb;Lcom/p1/mobile/putong/data/AppealPostData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pdb;->a:Ll/dkb;

    iput-object p2, p0, Ll/pdb;->b:Lcom/p1/mobile/putong/data/AppealPostData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pdb;->a:Ll/dkb;

    iget-object p0, p0, Ll/pdb;->b:Lcom/p1/mobile/putong/data/AppealPostData;

    check-cast p1, Lcom/p1/mobile/putong/data/AppealPostData;

    invoke-static {v0, p0, p1}, Ll/dkb;->f4(Ll/dkb;Lcom/p1/mobile/putong/data/AppealPostData;Lcom/p1/mobile/putong/data/AppealPostData;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
