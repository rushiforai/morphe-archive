.class public final synthetic Ll/d480;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/t480;


# direct methods
.method public synthetic constructor <init>(Ll/t480;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d480;->a:Ll/t480;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d480;->a:Ll/t480;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLivePkTimeRange;

    invoke-static {p0, p1}, Ll/t480;->c4(Ll/t480;Lcom/p1/mobile/putong/live/base/data/BLivePkTimeRange;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
