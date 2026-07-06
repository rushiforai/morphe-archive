/*
 * SPDX-FileCopyrightText: 2023 microG Project Team
 * SPDX-License-Identifier: Apache-2.0
 */

package org.microg.gms.ui

import android.content.Context
import android.content.pm.ApplicationInfo
import android.content.pm.PackageManager
import android.util.AttributeSet
import android.view.View
import android.widget.TextView
import androidx.appcompat.content.res.AppCompatResources
import androidx.preference.Preference
import androidx.preference.PreferenceViewHolder
import org.microg.gms.base.core.R
import org.microg.gms.utils.AppPatcherDetector

abstract class AppPreference : Preference {
    constructor(context: Context, attrs: AttributeSet?, defStyleAttr: Int, defStyleRes: Int) : super(context, attrs, defStyleAttr, defStyleRes)
    constructor(context: Context, attrs: AttributeSet?, defStyleAttr: Int) : super(context, attrs, defStyleAttr)
    constructor(context: Context, attrs: AttributeSet?) : super(context, attrs)
    constructor(context: Context) : super(context)

    init {
        isPersistent = false
    }

    private var packageNameField: String? = null
    private var appVersion: String? = null

    var applicationInfo: ApplicationInfo?
        get() = context.packageManager.getApplicationInfoIfExists(packageNameField)
        set(value) {
            if (value == null && packageNameField != null) {
                title = null
                icon = null
                appVersion = null
            } else if (value != null) {
                val pm = context.packageManager
                title = value.loadLabel(pm)
                icon = value.loadIcon(pm) ?: AppCompatResources.getDrawable(context, android.R.mipmap.sym_def_app_icon)

                appVersion = try {
                    pm.getPackageInfo(value.packageName, 0)?.versionName
                } catch (_: PackageManager.NameNotFoundException) {
                    null
                }
            }
            packageNameField = value?.packageName
        }

    var packageName: String?
        get() = packageNameField
        set(value) {
            if (value == null && packageNameField != null) {
                title = null
                icon = null
                appVersion = null
            } else if (value != null) {
                val pm = context.packageManager
                val applicationInfo = pm.getApplicationInfoIfExists(value)
                title = applicationInfo?.loadLabel(pm)?.toString() ?: value
                icon = applicationInfo?.loadIcon(pm) ?: AppCompatResources.getDrawable(context, android.R.mipmap.sym_def_app_icon)

                appVersion = try {
                    pm.getPackageInfo(value, 0)?.versionName
                } catch (_: PackageManager.NameNotFoundException) {
                    null
                }
            }
            packageNameField = value
        }

    override fun onBindViewHolder(holder: PreferenceViewHolder) {
        super.onBindViewHolder(holder)

        val packageNameTextView = holder.itemView.findViewById<TextView>(R.id.package_name)
        val appVersionTextView = holder.itemView.findViewById<TextView>(R.id.version_name)
        val appPatcherTextView = holder.itemView.findViewById<TextView>(R.id.patcher_name)

        packageNameTextView?.text = packageNameField ?: ""
        appVersionTextView?.text = appVersion ?: ""

        val patcherSource = AppPatcherDetector.getUsingPackageName(packageNameField)

        appPatcherTextView?.let {
            if (patcherSource != null) {
                it.text = context.getString(patcherSource)
                it.visibility = View.VISIBLE
            } else {
                it.visibility = View.GONE
            }
        }
    }
}
