import io.grpc.CallOptions;
import io.grpc.ClientCall;
import io.grpc.ManagedChannel;
import io.grpc.Metadata;
import io.grpc.MethodDescriptor;
import io.grpc.Server;
import io.grpc.ServerCall;
import io.grpc.ServerCallHandler;
import io.grpc.ServerServiceDefinition;
import io.grpc.Status;
import io.grpc.netty.NettyChannelBuilder;
import io.grpc.netty.NettyServerBuilder;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.InetSocketAddress;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

public final class ToolingClasspathSmoke {
    private static final MethodDescriptor.Marshaller<String> TEXT =
            new MethodDescriptor.Marshaller<String>() {
                public InputStream stream(String value) {
                    return new ByteArrayInputStream(value.getBytes(StandardCharsets.UTF_8));
                }
                public String parse(InputStream input) {
                    try {
                        ByteArrayOutputStream out = new ByteArrayOutputStream();
                        byte[] buffer = new byte[512];
                        for (int n; (n = input.read(buffer)) != -1;) out.write(buffer, 0, n);
                        return new String(out.toByteArray(), StandardCharsets.UTF_8);
                    } catch (Exception error) { throw new RuntimeException(error); }
                }
            };

    public static final class Xml {
        public static void main(String[] args) throws Exception {
            Class<?> parser = Class.forName("org.jdom2.input.SAXBuilder");
            Object document = parser.getMethod("build", java.io.Reader.class).invoke(
                    parser.getDeclaredConstructor().newInstance(), new java.io.StringReader("<smoke>compatible</smoke>"));
            Object root = document.getClass().getMethod("getRootElement").invoke(document);
            if (!"compatible".equals(root.getClass().getMethod("getText").invoke(root))) {
                throw new AssertionError("JDOM changed trusted XML content");
            }
            System.out.println("JDOM trusted XML parsing passed");
        }
    }

    public static void main(String[] args) throws Exception {
        MethodDescriptor<String, String> method = MethodDescriptor.<String, String>newBuilder()
                .setType(MethodDescriptor.MethodType.UNARY)
                .setFullMethodName("tooling.Smoke/Echo").setRequestMarshaller(TEXT)
                .setResponseMarshaller(TEXT).build();
        ServerServiceDefinition service = ServerServiceDefinition.builder("tooling.Smoke")
                .addMethod(method, new ServerCallHandler<String, String>() {
                    public ServerCall.Listener<String> startCall(final ServerCall<String, String> call, Metadata headers) {
                        call.request(1);
                        return new ServerCall.Listener<String>() {
                            String request;
                            public void onMessage(String value) { request = value; }
                            public void onHalfClose() {
                                call.sendHeaders(new Metadata());
                                call.sendMessage("echo:" + request);
                                call.close(Status.OK, new Metadata());
                            }
                        };
                    }
                }).build();
        Server server = null;
        ManagedChannel channel = null;
        try {
            server = NettyServerBuilder.forAddress(new InetSocketAddress("127.0.0.1", 0)).addService(service).build().start();
            channel = NettyChannelBuilder.forAddress("127.0.0.1", server.getPort()).usePlaintext().build();
            final CountDownLatch done = new CountDownLatch(1);
            final String[] reply = new String[1];
            final Status[] status = new Status[1];
            ClientCall<String, String> call = channel.newCall(method, CallOptions.DEFAULT.withDeadlineAfter(10, TimeUnit.SECONDS));
            call.start(new ClientCall.Listener<String>() {
                public void onMessage(String value) { reply[0] = value; }
                public void onClose(Status value, Metadata trailers) { status[0] = value; done.countDown(); }
            }, new Metadata());
            call.request(1);
            call.sendMessage("compatibility");
            call.halfClose();
            if (!done.await(15, TimeUnit.SECONDS) || status[0] == null || !status[0].isOk()
                    || !"echo:compatibility".equals(reply[0])) {
                throw new AssertionError("Loopback gRPC call failed: " + status[0] + ", response=" + reply[0]);
            }
            System.out.println("gRPC loopback passed; " + io.netty.util.Version.identify());
        } finally {
            if (channel != null) {
                channel.shutdownNow();
                if (!channel.awaitTermination(10, TimeUnit.SECONDS)) throw new AssertionError("gRPC channel did not terminate");
            }
            if (server != null) {
                server.shutdownNow();
                if (!server.awaitTermination(10, TimeUnit.SECONDS)) throw new AssertionError("gRPC server did not terminate");
            }
        }
    }
}
