package app.template.patches.mhphysique

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.pairip.disablePairIpLicenseCheckPatch
import app.template.patches.shared.Constants.MH_PHYSIQUE_COMPATIBILITY
import app.template.patches.shared.replaceTextOnce

private const val MH_MAIN_JS_PATH = "assets/public/main.3386af3d1c878129.js"
private const val MH_PREMIUM_EXPIRY = "2035-07-09T00:00:00.000Z"

private val mhPhysiqueUnlockResourcePatch = rawResourcePatch {
    execute {
        val mainJs = get(MH_MAIN_JS_PATH)
        if (!mainJs.exists()) {
            throw PatchException("$MH_MAIN_JS_PATH not found in the APK.")
        }

        val patchedMainJs = mainJs.readBytes()
            .replaceTextOnce(
                path = MH_MAIN_JS_PATH,
                search = "isWelcomePhaseDone(){return this.plan&&this.plan.welcomePhase===nt.Gp.Done}",
                replacement = "isWelcomePhaseDone(){return this.plan&&this.plan.welcomePhase===nt.Gp.Done&&this.plan.workouts&&this.plan.workouts.length>0}"
            )
            .replaceTextOnce(
                path = MH_MAIN_JS_PATH,
                search = "getPageByWelcomePhase(){return this.auth.getAuthRole()!=ns.lP.Unknown||this.coachClaim.hasPendingClaimToken()?this.plan&&this.plan.welcomePhase!==nt.Gp.Intro?this.plan.welcomePhase===nt.Gp.Intake||this.plan.welcomePhase===nt.Gp.CoachedIntake?Dh:this.plan.welcomePhase===nt.Gp.AwaitingCoachFinalize?m0e:fl:ZY:w2}",
                replacement = "getPageByWelcomePhase(){return this.auth.getAuthRole()!=ns.lP.Unknown||this.coachClaim.hasPendingClaimToken()?this.plan&&this.plan.welcomePhase!==nt.Gp.Intro?this.plan.welcomePhase===nt.Gp.Intake||this.plan.welcomePhase===nt.Gp.CoachedIntake||this.plan.welcomePhase===nt.Gp.Done&&(!this.plan.workouts||!this.plan.workouts.length)?Dh:this.plan.welcomePhase===nt.Gp.AwaitingCoachFinalize?m0e:fl:ZY:w2}"
            )
            .replaceTextOnce(
                path = MH_MAIN_JS_PATH,
                search = "let ae=await this.cloudFunctionsService.solveWorkoutsAsync(H);if(ae.error)throw new Error(`Can't solve workout: ${'$'}{ae.error}`);",
                replacement = """let ae=await this.cloudFunctionsService.solveWorkoutsAsync(H).catch(ge=>({error:String(ge?.message||ge)}));if(ae.error&&String(ae.error).toLowerCase().includes("paid users only"))ae={days:[[{subSlotId:"${'$'}squat",sets:3,trainingLevel:Yn.X2.Novice,intensities:{[Yn.X2.Novice]:{[nt.CY.Initial]:65}}},{subSlotId:"${'$'}bench_press",sets:3,trainingLevel:Yn.X2.Novice,intensities:{[Yn.X2.Novice]:{[nt.CY.Initial]:65}}},{subSlotId:"${'$'}rdl",sets:3,trainingLevel:Yn.X2.Novice,intensities:{[Yn.X2.Novice]:{[nt.CY.Initial]:65}}},{subSlotId:"${'$'}chin_up",sets:3,trainingLevel:Yn.X2.Novice,intensities:{[Yn.X2.Novice]:{[nt.CY.Initial]:65}}},{subSlotId:"${'$'}ohp",sets:3,trainingLevel:Yn.X2.Novice,intensities:{[Yn.X2.Novice]:{[nt.CY.Initial]:65}}}]],trainingLevels:{${'$'}bench_press:Yn.X2.Novice,${'$'}chin_up:Yn.X2.Novice,${'$'}ohp:Yn.X2.Novice,${'$'}rdl:Yn.X2.Novice,${'$'}squat:Yn.X2.Novice},trainingVolumeWeeklyAvg:15};if(ae.error)throw new Error(`Can't solve workout: ${'$'}{ae.error}`);"""
            )
            .replaceTextOnce(
                path = MH_MAIN_JS_PATH,
                search = "isFullAppUnlocked(){return this.isWelcomePhaseDone()&&this.auth.getAuthRole()>=ns.lP.Paid}",
                replacement = "isFullAppUnlocked(){return this.isWelcomePhaseDone()}"
            )
            .replaceTextOnce(
                path = MH_MAIN_JS_PATH,
                search = """getAuthRoleAndExpiry(){let r=Yt.DateTime.utc(),e=this.couch;if(null==e||!e.roles||0===e.roles.length)return!this.settings.cachedRoleExpiry_utc||"never"===this.settings.cachedRoleExpiry_utc||Yt.DateTime.fromISO(this.settings.cachedRoleExpiry_utc).plus({days:2})>r?{role:this.settings.cachedRole,expiry_utc:this.settings.cachedRoleExpiry_utc}:{role:ns.lP.Unknown,expiry_utc:"never",subscriptionExpired:!0};let n=(0,ns.ln)(e.roles);return e.subscriptionStatus===Ro.Waiting&&(n=ns.lP.Unknown),(this.settings.cachedRole!==n||this.settings.cachedRoleExpiry_utc!==e.licenseExpires_utc)&&(this.settings.cachedRole=n,this.settings.cachedRoleExpiry_utc=e.licenseExpires_utc,this.settings.saveAsync()),this.settings.cachedRole===ns.lP.Paid&&Yt.DateTime.fromISO(this.settings.cachedRoleExpiry_utc)<r?{role:ns.lP.Unknown,expiry_utc:"never",subscriptionExpired:!0}:{role:this.settings.cachedRole,expiry_utc:this.settings.cachedRoleExpiry_utc}}""",
                replacement = """getAuthRoleAndExpiry(){return{role:ns.lP.Paid,expiry_utc:"$MH_PREMIUM_EXPIRY"}}"""
            )
            .replaceTextOnce(
                path = MH_MAIN_JS_PATH,
                search = "getAuthRole(){return this.getAuthRoleAndExpiry().role}",
                replacement = "getAuthRole(){return ns.lP.Paid}"
            )
            .replaceTextOnce(
                path = MH_MAIN_JS_PATH,
                search = "getCanCancelSubscription(){return this.getAuthRole()>=ns.lP.Paid&&this.couch&&this.couch.canCancelSubscription}",
                replacement = "getCanCancelSubscription(){return!0}"
            )
            .replaceTextOnce(
                path = MH_MAIN_JS_PATH,
                search = "getCanResumeSubscription(){return this.couch&&this.couch.subscriptionStatus===Ro.Suspended}",
                replacement = "getCanResumeSubscription(){return!1}"
            )
            .replaceTextOnce(
                path = MH_MAIN_JS_PATH,
                search = "getSubscriptionStatus(){return!this.couch||this.couch.licenseExpires_utc<Yt.DateTime.utc().toISO()?Ro.None:this.couch.subscriptionStatus??Ro.None}",
                replacement = "getSubscriptionStatus(){return Ro.Active}"
            )
            .replaceTextOnce(
                path = MH_MAIN_JS_PATH,
                search = "this.canCancelSubscription=this.subManager.canCancelSubscription",
                replacement = "this.canCancelSubscription=!0"
            )

        mainJs.writeBytes(patchedMainJs)
    }
}

@Suppress("unused")
val mhPhysiqueUnlockPremiumPatch = bytecodePatch(
    name = "Unlock MH Physique Premium",
    description = "Unlock all Paid features",
    default = true
) {
    compatibleWith(MH_PHYSIQUE_COMPATIBILITY)
    dependsOn(mhPhysiqueUnlockResourcePatch, disablePairIpLicenseCheckPatch)
}
