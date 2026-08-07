.class public final synthetic Ll/s08;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/CoreData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/CoreData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s08;->a:Lcom/p1/mobile/putong/core/data/CoreData;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s08;->a:Lcom/p1/mobile/putong/core/data/CoreData;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/g;->U5(Lcom/p1/mobile/putong/core/data/CoreData;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
