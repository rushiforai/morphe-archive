package app.morphe.extension.mapsautomotive.patches;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * Reads BYD DiCarServer's energy-model assets. The assets are Java-serialized
 * com.byd.car.VEMBinaryData objects whose fields hold protobuf parts of Google's VehicleEnergyModel.
 * Java serialization matches classes by simple name, serialVersionUID and field names, so this class
 * keeps all three; {@link BydVehicleEnergyFile} maps BYD's class name to it. Never written.
 */
final class VEMBinaryData implements Serializable {
    private static final long serialVersionUID = 1;

    byte[] mVehicleInfo, mRoadLoad, mDrivetrainLosses, mChargingCurves;
    /** Keyed by temperature, °C. */
    Map<Integer, byte[]> mMaxRegenPowerMap, mBatteryLossesMap;
    Map<Integer, List<byte[]>> mDrainAtTimeMap;
    List<byte[]> mDrainAtTemperatureList;

    private VEMBinaryData() {
    }
}
