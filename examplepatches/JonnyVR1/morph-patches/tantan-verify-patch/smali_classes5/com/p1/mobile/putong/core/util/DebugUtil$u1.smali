.class public Lcom/p1/mobile/putong/core/util/DebugUtil$u1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/util/DebugUtil;->Xi(Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/newui/home/b;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/n55;


# direct methods
.method public constructor <init>(Ll/n55;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$u1;->a:Ll/n55;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CityCData;->new_()Lcom/p1/mobile/putong/core/data/CityCData;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CityCData;->userId:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {}, Ll/pzi0;->o()J

    .line 18
    .line 19
    .line 20
    move-result-wide v1

    .line 21
    const-wide/32 v3, 0x2255100

    .line 22
    .line 23
    .line 24
    add-long/2addr v1, v3

    .line 25
    long-to-double v1, v1

    .line 26
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/CityCData;->expireAt:D

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$u1;->a:Ll/n55;

    .line 29
    .line 30
    const/4 v1, 0x2

    .line 31
    const/4 v2, 0x0

    .line 32
    invoke-virtual {p0, v1, v0, v2}, Ll/n55;->K(ILcom/p1/mobile/putong/core/data/CityCData;Lcom/p1/mobile/putong/core/data/CityCBanner;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
