.class public final synthetic Ll/sad;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

.field public final synthetic b:Ljava/util/ArrayList;

.field public final synthetic c:Ljava/util/Map$Entry;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;Ljava/util/ArrayList;Ljava/util/Map$Entry;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sad;->a:Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    iput-object p2, p0, Ll/sad;->b:Ljava/util/ArrayList;

    iput-object p3, p0, Ll/sad;->c:Ljava/util/Map$Entry;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sad;->a:Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    iget-object v1, p0, Ll/sad;->b:Ljava/util/ArrayList;

    iget-object p0, p0, Ll/sad;->c:Ljava/util/Map$Entry;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/util/DebugUtil;->Sc(Lcom/p1/mobile/putong/core/newui/main/NewMainAct;Ljava/util/ArrayList;Ljava/util/Map$Entry;)V

    return-void
.end method
