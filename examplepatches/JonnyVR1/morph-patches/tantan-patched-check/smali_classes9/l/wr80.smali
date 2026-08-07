.class public final synthetic Ll/wr80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/us80;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/us80;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wr80;->a:Ll/us80;

    iput-object p2, p0, Ll/wr80;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wr80;->a:Ll/us80;

    iget-object p0, p0, Ll/wr80;->b:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    invoke-static {v0, p0, p1}, Ll/us80;->m4(Ll/us80;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
