extension { name = "extensions/smartlauncher.mpe" }
android {
    namespace = "app.mrcool.extension.smartlauncher"
    compileSdk = 35
    defaultConfig { minSdk = 32 }
}
// This existing harness uses small Android doubles and runs independently of AGP.
val widgetTestClasses = layout.buildDirectory.dir("widget-tests")
val compileWidgetTests by tasks.registering(JavaCompile::class) {
    source("src/main/java", "src/test/java")
    classpath = files()
    destinationDirectory.set(widgetTestClasses)
    sourceCompatibility = "17"
    targetCompatibility = "17"
}
tasks.register<JavaExec>("widgetTest") {
    dependsOn(compileWidgetTests)
    classpath = files(widgetTestClasses)
    mainClass.set("WidgetConfigurationJvmTest")
}
