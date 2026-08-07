.class public final synthetic Ll/tca;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/jka;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/p1/mobile/putong/feed/data/MomentMessage;


# direct methods
.method public synthetic constructor <init>(Ll/jka;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tca;->a:Ll/jka;

    iput-object p2, p0, Ll/tca;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/tca;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/tca;->d:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/tca;->a:Ll/jka;

    iget-object v1, p0, Ll/tca;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/tca;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/tca;->d:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    invoke-static {v0, v1, v2, p0}, Ll/jka;->Z2(Ll/jka;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
