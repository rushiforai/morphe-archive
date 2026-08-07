.class public final synthetic Ll/y7g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y7g;->a:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y7g;->a:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;

    invoke-static {p0, p1}, Ll/a8g;->a(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
