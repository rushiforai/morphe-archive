.class public final synthetic Ll/pk9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/sk9;


# direct methods
.method public synthetic constructor <init>(Ll/sk9;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pk9;->a:Ll/sk9;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pk9;->a:Ll/sk9;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {p0, p1}, Ll/sk9;->e3(Ll/sk9;Lcom/p1/mobile/putong/data/Envelope;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
