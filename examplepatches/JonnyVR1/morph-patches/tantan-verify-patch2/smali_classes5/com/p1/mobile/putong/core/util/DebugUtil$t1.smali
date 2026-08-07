.class public Lcom/p1/mobile/putong/core/util/DebugUtil$t1;
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$t1;->a:Ll/n55;

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
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CityCBanner;->new_()Lcom/p1/mobile/putong/core/data/CityCBanner;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "\u5317\u4eacxx"

    .line 6
    .line 7
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CityCBanner;->cityName:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$t1;->a:Ll/n55;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-virtual {p0, v1, v2, v0}, Ll/n55;->K(ILcom/p1/mobile/putong/core/data/CityCData;Lcom/p1/mobile/putong/core/data/CityCBanner;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
