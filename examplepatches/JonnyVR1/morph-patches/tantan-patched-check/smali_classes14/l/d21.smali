.class public final synthetic Ll/d21;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d21;->a:Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d21;->a:Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;

    invoke-static {p0}, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;->D(Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;)V

    return-void
.end method
