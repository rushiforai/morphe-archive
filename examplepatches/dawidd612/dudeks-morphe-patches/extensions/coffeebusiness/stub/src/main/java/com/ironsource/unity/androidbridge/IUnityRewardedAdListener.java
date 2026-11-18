package com.ironsource.unity.androidbridge;
interface IUnityRewardedAdListener {
 void onAdLoaded(String info);
 void onAdDisplayed(String info);
 void onAdRewarded(String info, String name, int amount);
 void onAdClosed(String info);
}
