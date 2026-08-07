.class public final synthetic Ll/zz5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zz5;->a:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zz5;->a:Lcom/p1/mobile/android/app/Act;

    check-cast p1, Lcom/p1/mobile/putong/core/data/ConstellationDataEnvelope;

    invoke-static {p0, p1}, Ll/c06$a;->a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/ConstellationDataEnvelope;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
