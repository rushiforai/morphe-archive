.class public final synthetic Ll/qag;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/fbg;


# direct methods
.method public synthetic constructor <init>(Ll/fbg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qag;->a:Ll/fbg;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qag;->a:Ll/fbg;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveMedalColorTemplate;

    invoke-static {p0, p1}, Ll/vag;->c(Ll/fbg;Lcom/p1/mobile/putong/live/base/data/BLiveMedalColorTemplate;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
