.class public final synthetic Ll/b6n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/f6n;


# direct methods
.method public synthetic constructor <init>(Ll/f6n;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b6n;->a:Ll/f6n;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b6n;->a:Ll/f6n;

    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlCampingEnvelope;

    invoke-static {p0, p1}, Ll/f6n;->d(Ll/f6n;Lcom/p1/mobile/putong/core/data/IntlCampingEnvelope;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
