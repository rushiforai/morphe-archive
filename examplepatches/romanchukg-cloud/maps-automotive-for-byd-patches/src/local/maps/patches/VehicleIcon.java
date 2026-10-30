// SPDX-License-Identifier: GPL-3.0-only
package local.maps.patches;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.security.MessageDigest;
import app.morphe.patcher.patch.ResourcePatchContext;

/** Our own top-down car picture for the map location arrow (raw/my_location_chevron_arrow) and the
 * flat navigation chevrons. The
 * user's original model is rebuilt at patch time: its Draco geometry stays as it is, only the image
 * and the material colour change (black base keeps the picture's alpha, the picture itself is the
 * emissive colour, specular off), so the car shows in its own colours. No Google bytes are bundled.
 * The input is pinned by SHA-256; any other model fails the patch. */
final class VehicleIcon {
    static final String PATH="res/raw/my_location_chevron_arrow.glb";
    static final String ORIGINAL_SHA256="7eb76cc5898b285c4997bbad962db26a4bbb55990993c89e24e2f8024d01d821";
    static final String TEXTURE="vehicle-icon/car-topview.webp";
    static final int IMAGE_LENGTH=2630,DRACO_OFFSET=2632,DRACO_LENGTH=166;

    static void apply(ResourcePatchContext context) throws Exception {
        Path file=context.get(PATH,false).toPath();
        byte[] original=Files.readAllBytes(file);
        require(sha256(original).equals(ORIGINAL_SHA256),"unexpected location arrow model");
        byte[] texture;
        try(InputStream in=VehicleIcon.class.getClassLoader().getResourceAsStream(TEXTURE)){
            require(in!=null,"missing "+TEXTURE);texture=in.readAllBytes();
        }
        Files.write(file,rebuild(original,texture));
        int replaced=replaceChevrons(context);
        int navatars=bundleNavatars(context);
        System.out.println("Vehicle icon: own top-down car in "+PATH+" ("+texture.length+" bytes WebP) and "+replaced+" navigation chevron/disc images; "+navatars+" Navatars files in assets/navatars");
    }

    /** Navigation draws flat chevron PNGs (256 or 207 px) over a disc PNG.
     * Night and min-mode discs are blue or dark, so those get the light car, like Google's own white chevrons.
     * The discs themselves become transparent: the car alone marks the position (owner's choice). */
    static final String[] CHEVRONS={"chevron_navigation_chevron","chevron_navigation_chevron_ambient","chevron_navigation_chevron_map_colors2",
        "chevron_navigation_chevron_min_mode","chevron_navigation_chevron_night","chevron_navigation_chevron_night_ambient","chevron_navigation_chevron_night_map_colors2"};
    static final String[] DISCS={"chevron_navigation_disc","chevron_navigation_disc_min_mode","chevron_navigation_disc_night",
        "chevron_navigation_disc_night_ambient","chevron_navigation_disc_night_map_colors2"};
    static int replaceChevrons(ResourcePatchContext context) throws Exception {
        java.io.File res=context.get("res",false);
        java.io.File[] dirs=res.listFiles(f->f.isDirectory()&&f.getName().startsWith("drawable"));
        require(dirs!=null,"no drawable resources");
        int replaced=0;
        for(String name:CHEVRONS)replaced+=replaceDrawable(dirs,name,name.contains("_night")||name.endsWith("_min_mode")?"car-light-":"car-");
        for(String name:DISCS)replaced+=replaceDrawable(dirs,name,"empty-");
        return replaced;
    }
    static int replaceDrawable(java.io.File[] dirs,String name,String prefix) throws Exception {
        Path found=null;
        for(java.io.File dir:dirs){
            Path candidate=dir.toPath().resolve(name+".png");
            if(!Files.exists(candidate))continue;
            require(found==null,"duplicate "+name);found=candidate;
        }
        require(found!=null,"missing "+name);
        int size=pngWidth(Files.readAllBytes(found));
        require(size==256||size==207,"unexpected size "+size+" for "+name);
        String bundled=prefix+size+".png";
        byte[] image;
        try(InputStream in=VehicleIcon.class.getClassLoader().getResourceAsStream("vehicle-icon/"+bundled)){
            require(in!=null,"missing "+bundled);image=in.readAllBytes();
        }
        require(pngWidth(image)==size,"bundled "+bundled+" size");
        Files.write(found,image);
        return 1;
    }
    /** The 3D car models (our own rig, see NOTICE) into the APK's assets/navatars/, read at startup by
     * Navatars.installEarly; the bundle's navatars/FILES lists them (manifest, models.json, <id>.fbx/.png). */
    static int bundleNavatars(ResourcePatchContext context) throws Exception {
        Path dir=context.get("assets",false).toPath().resolve("navatars");
        Files.createDirectories(dir);
        String list;
        try(InputStream in=VehicleIcon.class.getClassLoader().getResourceAsStream("navatars/FILES")){
            require(in!=null,"missing navatars/FILES");list=new String(in.readAllBytes(),java.nio.charset.StandardCharsets.UTF_8);
        }
        int count=0;
        for(String name:list.split("\n")){
            if(name.isBlank())continue;
            require(name.matches("[A-Za-z0-9_.-]+"),"bad navatars file name "+name);
            try(InputStream in=VehicleIcon.class.getClassLoader().getResourceAsStream("navatars/"+name)){
                require(in!=null,"missing navatars/"+name);Files.write(dir.resolve(name),in.readAllBytes());
            }
            count++;
        }
        require(count>=3,"navatars/FILES lists too few files");
        return count;
    }
    static int pngWidth(byte[] png){
        require(png.length>24&&(png[0]&255)==0x89&&png[1]=='P'&&png[2]=='N'&&png[3]=='G',"not a PNG");
        return ByteBuffer.wrap(png,16,4).order(ByteOrder.BIG_ENDIAN).getInt();
    }

    static byte[] rebuild(byte[] glb,byte[] texture) throws Exception {
        ByteBuffer in=ByteBuffer.wrap(glb).order(ByteOrder.LITTLE_ENDIAN);
        require(in.getInt(0)==0x46546c67&&in.getInt(4)==2&&in.getInt(8)==glb.length,"GLB header");
        int jsonLength=in.getInt(12);require(in.getInt(16)==0x4e4f534a,"JSON chunk");
        int binOffset=20+jsonLength;require(in.getInt(binOffset+4)==0x004e4942,"BIN chunk");
        String json=new String(glb,20,jsonLength,StandardCharsets.UTF_8).trim();
        byte[] draco=new byte[DRACO_LENGTH];System.arraycopy(glb,binOffset+8+DRACO_OFFSET,draco,0,DRACO_LENGTH);
        int dracoOffset=align(texture.length),binLength=dracoOffset+DRACO_LENGTH;
        json=replace(json,"\"bufferViews\":[{\"buffer\":0,\"byteOffset\":0,\"byteLength\":"+IMAGE_LENGTH+"},{\"buffer\":0,\"byteOffset\":"+DRACO_OFFSET+",\"byteLength\":"+DRACO_LENGTH+"}]",
            "\"bufferViews\":[{\"buffer\":0,\"byteOffset\":0,\"byteLength\":"+texture.length+"},{\"buffer\":0,\"byteOffset\":"+dracoOffset+",\"byteLength\":"+DRACO_LENGTH+"}]");
        json=replace(json,"\"buffers\":[{\"byteLength\":2798}]","\"buffers\":[{\"byteLength\":"+binLength+"}]");
        json=replace(json,"\"name\":\"NavArrow_Alpha_Centered_v01_00\"","\"name\":\"TopViewCar\"");
        json=replace(json,"\"baseColorFactor\":[0.004776229616254568,0.08650018274784088,1,1]","\"baseColorFactor\":[0,0,0,1]");
        json=replace(json,"\"emissiveFactor\":[0.004776229616254568,0.08650018274784088,1]","\"emissiveFactor\":[1,1,1],\"emissiveTexture\":{\"index\":0}");
        json=replace(json,"\"specularColorFactor\":[2.3713576793670654,2.3713576793670654,2.3713576793670654]","\"specularColorFactor\":[0,0,0]");
        byte[] jsonBytes=json.getBytes(StandardCharsets.UTF_8);
        int jsonChunk=align(jsonBytes.length),binChunk=align(binLength);
        ByteBuffer out=ByteBuffer.allocate(12+8+jsonChunk+8+binChunk).order(ByteOrder.LITTLE_ENDIAN);
        out.putInt(0x46546c67).putInt(2).putInt(out.capacity());
        out.putInt(jsonChunk).putInt(0x4e4f534a).put(jsonBytes);
        for(int i=jsonBytes.length;i<jsonChunk;i++)out.put((byte)' ');
        out.putInt(binChunk).putInt(0x004e4942).put(texture);
        for(int i=texture.length;i<dracoOffset;i++)out.put((byte)0);
        out.put(draco);
        for(int i=binLength;i<binChunk;i++)out.put((byte)0);
        return out.array();
    }
    private static int align(int n){return (n+3)&~3;}
    private static String replace(String json,String from,String to){
        int at=json.indexOf(from);require(at>=0&&json.indexOf(from,at+1)<0,"location arrow model JSON changed");
        return json.replace(from,to);
    }
    private static String sha256(byte[] data) throws Exception {
        StringBuilder s=new StringBuilder();for(byte b:MessageDigest.getInstance("SHA-256").digest(data))s.append(String.format("%02x",b&255));return s.toString();
    }
    private static void require(boolean condition,String message){if(!condition)throw new IllegalStateException("Vehicle icon: "+message);}
    private VehicleIcon(){}
}
