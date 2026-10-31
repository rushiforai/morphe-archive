package app.template.patches.esexplorer

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.ES_EXPLORER_COMPATIBILITY
import app.template.patches.shared.returnEarly

/**
 * Neutralizes UMeng SDK analytics, crash reporting, device fingerprinting,
 * installation source telemetry, and ad action tracking.
 */
@Suppress("unused")
val esExplorerBlockTrackingPatch = bytecodePatch(
    name = "Block Tracking & Telemetry",
    description = "Neutralizes UMeng analytics, device identifiers, install source reporting, and ad event tracking.",
    default = true,
) {
    compatibleWith(ES_EXPLORER_COMPATIBILITY)

    execute {
        // 1. Prevent UMeng SDK initialization (blocks device token collection & background telemetry)
        runCatching {
            UMConfigureInitFingerprint.method.returnEarly()
        }
        runCatching {
            UMConfigurePreInitFingerprint.method.returnEarly()
        }

        // 2. Kill MobclickAgent analytics event dispatching
        runCatching {
            MobclickAgentOnEventFingerprint.method.returnEarly()
        }

        // 3. Disable FexApplication startup status telemetry & install source tracker
        runCatching {
            FexAppInitStatusReportFingerprint.method.returnEarly()
        }
        runCatching {
            FexAppReportInstallSourceFingerprint.method.returnEarly()
        }

        // 4. Kill Ad Action tracking and analytics reporting
        runCatching {
            AdReportActionFingerprint.method.returnEarly()
        }
        runCatching {
            AdReportGeneralFingerprint.method.returnEarly()
        }
    }
}

