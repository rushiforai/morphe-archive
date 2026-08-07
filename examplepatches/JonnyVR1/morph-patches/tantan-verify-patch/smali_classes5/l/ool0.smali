.class public final synthetic Ll/ool0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/result/a;

.field public final synthetic b:J


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/result/a;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ool0;->a:Lcom/p1/mobile/putong/core/ui/result/a;

    iput-wide p2, p0, Ll/ool0;->b:J

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ool0;->a:Lcom/p1/mobile/putong/core/ui/result/a;

    iget-wide v1, p0, Ll/ool0;->b:J

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, v1, v2, p1}, Lcom/p1/mobile/putong/core/ui/result/a;->c(Lcom/p1/mobile/putong/core/ui/result/a;JLjava/lang/Long;)V

    return-void
.end method
