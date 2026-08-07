.class public final synthetic Ll/ikr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/LikersBoostRemainingCountView;

.field public final synthetic b:J

.field public final synthetic c:I

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/LikersBoostRemainingCountView;JII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ikr;->a:Lcom/p1/mobile/putong/core/newui/home/LikersBoostRemainingCountView;

    iput-wide p2, p0, Ll/ikr;->b:J

    iput p4, p0, Ll/ikr;->c:I

    iput p5, p0, Ll/ikr;->d:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ikr;->a:Lcom/p1/mobile/putong/core/newui/home/LikersBoostRemainingCountView;

    iget-wide v1, p0, Ll/ikr;->b:J

    iget v3, p0, Ll/ikr;->c:I

    iget p0, p0, Ll/ikr;->d:I

    invoke-static {v0, v1, v2, v3, p0}, Lcom/p1/mobile/putong/core/newui/home/LikersBoostRemainingCountView;->a(Lcom/p1/mobile/putong/core/newui/home/LikersBoostRemainingCountView;JII)V

    return-void
.end method
