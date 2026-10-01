# Morphe patch development tools.
# Scripts are independent — use any target, in any order.
# See AGENTS.md for the full guide.

APP ?= chefkoch

.PHONY: help check session-init fetch extract decompile analyze build verify check-apk spoof-crc setup-tools patch-local deploy smoke device-test

help:
	@echo "Targets (set APP=<app_id>, default: chefkoch):"
	@echo "  make check                  Environment preflight"
	@echo "  make session-init APP=chefkoch  Bootstrap scratch/<app>/ for agent workflow"
	@echo "  make fetch APP=chefkoch      Download APK bundle"
	@echo "  make extract APP=chefkoch    Unzip bundle to analysis/<app>/extract/"
	@echo "  make decompile APP=chefkoch  Run jadx + apktool"
	@echo "  make analyze APP=chefkoch    Write optional analysis hints"
	@echo "  make build                  Build patches .mpp"
	@echo "  make verify APP=chefkoch     Apply .mpp to base APK"
	@echo "  make check-apk APK=... APP=chefkoch  Smali-check a Morphe-patched APK"
	@echo "  make spoof-crc ORIG=... PATCHED=...  Copy original CRC onto patched APK"
	@echo "  make setup-tools             Download Morphe Desktop CLI to tools/"
	@echo "  make patch-local APP=chefkoch  Patch APK with local .mpp"
	@echo "  make deploy APP=chefkoch       Install patched APK over adb"
	@echo "  make smoke APP=chefkoch        Crash/ANR smoke + screenshot"
	@echo "  make device-test APP=chefkoch  build→patch→deploy→smoke"

check:
	@scripts/check_env.sh

session-init:
	@scripts/init_session.sh $(APP)

fetch:
	@scripts/fetch_apk.sh $(APP)

extract:
	@scripts/extract_apk.sh $(APP)

decompile:
	@scripts/decompile.sh $(APP)

analyze:
	@scripts/analyze.sh $(APP)

build:
	@scripts/build.sh

verify:
	@scripts/verify_patch.sh $(APP)

check-apk:
	@test -n "$(APK)" && test -n "$(APP)" || (echo "Usage: make check-apk APK=/path/to/patched.apk APP=chefkoch" && exit 1)
	@scripts/check_patched_apk.sh "$(APK)" $(APP)

spoof-crc:
	@test -n "$(ORIG)" && test -n "$(PATCHED)" || (echo "Usage: make spoof-crc ORIG=base.apk PATCHED=patched.apk [OUT=out.apk]" && exit 1)
	@python3 scripts/spoof_apk_crc.py "$(ORIG)" "$(PATCHED)" $(if $(OUT),-o "$(OUT)",)

setup-tools:
	@scripts/setup_tools.sh

patch-local:
	@scripts/patch_local.sh $(APP)

deploy:
	@scripts/device_deploy.sh $(APP)

smoke:
	@scripts/device_smoke.sh $(APP) --screenshot

device-test:
	@scripts/device_test.sh $(APP)
