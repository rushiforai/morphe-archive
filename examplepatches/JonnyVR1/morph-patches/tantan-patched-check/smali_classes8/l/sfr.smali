.class public final synthetic Ll/sfr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(ZLcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/sfr;->a:Z

    iput-object p2, p0, Ll/sfr;->b:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/sfr;->a:Z

    iget-object p0, p0, Ll/sfr;->b:Lcom/p1/mobile/android/app/Act;

    check-cast p1, Lcom/p1/mobile/putong/core/data/LikeMindedEnvelope;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/likeminded/a;->b(ZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/LikeMindedEnvelope;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
