.class public final synthetic Ll/mk50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/OMSLauncherInfo;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/OMSLauncherInfo;Ljava/util/List;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mk50;->a:Lcom/p1/mobile/putong/data/OMSLauncherInfo;

    iput-object p2, p0, Ll/mk50;->b:Ljava/util/List;

    iput-object p3, p0, Ll/mk50;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mk50;->a:Lcom/p1/mobile/putong/data/OMSLauncherInfo;

    iget-object v1, p0, Ll/mk50;->b:Ljava/util/List;

    iget-object p0, p0, Ll/mk50;->c:Ljava/util/List;

    invoke-static {v0, v1, p0}, Ll/ok50;->b(Lcom/p1/mobile/putong/data/OMSLauncherInfo;Ljava/util/List;Ljava/util/List;)V

    return-void
.end method
