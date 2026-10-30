package local.maps.cluster;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.EnumMap;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.Map;

/** Pinned native vehicle-info facade. Added invocation work is in-memory only. */
final class VehicleEvInfo {
    private VehicleEvInfo() {}

    static Object wrap(Object original) {
        if (original == null) return null;
        if (Proxy.isProxyClass(original.getClass()) && Proxy.getInvocationHandler(original) instanceof Adapter)
            return original;
        try {
            ClassLoader loader = original.getClass().getClassLoader();
            Class<?> type = loader.loadClass("ftz");
            if (!type.isInterface() || !type.isInstance(original)) return original;
            Class<?> list = loader.loadClass("abpw"), fuel = loader.loadClass("ftu");
            require(type.getMethod("d").getReturnType() == list, "Native fuel-list ABI");
            Class<?> optional = type.getMethod("e").getReturnType();
            require("j$.util.Optional".equals(optional.getName()), "Native connector-optional ABI");
            for (String name : new String[]{"i", "j", "k", "l"})
                require(type.getMethod(name).getReturnType() == boolean.class, "Native vehicle gate ABI");
            Field electricField = fuel.getDeclaredField("k"); electricField.setAccessible(true);
            Object electric = electricField.get(null);
            require(electric instanceof Enum && "ELECTRIC".equals(((Enum<?>) electric).name()), "Native electric fuel enum");
            Field unleadedField=fuel.getDeclaredField("b");unleadedField.setAccessible(true);
            Object unleaded=unleadedField.get(null);
            require(unleaded instanceof Enum&&"UNLEADED".equals(((Enum<?>)unleaded).name()),"Native unleaded fuel enum");

            // Catalog/CarInfo connector numbering differs from the energy protobuf enum6.
            Field mapping = loader.loadClass("fuh").getDeclaredField("b"); mapping.setAccessible(true);
            Object combo2 = ((Map<?, ?>) mapping.get(null)).get("COMBO_2");
            require(Integer.valueOf(5).equals(combo2), "Pinned native CCS2 catalog mapping");
            require(Integer.valueOf(2).equals(((Map<?,?>)mapping.get(null)).get("MENNEKES")),"Pinned native Type2 catalog mapping");
            require(Integer.valueOf(4).equals(((Map<?,?>)mapping.get(null)).get("COMBO_1")),"Pinned native CCS1 catalog mapping");
            Method singleton = list.getDeclaredMethod("q", Object.class); singleton.setAccessible(true);
            Method copy = list.getDeclaredMethod("n", Collection.class); copy.setAccessible(true);
            Method of = optional.getMethod("of", Object.class); of.setAccessible(true);
            Map<VehiclePowertrain,Object> fuelTypes=new EnumMap<>(VehiclePowertrain.class);
            fuelTypes.put(VehiclePowertrain.BEV,singleton.invoke(null,electric));
            fuelTypes.put(VehiclePowertrain.PHEV,copy.invoke(null,Arrays.asList(unleaded,electric)));
            fuelTypes.put(VehiclePowertrain.HEV,singleton.invoke(null,unleaded));
            Map<String,Object> connections=new HashMap<>();
            // Raw CarInfo IDs, not energy-proto IDs. No backend acceptance is implied.
            for(VehiclePowertrain powertrain:new VehiclePowertrain[]{VehiclePowertrain.BEV,VehiclePowertrain.PHEV,VehiclePowertrain.HEV}){
                for(VehicleEvConnection connection:VehicleEvConnection.choices(powertrain)){
                    if(connections.containsKey(connection.id))continue;
                    Collection<Integer> ids=new ArrayList<>();for(int value:connection.carInfoEnums())ids.add(value);
                    connections.put(connection.id,of.invoke(null,copy.invoke(null,ids)));
                }
            }
            return Proxy.newProxyInstance(loader,new Class<?>[]{type},new Adapter(original,Collections.unmodifiableMap(fuelTypes),Collections.unmodifiableMap(connections)));
        } catch (ReflectiveOperationException | RuntimeException | LinkageError incompatible) {
            // An unknown Maps ABI retains its original vehicle information and capabilities.
            return original;
        }
    }

    private static void require(boolean valid, String message) {
        if (!valid) throw new IllegalStateException(message);
    }

    private static final class Adapter implements InvocationHandler {
        private final Object original;
        private final Map<VehiclePowertrain,Object> fuelTypes;
        private final Map<String,Object> connections;
        Adapter(Object original,Map<VehiclePowertrain,Object> fuelTypes,Map<String,Object> connections) {
            this.original=original;this.fuelTypes=fuelTypes;this.connections=connections;
        }
        public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
            if (method.getDeclaringClass() == Object.class) {
                if ("equals".equals(method.getName())) return proxy == args[0];
                if ("hashCode".equals(method.getName())) return System.identityHashCode(proxy);
                if ("toString".equals(method.getName())) return "VehicleEvInfo(" + original.getClass().getName() + ")";
            }
            String name = method.getName();
            if (method.getParameterTypes().length == 0) {
                // Identity is available at construction, including before async profile loading.
                VehiclePowertrain powertrain=VehicleEvBridge.identityPowertrain();
                VehicleEvConnection connection=VehicleEvBridge.identityConnection();
                if(connection!=null&&connection.supportsIdentity(powertrain)&&fuelTypes.containsKey(powertrain)&&connections.containsKey(connection.id)){
                    if("d".equals(name))return fuelTypes.get(powertrain);
                    if("e".equals(name))return connections.get(connection.id);
                    if("j".equals(name))return powertrain==VehiclePowertrain.BEV;
                    if("k".equals(name))return powertrain==VehiclePowertrain.BEV||powertrain==VehiclePowertrain.PHEV;
                    if("l".equals(name))return powertrain==VehiclePowertrain.PHEV;
                    // A PHEV identity does not authorize our BEV-only energy model or charging plan.
                    if("i".equals(name)&&powertrain==VehiclePowertrain.BEV&&VehicleEvBridge.canPlanRoutes())return true;
                }
            }
            try { method.setAccessible(true); return method.invoke(original, args); }
            catch (InvocationTargetException failure) { throw failure.getCause(); }
        }
    }
}
