PATCH_JAR := build/libs/den-patch-1.0.0.jar
PATCH_MPP := build/libs/den-patch-1.0.0.mpp
MORPHE_CLI := tools/morphe-cli.jar

.PHONY: build list clean

build:
	./gradlew buildAndroid --no-daemon

list: build
	@test -f "$(MORPHE_CLI)" || (echo "Place morphe-cli.jar in tools/"; exit 1)
	java -jar $(MORPHE_CLI) list-patches $(PATCH_MPP) -pvo

clean:
	./gradlew clean --no-daemon
