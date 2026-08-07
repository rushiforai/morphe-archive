.class public final synthetic Ll/ue9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/ze9;

.field public final synthetic b:Lkotlin/jvm/functions/Function1;


# direct methods
.method public synthetic constructor <init>(Ll/ze9;Lkotlin/jvm/functions/Function1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ue9;->a:Ll/ze9;

    iput-object p2, p0, Ll/ue9;->b:Lkotlin/jvm/functions/Function1;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ue9;->a:Ll/ze9;

    iget-object p0, p0, Ll/ue9;->b:Lkotlin/jvm/functions/Function1;

    check-cast p1, Lcom/p1/mobile/putong/core/data/LikeMindedEnvelope;

    invoke-static {v0, p0, p1}, Ll/ze9;->e3(Ll/ze9;Lkotlin/jvm/functions/Function1;Lcom/p1/mobile/putong/core/data/LikeMindedEnvelope;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
