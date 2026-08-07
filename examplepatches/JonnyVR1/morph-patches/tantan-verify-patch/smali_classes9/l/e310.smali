.class public final synthetic Ll/e310;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/b30;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e310;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/e310;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/e310;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/e310;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/e310;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/e310;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    move-object v3, p1

    check-cast v3, Ljava/lang/Boolean;

    move-object v4, p2

    check-cast v4, Ljava/lang/Integer;

    move-object v5, p3

    check-cast v5, Ljava/lang/Integer;

    move-object v6, p4

    check-cast v6, Ljava/lang/Integer;

    invoke-static/range {v0 .. v6}, Ll/s310;->D(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)V

    return-void
.end method
