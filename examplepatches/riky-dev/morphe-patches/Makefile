# Morphe patch development tools.
# Scripts are independent — use any target, in any order.
# See AGENTS.md for the full guide.

APP ?= meteo3b

.PHONY: help check fetch extract decompile analyze build verify

help:
	@echo "Targets (set APP=<app_id>, default: meteo3b):"
	@echo "  make check                  Environment preflight"
	@echo "  make fetch APP=meteo3b      Download APK bundle"
	@echo "  make extract APP=meteo3b    Unzip bundle to analysis/<app>/extract/"
	@echo "  make decompile APP=meteo3b  Run jadx + apktool"
	@echo "  make analyze APP=meteo3b    Write optional analysis hints"
	@echo "  make build                  Build patches .mpp"
	@echo "  make verify APP=meteo3b     Apply .mpp to base APK"

check:
	@scripts/check_env.sh

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
