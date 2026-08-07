.class public final synthetic Ll/nca;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/jka;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/feed/data/Moment;


# direct methods
.method public synthetic constructor <init>(Ll/jka;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nca;->a:Ll/jka;

    iput-object p2, p0, Ll/nca;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/nca;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nca;->a:Ll/jka;

    iget-object v1, p0, Ll/nca;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/nca;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-static {v0, v1, p0}, Ll/jka;->I4(Ll/jka;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
