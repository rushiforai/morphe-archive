.class public final synthetic Ll/h21;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h21;->a:Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;

    iput-object p2, p0, Ll/h21;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/h21;->a:Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;

    iget-object p0, p0, Ll/h21;->b:Ljava/lang/String;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;->C(Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
