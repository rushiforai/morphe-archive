.class public final synthetic Ll/u730;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;

.field public final synthetic b:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u730;->a:Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;

    iput-object p2, p0, Ll/u730;->b:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u730;->a:Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;

    iget-object p0, p0, Ll/u730;->b:Ljava/util/ArrayList;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;->i2(Lcom/p1/mobile/putong/core/newui/main/NewMainBaseAct;Ljava/util/ArrayList;)V

    return-void
.end method
