.class public final synthetic Ll/kz4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/mz4;


# direct methods
.method public synthetic constructor <init>(Ll/mz4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kz4;->a:Ll/mz4;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kz4;->a:Ll/mz4;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;

    invoke-static {p0, p1}, Ll/mz4;->N3(Ll/mz4;Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;)Lcom/p1/mobile/putong/live/base/data/BLiveChatMangerSettings;

    move-result-object p0

    return-object p0
.end method
