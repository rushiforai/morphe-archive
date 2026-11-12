.class public final Ldm;
.super Ljava/lang/Exception;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:I


# direct methods
.method public constructor <init>(IILjava/lang/String;)V
    .registers 4

    invoke-direct {p0, p3}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    iput p1, p0, Ldm;->b:I

    iput p2, p0, Ldm;->a:I

    return-void
.end method


# virtual methods
.method public final toString()Ljava/lang/String;
    .registers 6

    const/4 v0, 0x1

    iget v1, p0, Ldm;->b:I

    if-eq v1, v0, :cond_e

    const/4 v0, 0x2

    if-eq v1, v0, :cond_b

    const-string v0, "null"

    goto :goto_10

    :cond_b
    const-string v0, "PLAY"

    goto :goto_10

    :cond_e
    const-string v0, "LOAD"

    :goto_10
    iget v1, p0, Ldm;->a:I

    packed-switch v1, :pswitch_data_6e

    const-string v1, "null"

    goto :goto_59

    :pswitch_18
    const-string v1, "ADS_PLAYER_NOT_PROVIDED"

    goto :goto_59

    :pswitch_1b
    const-string v1, "UNEXPECTED_ADS_LOADED_EVENT"

    goto :goto_59

    :pswitch_1e
    const-string v1, "PLAYLIST_NO_CONTENT_TRACKING"

    goto :goto_59

    :pswitch_21
    const-string v1, "INVALID_ARGUMENTS"

    goto :goto_59

    :pswitch_24
    const-string v1, "ADS_REQUEST_NETWORK_ERROR"

    goto :goto_59

    :pswitch_27
    const-string v1, "VAST_ASSET_NOT_FOUND"

    goto :goto_59

    :pswitch_2a
    const-string v1, "FAILED_TO_REQUEST_ADS"

    goto :goto_59

    :pswitch_2d
    const-string v1, "VAST_EMPTY_RESPONSE"

    goto :goto_59

    :pswitch_30
    const-string v1, "UNKNOWN_ERROR"

    goto :goto_59

    :pswitch_33
    const-string v1, "COMPANION_AD_LOADING_FAILED"

    goto :goto_59

    :pswitch_36
    const-string v1, "VAST_NONLINEAR_ASSET_MISMATCH"

    goto :goto_59

    :pswitch_39
    const-string v1, "OVERLAY_AD_LOADING_FAILED"

    goto :goto_59

    :pswitch_3c
    const-string v1, "OVERLAY_AD_PLAYING_FAILED"

    goto :goto_59

    :pswitch_3f
    const-string v1, "VAST_LINEAR_ASSET_MISMATCH"

    goto :goto_59

    :pswitch_42
    const-string v1, "VAST_MEDIA_LOAD_TIMEOUT"

    goto :goto_59

    :pswitch_45
    const-string v1, "VIDEO_PLAY_ERROR"

    goto :goto_59

    :pswitch_48
    const-string v1, "VAST_TOO_MANY_REDIRECTS"

    goto :goto_59

    :pswitch_4b
    const-string v1, "VAST_LOAD_TIMEOUT"

    goto :goto_59

    :pswitch_4e
    const-string v1, "VAST_TRAFFICKING_ERROR"

    goto :goto_59

    :pswitch_51
    const-string v1, "UNKNOWN_AD_RESPONSE"

    goto :goto_59

    :pswitch_54
    const-string v1, "VAST_MALFORMED_RESPONSE"

    goto :goto_59

    :pswitch_57
    const-string v1, "INTERNAL_ERROR"

    :goto_59
    invoke-super {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    const-string v2, ", errorCode: "

    const-string v3, ", message: "

    const-string v4, "AdError [errorType: "

    invoke-static {v4, v0, v2, v1, v3}, Lz1m;->n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-static {v0, p0, v1}, Lz1m;->l(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_data_6e
    .packed-switch 0x1
        :pswitch_57
        :pswitch_54
        :pswitch_51
        :pswitch_4e
        :pswitch_4b
        :pswitch_48
        :pswitch_45
        :pswitch_42
        :pswitch_3f
        :pswitch_3c
        :pswitch_39
        :pswitch_36
        :pswitch_33
        :pswitch_30
        :pswitch_2d
        :pswitch_2a
        :pswitch_27
        :pswitch_24
        :pswitch_21
        :pswitch_1e
        :pswitch_1b
        :pswitch_18
    .end packed-switch
.end method
