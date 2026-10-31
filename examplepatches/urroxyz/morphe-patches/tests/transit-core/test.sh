#!/bin/sh
set -eu
cd "$(dirname "$0")"
mkdir -p build
source=../../extensions/extension/src/main/java/xyz/urro/transit
javac -d build "$source/BoardingDetector.java" "$source/GoInstruction.java" "$source/GoVehicleState.java" "$source/MotionSession.java" "$source/ObservationFence.java" "$source/PermissionCheck.java" "$source/ReminderFormatter.java" test/xyz/urro/transit/*.java
java -cp build xyz.urro.transit.CoreTest

java -cp build xyz.urro.transit.MotionSessionTest

java -cp build xyz.urro.transit.ObservationFenceTest

java -cp build xyz.urro.transit.PermissionCheckTest

java -cp build xyz.urro.transit.GoInstructionTest

java -cp build xyz.urro.transit.GoVehicleStateTest
