.class public final synthetic Ll/l07;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/s07;


# direct methods
.method public synthetic constructor <init>(Ll/s07;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l07;->a:Ll/s07;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l07;->a:Ll/s07;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {p0, p1}, Ll/s07;->e3(Ll/s07;Lcom/p1/mobile/putong/data/Envelope;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
