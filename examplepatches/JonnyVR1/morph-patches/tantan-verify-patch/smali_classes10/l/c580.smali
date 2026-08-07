.class public final synthetic Ll/c580;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/q580;


# direct methods
.method public synthetic constructor <init>(Ll/q580;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c580;->a:Ll/q580;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c580;->a:Ll/q580;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLivePkTimeRange;

    invoke-static {p0, p1}, Ll/q580;->Z3(Ll/q580;Lcom/p1/mobile/putong/live/base/data/BLivePkTimeRange;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
