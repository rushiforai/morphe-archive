.class public final synthetic Ll/bz2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/mz2;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;


# direct methods
.method public synthetic constructor <init>(Ll/mz2;Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bz2;->a:Ll/mz2;

    iput-object p2, p0, Ll/bz2;->b:Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bz2;->a:Ll/mz2;

    iget-object p0, p0, Ll/bz2;->b:Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, p0, p1}, Ll/mz2;->a(Ll/mz2;Lcom/p1/mobile/putong/core/data/TTCMigrateGuideConfig;Ljava/lang/Long;)V

    return-void
.end method
