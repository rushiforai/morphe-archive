.class public final synthetic Ll/xn7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/Links;

.field public final synthetic b:Z

.field public final synthetic c:J


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/Links;ZJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xn7;->a:Lcom/p1/mobile/putong/data/Links;

    iput-boolean p2, p0, Ll/xn7;->b:Z

    iput-wide p3, p0, Ll/xn7;->c:J

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/xn7;->a:Lcom/p1/mobile/putong/data/Links;

    iget-boolean v1, p0, Ll/xn7;->b:Z

    iget-wide v2, p0, Ll/xn7;->c:J

    invoke-static {v0, v1, v2, v3}, Ll/no7;->q3(Lcom/p1/mobile/putong/data/Links;ZJ)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
