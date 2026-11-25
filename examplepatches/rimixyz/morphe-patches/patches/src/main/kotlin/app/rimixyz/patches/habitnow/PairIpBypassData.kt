package app.rimixyz.patches.habitnow

/**
 * Assinaturas `Method.toGenericString()` dos 9 campos `public static final`
 * que nao podem ser escritos pelo Object.restore() de outra classe.
 * Cada entrada e injetada no <clinit> da propria classe declarante.
 * Dados capturados do HabitNow 2.5.5 (versionCode 229).
 */
internal val FINAL_METHOD_FIELDS: Map<String, List<Pair<String, String>>> = mapOf(
    "Lca2;" to listOf(
        "a" to "public final synchronized void java.lang.Throwable.addSuppressed(java.lang.Throwable)",
    ),
    "Lh30;" to listOf(
        "a" to "public void java.util.concurrent.ScheduledThreadPoolExecutor.setRemoveOnCancelPolicy(boolean)",
    ),
    "Lnt4;" to listOf(
        "a" to "public static java.lang.String android.os.SystemProperties.get(java.lang.String,java.lang.String)",
    ),
    "Lqp0;" to listOf(
        "a" to "void android.widget.AbsListView.positionSelector(int,android.view.View,boolean,float,float)",
        "b" to "void android.widget.AdapterView.setSelectedPositionInt(int)",
        "c" to "void android.widget.AdapterView.setNextSelectedPositionInt(int)",
    ),
    "Lvo0;" to listOf(
        "b" to "public android.graphics.Insets android.graphics.drawable.Drawable.getOpticalInsets()",
    ),
    "Lx44;" to listOf(
        "a" to "public abstract int android.app.job.JobScheduler.scheduleAsPackage(android.app.job.JobInfo,java.lang.String,int,java.lang.String)",
        "b" to "public static int android.os.UserHandle.myUserId()",
    ),
)
