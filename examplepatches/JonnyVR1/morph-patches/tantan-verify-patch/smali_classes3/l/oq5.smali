.class public final synthetic Ll/oq5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/compliment/a;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/compliment/a;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oq5;->a:Lcom/p1/mobile/putong/core/ui/compliment/a;

    iput-boolean p2, p0, Ll/oq5;->b:Z

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/oq5;->a:Lcom/p1/mobile/putong/core/ui/compliment/a;

    iget-boolean p0, p0, Ll/oq5;->b:Z

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/compliment/a;->E(Lcom/p1/mobile/putong/core/ui/compliment/a;Z)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
