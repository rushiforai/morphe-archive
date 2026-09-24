package app.lchanc3.patches.jptt.image

import app.lchanc3.patches.jptt.shared.Constants.ARTICLE_URL_TASK_CLASS
import app.morphe.patcher.Fingerprint

/**
 * `ArticleUrlAsyncTask.doInBackground(String...)`, which turns a link found in an
 * article into the URL the preview and the full size viewer load. The bridge
 * method the generic superclass declares takes `Object[]`, so the parameter and
 * return types are what tell the two apart.
 */
internal object ArticleUrlDoInBackgroundFingerprint : Fingerprint(
    definingClass = ARTICLE_URL_TASK_CLASS,
    name = "doInBackground",
    returnType = "Ljava/lang/Runnable;",
    parameters = listOf("[Ljava/lang/String;"),
)
