.class public final synthetic Ll/kos;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/mos;

.field public final synthetic b:Ll/mx50;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ll/mos;Ll/mx50;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kos;->a:Ll/mos;

    iput-object p2, p0, Ll/kos;->b:Ll/mx50;

    iput-boolean p3, p0, Ll/kos;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kos;->a:Ll/mos;

    iget-object v1, p0, Ll/kos;->b:Ll/mx50;

    iget-boolean p0, p0, Ll/kos;->c:Z

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;

    invoke-static {v0, v1, p0, p1}, Ll/mos;->S3(Ll/mos;Ll/mx50;ZLcom/p1/mobile/putong/live/base/data/BLiveExtraResponse;)V

    return-void
.end method
