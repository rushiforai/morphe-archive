.class public final synthetic Ll/pzg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic b:Ljava/lang/Integer;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pzg;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-object p2, p0, Ll/pzg;->b:Ljava/lang/Integer;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pzg;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object p0, p0, Ll/pzg;->b:Ljava/lang/Integer;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    invoke-static {v0, p0, p1}, Ll/qzg;->m(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/Integer;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
