.class public final synthetic Ll/aj9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreLikers;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreLikers;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/aj9;->a:Lcom/p1/mobile/putong/core/api/CoreLikers;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aj9;->a:Lcom/p1/mobile/putong/core/api/CoreLikers;

    check-cast p1, Lcom/p1/mobile/putong/core/data/SeeInfos;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreLikers;->w3(Lcom/p1/mobile/putong/core/api/CoreLikers;Lcom/p1/mobile/putong/core/data/SeeInfos;)V

    return-void
.end method
