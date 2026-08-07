.class public final synthetic Ll/uc90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lkotlin/jvm/internal/Ref$BooleanRef;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Merchandise;


# direct methods
.method public synthetic constructor <init>(Lkotlin/jvm/internal/Ref$BooleanRef;Lcom/p1/mobile/putong/core/data/Merchandise;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uc90;->a:Lkotlin/jvm/internal/Ref$BooleanRef;

    iput-object p2, p0, Ll/uc90;->b:Lcom/p1/mobile/putong/core/data/Merchandise;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uc90;->a:Lkotlin/jvm/internal/Ref$BooleanRef;

    iget-object p0, p0, Ll/uc90;->b:Lcom/p1/mobile/putong/core/data/Merchandise;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Merchandise;

    invoke-static {v0, p0, p1}, Ll/xc90;->p(Lkotlin/jvm/internal/Ref$BooleanRef;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
