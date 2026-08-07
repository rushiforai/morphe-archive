.class final Lcom/facebook/appevents/integrity/ProtectedModeManager$defaultStandardParameterNames$2;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/appevents/integrity/ProtectedModeManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Ljava/util/HashSet<",
        "Ljava/lang/String;",
        ">;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u0012\u0012\u0004\u0012\u00020\u00020\u0001j\u0008\u0012\u0004\u0012\u00020\u0002`\u0003H\n\u00a2\u0006\u0002\u0008\u0004"
    }
    d2 = {
        "<anonymous>",
        "Ljava/util/HashSet;",
        "",
        "Lkotlin/collections/HashSet;",
        "invoke"
    }
    k = 0x3
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lcom/facebook/appevents/integrity/ProtectedModeManager$defaultStandardParameterNames$2;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/facebook/appevents/integrity/ProtectedModeManager$defaultStandardParameterNames$2;

    invoke-direct {v0}, Lcom/facebook/appevents/integrity/ProtectedModeManager$defaultStandardParameterNames$2;-><init>()V

    sput-object v0, Lcom/facebook/appevents/integrity/ProtectedModeManager$defaultStandardParameterNames$2;->INSTANCE:Lcom/facebook/appevents/integrity/ProtectedModeManager$defaultStandardParameterNames$2;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0

    .line 258
    invoke-virtual {p0}, Lcom/facebook/appevents/integrity/ProtectedModeManager$defaultStandardParameterNames$2;->invoke()Ljava/util/HashSet;

    move-result-object p0

    return-object p0
.end method

.method public final invoke()Ljava/util/HashSet;
    .locals 125
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-string v123, "_audiencePropertyIds"

    .line 2
    .line 3
    const-string v124, "cs_maca"

    .line 4
    .line 5
    const-string v1, "_currency"

    .line 6
    .line 7
    const-string v2, "_valueToSum"

    .line 8
    .line 9
    const-string v3, "fb_availability"

    .line 10
    .line 11
    const-string v4, "fb_body_style"

    .line 12
    .line 13
    const-string v5, "fb_checkin_date"

    .line 14
    .line 15
    const-string v6, "fb_checkout_date"

    .line 16
    .line 17
    const-string v7, "fb_city"

    .line 18
    .line 19
    const-string v8, "fb_condition_of_vehicle"

    .line 20
    .line 21
    const-string v9, "fb_content_ids"

    .line 22
    .line 23
    const-string v10, "fb_content_type"

    .line 24
    .line 25
    const-string v11, "fb_contents"

    .line 26
    .line 27
    const-string v12, "fb_country"

    .line 28
    .line 29
    const-string v13, "fb_currency"

    .line 30
    .line 31
    const-string v14, "fb_delivery_category"

    .line 32
    .line 33
    const-string v15, "fb_departing_arrival_date"

    .line 34
    .line 35
    const-string v16, "fb_departing_departure_date"

    .line 36
    .line 37
    const-string v17, "fb_destination_airport"

    .line 38
    .line 39
    const-string v18, "fb_destination_ids"

    .line 40
    .line 41
    const-string v19, "fb_dma_code"

    .line 42
    .line 43
    const-string v20, "fb_drivetrain"

    .line 44
    .line 45
    const-string v21, "fb_exterior_color"

    .line 46
    .line 47
    const-string v22, "fb_fuel_type"

    .line 48
    .line 49
    const-string v23, "fb_hotel_score"

    .line 50
    .line 51
    const-string v24, "fb_interior_color"

    .line 52
    .line 53
    const-string v25, "fb_lease_end_date"

    .line 54
    .line 55
    const-string v26, "fb_lease_start_date"

    .line 56
    .line 57
    const-string v27, "fb_listing_type"

    .line 58
    .line 59
    const-string v28, "fb_make"

    .line 60
    .line 61
    const-string v29, "fb_mileage.unit"

    .line 62
    .line 63
    const-string v30, "fb_mileage.value"

    .line 64
    .line 65
    const-string v31, "fb_model"

    .line 66
    .line 67
    const-string v32, "fb_neighborhood"

    .line 68
    .line 69
    const-string v33, "fb_num_adults"

    .line 70
    .line 71
    const-string v34, "fb_num_children"

    .line 72
    .line 73
    const-string v35, "fb_num_infants"

    .line 74
    .line 75
    const-string v36, "fb_num_items"

    .line 76
    .line 77
    const-string v37, "fb_order_id"

    .line 78
    .line 79
    const-string v38, "fb_origin_airport"

    .line 80
    .line 81
    const-string v39, "fb_postal_code"

    .line 82
    .line 83
    const-string v40, "fb_predicted_ltv"

    .line 84
    .line 85
    const-string v41, "fb_preferred_baths_range"

    .line 86
    .line 87
    const-string v42, "fb_preferred_beds_range"

    .line 88
    .line 89
    const-string v43, "fb_preferred_neighborhoods"

    .line 90
    .line 91
    const-string v44, "fb_preferred_num_stops"

    .line 92
    .line 93
    const-string v45, "fb_preferred_price_range"

    .line 94
    .line 95
    const-string v46, "fb_preferred_star_ratings"

    .line 96
    .line 97
    const-string v47, "fb_price"

    .line 98
    .line 99
    const-string v48, "fb_property_type"

    .line 100
    .line 101
    const-string v49, "fb_region"

    .line 102
    .line 103
    const-string v50, "fb_returning_arrival_date"

    .line 104
    .line 105
    const-string v51, "fb_returning_departure_date"

    .line 106
    .line 107
    const-string v52, "fb_state_of_vehicle"

    .line 108
    .line 109
    const-string v53, "fb_suggested_destinations"

    .line 110
    .line 111
    const-string v54, "fb_suggested_home_listings"

    .line 112
    .line 113
    const-string v55, "fb_suggested_hotels"

    .line 114
    .line 115
    const-string v56, "fb_suggested_jobs"

    .line 116
    .line 117
    const-string v57, "fb_suggested_local_service_businesses"

    .line 118
    .line 119
    const-string v58, "fb_suggested_location_based_items"

    .line 120
    .line 121
    const-string v59, "fb_suggested_vehicles"

    .line 122
    .line 123
    const-string v60, "fb_transmission"

    .line 124
    .line 125
    const-string v61, "fb_travel_class"

    .line 126
    .line 127
    const-string v62, "fb_travel_end"

    .line 128
    .line 129
    const-string v63, "fb_travel_start"

    .line 130
    .line 131
    const-string v64, "fb_trim"

    .line 132
    .line 133
    const-string v65, "fb_user_bucket"

    .line 134
    .line 135
    const-string v66, "fb_value"

    .line 136
    .line 137
    const-string v67, "fb_vin"

    .line 138
    .line 139
    const-string v68, "fb_year"

    .line 140
    .line 141
    const-string v69, "lead_event_source"

    .line 142
    .line 143
    const-string v70, "predicted_ltv"

    .line 144
    .line 145
    const-string v71, "product_catalog_id"

    .line 146
    .line 147
    const-string v72, "app_user_id"

    .line 148
    .line 149
    const-string v73, "appVersion"

    .line 150
    .line 151
    const-string v74, "_eventName"

    .line 152
    .line 153
    const-string v75, "_eventName_md5"

    .line 154
    .line 155
    const-string v76, "_implicitlyLogged"

    .line 156
    .line 157
    const-string v77, "_inBackground"

    .line 158
    .line 159
    const-string v78, "_isTimedEvent"

    .line 160
    .line 161
    const-string v79, "_logTime"

    .line 162
    .line 163
    const-string v80, "_session_id"

    .line 164
    .line 165
    const-string v81, "_ui"

    .line 166
    .line 167
    const-string v82, "_valueToUpdate"

    .line 168
    .line 169
    const-string v83, "_is_fb_codeless"

    .line 170
    .line 171
    const-string v84, "_is_suggested_event"

    .line 172
    .line 173
    const-string v85, "_fb_pixel_referral_id"

    .line 174
    .line 175
    const-string v86, "fb_pixel_id"

    .line 176
    .line 177
    const-string v87, "trace_id"

    .line 178
    .line 179
    const-string v88, "subscription_id"

    .line 180
    .line 181
    const-string v89, "event_id"

    .line 182
    .line 183
    const-string v90, "_restrictedParams"

    .line 184
    .line 185
    const-string v91, "_onDeviceParams"

    .line 186
    .line 187
    const-string v92, "purchase_valid_result_type"

    .line 188
    .line 189
    const-string v93, "core_lib_included"

    .line 190
    .line 191
    const-string v94, "login_lib_included"

    .line 192
    .line 193
    const-string v95, "share_lib_included"

    .line 194
    .line 195
    const-string v96, "place_lib_included"

    .line 196
    .line 197
    const-string v97, "messenger_lib_included"

    .line 198
    .line 199
    const-string v98, "applinks_lib_included"

    .line 200
    .line 201
    const-string v99, "marketing_lib_included"

    .line 202
    .line 203
    const-string v100, "_codeless_action"

    .line 204
    .line 205
    const-string v101, "sdk_initialized"

    .line 206
    .line 207
    const-string v102, "billing_client_lib_included"

    .line 208
    .line 209
    const-string v103, "billing_service_lib_included"

    .line 210
    .line 211
    const-string v104, "user_data_keys"

    .line 212
    .line 213
    const-string v105, "device_push_token"

    .line 214
    .line 215
    const-string v106, "fb_mobile_pckg_fp"

    .line 216
    .line 217
    const-string v107, "fb_mobile_app_cert_hash"

    .line 218
    .line 219
    const-string v108, "aggregate_id"

    .line 220
    .line 221
    const-string v109, "anonymous_id"

    .line 222
    .line 223
    const-string v110, "campaign_ids"

    .line 224
    .line 225
    const-string v111, "fb_post_attachment"

    .line 226
    .line 227
    const-string v112, "receipt_data"

    .line 228
    .line 229
    const-string v113, "ad_type"

    .line 230
    .line 231
    const-string v114, "fb_content"

    .line 232
    .line 233
    const-string v115, "fb_content_id"

    .line 234
    .line 235
    const-string v116, "fb_description"

    .line 236
    .line 237
    const-string v117, "fb_level"

    .line 238
    .line 239
    const-string v118, "fb_max_rating_value"

    .line 240
    .line 241
    const-string v119, "fb_payment_info_available"

    .line 242
    .line 243
    const-string v120, "fb_registration_method"

    .line 244
    .line 245
    const-string v121, "fb_success"

    .line 246
    .line 247
    const-string v122, "pm"

    .line 248
    .line 249
    filled-new-array/range {v1 .. v124}, [Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    invoke-static {v0}, Lkotlin/collections/SetsKt;->hashSetOf([Ljava/lang/Object;)Ljava/util/HashSet;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    return-object v0
.end method
