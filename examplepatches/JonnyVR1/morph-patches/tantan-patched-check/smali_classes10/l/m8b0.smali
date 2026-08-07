.class public final synthetic Ll/m8b0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

.field public final synthetic b:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m8b0;->a:Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    iput-object p2, p0, Ll/m8b0;->b:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m8b0;->a:Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    iget-object p0, p0, Ll/m8b0;->b:Ljava/util/ArrayList;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p0, p1}, Ll/o8b0;->N3(Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;Ljava/util/ArrayList;Ljava/lang/String;)V

    return-void
.end method
