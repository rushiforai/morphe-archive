/*
 * Copyright (C) 2013-2017 microG Project Team
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.microg.gms.ui;

import androidx.fragment.app.Fragment;

import com.google.android.gms.BuildConfig;

import org.microg.tools.ui.AbstractAboutFragment;
import org.microg.tools.ui.AbstractSettingsActivity;

import java.util.List;

public class AboutFragment extends AbstractAboutFragment {

    @Override
    protected void collectLibraries(List<Library> libraries) {
        if (BuildConfig.FLAVOR.toLowerCase().contains("vtm")) {
            libraries.add(new Library("org.oscim.android", "V™", "GNU LGPLv3, Hannes Janetzek and devemux86."));
            libraries.add(new Library("org.slf4j", "slf4j-api", "MIT License, QOS.ch."));
        } else {
            libraries.add(new Library("org.maplibre.gl", "MapLibre GL Native for Android", "Two-Clause BSD, MapLibre contributors."));
        }
        libraries.add(new Library("androidx", "Android Jetpack", "Apache License 2.0, The Android Open Source Project."));
        libraries.add(new Library("androidx.annotation", "AndroidX Annotation", "Apache License 2.0, The Android Open Source Project."));
        libraries.add(new Library("androidx.appcompat", "AndroidX AppCompat", "Apache License 2.0, The Android Open Source Project."));
        libraries.add(new Library("androidx.collection", "AndroidX Collection", "Apache License 2.0, The Android Open Source Project."));
        libraries.add(new Library("androidx.concurrent", "AndroidX Concurrent", "Apache License 2.0, The Android Open Source Project."));
        libraries.add(new Library("androidx.core", "AndroidX Core", "Apache License 2.0, The Android Open Source Project."));
        libraries.add(new Library("androidx.fragment", "AndroidX Fragment", "Apache License 2.0, The Android Open Source Project."));
        libraries.add(new Library("androidx.legacy", "AndroidX Legacy", "Apache License 2.0, The Android Open Source Project."));
        libraries.add(new Library("androidx.loader", "AndroidX Loader", "Apache License 2.0, The Android Open Source Project."));
        libraries.add(new Library("androidx.lifecycle", "AndroidX Lifecycle", "Apache License 2.0, The Android Open Source Project."));
        libraries.add(new Library("androidx.media", "AndroidX Media", "Apache License 2.0, The Android Open Source Project."));
        libraries.add(new Library("androidx.mediarouter", "AndroidX MediaRouter", "Apache License 2.0, The Android Open Source Project."));
        libraries.add(new Library("androidx.multidex", "AndroidX MultiDex", "Apache License 2.0, The Android Open Source Project."));
        libraries.add(new Library("androidx.navigation", "AndroidX Navigation", "Apache License 2.0, The Android Open Source Project."));
        libraries.add(new Library("androidx.preference", "AndroidX Preference", "Apache License 2.0, The Android Open Source Project."));
        libraries.add(new Library("androidx.recyclerview", "AndroidX RecyclerView", "Apache License 2.0, The Android Open Source Project."));
        libraries.add(new Library("androidx.webkit", "AndroidX WebKit", "Apache License 2.0, The Android Open Source Project."));
        libraries.add(new Library("com.android.volley", "Volley", "Apache License 2.0, The Android Open Source Project."));
        libraries.add(new Library("com.google.android.material", "Material Components", "Apache License 2.0, Google LLC."));
        libraries.add(new Library("com.google.android.material", "Material Symbols", "Apache License 2.0, Google LLC."));
        libraries.add(new Library("com.google.guava", "Google Guava", "Apache License 2.0, Google LLC."));
        libraries.add(new Library("com.google.protobuf", "Protobuf", "BSD 3-Clause License, Google."));
        libraries.add(new Library("com.google.zxing", "ZXing", "Apache License 2.0, ZXing authors."));
        libraries.add(new Library("com.journeyapps", "ZXing Android Embedded", "Apache License 2.0, Journey Mobile."));
        libraries.add(new Library("com.squareup.okhttp3", "OkHttp", "Apache License 2.0, Square Inc."));
        libraries.add(new Library("com.squareup.wire", "Wire Protocol Buffers", "Apache License 2.0, Square Inc."));
        libraries.add(new Library("de.hdodenhof.circleimageview", "CircleImageView", "Apache License 2.0, Henning Dodenhof."));
        libraries.add(new Library("org.chromium.net", "Cronet", "BSD-style License, The Chromium Authors."));
        libraries.add(new Library("org.conscrypt", "Conscrypt", "Apache License 2.0, The Android Open Source Project."));
        libraries.add(new Library("org.json", "JSON-java", "Public Domain."));
        libraries.add(new Library("org.jetbrains.kotlin", "Kotlin", "Apache License 2.0, JetBrains."));
        libraries.add(new Library("org.jetbrains.kotlinx", "kotlinx.coroutines", "Apache License 2.0, JetBrains."));
        libraries.add(new Library("su.litvak.chromecast.api.v2", "ChromeCast Java API v2", "Apache License 2.0, Vitaly Litvak."));
    }

    public static class AsActivity extends AbstractSettingsActivity {
        public AsActivity() {
            showHomeAsUp = true;
        }

        @Override
        protected Fragment getFragment() {
            return new AboutFragment();
        }
    }
}
