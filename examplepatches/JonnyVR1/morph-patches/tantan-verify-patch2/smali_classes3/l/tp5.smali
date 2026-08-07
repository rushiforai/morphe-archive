.class public final synthetic Ll/tp5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/compliment/a;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/compliment/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tp5;->a:Lcom/p1/mobile/putong/core/ui/compliment/a;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tp5;->a:Lcom/p1/mobile/putong/core/ui/compliment/a;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/compliment/a;->a0(Lcom/p1/mobile/putong/core/ui/compliment/a;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
