package local.maps.cluster;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Builds the pinned 26.10 external EV message consumed by the native EV repository (26.10 hjo).
 * Capacity is a manual owner profile, current energy is derived from that profile
 * and SOC, and the constant J/m term is derived from the car's estimated range.
 * No native implementation, charging power, charging curve or demo defaults live here.
 */
final class VehicleEvProto {
    private VehicleEvProto() {}

    static Object build(ClassLoader loader, int capacityWh, double soc, double rangeKm,
                        int nativeConnectorEnum) throws Exception {
        return buildValidated(loader, capacityWh, soc, rangeKm, legacyConnectors(nativeConnectorEnum));
    }

    /** Supported station types in preference order; duplicates never create extra entries. */
    static Object build(ClassLoader loader, int capacityWh, double soc, double rangeKm,
                        int[] nativeConnectorEnums) throws Exception {
        return buildValidated(loader, capacityWh, soc, rangeKm, connectors(nativeConnectorEnums));
    }

    private static Object buildValidated(ClassLoader loader, int capacityWh, double soc, double rangeKm,
                                         int[] nativeConnectorEnums) throws Exception {
        Values values = values(capacityWh, soc, rangeKm);
        Message current = message(loader, "afnh");
        set(current.value, "b", values.currentWh);
        Message capacity = message(loader, "afnh");
        set(capacity.value, "b", capacityWh);

        Message energy = message(loader, "afob");
        set(energy.value, "b", 0x2 | 0x4);
        set(energy.value, "d", finish(current));
        set(energy.value, "e", finish(capacity));

        Message coefficient = message(loader, "afmv");
        set(coefficient.value, "b", values.joulesPerMetre);
        Message consumption = message(loader, "afnq");
        set(consumption.value, "b", 0x1);
        set(consumption.value, "c", finish(coefficient));

        Message vehicle = message(loader, "afnz");
        set(vehicle.value, "b", 0x1 | 0x2);
        set(vehicle.value, "c", finish(energy));
        set(vehicle.value, "d", finish(consumption));
        if (nativeConnectorEnums.length != 0) {
            Message connectors = message(loader, "aflz");
            Field listField = field(connectors.value.getClass(), "b");
            Object oldList = listField.get(connectors.value);
            Class<?> base = loader.loadClass("akbq");
            Method copy = base.getDeclaredMethod("cV", listField.getType());
            copy.setAccessible(true);
            Object mutableList = copy.invoke(null, oldList);
            @SuppressWarnings("unchecked") List<Object> entries = (List<Object>) mutableList;
            for (int nativeConnectorEnum : nativeConnectorEnums) {
                Message connector = message(loader, "afni");
                set(connector.value, "c", nativeConnectorEnum);
                // afpe.d is optional maximum power. Keep it absent when unknown.
                entries.add(finish(connector));
            }
            listField.set(connectors.value, mutableList);
            set(vehicle.value, "g", finish(connectors));
            set(vehicle.value, "b", 0x1 | 0x2 | 0x10);
        }
        Object result = finish(vehicle);
        verifyValidated(result, capacityWh, soc, rangeKm, nativeConnectorEnums);
        return result;
    }

    /** Read the exact external fields back; throws rather than publishing a wrong schema. */
    static Map<String, Object> verify(Object vehicle, int capacityWh, double soc, double rangeKm,
                                      int nativeConnectorEnum) throws Exception {
        Map<String, Object> summary = verifyValidated(vehicle, capacityWh, soc, rangeKm,
                                                      legacyConnectors(nativeConnectorEnum));
        summary.put("native_connector_enum", nativeConnectorEnum);
        return summary;
    }

    static Map<String, Object> verify(Object vehicle, int capacityWh, double soc, double rangeKm,
                                      int[] nativeConnectorEnums) throws Exception {
        return verifyValidated(vehicle, capacityWh, soc, rangeKm, connectors(nativeConnectorEnums));
    }

    private static Map<String, Object> verifyValidated(Object vehicle, int capacityWh, double soc,
                                                       double rangeKm, int[] nativeConnectorEnums) throws Exception {
        Values expected = values(capacityWh, soc, rangeKm);
        require(vehicle != null && "afnz".equals(vehicle.getClass().getName()), "External EV type");
        require(number(vehicle, "b").intValue() == (nativeConnectorEnums.length == 0 ? 3 : 19), "Vehicle presence");
        Object energy = get(vehicle, "c"), consumption = get(vehicle, "d");
        require(number(energy, "b").intValue() == 6, "Energy presence");
        require(number(get(energy, "d"), "b").intValue() == expected.currentWh, "Current Wh");
        require(number(get(energy, "e"), "b").intValue() == capacityWh, "Capacity Wh");
        require(get(energy, "c") == null, "Unknown energy quantity must be absent");
        require(number(consumption, "b").intValue() == 1, "Consumption presence");
        float actual = number(get(consumption, "c"), "b").floatValue();
        require(Float.floatToIntBits(actual) == Float.floatToIntBits(expected.joulesPerMetre), "Distance coefficient J/m");
        require(get(consumption, "d") == null && get(consumption, "e") == null, "Unknown consumption terms must be absent");
        // dpp.p intrinsically copies these proto3 zero defaults. They are not measured range/power.
        require(number(energy, "g").floatValue() == 0f && number(energy, "h").floatValue() == 0f,
                "Unverified energy scalars must remain default");
        require(get(vehicle, "e") == null && get(vehicle, "f") == null && get(vehicle, "j") == null,
                "Unknown charging curves must be absent");
        Object connectors = get(vehicle, "g");
        if (nativeConnectorEnums.length == 0) require(connectors == null, "Unknown connector must be absent");
        else {
            List<?> entries = (List<?>) get(connectors, "b");
            require(entries.size() == nativeConnectorEnums.length, "Connector count");
            for (int i = 0; i < nativeConnectorEnums.length; i++) {
                Object connector = entries.get(i);
                require(number(connector, "c").intValue() == nativeConnectorEnums[i], "Connector enum/order");
                require(number(connector, "b").intValue() == 0 && get(connector, "d") == null,
                        "Unknown maximum charging power must be absent");
            }
        }
        Map<String, Object> summary = new LinkedHashMap<>();
        summary.put("profile_capacity_wh", capacityWh);
        summary.put("derived_current_wh", expected.currentWh);
        summary.put("derived_joules_per_metre", actual);
        summary.put("derived_range_km", expected.currentWh * 3.6 / actual);
        List<Integer> connectorSummary = new ArrayList<>();
        for (int nativeConnectorEnum : nativeConnectorEnums) connectorSummary.add(nativeConnectorEnum);
        summary.put("native_connector_enums", Collections.unmodifiableList(connectorSummary));
        summary.put("charging_power_present", false);
        summary.put("charging_curve_present", false);
        summary.put("unverified_scalars_are_proto_defaults", true);
        return summary;
    }

    /** Only the legacy scalar overload has an explicit unknown/omitted connector marker. */
    private static int[] legacyConnectors(int nativeConnectorEnum) {
        return nativeConnectorEnum == -1 ? new int[0] : connectors(new int[]{nativeConnectorEnum});
    }

    private static int[] connectors(int[] supplied) {
        if (supplied == null || supplied.length == 0)
            throw new IllegalArgumentException("Select a supported station connector");
        int[] copy = supplied.clone(), selected = new int[2];
        int count = 0;
        for (int value : copy) {
            // Energy-protobuf values, independent of the separate CarInfo/catalog IDs.
            if (value != 6 && value != 10)
                throw new IllegalArgumentException("Unsupported station connector enum");
            boolean duplicate = false;
            for (int i = 0; i < count; i++) if (selected[i] == value) duplicate = true;
            if (!duplicate) selected[count++] = value;
        }
        int[] result = new int[count];
        System.arraycopy(selected, 0, result, 0, count);
        return result;
    }

    private static Values values(int capacityWh, double soc, double rangeKm) {
        if (capacityWh <= 0 || !Double.isFinite(soc) || soc <= 0 || soc > 100
                || !Double.isFinite(rangeKm) || rangeKm <= 0 || rangeKm > 3000)
            throw new IllegalArgumentException("Usable positive EV profile and readings required");
        long currentWh = Math.round(capacityWh * (soc / 100.0));
        if (currentWh <= 0 || currentWh > capacityWh)
            throw new IllegalArgumentException("Positive derived current energy required");
        // Wh × 3600 J/Wh ÷ (km × 1000 m/km) = J/m.
        float coefficient = (float) (currentWh * 3.6 / rangeKm);
        if (!Float.isFinite(coefficient) || coefficient <= 0)
            throw new IllegalArgumentException("Finite positive distance coefficient required");
        return new Values((int) currentWh, coefficient);
    }

    private static Message message(ClassLoader loader, String name) throws Exception {
        Class<?> type = loader.loadClass(name);
        Object defaultValue = field(type, "a").get(null);
        Object builder = invoke(defaultValue, "cC");
        invoke(builder, "bI");
        Object value = get(builder, "b");
        require(type.isInstance(value) && value != defaultValue, "Mutable protobuf instance");
        return new Message(builder, value);
    }
    private static Object finish(Message message) throws Exception { return invoke(message.builder, "bE"); }
    private static Object invoke(Object object, String name) throws Exception {
        Method method = object.getClass().getMethod(name);
        method.setAccessible(true);
        return method.invoke(object);
    }
    private static Field field(Class<?> type, String name) throws Exception {
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            try { Field field = current.getDeclaredField(name); field.setAccessible(true); return field; }
            catch (NoSuchFieldException absent) { /* Search the native protobuf base. */ }
        }
        throw new NoSuchFieldException(type.getName() + "." + name);
    }
    private static Object get(Object object, String name) throws Exception {
        if (object == null) throw new IllegalStateException("Missing native EV message");
        return field(object.getClass(), name).get(object);
    }
    private static Number number(Object object, String name) throws Exception { return (Number) get(object, name); }
    private static void set(Object object, String name, Object value) throws Exception { field(object.getClass(), name).set(object, value); }
    private static void require(boolean valid, String what) { if (!valid) throw new IllegalStateException(what); }
    private static final class Message {
        final Object builder, value;
        Message(Object builder, Object value) { this.builder = builder; this.value = value; }
    }
    private static final class Values {
        final int currentWh;
        final float joulesPerMetre;
        Values(int currentWh, float joulesPerMetre) { this.currentWh = currentWh; this.joulesPerMetre = joulesPerMetre; }
    }
}
