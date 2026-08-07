.class public final synthetic Ll/kyc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/util/ArrayList;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

.field public final synthetic c:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/newui/main/NewMainAct;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kyc;->a:Ljava/util/ArrayList;

    iput-object p2, p0, Ll/kyc;->b:Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    iput-object p3, p0, Ll/kyc;->c:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kyc;->a:Ljava/util/ArrayList;

    iget-object v1, p0, Ll/kyc;->b:Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    iget-object p0, p0, Ll/kyc;->c:Ljava/util/ArrayList;

    check-cast p1, Ljava/util/Map$Entry;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/util/DebugUtil;->yf(Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/newui/main/NewMainAct;Ljava/util/ArrayList;Ljava/util/Map$Entry;)V

    return-void
.end method
