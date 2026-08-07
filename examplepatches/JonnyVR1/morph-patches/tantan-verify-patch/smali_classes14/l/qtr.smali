.class public final synthetic Ll/qtr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/gur;


# direct methods
.method public synthetic constructor <init>(Ll/gur;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qtr;->a:Ll/gur;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qtr;->a:Ll/gur;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivity;

    invoke-static {p0, p1}, Ll/rtr;->a(Ll/gur;Lcom/p1/mobile/putong/live/base/data/BLiveActivity;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
