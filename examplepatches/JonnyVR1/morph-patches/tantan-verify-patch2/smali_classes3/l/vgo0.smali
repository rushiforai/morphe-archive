.class public final synthetic Ll/vgo0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/aho0;


# direct methods
.method public synthetic constructor <init>(Ll/aho0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vgo0;->a:Ll/aho0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vgo0;->a:Ll/aho0;

    check-cast p1, Ll/pgo0;

    invoke-static {p0, p1}, Ll/aho0;->N3(Ll/aho0;Ll/pgo0;)Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;

    move-result-object p0

    return-object p0
.end method
