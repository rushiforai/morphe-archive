# Morphe patch development tools.
# Scripts are independent — use any target, in any order.
# See AGENTS.md for the full guide.

APP ?= meteo3b

.PHONY: help check session-init fetch extract decompile analyze build verify check-apk spoof-crc setup-tools patch-local deploy smoke device-test

help:
	@echo "Targets (set APP=<app_id>, default: meteo3b):"
	@echo "  make check                  Environment preflight"
	@echo "  make session-init APP=meteo3b  Bootstrap scratch/<app>/ for agent workflow"
	@echo "  make fetch APP=meteo3b      Download APK bundle"
	@echo "  make extract APP=meteo3b    Unzip bundle to analysis/<app>/extract/"
	@echo "  make decompile APP=meteo3b  Run jadx + apktool"
	@echo "  make analyze APP=meteo3b    Write optional analysis hints"
	@echo "  make build                  Build patches .mpp"
	@echo "  make verify APP=meteo3b     Apply .mpp to base APK"
	@echo "  make check-apk APK=... APP=meteo3b  Smali-check a Morphe-patched APK"
	@echo "  make spoof-crc ORIG=... PATCHED=...  Copy original CRC onto patched APK"
	@echo "  make setup-tools             Download Morphe Desktop CLI to tools/"
	@echo "  make patch-local APP=capcut  Patch APK with local .mpp"
	@echo "  make deploy APP=capcut       Install patched APK over adb"
	@echo "  make smoke APP=capcut        Crash/ANR smoke + screenshot"
	@echo "  make device-test APP=capcut  build→patch→deploy→smoke"

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
	@test -n "$(APK)" && test -n "$(APP)" || (echo "Usage: make check-apk APK=/path/to/patched.apk APP=meteo3b" && exit 1)
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
