import com.android.build.api.dsl.ApplicationExtension

configure<ApplicationExtension> {
    defaultConfig {
        minSdk = 24
    }
}

dependencies {
    "testImplementation"("junit:junit:4.13.2")
    "testImplementation"("org.json:json:20250517")
}
