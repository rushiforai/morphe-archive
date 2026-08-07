.class public final synthetic Ll/uea;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/jka;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/MomentMessage;


# direct methods
.method public synthetic constructor <init>(Ll/jka;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uea;->a:Ll/jka;

    iput-object p2, p0, Ll/uea;->b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uea;->a:Ll/jka;

    iget-object p0, p0, Ll/uea;->b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    invoke-static {v0, p0}, Ll/jka;->s3(Ll/jka;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
