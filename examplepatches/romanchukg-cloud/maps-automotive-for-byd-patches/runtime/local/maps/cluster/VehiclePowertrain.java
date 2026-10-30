// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

/** Explicit owner choice, never inferred from a battery reading, car name or CAN protocol. */
enum VehiclePowertrain {
    UNKNOWN, BEV, PHEV, HEV
}
