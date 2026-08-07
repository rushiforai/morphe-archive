.class public final synthetic Ll/uka;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ljava/util/Map$Entry;


# direct methods
.method public synthetic constructor <init>(Ljava/util/Map$Entry;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uka;->a:Ljava/util/Map$Entry;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uka;->a:Ljava/util/Map$Entry;

    check-cast p1, Lcom/p1/mobile/putong/core/data/PicksUser;

    invoke-static {p0, p1}, Ll/ela;->a3(Ljava/util/Map$Entry;Lcom/p1/mobile/putong/core/data/PicksUser;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
