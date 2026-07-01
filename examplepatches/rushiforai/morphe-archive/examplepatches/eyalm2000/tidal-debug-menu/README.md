# TIDAL Debug Menu Patches

ReVanced and Morphe patches to enable TIDAL's debug menu.  
The debug menu includes an internal feature flags page, which can be used to enable hidden features such as [the new player UI](assets/player.webp).  

Included patches:

- **Unlock Debug Menu**  
    Enables the hidden debug menu in the app, at the bottom of the settings page.
 - **Export Debug Activity**  
   Ensures `com.tidal.android.debugmenu.DebugMenuActivity` is exported in `AndroidManifest.xml`. This allows launching the debug menu activity with a home screen shortcut (or directly via ADB). Optional, but recommended.

## Patching with ReVanced Manager

1. Uninstall any existing version of TIDAL from your phone. **This is required and will delete downloaded music.**
2. Download the latest ReVanced Manager from [here.](https://revanced.app/download)
3. If you have never used ReVanced Manager before, follow the onboarding and grant the necessary permissions. When prompted to select an app, choose "Skip for now". 
4. Go to the "Patches" tab and click the edit button at the bottom, then the "+" button. Choose "Enter URL".
5. Add this URL:

   `https://raw.githubusercontent.com/eyalm2000/tidal-debug-menu/main/patches-bundle.json`

6. Alternative: manually download the latest `patches-*.rvp` from Releases and import it.
7. It might take a moment to load the patches. When done, go back to the Apps tab, search for and select "com.aspiro.tidal".
8. Click "Select Patches" and make sure all both patches are selected.
9. Click Patch. If prompted, download the APK from APKMirror. Make sure to download the latest version, **2.184.2 or later**.
10. Wait for the patching process to finish. **This can take a few minutes.**  
     When finished, click "install" to install the patched APK.
11. Open TIDAL, log in to your account, navigate to the settings page, and scroll to the bottom. You should see a new "Debug Menu" option.  
12. Congratulations! You have successfully unlocked the debug menu.  
   To use the new player UI, click the "Feature Flags" option, search for the "Player Market UI" toggle, and enable it.

## Patching with Morphe Manager

1. Uninstall any existing version of TIDAL from your phone. **This is required and will delete downloaded music.**
2. Download the latest Morphe Manager from [here.](https://morphe.software/)
3. Download the latest TIDAL APK from APKMirror. Make sure to download the latest version, **2.184.2 or later**.
4. Click the folder icon at the bottom left, then the "+" button, and choose "Remote"
5. Add this URL:
 
   `https://raw.githubusercontent.com/eyalm2000/tidal-debug-menu/main/morphe-patches-bundle.json`

6. Alternative: manually download the latest `patches-*.mpp` from Releases and import it on the "Local" tab.
7. It might take a moment to load the patches. When done, click "com.aspiro.tidal" in the app list.
8. Click "No, I already have the APK", then select the APK you downloaded in step 3.
9. Wait for the patching process to finish. **This can take a few minutes.**  
     When finished, click "install" to install the patched APK.
10. Open TIDAL, log in to your account, navigate to the settings page, and scroll to the bottom. You should see a new "Debug Menu" option.  
11. Congratulations! You have successfully unlocked the debug menu.  
   To use the new player UI, click the "Feature Flags" option, search for the "Player Market UI" toggle, and enable it.