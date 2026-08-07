.class public final synthetic Ll/g5b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

.field public final synthetic b:Ljava/util/HashSet;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreSuggested;Ljava/util/HashSet;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g5b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iput-object p2, p0, Ll/g5b;->b:Ljava/util/HashSet;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g5b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iget-object p0, p0, Ll/g5b;->b:Ljava/util/HashSet;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->k4(Lcom/p1/mobile/putong/core/api/CoreSuggested;Ljava/util/HashSet;Ljava/util/List;)V

    return-void
.end method
