.class public final synthetic Ll/s2t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/d4t;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/Live;

.field public final synthetic b:Lkotlin/jvm/internal/Ref$LongRef;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/Live;Lkotlin/jvm/internal/Ref$LongRef;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s2t;->a:Lcom/p1/mobile/putong/data/Live;

    iput-object p2, p0, Ll/s2t;->b:Lkotlin/jvm/internal/Ref$LongRef;

    return-void
.end method


# virtual methods
.method public final onStart()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s2t;->a:Lcom/p1/mobile/putong/data/Live;

    iget-object p0, p0, Ll/s2t;->b:Lkotlin/jvm/internal/Ref$LongRef;

    invoke-static {v0, p0}, Ll/t2t;->b(Lcom/p1/mobile/putong/data/Live;Lkotlin/jvm/internal/Ref$LongRef;)V

    return-void
.end method
