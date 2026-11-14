/* fixture: excerpts around the four qualified sites */
// site
nction(e){return new Promise((function(t,n){h("POST","/AppUser/GetAd",e,d.a.state.loginStatus?"communityUserToken":"communityUser").then((function(e){1===e.data.Status&&(d.a.commit("advertising/setAdStorage",e.data.Data.Ad2SpecificStyleMemberComponent),d.a.commit("advertising/setAdSetting",e.data.Data.Settings)),t(e)})).catch((function(e){n(e)}))}))}},function(e,t,n){"use strict";(function(e){var a=n(400),r=n.n(a);function i(e,t,n,a,r,i,o,s,c,l){"boolean"!=typeof
;
// site
nction(e){return new Promise((function(t,n){y("POST","/AppUser/GetAd",e,v.a.state.loginStatus?"communityUserToken":"communityUser").then((function(e){1===e.data.Status&&(v.a.commit("advertising/setAdStorage",e.data.Data.Ad2SpecificStyleMemberComponent),v.a.commit("advertising/setAdSetting",e.data.Data.Settings)),t(e)})).catch((function(e){n(e)}))}))};function C(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);t&&(a=
;
// site
},f={initialize:function(e){return r()(o.a.mark((function t(){return o.a.wrap((function(t){for(;;)switch(t.prev=t.next){case 0:return MobileMessaging.init({applicationCode:"PLACEHOLDER",geofencingEnabled:"false",ios:{notificationTypes:["alert","badge","sound"],overridingNotificationCenterDelegateDisabled:!0},android:{notificationIcon:"iconss",multipleNotifications:"true",notificationAccentColor:"#15beae"},privacySettings:{userDataPersistingDisabled:!0}},(function(e){}),(function(e){})),f.handleInfobipPushNotification(e),t.abrupt
;
// site
 16:case"end":return e.stop()}}),e,null,[[4,12]])})));return function(){return e.apply(this,arguments)}}(),u=function(){cordova.plugins.notification.local.cancelAll((function(){var e=this,t=new Date,n=[3,4,5];t.getDate()>15&&(n=[4,5,6]),n.map((function(e){return d(t,e)})).forEach((function(n){var a,r,i=n-t,o=Math.round(i/6e4);cordova.plugins.notification.local.schedule({id:(a=Date.now(),r=new Uint32Array(1),window.crypto.getRandomValues(r),a+Math.floor(r[0]/4294967296*1e10)),title:c
