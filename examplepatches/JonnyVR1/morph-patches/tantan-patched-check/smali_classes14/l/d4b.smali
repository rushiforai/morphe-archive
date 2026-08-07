.class public final synthetic Ll/d4b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/CardPattern;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/CardPattern;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d4b;->a:Lcom/p1/mobile/putong/core/data/CardPattern;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d4b;->a:Lcom/p1/mobile/putong/core/data/CardPattern;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->R4(Lcom/p1/mobile/putong/core/data/CardPattern;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
