.class public final synthetic Ll/jix;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:J

.field public final synthetic b:J

.field public final synthetic c:Lkotlin/jvm/internal/Ref$IntRef;


# direct methods
.method public synthetic constructor <init>(JJLkotlin/jvm/internal/Ref$IntRef;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Ll/jix;->a:J

    iput-wide p3, p0, Ll/jix;->b:J

    iput-object p5, p0, Ll/jix;->c:Lkotlin/jvm/internal/Ref$IntRef;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-wide v0, p0, Ll/jix;->a:J

    iget-wide v2, p0, Ll/jix;->b:J

    iget-object v4, p0, Ll/jix;->c:Lkotlin/jvm/internal/Ref$IntRef;

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/core/data/LikeUser;

    invoke-static/range {v0 .. v5}, Ll/kix;->a(JJLkotlin/jvm/internal/Ref$IntRef;Lcom/p1/mobile/putong/core/data/LikeUser;)V

    return-void
.end method
