package app.template.patches.digisport.misc.consent

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

internal const val DATA_BINDER_MAPPER = "Lro/rcsrds/digisport/DataBinderMapperImpl;"
internal const val USER_DATA_ADS_TAG = "layout/include_settings_user_data_ads_0"

// GoogleConsentUmp.loadConsentInfo(requestUpdate) (merged into a shared class and void since
// 1.1.16): posts STATUS.STARTED, then runs UMP's requestConsentInfoUpdate (and from its callback
// loadAndShowConsentFormIfRequired); it is the app's only reader of the "mConsentInformation"
// property name besides a UMP callback. MainActivity, the GDPR onboarding, its details screen and
// Settings call it and then observe the status LiveData. The STATUS enum keeps its constant names.
internal val loadConsentInfoFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Z"),
    filters = listOf(
        fieldAccess(name = "STARTED", opcode = Opcode.SGET_OBJECT),
        string("mConsentInformation"),
    ),
    custom = { method, _ -> method.implementation != null },
)

// The generated DataBinderMapperImpl creates the binding of include_settings_user_data_ads (the
// "Publicitate (Google Ad Manager)" heading, its paragraph and the "Actualizare date" consent
// button) right after it checks the layout tag. The binding class itself is renamed since 1.1.16.
internal val userDataAdsBindingFactoryFingerprint = Fingerprint(
    definingClass = DATA_BINDER_MAPPER,
    filters = listOf(
        string(USER_DATA_ADS_TAG),
        opcode(Opcode.NEW_INSTANCE, location = MatchAfterWithin(4)),
    ),
    custom = { method, _ -> method.implementation != null },
)
