#!/usr/bin/env bash
set -euo pipefail
javac -d /tmp/nicoid-bike-tests extensions/extension/src/main/java/e/e/a/BikeRunModel.java porting/tests/BikeRunModelTest.java
java -cp /tmp/nicoid-bike-tests e.e.a.BikeRunModelTest
