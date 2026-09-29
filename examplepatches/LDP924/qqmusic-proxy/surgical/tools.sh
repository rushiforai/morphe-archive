#!/bin/bash
# 手术工具链环境（baksmali/smali/d8/apksigner 直跑所需 classpath）
export JAVA_HOME=$HOME/jdks/jdk-21.0.12.1+1
SDK=/home/z/my-project/tools/sdk
BSM=$SDK/cmdline-tools/latest/lib/external
C="/home/z/.gradle/caches/modules-2/files-2.1"
export BAKSMALI_CP="$BSM/com/android/tools/smali/smali-baksmali/3.0.3/smali-baksmali-3.0.3.jar:$BSM/com/android/tools/smali/smali-dexlib2/3.0.3/smali-dexlib2-3.0.3.jar:$BSM/com/android/tools/smali/smali-util/3.0.3/smali-util-3.0.3.jar:$C/com.google.guava/guava/31.1-jre/60458f877d055d0c9114d9e1a2efb737b4bc282c/guava-31.1-jre.jar:$C/com.beust/jcommander/1.48/bfcb96281ea3b59d626704f74bc6d625ff51cbce/jcommander-1.48.jar:$C/com.google.android/annotations/4.1.1.4/a1678ba907bf92691d879fef34e1a187038f9259/annotations-4.1.1.4.jar"
SML=/home/z/.gradle/caches/modules-2/files-2.1/com.github.MorpheApp.smali
export SMALI_CP="$SML/smali/d92701d947/b5adff123a8640b9a54789e4a804537ec9ba4ba6/smali-d92701d947.jar:$SML/smali-dexlib2/d92701d947/35d6c9a19f0d097829cd2987284bd1190e4115fe/smali-dexlib2-d92701d947.jar:$SML/smali-util/d92701d947/de8b927378db8df1244fed2138db020af000afd1/smali-util-d92701d947.jar:$C/com.google.guava/guava/31.1-jre/60458f877d055d0c9114d9e1a2efb737b4bc282c/guava-31.1-jre.jar:$C/com.beust/jcommander/1.48/bfcb96281ea3b59d626704f74bc6d625ff51cbce/jcommander-1.48.jar:$C/org.antlr/antlr-runtime/3.5.2/cd9cd41361c155f3af0f653009dcecb08d8b4afd/antlr-runtime-3.5.2.jar"
export SDK BT="$SDK/build-tools/34.0.0" AJ="$SDK/platforms/android-33/android.jar"
