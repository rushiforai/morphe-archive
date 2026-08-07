.class public final synthetic Ll/tx9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/Moment;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tx9;->a:Ljava/util/List;

    iput-object p2, p0, Ll/tx9;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tx9;->a:Ljava/util/List;

    iget-object p0, p0, Ll/tx9;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/feed/api/b;->y2(Ljava/util/List;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
