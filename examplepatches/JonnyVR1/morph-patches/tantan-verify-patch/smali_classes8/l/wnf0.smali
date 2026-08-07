.class public final synthetic Ll/wnf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(ILcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/wnf0;->a:I

    iput-object p2, p0, Ll/wnf0;->b:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget v0, p0, Ll/wnf0;->a:I

    iget-object p0, p0, Ll/wnf0;->b:Lcom/p1/mobile/android/app/Act;

    check-cast p1, Lcom/p1/mobile/putong/core/data/LikeMindedEnvelope;

    invoke-static {v0, p0, p1}, Ll/xnf0;->c(ILcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/LikeMindedEnvelope;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
