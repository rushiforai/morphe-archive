.class public final synthetic Ll/mfg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/rfg;


# direct methods
.method public synthetic constructor <init>(Ll/rfg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mfg;->a:Ll/rfg;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mfg;->a:Ll/rfg;

    check-cast p1, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;

    invoke-static {p0, p1}, Ll/rfg;->S3(Ll/rfg;Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;)V

    return-void
.end method
