.class public Ltech/sud/gip/core/TccRtssCfg;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public app_id:I

.field public asr_number_language_list:Lorg/json/JSONArray;

.field public asr_text_language_list:Lorg/json/JSONArray;

.field public engine_model_type:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public hotword_id:Ljava/lang/String;

.field public hotword_list:Ljava/lang/String;

.field public secret_id:Ljava/lang/String;

.field public secret_key:Ljava/lang/String;


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
