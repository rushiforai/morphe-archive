NIX ?= nix

PROXY_TEST_CLASSES := .gradle/proxy-test-classes
PROXY_TEST_SOURCES := \
	extensions/extension/src/main/java/app/ytmusicproxy/extension/ProxySettings.java \
	extensions/extension/src/main/java/app/ytmusicproxy/extension/ProxyConfig.java \
	extensions/extension/src/main/java/app/ytmusicproxy/extension/ProxyInstaller.java \
	extensions/extension/src/test/java/app/ytmusicproxy/extension/ProxyInstallerTest.java

.PHONY: check
check:
	$(NIX) develop -c bash -lc '\
		set -euo pipefail; \
		rm -rf "$(PROXY_TEST_CLASSES)"; \
		mkdir -p "$(PROXY_TEST_CLASSES)"; \
		javac -d "$(PROXY_TEST_CLASSES)" $(PROXY_TEST_SOURCES); \
		java -cp "$(PROXY_TEST_CLASSES)" app.ytmusicproxy.extension.ProxyInstallerTest; \
		./gradlew :patches:compileKotlin :patches:buildAndroid \
	'
