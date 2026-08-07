.class public final synthetic Ll/mhs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/nhs;

.field public final synthetic b:Ll/xbe;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/c0s;


# direct methods
.method public synthetic constructor <init>(Ll/nhs;Ll/xbe;Ljava/lang/String;Ll/c0s;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mhs;->a:Ll/nhs;

    iput-object p2, p0, Ll/mhs;->b:Ll/xbe;

    iput-object p3, p0, Ll/mhs;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/mhs;->d:Ll/c0s;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/mhs;->a:Ll/nhs;

    iget-object v1, p0, Ll/mhs;->b:Ll/xbe;

    iget-object v2, p0, Ll/mhs;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/mhs;->d:Ll/c0s;

    move-object v4, p1

    check-cast v4, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    move-object v5, p2

    check-cast v5, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    invoke-static/range {v0 .. v5}, Ll/nhs;->p(Ll/nhs;Ll/xbe;Ljava/lang/String;Ll/c0s;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;)V

    return-void
.end method
