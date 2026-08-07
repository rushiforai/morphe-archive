.class public final synthetic Ll/mq9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/s;

.field public final synthetic b:Lcom/p1/mobile/putong/data/DbLinks;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/s;Lcom/p1/mobile/putong/data/DbLinks;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mq9;->a:Lcom/p1/mobile/putong/core/api/s;

    iput-object p2, p0, Ll/mq9;->b:Lcom/p1/mobile/putong/data/DbLinks;

    iput-boolean p3, p0, Ll/mq9;->c:Z

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mq9;->a:Lcom/p1/mobile/putong/core/api/s;

    iget-object v1, p0, Ll/mq9;->b:Lcom/p1/mobile/putong/data/DbLinks;

    iget-boolean p0, p0, Ll/mq9;->c:Z

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/api/s;->Y3(Lcom/p1/mobile/putong/core/api/s;Lcom/p1/mobile/putong/data/DbLinks;ZLcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
