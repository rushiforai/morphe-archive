.class public final synthetic Ll/zga;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/jka;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic c:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/jka;Lcom/p1/mobile/putong/feed/data/Moment;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zga;->a:Ll/jka;

    iput-object p2, p0, Ll/zga;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-object p3, p0, Ll/zga;->c:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zga;->a:Ll/jka;

    iget-object v1, p0, Ll/zga;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object p0, p0, Ll/zga;->c:Ll/y20;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-static {v0, v1, p0, p1}, Ll/jka;->H4(Ll/jka;Lcom/p1/mobile/putong/feed/data/Moment;Ll/y20;Lcom/p1/mobile/putong/feed/data/Moment;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
