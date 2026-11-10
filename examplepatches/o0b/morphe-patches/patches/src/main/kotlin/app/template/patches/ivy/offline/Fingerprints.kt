// recon 2026-11-09
package app.template.patches.ivy.offline

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

internal object FirebaseAppInitializeAppFingerprint : Fingerprint(
 name = "initializeApp",
 definingClass = "Lcom/google/firebase/FirebaseApp;",
 returnType = "Lcom/google/firebase/FirebaseApp;",
 accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
 parameters = listOf("Landroid/content/Context;"),
 filters = listOf(
  methodCall(definingClass = "Lcom/google/firebase/FirebaseOptions;", name = "fromResource"),
 ),
)

internal object FirebaseHelperClinitFingerprint : Fingerprint(
 name = "<clinit>",
 definingClass = "Lcom/stinger/ivy/firebase/FirebaseHelper;",
 returnType = "V",
 accessFlags = listOf(AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),
 parameters = listOf(),
 filters = listOf(
  methodCall(definingClass = "Lcom/google/firebase/database/FirebaseDatabase;", name = "getInstance"),
 ),
)

internal object FirebaseHelperGetHelpItemsFingerprint : Fingerprint(
 name = "getHelpItems",
 definingClass = "Lcom/stinger/ivy/firebase/FirebaseHelper;",
 returnType = "V",
 accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
 parameters = listOf("Lcom/stinger/ivy/firebase/FirebaseHelper\$DataListener;"),
 filters = listOf(
  methodCall(definingClass = "Lcom/google/firebase/database/DatabaseReference;", name = "addValueEventListener"),
 ),
)

internal object FirebaseHelperGetRssItemsFingerprint : Fingerprint(
 name = "getRssItems",
 definingClass = "Lcom/stinger/ivy/firebase/FirebaseHelper;",
 returnType = "V",
 accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
 parameters = listOf("Ljava/lang/String;", "Lcom/stinger/ivy/firebase/FirebaseHelper\$DataListener;"),
 filters = listOf(
  methodCall(definingClass = "Lcom/google/firebase/database/Query;", name = "addValueEventListener"),
 ),
)

internal object RssCrawlUpdateFeedFingerprint : Fingerprint(
 name = "updateFeed",
 definingClass = "Lcom/stinger/ivy/rss/RssCrawl;",
 returnType = "V",
 accessFlags = listOf(AccessFlags.PRIVATE),
 parameters = listOf("Ljava/lang/String;"),
 filters = listOf(
  methodCall(definingClass = "Lcom/crazyhitty/chdev/ks/rssmanager/RssReader;", name = "loadFeeds"),
 ),
)

internal object RssDialogHelperCustomDialogFingerprint : Fingerprint(
 name = "lambda\$customDialog\$5",
 definingClass = "Lcom/stinger/ivy/rss/RssDialogHelper;",
 returnType = "V",
 accessFlags = listOf(AccessFlags.STATIC, AccessFlags.SYNTHETIC),
 parameters = listOf(
  "Landroid/content/Context;",
  "Landroid/widget/EditText;",
  "Lcom/stinger/ivy/rss/RssDialogHelper\$RssDialogCallbacks;",
  "Landroid/content/DialogInterface;",
  "I",
 ),
 filters = listOf(
  methodCall(definingClass = "Lcom/crazyhitty/chdev/ks/rssmanager/RssReader;", name = "loadFeeds"),
 ),
)
