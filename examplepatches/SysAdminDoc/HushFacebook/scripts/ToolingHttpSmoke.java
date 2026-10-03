import java.io.ByteArrayOutputStream;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import org.apache.http.HttpEntity;
import org.apache.http.HttpHost;
import org.apache.http.client.utils.URIUtils;
import org.apache.http.entity.mime.MultipartEntityBuilder;

public final class ToolingHttpSmoke {
    public static void main(String[] args) throws Exception {
        String[] malformed = {
            "http://first.invalid:80@second.invalid:80@third.invalid/report",
            "http://host.invalid:8080;route=other/report",
            "http://some%20host.invalid:80/report"
        };
        for (String uri : malformed) {
            HttpHost host = URIUtils.extractHost(new URI(uri));
            if (host != null) throw new AssertionError("Malformed authority selected " + host);
        }
        HttpHost ordinary = URIUtils.extractHost(new URI("https://build.invalid:8443/report"));
        if (!"build.invalid".equals(ordinary.getHostName()) || ordinary.getPort() != 8443
                || !"https".equals(ordinary.getSchemeName())) throw new AssertionError("Ordinary host changed");
        HttpEntity entity = MultipartEntityBuilder.create().addTextBody("result", "compatible")
                .addBinaryBody("report", "fixture".getBytes(StandardCharsets.UTF_8)).build();
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        entity.writeTo(bytes);
        String body = new String(bytes.toByteArray(), StandardCharsets.UTF_8);
        if (!entity.getContentType().getValue().startsWith("multipart/form-data;")
                || !body.contains("compatible") || !body.contains("fixture")) {
            throw new AssertionError("Multipart report changed");
        }
        System.out.println("HTTP authority refusal, ordinary host and multipart checks passed");
    }
}
