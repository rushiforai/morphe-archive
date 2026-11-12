package app.template.patches.easylauncher.misc.reminder

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string

// The framework call that answers "is this app the default home app".
internal const val ROLE_MANAGER_IS_ROLE_HELD = "isRoleHeld"
internal const val ROLE_MANAGER = "Landroid/app/role/RoleManager;"

// HomeRoleReminderWorker's suspend work method (the worker class is kept for WorkManager). It
// asks the home role helper (R8-renamed, abstract) whether the role is available and then whether
// it is held; when held it cancels the "set as default launcher" notification and returns.
internal object HomeRoleReminderWorkFingerprint : Fingerprint(
    definingClass = "Leasy/launcher/role/HomeRoleReminderWorker;",
    name = "doWork",
    returnType = "Ljava/lang/Object;",
    // The Continuation parameter is R8-renamed since 1.10.31 (Leasy/launcher/xo2;), so only its kind is pinned.
    parameters = listOf("L"),
    filters = listOf(
        string("doWork: Home role is already held, cancelling the reminder", StringComparisonType.STARTS_WITH),
    ),
)
