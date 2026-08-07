.class public final synthetic Ll/e69;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lkotlin/jvm/functions/Function1;


# direct methods
.method public synthetic constructor <init>(Lkotlin/jvm/functions/Function1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e69;->a:Lkotlin/jvm/functions/Function1;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e69;->a:Lkotlin/jvm/functions/Function1;

    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlCampingEnvelope;

    invoke-static {p0, p1}, Ll/m69;->e3(Lkotlin/jvm/functions/Function1;Lcom/p1/mobile/putong/core/data/IntlCampingEnvelope;)V

    return-void
.end method
