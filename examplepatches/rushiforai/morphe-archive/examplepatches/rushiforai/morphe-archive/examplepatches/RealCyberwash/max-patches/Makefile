PKG := ru.oneme.app
CLI_VERSION  := 1.6.3
CLI_URL      := https://github.com/MorpheApp/morphe-cli/releases/download/v$(CLI_VERSION)/morphe-cli-$(CLI_VERSION)-all.jar

CLI_JAR      := tools/morphe-cli.jar
MPP_BUNDLE := patches/build/libs/patches-1.0.0.mpp
INPUT_APK    := sources/original.apk
OUTPUT_APK   := build/patched.apk

.PHONY: all setup build patch clean help

all: patch

setup:
	@if [ ! -f $(CLI_JAR) ]; then \
		echo "[*] Downloading morphe-cli v$(CLI_VERSION)..."; \
		curl -L $(CLI_URL) -o $(CLI_JAR) || { echo "[-] Download failed"; exit 1; }; \
	fi

# Build patches bundle
build:
	@echo "[*] Building patches..."
	@./gradlew :patches:buildAndroid

# Build, patch and mount in one go
patch: setup build
	@if [ ! -f $(INPUT_APK) ]; then echo "[-] Error: $(INPUT_APK) not found!"; exit 1; fi
	@echo "[*] Running CLI patch + mount..."
	java -jar $(CLI_JAR) patch \
		--patches $(MPP_BUNDLE) \
		-i \
		--mount \
		-o $(OUTPUT_APK) \
		$(INPUT_APK)
	@echo "[*] Fixing mount namespace"
	@adb shell su -mm -c 'mount -o bind /data/adb/morphe/$(PKG).apk $$(pm path $(PKG) | grep base | cut -d: -f2)'
	@echo "[+] Done. App patched"

clean:
	@./gradlew clean
	@rm -rf output/