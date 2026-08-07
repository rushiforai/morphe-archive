.class public final synthetic Ll/j34;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/w34;


# direct methods
.method public synthetic constructor <init>(Ll/w34;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j34;->a:Ll/w34;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j34;->a:Ll/w34;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;

    invoke-static {p0, p1}, Ll/w34;->M3(Ll/w34;Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
