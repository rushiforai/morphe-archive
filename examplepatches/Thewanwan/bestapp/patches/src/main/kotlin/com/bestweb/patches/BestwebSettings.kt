package com.bestweb.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch

val bestwebSettings = resourcePatch(
    name = "bestweb settings",
    description = "Adds bestweb module settings page with tab blocking, supergroup toggle, and ad blocking info",
    default = true
) {
    compatibleWith(WEIBO_COMPATIBILITY)

    execute {
        // 1. Add settings entry to settings_main.xml
        val settingsMainXml = get("res/layout/settings_main.xml")
        val settingsMainContent = settingsMainXml.readText()

        val bestwebEntry = """
            <RelativeLayout android:id="@+id/moduleSettingsLayout" android:layout_width="match_parent" android:layout_height="@dimen/settings_item_height_top" android:layout_marginTop="@dimen/settings_margin_top" android:background="?android:attr/selectableItemBackground">
                <View android:background="@color/common_line" android:layout_width="match_parent" android:layout_height="1.0px" />
                <TextView android:gravity="center_vertical" android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="bestweb" android:layout_centerVertical="true" style="@style/SettingMainText" />
                <ImageView android:layout_width="wrap_content" android:layout_height="wrap_content" android:layout_marginRight="@dimen/settings_item_padding_right" android:src="@drawable/common_icon_arrow" android:layout_alignParentRight="true" android:layout_centerVertical="true" />
                <View android:background="@color/common_line" android:layout_width="match_parent" android:layout_height="1.0px" android:layout_alignParentBottom="true" />
            </RelativeLayout>
        """.trimIndent()

        settingsMainXml.writeText(settingsMainContent.replace("</LinearLayout>", "$bestwebEntry\n    </LinearLayout>"))

        // 2. Create module_settings.xml layout
        val moduleSettingsLayout = """
            <?xml version="1.0" encoding="utf-8"?>
            <ScrollView xmlns:android="http://schemas.android.com/apk/res/android"
                android:layout_width="match_parent" android:layout_height="match_parent" android:background="@android:color/white">
                <LinearLayout android:layout_width="match_parent" android:layout_height="wrap_content" android:orientation="vertical" android:paddingBottom="24dp">
                    <View android:layout_width="match_parent" android:layout_height="1dp" android:background="@color/common_line" />
                    <TextView android:id="@+id/section_general" android:layout_width="match_parent" android:layout_height="wrap_content" android:text="通用" android:textSize="16sp" android:textStyle="bold" android:textColor="#333333" android:paddingLeft="16dp" android:paddingRight="16dp" android:paddingTop="16dp" android:paddingBottom="8dp" android:background="@color/common_line" />
                    <RelativeLayout android:id="@+id/switch_video_tab" android:layout_width="match_parent" android:layout_height="@dimen/settings_item_height_top" android:background="?android:attr/selectableItemBackground" android:paddingLeft="16dp" android:paddingRight="16dp">
                        <TextView android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="屏蔽视频Tab" android:layout_centerVertical="true" style="@style/SettingMainText" />
                        <Switch android:id="@+id/mod_sw_video_tab" android:layout_width="wrap_content" android:layout_height="wrap_content" android:layout_alignParentRight="true" android:layout_centerVertical="true" android:focusable="false" />
                        <View android:layout_width="match_parent" android:layout_height="1dp" android:background="@color/common_line" android:layout_alignParentBottom="true" />
                    </RelativeLayout>
                    <RelativeLayout android:id="@+id/switch_message_tab" android:layout_width="match_parent" android:layout_height="@dimen/settings_item_height_top" android:background="?android:attr/selectableItemBackground" android:paddingLeft="16dp" android:paddingRight="16dp">
                        <TextView android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="屏蔽消息Tab" android:layout_centerVertical="true" style="@style/SettingMainText" />
                        <Switch android:id="@+id/mod_sw_message_tab" android:layout_width="wrap_content" android:layout_height="wrap_content" android:layout_alignParentRight="true" android:layout_centerVertical="true" android:focusable="false" />
                        <View android:layout_width="match_parent" android:layout_height="1dp" android:background="@color/common_line" android:layout_alignParentBottom="true" />
                    </RelativeLayout>
                    <RelativeLayout android:id="@+id/switch_find_tab" android:layout_width="match_parent" android:layout_height="@dimen/settings_item_height_top" android:background="?android:attr/selectableItemBackground" android:paddingLeft="16dp" android:paddingRight="16dp">
                        <TextView android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="屏蔽发现Tab" android:layout_centerVertical="true" style="@style/SettingMainText" />
                        <Switch android:id="@+id/mod_sw_find_tab" android:layout_width="wrap_content" android:layout_height="wrap_content" android:layout_alignParentRight="true" android:layout_centerVertical="true" android:focusable="false" />
                        <View android:layout_width="match_parent" android:layout_height="1dp" android:background="@color/common_line" android:layout_alignParentBottom="true" />
                    </RelativeLayout>
                    <RelativeLayout android:id="@+id/switch_discover_tab" android:layout_width="match_parent" android:layout_height="@dimen/settings_item_height_top" android:background="?android:attr/selectableItemBackground" android:paddingLeft="16dp" android:paddingRight="16dp">
                        <TextView android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="屏蔽搜索Tab" android:layout_centerVertical="true" style="@style/SettingMainText" />
                        <Switch android:id="@+id/mod_sw_discover_tab" android:layout_width="wrap_content" android:layout_height="wrap_content" android:layout_alignParentRight="true" android:layout_centerVertical="true" android:focusable="false" />
                        <View android:layout_width="match_parent" android:layout_height="1dp" android:background="@color/common_line" android:layout_alignParentBottom="true" />
                    </RelativeLayout>
                    <RelativeLayout android:id="@+id/switch_playlet_tab" android:layout_width="match_parent" android:layout_height="@dimen/settings_item_height_top" android:background="?android:attr/selectableItemBackground" android:paddingLeft="16dp" android:paddingRight="16dp">
                        <TextView android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="屏蔽短剧Tab" android:layout_centerVertical="true" style="@style/SettingMainText" />
                        <Switch android:id="@+id/mod_sw_playlet_tab" android:layout_width="wrap_content" android:layout_height="wrap_content" android:layout_alignParentRight="true" android:layout_centerVertical="true" android:focusable="false" />
                        <View android:layout_width="match_parent" android:layout_height="1dp" android:background="@color/common_line" android:layout_alignParentBottom="true" />
                    </RelativeLayout>
                    <TextView android:id="@+id/section_home" android:layout_width="match_parent" android:layout_height="wrap_content" android:text="首页" android:textSize="16sp" android:textStyle="bold" android:textColor="#333333" android:paddingLeft="16dp" android:paddingRight="16dp" android:paddingTop="16dp" android:paddingBottom="8dp" android:background="@color/common_line" />
                    <RelativeLayout android:id="@+id/switch_supergroup" android:layout_width="match_parent" android:layout_height="@dimen/settings_item_height_top" android:background="?android:attr/selectableItemBackground" android:paddingLeft="16dp" android:paddingRight="16dp">
                        <TextView android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="屏蔽超话" android:layout_centerVertical="true" style="@style/SettingMainText" />
                        <Switch android:id="@+id/mod_sw_supergroup" android:layout_width="wrap_content" android:layout_height="wrap_content" android:layout_alignParentRight="true" android:layout_centerVertical="true" android:focusable="false" />
                        <View android:layout_width="match_parent" android:layout_height="1dp" android:background="@color/common_line" android:layout_alignParentBottom="true" />
                    </RelativeLayout>
                    <TextView android:id="@+id/section_discover" android:layout_width="match_parent" android:layout_height="wrap_content" android:text="发现" android:textSize="16sp" android:textStyle="bold" android:textColor="#333333" android:paddingLeft="16dp" android:paddingRight="16dp" android:paddingTop="16dp" android:paddingBottom="8dp" android:background="@color/common_line" />
                    <RelativeLayout android:layout_width="match_parent" android:layout_height="@dimen/settings_item_height_top" android:paddingLeft="16dp" android:paddingRight="16dp">
                        <TextView android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="搜索热搜视频广告" android:layout_centerVertical="true" style="@style/SettingMainText" />
                        <TextView android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="已屏蔽" android:textColor="#4CAF50" android:textSize="14sp" android:layout_alignParentRight="true" android:layout_centerVertical="true" />
                        <View android:layout_width="match_parent" android:layout_height="1dp" android:background="@color/common_line" android:layout_alignParentBottom="true" />
                    </RelativeLayout>
                    <TextView android:id="@+id/section_message" android:layout_width="match_parent" android:layout_height="wrap_content" android:text="消息" android:textSize="16sp" android:textStyle="bold" android:textColor="#333333" android:paddingLeft="16dp" android:paddingRight="16dp" android:paddingTop="16dp" android:paddingBottom="8dp" android:background="@color/common_line" />
                    <RelativeLayout android:layout_width="match_parent" android:layout_height="@dimen/settings_item_height_top" android:paddingLeft="16dp" android:paddingRight="16dp">
                        <TextView android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="暂无设置项" android:textColor="#999999" android:layout_centerVertical="true" style="@style/SettingMainText" />
                        <View android:layout_width="match_parent" android:layout_height="1dp" android:background="@color/common_line" android:layout_alignParentBottom="true" />
                    </RelativeLayout>
                    <TextView android:id="@+id/section_post" android:layout_width="match_parent" android:layout_height="wrap_content" android:text="博文" android:textSize="16sp" android:textStyle="bold" android:textColor="#333333" android:paddingLeft="16dp" android:paddingRight="16dp" android:paddingTop="16dp" android:paddingBottom="8dp" android:background="@color/common_line" />
                    <RelativeLayout android:layout_width="match_parent" android:layout_height="@dimen/settings_item_height_top" android:paddingLeft="16dp" android:paddingRight="16dp">
                        <TextView android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="评论区广告" android:layout_centerVertical="true" style="@style/SettingMainText" />
                        <TextView android:layout_width="wrap_content" android:layout_height="wrap_content" android:text="已屏蔽" android:textColor="#4CAF50" android:textSize="14sp" android:layout_alignParentRight="true" android:layout_centerVertical="true" />
                        <View android:layout_width="match_parent" android:layout_height="1dp" android:background="@color/common_line" android:layout_alignParentBottom="true" />
                    </RelativeLayout>
                    <View android:layout_width="match_parent" android:layout_height="1dp" android:background="@color/common_line" />
                </LinearLayout>
            </ScrollView>
        """.trimIndent()

        get("res/layout/module_settings.xml").writeText(moduleSettingsLayout)

        // 3. Update AndroidManifest.xml to register ModuleSettingsActivity
        val manifest = get("AndroidManifest.xml")
        val manifestContent = manifest.readText()
        val activityTag = """<activity android:configChanges="keyboardHidden|orientation|screenSize" android:name="com.sina.weibo.module.ModuleSettingsActivity" android:theme="@style/ContentOverlay"/>"""
        manifest.writeText(manifestContent.replace("</application>", "    $activityTag\n</application>"))
    }
}
