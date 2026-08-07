.class public final synthetic Ll/g69;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/m69;

.field public final synthetic b:Lkotlin/jvm/functions/Function1;


# direct methods
.method public synthetic constructor <init>(Ll/m69;Lkotlin/jvm/functions/Function1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g69;->a:Ll/m69;

    iput-object p2, p0, Ll/g69;->b:Lkotlin/jvm/functions/Function1;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g69;->a:Ll/m69;

    iget-object p0, p0, Ll/g69;->b:Lkotlin/jvm/functions/Function1;

    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlCampingConfigEnvelope;

    invoke-static {v0, p0, p1}, Ll/m69;->h3(Ll/m69;Lkotlin/jvm/functions/Function1;Lcom/p1/mobile/putong/core/data/IntlCampingConfigEnvelope;)V

    return-void
.end method
