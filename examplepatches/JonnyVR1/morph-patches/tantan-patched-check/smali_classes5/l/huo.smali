.class public final synthetic Ll/huo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;

.field public final synthetic b:Ll/hvo;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/User;Ll/hvo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/huo;->a:Lcom/p1/mobile/putong/data/User;

    iput-object p2, p0, Ll/huo;->b:Ll/hvo;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/huo;->a:Lcom/p1/mobile/putong/data/User;

    iget-object p0, p0, Ll/huo;->b:Ll/hvo;

    invoke-static {v0, p0}, Ll/hvo;->E(Lcom/p1/mobile/putong/data/User;Ll/hvo;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
