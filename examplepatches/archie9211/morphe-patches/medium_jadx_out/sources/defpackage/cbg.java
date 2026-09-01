package defpackage;

import com.drew.metadata.exif.makernotes.NikonType2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public enum cbg implements k5g {
    REASON_UNSPECIFIED(0),
    SERVICE_CONNECTION_NOT_READY(1),
    GET_BUY_INTENT_ERROR(2),
    LAUNCH_BILLING_FLOW_TIMEOUT(3),
    LAUNCH_BILLING_FLOW_EXCEPTION(4),
    INVALID_BUNDLE(5),
    INVALID_REQUEST_CODE(6),
    INVALID_LISTENER(7),
    SUBSCRIPTIONS_NOT_SUPPORTED(8),
    SUBSCRIPTIONS_UPDATE_NOT_SUPPORTED(9),
    NULL_BUNDLE_IN_BROADCAST_RECEIVER(10),
    MISSING_LISTENER(11),
    MISSING_PURCHASE_DATA(12),
    INVALID_FIRST_PARTY_PURCHASE_DATA(13),
    MISSING_ALTERNATIVE_BILLING_LISTENER(14),
    MISSING_ALTERNATIVE_BILLING_USER_CHOICE_DATA(15),
    INVALID_ALTERNATIVE_BILLING_USER_CHOICE_DATA(16),
    EXTRA_PARAMS_NOT_SUPPORTED(17),
    MULTI_ITEM_NOT_SUPPORTED(18),
    PRODUCT_DETAILS_NOT_SUPPORTED(19),
    OFFER_ID_TOKEN_NOT_SUPPORTED(20),
    NULL_BUNDLE_IN_ACTIVITY_RESULT(21),
    BILLING_RESULT_RECEIVED_FROM_PHONESKY(22),
    EXECUTE_ASYNC_TIMEOUT(23),
    MISSING_RESULT_FROM_EXECUTE_ASYNC(24),
    EMPTY_PURCHASE_TOKEN(25),
    API_VERSION_NOT_V9(26),
    ACKNOWLEDGE_PURCHASE_SERVICE_CALL_EXCEPTION(27),
    CONSUME_PURCHASE_SERVICE_CALL_EXCEPTION(28),
    IN_APP_MESSAGE_NOT_SUPPORTED(29),
    CROSS_APP_NOT_SUPPORTED(30),
    GET_BILLING_CONFIG_NOT_SUPPORTED(31),
    QUERY_PRODUCT_DETAILS_WITH_SERIALIZED_DOCID_NOT_SUPPORTED(32),
    UNKNOWN_FEATURE(33),
    PRICE_CHANGE_CONFIRMATION_NOT_SUPPORTED(34),
    ONE_TIME_PRODUCT_NOT_SUPPORTED(35),
    BILLING_CLIENT_CONNECTING(36),
    BILLING_CLIENT_CLOSED(37),
    BILLING_SERVICE_BLOCKED(38),
    INVALID_PHONESKY_PACKAGE(39),
    INTENT_SERVICE_NOT_FOUND(40),
    IS_BILLING_SUPPORTED_SERVICE_CALL_EXCEPTION(41),
    GET_SKU_DETAILS_SERVICE_CALL_EXCEPTION(42),
    NULL_BUNDLE_FROM_GET_SKU_DETAILS_SERVICE_CALL(43),
    MISSING_DETAILS_LIST_IN_GET_SKU_DETAILS_RESPONSE(44),
    NULL_DETAILS_LIST_IN_GET_SKU_DETAILS_RESPONSE(45),
    ERROR_DECODING_SKU_DETAILS(46),
    EMPTY_SKU_LIST(47),
    EMPTY_SKU_TYPE(48),
    EMPTY_PRODUCT_TYPE(49),
    ERROR_DECODING_PURCHASE_DATA(50),
    GET_PURCHASE_SERVICE_CALL_EXCEPTION(51),
    INVALID_PURCHASES_BUNDLE(52),
    NULL_OWNED_ITEMS_LIST(53),
    zzac(54),
    NULL_SKUS_LIST(55),
    NULL_PURCHASES_LIST(56),
    NULL_SIGNATURES_LIST(57),
    GET_PURCHASE_HISTORY_SERVICE_CALL_EXCEPTION(58),
    QUERY_PRODUCT_DETAILS_WITH_DEVELOPER_SPECIFIED_ACCOUNT_NOT_SUPPORTED(59),
    PBL_FOR_PAYMENTS_GATEWAY_BUYFLOW_NOT_SUPPORTED(60),
    GET_BILLING_CONFIG_SERVICE_CALL_EXCEPTION(61),
    NULL_BUNDLE_FROM_GET_BILLING_CONFIG_SERVICE_CALL(62),
    MISSING_BILLING_CONFIG_IN_GET_BILLING_CONFIG_RESPONSE(63),
    ERROR_DECODING_BILLING_CONFIG_DATA(64),
    ALTERNATIVE_BILLING_ONLY_NOT_SUPPORTED(65),
    NULL_BUNDLE_FROM_IS_ALTERNATIVE_BILLING_ONLY_AVAILABLE_SERVICE_CALL(66),
    ERROR_DECODING_ALTERNATIVE_BILLING_ONLY_AVAILABILITY(67),
    IS_ALTERNATIVE_BILLING_ONLY_AVAILABLE_SERVICE_CALL_EXCEPTION(68),
    CREATE_ALTERNATIVE_BILLING_ONLY_TOKEN_SERVICE_CALL_EXCEPTION(69),
    NULL_BUNDLE_FROM_CREATE_ALTERNATIVE_BILLING_ONLY_TOKEN_SERVICE_CALL(70),
    ERROR_DECODING_ALTERNATIVE_BILLING_ONLY_REPORTING_DETAILS(71),
    NULL_BUNDLE_IN_ALTERNATIVE_BILLING_ONLY_INFORMATION_DIALOG_RECEIVER(72),
    SHOW_ALTERNATIVE_BILLING_ONLY_DIALOG_SERVICE_CALL_EXCEPTION(73),
    MISSING_ALTERNATIVE_BILLING_ONLY_DIALOG_RESULT_RECEIVER(74),
    RUNTIME_EXCEPTION_ON_LAUNCHING_ALTERNATIVE_BILLING_ONLY_DIALOG_INTENT(75),
    MISSING_USER_CHOICE_BILLING_LISTENER(76),
    NULL_BUNDLE_FROM_GET_BUY_INTENT_EXTRA_PARAMS_SERVICE_CALL(77),
    NULL_BUNDLE_FROM_GET_BUY_INTENT_TO_REPLACE_SKUS_SERVICE_CALL(78),
    NULL_BUNDLE_FROM_GET_BUY_INTENT_SERVICE_CALL(79),
    IS_EXTERNAL_PAYMENT_AVAILABLE_SERVICE_CALL_EXCEPTION(90),
    NULL_BUNDLE_FROM_IS_EXTERNAL_PAYMENT_AVAILABLE_SERVICE_CALL(91),
    EXTERNAL_OFFER_NOT_SUPPORTED(102),
    CREATE_EXTERNAL_PAYMENT_REPORTING_DETAILS_SERVICE_CALL_EXCEPTION(93),
    NULL_BUNDLE_FROM_CREATE_EXTERNAL_PAYMENT_REPORTING_DETAILS_SERVICE_CALL(94),
    ERROR_DECODING_EXTERNAL_OFFER_REPORTING_DETAILS(103),
    NULL_BUNDLE_IN_EXTERNAL_PAYMENT_INFORMATION_DIALOG_RECEIVER(96),
    SHOW_EXTERNAL_PAYMENT_DIALOG_SERVICE_CALL_EXCEPTION(97),
    RUNTIME_EXCEPTION_ON_LAUNCHING_EXTERNAL_PAYMENT_DIALOG_INTENT(98),
    IS_BILLING_SUPPORTED_REMOTE_EXCEPTION(99),
    IS_BILLING_SUPPORTED_DEAD_OBJECT_EXCEPTION(100),
    IS_BILLING_SUPPORTED_SECURITY_EXCEPTION(101),
    LICENSE_TESTER_BILLING_OVERRIDE(104),
    BILLING_OVERRIDE_SERVICE_CONNECTION_NOT_READY(PanasonicMakernoteDirectory.TAG_COUNTRY),
    BILLING_OVERRIDE_SERVICE_CALL_EXCEPTION(106),
    NULL_LISTENER_IN_DELEGATE_TO_BACKEND_CALLBACK(107),
    ERROR_DECODING_DELEGATE_TO_BACKEND_RESPONSE_DATA(108),
    zzaT(109),
    MISSING_BILLING_RESULT_IN_DELEGATE_TO_BACKEND_RESPONSE(110),
    ERROR_DECODING_DELEGATE_TO_BACKEND_BILLING_RESULT(PanasonicMakernoteDirectory.TAG_LANDMARK),
    MISSING_RESPONSE_DATA_IN_DELEGATE_TO_BACKEND_RESPONSE(PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION),
    BILLING_OVERRIDE_SERVICE_CALL_TIMEOUT(113),
    BILLING_OVERRIDE_SERVICE_FALLBACK_ERROR(114),
    MULTI_ITEM_WITH_SEASON_PASS_NOT_SUPPORTED(115),
    BILLING_CLIENT_TRANSITIONED_OUT_OF_CONNECTING(116),
    SERVICE_CALL_EXCEPTION(117),
    SERVICE_RESET_TO_NULL(118),
    INVALID_BILLING_FLOW_PARAMS(PanasonicMakernoteDirectory.TAG_BURST_SPEED),
    SERVICE_DISCONNECTED(120),
    BINDING_DIED(PanasonicMakernoteDirectory.TAG_INTELLIGENT_D_RANGE),
    FIRST_PARTY_CLIENT_MISSING_1P_LISTENER(122),
    FIRST_PARTY_CLIENT_MISSING_3P_LISTENER(123),
    NULL_DATA_WITH_OK_RESULT_CODE_IN_PROXY_BILLING_ACTIVITY_RESULT(PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH),
    NULL_DATA_WITH_CANCELLED_RESULT_CODE_IN_PROXY_BILLING_ACTIVITY_RESULT(125),
    NULL_DATA_WITH_PLAY_CANCELED_RESULT_CODE(145),
    NULL_DATA_WITH_PLAY_CANCELED_WITHOUT_COMPLETE_ACTION_RESULT_CODE(146),
    NULL_DATA_WITH_OTHER_RESULT_CODE_IN_PROXY_BILLING_ACTIVITY_RESULT(ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER),
    NULL_DATA_WITH_ON_CREATE_RUNTIME_EXCEPTION_RESULT_CODE(147),
    AUTO_PAY_NOT_SUPPORTED(127),
    BILLING_PROGRAM_NOT_SUPPORTED(128),
    LAUNCH_EXTERNAL_OFFER_FLOW_NOT_SUPPORTED(129),
    NULL_BUNDLE_RETURNED_BY_PHONESKY(NikonType2MakernoteDirectory.TAG_ADAPTER),
    LAUNCH_EXTERNAL_LINK_NOT_SUPPORTED(131),
    RUNTIME_EXCEPTION_WHEN_LAUNCHING_INTENT(NikonType2MakernoteDirectory.TAG_LENS),
    NULL_INTENT_RETURNED_BY_PHONESKY(NikonType2MakernoteDirectory.TAG_MANUAL_FOCUS_DISTANCE),
    ERROR_IN_ACTIVITY_RESULT(NikonType2MakernoteDirectory.TAG_DIGITAL_ZOOM),
    MISSING_RESPONSE_CODE_IN_PHONESKY_BUNDLE(NikonType2MakernoteDirectory.TAG_FLASH_USED),
    BILLING_API_VERSION_NOT_SET_IN_BUNDLE(136),
    zzby(137),
    NON_OK_CODE_RETURNED_BY_PHONESKY(138),
    INITIALIZE_SERVICE_CALL_EXCEPTION(NikonType2MakernoteDirectory.TAG_LENS_STOPS),
    INITIALIZE_DEAD_OBJECT_EXCEPTION(140),
    INITIALIZE_SECURITY_EXCEPTION(141),
    INITIALIZE_REMOTE_EXCEPTION(142),
    RUNTIME_EXCEPTION_ON_LAUNCH_EXTERNAL_LINK_INTENT(143),
    NULL_BUNDLE_IN_LAUNCH_EXTERNAL_LINK_RESULT_RECEIVER(144),
    INTENT_SENDER_EXCEPTION(148),
    INCLUDE_SUSPENDED_SUBSCRIPTIONS_NOT_SUPPORTED(149),
    PLAY_STORE_ON_CREATE_RUNTIME_EXCEPTION(150),
    MISSING_DEVELOPER_PROVIDED_BILLING_LISTENER(151),
    NULL_DEVELOPER_MANAGED_BILLING_LISTENER(152),
    PLAY_STORE_APP_BLOCKED(153),
    GIFT_CODE_PURCHASE_NOT_SUPPORTED(154),
    LAUNCH_SUBSCRIPTION_MANAGEMENT_ACTION_FLOW_EXCEPTION(NikonType2MakernoteDirectory.TAG_UNKNOWN_10),
    LAUNCH_SUBSCRIPTION_MANAGEMENT_ACTION_FLOW_NOT_SUPPORTED(NikonType2MakernoteDirectory.TAG_SCENE_ASSIST),
    FEATURE_NOT_SUPPORTED(157);

    public final int a;

    cbg(int i) {
        this.a = i;
    }

    public static cbg zzb(int i) {
        if (i == 90) {
            return IS_EXTERNAL_PAYMENT_AVAILABLE_SERVICE_CALL_EXCEPTION;
        }
        if (i == 91) {
            return NULL_BUNDLE_FROM_IS_EXTERNAL_PAYMENT_AVAILABLE_SERVICE_CALL;
        }
        if (i == 93) {
            return CREATE_EXTERNAL_PAYMENT_REPORTING_DETAILS_SERVICE_CALL_EXCEPTION;
        }
        if (i == 94) {
            return NULL_BUNDLE_FROM_CREATE_EXTERNAL_PAYMENT_REPORTING_DETAILS_SERVICE_CALL;
        }
        switch (i) {
            case 0:
                return REASON_UNSPECIFIED;
            case 1:
                return SERVICE_CONNECTION_NOT_READY;
            case 2:
                return GET_BUY_INTENT_ERROR;
            case 3:
                return LAUNCH_BILLING_FLOW_TIMEOUT;
            case 4:
                return LAUNCH_BILLING_FLOW_EXCEPTION;
            case 5:
                return INVALID_BUNDLE;
            case 6:
                return INVALID_REQUEST_CODE;
            case 7:
                return INVALID_LISTENER;
            case 8:
                return SUBSCRIPTIONS_NOT_SUPPORTED;
            case 9:
                return SUBSCRIPTIONS_UPDATE_NOT_SUPPORTED;
            case 10:
                return NULL_BUNDLE_IN_BROADCAST_RECEIVER;
            case 11:
                return MISSING_LISTENER;
            case 12:
                return MISSING_PURCHASE_DATA;
            case 13:
                return INVALID_FIRST_PARTY_PURCHASE_DATA;
            case 14:
                return MISSING_ALTERNATIVE_BILLING_LISTENER;
            case 15:
                return MISSING_ALTERNATIVE_BILLING_USER_CHOICE_DATA;
            case 16:
                return INVALID_ALTERNATIVE_BILLING_USER_CHOICE_DATA;
            case 17:
                return EXTRA_PARAMS_NOT_SUPPORTED;
            case 18:
                return MULTI_ITEM_NOT_SUPPORTED;
            case 19:
                return PRODUCT_DETAILS_NOT_SUPPORTED;
            case 20:
                return OFFER_ID_TOKEN_NOT_SUPPORTED;
            case 21:
                return NULL_BUNDLE_IN_ACTIVITY_RESULT;
            case 22:
                return BILLING_RESULT_RECEIVED_FROM_PHONESKY;
            case 23:
                return EXECUTE_ASYNC_TIMEOUT;
            case 24:
                return MISSING_RESULT_FROM_EXECUTE_ASYNC;
            case 25:
                return EMPTY_PURCHASE_TOKEN;
            case 26:
                return API_VERSION_NOT_V9;
            case 27:
                return ACKNOWLEDGE_PURCHASE_SERVICE_CALL_EXCEPTION;
            case 28:
                return CONSUME_PURCHASE_SERVICE_CALL_EXCEPTION;
            case 29:
                return IN_APP_MESSAGE_NOT_SUPPORTED;
            case 30:
                return CROSS_APP_NOT_SUPPORTED;
            case 31:
                return GET_BILLING_CONFIG_NOT_SUPPORTED;
            case 32:
                return QUERY_PRODUCT_DETAILS_WITH_SERIALIZED_DOCID_NOT_SUPPORTED;
            case 33:
                return UNKNOWN_FEATURE;
            case 34:
                return PRICE_CHANGE_CONFIRMATION_NOT_SUPPORTED;
            case 35:
                return ONE_TIME_PRODUCT_NOT_SUPPORTED;
            case 36:
                return BILLING_CLIENT_CONNECTING;
            case 37:
                return BILLING_CLIENT_CLOSED;
            case 38:
                return BILLING_SERVICE_BLOCKED;
            case 39:
                return INVALID_PHONESKY_PACKAGE;
            case 40:
                return INTENT_SERVICE_NOT_FOUND;
            case 41:
                return IS_BILLING_SUPPORTED_SERVICE_CALL_EXCEPTION;
            case 42:
                return GET_SKU_DETAILS_SERVICE_CALL_EXCEPTION;
            case 43:
                return NULL_BUNDLE_FROM_GET_SKU_DETAILS_SERVICE_CALL;
            case 44:
                return MISSING_DETAILS_LIST_IN_GET_SKU_DETAILS_RESPONSE;
            case 45:
                return NULL_DETAILS_LIST_IN_GET_SKU_DETAILS_RESPONSE;
            case 46:
                return ERROR_DECODING_SKU_DETAILS;
            case 47:
                return EMPTY_SKU_LIST;
            case 48:
                return EMPTY_SKU_TYPE;
            case 49:
                return EMPTY_PRODUCT_TYPE;
            case 50:
                return ERROR_DECODING_PURCHASE_DATA;
            case 51:
                return GET_PURCHASE_SERVICE_CALL_EXCEPTION;
            case 52:
                return INVALID_PURCHASES_BUNDLE;
            case 53:
                return NULL_OWNED_ITEMS_LIST;
            case 54:
                return zzac;
            case 55:
                return NULL_SKUS_LIST;
            case 56:
                return NULL_PURCHASES_LIST;
            case 57:
                return NULL_SIGNATURES_LIST;
            case 58:
                return GET_PURCHASE_HISTORY_SERVICE_CALL_EXCEPTION;
            case 59:
                return QUERY_PRODUCT_DETAILS_WITH_DEVELOPER_SPECIFIED_ACCOUNT_NOT_SUPPORTED;
            case PanasonicMakernoteDirectory.TAG_PROGRAM_ISO /* 60 */:
                return PBL_FOR_PAYMENTS_GATEWAY_BUYFLOW_NOT_SUPPORTED;
            case 61:
                return GET_BILLING_CONFIG_SERVICE_CALL_EXCEPTION;
            case 62:
                return NULL_BUNDLE_FROM_GET_BILLING_CONFIG_SERVICE_CALL;
            case 63:
                return MISSING_BILLING_CONFIG_IN_GET_BILLING_CONFIG_RESPONSE;
            case 64:
                return ERROR_DECODING_BILLING_CONFIG_DATA;
            case 65:
                return ALTERNATIVE_BILLING_ONLY_NOT_SUPPORTED;
            case 66:
                return NULL_BUNDLE_FROM_IS_ALTERNATIVE_BILLING_ONLY_AVAILABLE_SERVICE_CALL;
            case 67:
                return ERROR_DECODING_ALTERNATIVE_BILLING_ONLY_AVAILABILITY;
            case 68:
                return IS_ALTERNATIVE_BILLING_ONLY_AVAILABLE_SERVICE_CALL_EXCEPTION;
            case PanasonicMakernoteDirectory.TAG_BRACKET_SETTINGS /* 69 */:
                return CREATE_ALTERNATIVE_BILLING_ONLY_TOKEN_SERVICE_CALL_EXCEPTION;
            case 70:
                return NULL_BUNDLE_FROM_CREATE_ALTERNATIVE_BILLING_ONLY_TOKEN_SERVICE_CALL;
            case PanasonicMakernoteDirectory.TAG_WB_ADJUST_GM /* 71 */:
                return ERROR_DECODING_ALTERNATIVE_BILLING_ONLY_REPORTING_DETAILS;
            case 72:
                return NULL_BUNDLE_IN_ALTERNATIVE_BILLING_ONLY_INFORMATION_DIALOG_RECEIVER;
            case 73:
                return SHOW_ALTERNATIVE_BILLING_ONLY_DIALOG_SERVICE_CALL_EXCEPTION;
            case 74:
                return MISSING_ALTERNATIVE_BILLING_ONLY_DIALOG_RESULT_RECEIVER;
            case 75:
                return RUNTIME_EXCEPTION_ON_LAUNCHING_ALTERNATIVE_BILLING_ONLY_DIALOG_INTENT;
            case 76:
                return MISSING_USER_CHOICE_BILLING_LISTENER;
            case PanasonicMakernoteDirectory.TAG_AF_POINT_POSITION /* 77 */:
                return NULL_BUNDLE_FROM_GET_BUY_INTENT_EXTRA_PARAMS_SERVICE_CALL;
            case 78:
                return NULL_BUNDLE_FROM_GET_BUY_INTENT_TO_REPLACE_SKUS_SERVICE_CALL;
            case 79:
                return NULL_BUNDLE_FROM_GET_BUY_INTENT_SERVICE_CALL;
            default:
                switch (i) {
                    case 96:
                        return NULL_BUNDLE_IN_EXTERNAL_PAYMENT_INFORMATION_DIALOG_RECEIVER;
                    case PanasonicMakernoteDirectory.TAG_FACE_RECOGNITION_INFO /* 97 */:
                        return SHOW_EXTERNAL_PAYMENT_DIALOG_SERVICE_CALL_EXCEPTION;
                    case 98:
                        return RUNTIME_EXCEPTION_ON_LAUNCHING_EXTERNAL_PAYMENT_DIALOG_INTENT;
                    case PanasonicMakernoteDirectory.TAG_RECOGNIZED_FACE_FLAGS /* 99 */:
                        return IS_BILLING_SUPPORTED_REMOTE_EXCEPTION;
                    case 100:
                        return IS_BILLING_SUPPORTED_DEAD_OBJECT_EXCEPTION;
                    case 101:
                        return IS_BILLING_SUPPORTED_SECURITY_EXCEPTION;
                    case 102:
                        return EXTERNAL_OFFER_NOT_SUPPORTED;
                    case 103:
                        return ERROR_DECODING_EXTERNAL_OFFER_REPORTING_DETAILS;
                    case 104:
                        return LICENSE_TESTER_BILLING_OVERRIDE;
                    case PanasonicMakernoteDirectory.TAG_COUNTRY /* 105 */:
                        return BILLING_OVERRIDE_SERVICE_CONNECTION_NOT_READY;
                    case 106:
                        return BILLING_OVERRIDE_SERVICE_CALL_EXCEPTION;
                    case 107:
                        return NULL_LISTENER_IN_DELEGATE_TO_BACKEND_CALLBACK;
                    case 108:
                        return ERROR_DECODING_DELEGATE_TO_BACKEND_RESPONSE_DATA;
                    case 109:
                        return zzaT;
                    case 110:
                        return MISSING_BILLING_RESULT_IN_DELEGATE_TO_BACKEND_RESPONSE;
                    case PanasonicMakernoteDirectory.TAG_LANDMARK /* 111 */:
                        return ERROR_DECODING_DELEGATE_TO_BACKEND_BILLING_RESULT;
                    case PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION /* 112 */:
                        return MISSING_RESPONSE_DATA_IN_DELEGATE_TO_BACKEND_RESPONSE;
                    case 113:
                        return BILLING_OVERRIDE_SERVICE_CALL_TIMEOUT;
                    case 114:
                        return BILLING_OVERRIDE_SERVICE_FALLBACK_ERROR;
                    case 115:
                        return MULTI_ITEM_WITH_SEASON_PASS_NOT_SUPPORTED;
                    case 116:
                        return BILLING_CLIENT_TRANSITIONED_OUT_OF_CONNECTING;
                    case 117:
                        return SERVICE_CALL_EXCEPTION;
                    case 118:
                        return SERVICE_RESET_TO_NULL;
                    case PanasonicMakernoteDirectory.TAG_BURST_SPEED /* 119 */:
                        return INVALID_BILLING_FLOW_PARAMS;
                    case 120:
                        return SERVICE_DISCONNECTED;
                    case PanasonicMakernoteDirectory.TAG_INTELLIGENT_D_RANGE /* 121 */:
                        return BINDING_DIED;
                    case 122:
                        return FIRST_PARTY_CLIENT_MISSING_1P_LISTENER;
                    case 123:
                        return FIRST_PARTY_CLIENT_MISSING_3P_LISTENER;
                    case PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH /* 124 */:
                        return NULL_DATA_WITH_OK_RESULT_CODE_IN_PROXY_BILLING_ACTIVITY_RESULT;
                    case 125:
                        return NULL_DATA_WITH_CANCELLED_RESULT_CODE_IN_PROXY_BILLING_ACTIVITY_RESULT;
                    case ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER /* 126 */:
                        return NULL_DATA_WITH_OTHER_RESULT_CODE_IN_PROXY_BILLING_ACTIVITY_RESULT;
                    case 127:
                        return AUTO_PAY_NOT_SUPPORTED;
                    case 128:
                        return BILLING_PROGRAM_NOT_SUPPORTED;
                    case 129:
                        return LAUNCH_EXTERNAL_OFFER_FLOW_NOT_SUPPORTED;
                    case NikonType2MakernoteDirectory.TAG_ADAPTER /* 130 */:
                        return NULL_BUNDLE_RETURNED_BY_PHONESKY;
                    case 131:
                        return LAUNCH_EXTERNAL_LINK_NOT_SUPPORTED;
                    case NikonType2MakernoteDirectory.TAG_LENS /* 132 */:
                        return RUNTIME_EXCEPTION_WHEN_LAUNCHING_INTENT;
                    case NikonType2MakernoteDirectory.TAG_MANUAL_FOCUS_DISTANCE /* 133 */:
                        return NULL_INTENT_RETURNED_BY_PHONESKY;
                    case NikonType2MakernoteDirectory.TAG_DIGITAL_ZOOM /* 134 */:
                        return ERROR_IN_ACTIVITY_RESULT;
                    case NikonType2MakernoteDirectory.TAG_FLASH_USED /* 135 */:
                        return MISSING_RESPONSE_CODE_IN_PHONESKY_BUNDLE;
                    case 136:
                        return BILLING_API_VERSION_NOT_SET_IN_BUNDLE;
                    case 137:
                        return zzby;
                    case 138:
                        return NON_OK_CODE_RETURNED_BY_PHONESKY;
                    case NikonType2MakernoteDirectory.TAG_LENS_STOPS /* 139 */:
                        return INITIALIZE_SERVICE_CALL_EXCEPTION;
                    case 140:
                        return INITIALIZE_DEAD_OBJECT_EXCEPTION;
                    case 141:
                        return INITIALIZE_SECURITY_EXCEPTION;
                    case 142:
                        return INITIALIZE_REMOTE_EXCEPTION;
                    case 143:
                        return RUNTIME_EXCEPTION_ON_LAUNCH_EXTERNAL_LINK_INTENT;
                    case 144:
                        return NULL_BUNDLE_IN_LAUNCH_EXTERNAL_LINK_RESULT_RECEIVER;
                    case 145:
                        return NULL_DATA_WITH_PLAY_CANCELED_RESULT_CODE;
                    case 146:
                        return NULL_DATA_WITH_PLAY_CANCELED_WITHOUT_COMPLETE_ACTION_RESULT_CODE;
                    case 147:
                        return NULL_DATA_WITH_ON_CREATE_RUNTIME_EXCEPTION_RESULT_CODE;
                    case 148:
                        return INTENT_SENDER_EXCEPTION;
                    case 149:
                        return INCLUDE_SUSPENDED_SUBSCRIPTIONS_NOT_SUPPORTED;
                    case 150:
                        return PLAY_STORE_ON_CREATE_RUNTIME_EXCEPTION;
                    case 151:
                        return MISSING_DEVELOPER_PROVIDED_BILLING_LISTENER;
                    case 152:
                        return NULL_DEVELOPER_MANAGED_BILLING_LISTENER;
                    case 153:
                        return PLAY_STORE_APP_BLOCKED;
                    case 154:
                        return GIFT_CODE_PURCHASE_NOT_SUPPORTED;
                    case NikonType2MakernoteDirectory.TAG_UNKNOWN_10 /* 155 */:
                        return LAUNCH_SUBSCRIPTION_MANAGEMENT_ACTION_FLOW_EXCEPTION;
                    case NikonType2MakernoteDirectory.TAG_SCENE_ASSIST /* 156 */:
                        return LAUNCH_SUBSCRIPTION_MANAGEMENT_ACTION_FLOW_NOT_SUPPORTED;
                    case 157:
                        return FEATURE_NOT_SUPPORTED;
                    default:
                        return null;
                }
        }
    }

    @Override // java.lang.Enum
    public final String toString() {
        return Integer.toString(this.a);
    }

    @Override // defpackage.k5g
    public final int zza() {
        return this.a;
    }
}
