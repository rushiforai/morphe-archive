package app.zonghome.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private val onboardingScreens=listOf("FragRegistration","FragPin","FragLanguage","FragProfile") + listOf(
            "FragBiometricLogin","FragCardVerification","FragCreatePin","FragMobileVerification","FragSignUpDetails",
            "FragChangePin","FragForgotPin","FragOtp","FragResetPin","FragSignUpBoarding"
        ).map { "zWallet/$it" }

internal val onboardingUiHookPatch = bytecodePatch {
    dependsOn(sharedExtensionPatch)
    execute {
        for(screen in onboardingScreens) {
            Fingerprint(definingClass="Lcom/zong/customercare/view/ui/$screen;",name="onViewCreated",
                returnType="V",parameters=listOf("Landroid/view/View;","Landroid/os/Bundle;"))
                .method.addInstruction(0,
                    "invoke-static/range {p1 .. p1}, Lapp/zonghome/extension/OnboardingStyling;->attach(Landroid/view/View;)V")
        }
    }
}

internal val otpPasteHookPatch = bytecodePatch {
    dependsOn(sharedExtensionPatch)
    execute {
        if (CustomizationSettings.enabled("otpPaste")) for(screen in onboardingScreens.filter { it!="FragProfile" }) {
            val create=Fingerprint(definingClass="Lcom/zong/customercare/view/ui/$screen;",name="onCreateView",
                returnType="Landroid/view/View;",parameters=listOf("Landroid/view/LayoutInflater;","Landroid/view/ViewGroup;","Landroid/os/Bundle;")).method
            check(create.implementation!!.registerCount<=255) { "Unsupported inflater parameter register: $screen" }
            create.addInstructions(0,"invoke-static/range {p1 .. p1}, Lapp/zonghome/extension/OtpPasteEditText;->wrap(Landroid/view/LayoutInflater;)Landroid/view/LayoutInflater;\nmove-result-object p1")
        }
    }
}

internal val skipPersonalDetailsPatch = bytecodePatch {
    dependsOn(sharedExtensionPatch)
    execute {
        if(!CustomizationSettings.enabled("skipPersonalDetails"))return@execute
        val profile="Lcom/zong/customercare/view/ui/FragProfile;"
        Fingerprint(definingClass=profile,name="access\$goToHome",returnType="V",parameters=listOf(profile)).method
        Fingerprint(definingClass="Lapp/zonghome/extension/ProfileSkip;",name="nativeHome",
            returnType="V",parameters=listOf("Ljava/lang/Object;")).method.addInstructions(0,
                "check-cast p0, $profile\ninvoke-static/range {p0 .. p0}, $profile->access\$goToHome($profile)V\nreturn-void")
        Fingerprint(definingClass=profile,name="onViewCreated",returnType="V",
            parameters=listOf("Landroid/view/View;","Landroid/os/Bundle;")).method.addInstruction(0,
                "invoke-static/range {p0 .. p1}, Lapp/zonghome/extension/ProfileSkip;->attach(Ljava/lang/Object;Landroid/view/View;)V")
    }
}
