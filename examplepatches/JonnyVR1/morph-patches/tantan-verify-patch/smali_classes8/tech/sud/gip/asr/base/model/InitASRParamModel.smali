.class public Ltech/sud/gip/asr/base/model/InitASRParamModel;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public context:Landroid/content/Context;

.field public iSudFSTAPP:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ltech/sud/gip/core/ISudFSTAPP;",
            ">;"
        }
    .end annotation
.end field

.field public mgId:J

.field public roomId:Ljava/lang/String;

.field public supportNumberLanguageList:Lorg/json/JSONArray;

.field public supportTextLanguageList:Lorg/json/JSONArray;

.field public userId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
