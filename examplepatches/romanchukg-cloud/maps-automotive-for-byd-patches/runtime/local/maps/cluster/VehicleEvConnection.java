// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

/** Owner-selected station types, independent of the vehicle-data reader and country. */
final class VehicleEvConnection {
    static final String UNKNOWN="UNKNOWN";
    static final VehicleEvConnection CCS2=new VehicleEvConnection("CCS2","CCS2",new int[]{5},new int[]{6});
    static final VehicleEvConnection CCS1=new VehicleEvConnection("CCS1","CCS1",new int[]{4},new int[]{5});
    static final VehicleEvConnection GBT=new VehicleEvConnection("GBT","GB/T (DC)",new int[]{10},new int[]{10});
    static final VehicleEvConnection GBT_CCS2=new VehicleEvConnection("GBT_CCS2","GB/T (DC) + CCS2 adapter",new int[]{10,5},new int[]{10,6});
    static final VehicleEvConnection TYPE2=new VehicleEvConnection("TYPE2","Type 2 (AC)",new int[]{2},new int[0]);
    static final VehicleEvConnection TYPE2_CCS2=new VehicleEvConnection("TYPE2_CCS2","Type 2 (AC) + CCS2 (DC)",new int[]{2,5},new int[0]);
    static final VehicleEvConnection GBTAC=new VehicleEvConnection("GBTAC","GB/T (AC)",new int[]{9},new int[0]);
    static final VehicleEvConnection GBTAC_DC=new VehicleEvConnection("GBTAC_DC","GB/T (AC + DC)",new int[]{9,10},new int[0]);
    static final VehicleEvConnection GBTAC_DC_CCS2=new VehicleEvConnection("GBTAC_DC_CCS2","GB/T (AC + DC) + CCS2 adapter",new int[]{9,10,5},new int[0]);
    static final VehicleEvConnection NONE=new VehicleEvConnection("NONE","No external charging",new int[0],new int[0]);
    final String id,label;
    private final int[] carInfo,energy;
    private VehicleEvConnection(String id,String label,int[] carInfo,int[] energy){this.id=id;this.label=label;this.carInfo=carInfo.clone();this.energy=energy.clone();}
    /** Unknown values stay unknown; they must never silently select CCS2. */
    static VehicleEvConnection get(String id){
        if("CCS2".equals(id))return CCS2;
        if("CCS1".equals(id))return CCS1;
        if("GBT".equals(id))return GBT;
        if("GBT_CCS2".equals(id))return GBT_CCS2;
        if("TYPE2".equals(id))return TYPE2;
        if("TYPE2_CCS2".equals(id))return TYPE2_CCS2;
        if("GBTAC".equals(id))return GBTAC;
        if("GBTAC_DC".equals(id))return GBTAC_DC;
        if("GBTAC_DC_CCS2".equals(id))return GBTAC_DC_CCS2;
        if("NONE".equals(id))return NONE;
        return null;
    }
    static VehicleEvConnection[] choices(){return new VehicleEvConnection[]{CCS2,CCS1,GBT,GBT_CCS2};}
    static VehicleEvConnection[] choices(VehiclePowertrain type){
        if(type==VehiclePowertrain.BEV)return choices();
        if(type==VehiclePowertrain.PHEV)return new VehicleEvConnection[]{TYPE2,TYPE2_CCS2,GBTAC,GBTAC_DC,GBTAC_DC_CCS2,CCS2,CCS1,GBT,GBT_CCS2};
        if(type==VehiclePowertrain.HEV)return new VehicleEvConnection[]{NONE};
        return new VehicleEvConnection[0];
    }
    boolean supportsIdentity(VehiclePowertrain type){
        if(type==VehiclePowertrain.BEV)return this==CCS2||this==CCS1||this==GBT||this==GBT_CCS2;
        if(type==VehiclePowertrain.PHEV)return carInfo.length>0;
        return type==VehiclePowertrain.HEV&&this==NONE;
    }
    /** Raw CarInfo domain: Type2=2, CCS1=4, CCS2=5, GB/T AC=9, GB/T DC=10 (Maps fuh: COMBO_1=4, COMBO_2=5). */
    int[] carInfoEnums(){return carInfo.clone();}
    /** Energy-protobuf numbering (CCS_COMBO_1=5, CCS_COMBO_2=6, GB_T=10); native station-catalog numbering is a separate ABI. */
    int[] energyEnums(){return energy.clone();}
}
