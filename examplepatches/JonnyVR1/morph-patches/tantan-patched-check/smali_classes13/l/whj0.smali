.class public final synthetic Ll/whj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/dij0;

.field public final synthetic b:I

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/dij0;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/whj0;->a:Ll/dij0;

    iput p2, p0, Ll/whj0;->b:I

    iput p3, p0, Ll/whj0;->c:I

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/whj0;->a:Ll/dij0;

    iget v1, p0, Ll/whj0;->b:I

    iget p0, p0, Ll/whj0;->c:I

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->q(Ll/dij0;II)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
