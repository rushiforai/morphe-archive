package xyz.urro.transit
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

// Grants remain per Transit UID and must be explicitly enabled by the user in Android Settings.
// No ACTIVITY_RECOGNITION permission: this integration does not consume that API.
internal val motionManifest = resourcePatch {
 execute {
  document("AndroidManifest.xml").use { d ->
   val android="http://schemas.android.com/apk/res/android"
   val root=d.documentElement
   for(p in listOf("android.permission.SYSTEM_ALERT_WINDOW","android.permission.PACKAGE_USAGE_STATS")){
    val all=d.getElementsByTagName("uses-permission")
    if((0 until all.length).none{(all.item(it) as Element).getAttributeNS(android,"name")==p}){
     val e=d.createElement("uses-permission");e.setAttributeNS(android,"android:name",p);root.appendChild(e)
    }
   }
   val app=d.getElementsByTagName("application").item(0)
   val activity=d.createElement("activity")
   activity.setAttributeNS(android,"android:name","xyz.urro.transit.RelayActivity")
   activity.setAttributeNS(android,"android:exported","false")
   activity.setAttributeNS(android,"android:excludeFromRecents","true")
   activity.setAttributeNS(android,"android:taskAffinity","com.thetransitapp.droid.morphe.command")
   activity.setAttributeNS(android,"android:theme","@android:style/Theme.Translucent.NoTitleBar")
   app.appendChild(activity)
   val service=d.createElement("service")
   service.setAttributeNS(android,"android:name","xyz.urro.transit.MotionStateListener")
   service.setAttributeNS(android,"android:exported","true")
   service.setAttributeNS(android,"android:permission","android.permission.BIND_NOTIFICATION_LISTENER_SERVICE")
   service.setAttributeNS(android,"android:label","Transit motion cues state confirmation")
   val filter=d.createElement("intent-filter");val action=d.createElement("action")
   action.setAttributeNS(android,"android:name","android.service.notification.NotificationListenerService")
   filter.appendChild(action);service.appendChild(filter);app.appendChild(service)
   var queries=d.getElementsByTagName("queries").item(0)
   if(queries==null){queries=d.createElement("queries");root.appendChild(queries)}
   val target=d.createElement("package");target.setAttributeNS(android,"android:name","com.stormtech.motionsense");queries.appendChild(target)
  }
 }
}
