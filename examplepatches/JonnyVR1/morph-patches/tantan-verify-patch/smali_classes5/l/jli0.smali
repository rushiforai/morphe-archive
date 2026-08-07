.class public final synthetic Ll/jli0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/mli0;


# direct methods
.method public synthetic constructor <init>(Ll/mli0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jli0;->a:Ll/mli0;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jli0;->a:Ll/mli0;

    check-cast p1, Lcom/p1/mobile/putong/core/data/TarotDataEnvelope;

    invoke-static {p0, p1}, Ll/mli0;->f(Ll/mli0;Lcom/p1/mobile/putong/core/data/TarotDataEnvelope;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
