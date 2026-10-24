import javax.xml.parsers.*;
import javax.xml.transform.*;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.*;
import java.io.*;

public final class VerifyManifestAttributes {
    public static void main(String[] args)throws Exception{
        int checks=0;
        for(boolean aware:new boolean[]{false,true}){
            DocumentBuilderFactory f=DocumentBuilderFactory.newInstance();f.setNamespaceAware(aware);
            Document d=f.newDocumentBuilder().parse(new ByteArrayInputStream(
                "<manifest xmlns:android=\"http://schemas.android.com/apk/res/android\"><application android:usesCleartextTraffic=\"false\" android:label=\"ChMate\"/></manifest>".getBytes("UTF-8")));
            Element a=(Element)d.getElementsByTagName("application").item(0);
            for(int i=0;i<3;i++){
                app.morphe.patches.chmate.ManifestAttributesKt.setAndroidAttribute(a,"usesCleartextTraffic","true");
                app.morphe.patches.chmate.ManifestAttributesKt.setAndroidAttribute(a,"label","Haiagaru");
                ByteArrayOutputStream out=new ByteArrayOutputStream();
                TransformerFactory.newInstance().newTransformer().transform(new DOMSource(d),new StreamResult(out));
                d=f.newDocumentBuilder().parse(new ByteArrayInputStream(out.toByteArray()));
                a=(Element)d.getElementsByTagName("application").item(0);
                if(!"true".equals(a.getAttribute("android:usesCleartextTraffic"))||!"Haiagaru".equals(a.getAttribute("android:label")))
                    throw new AssertionError("attributes lost");checks++;
            }
        }
        System.out.println("PASS "+checks+" manifest reparse / namespace / repeated update cases");
    }
}
