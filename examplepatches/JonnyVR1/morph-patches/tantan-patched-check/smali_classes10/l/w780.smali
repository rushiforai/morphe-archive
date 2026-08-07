.class public final synthetic Ll/w780;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/d880;


# direct methods
.method public synthetic constructor <init>(Ll/d880;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w780;->a:Ll/d880;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w780;->a:Ll/d880;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    invoke-static {p0, p1}, Ll/d880;->S3(Ll/d880;Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
