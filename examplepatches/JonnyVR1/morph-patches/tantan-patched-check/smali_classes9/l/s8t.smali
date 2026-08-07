.class public final synthetic Ll/s8t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/v8t;


# direct methods
.method public synthetic constructor <init>(Ll/v8t;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s8t;->a:Ll/v8t;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s8t;->a:Ll/v8t;

    check-cast p1, Ll/db20;

    invoke-static {p0, p1}, Ll/v8t;->N3(Ll/v8t;Ll/db20;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    move-result-object p0

    return-object p0
.end method
