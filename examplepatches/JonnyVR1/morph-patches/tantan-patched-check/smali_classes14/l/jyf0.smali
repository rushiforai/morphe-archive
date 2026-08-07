.class public final synthetic Ll/jyf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/pyf0;


# direct methods
.method public synthetic constructor <init>(Ll/pyf0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jyf0;->a:Ll/pyf0;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jyf0;->a:Ll/pyf0;

    check-cast p1, Lcom/p1/mobile/putong/core/data/HasSpotLightData;

    invoke-static {p0, p1}, Ll/pyf0;->m(Ll/pyf0;Lcom/p1/mobile/putong/core/data/HasSpotLightData;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
