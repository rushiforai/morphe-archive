// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.extension.syncforreddit.websitepreview;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import okhttp3.HttpUrl;
import okhttp3.Interceptor;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Protocol;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;
import okio.Buffer;
import okio.BufferedSource;
import org.junit.Test;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertThrows;
import static org.junit.Assert.assertTrue;

public final class PreviewClientTest {
    private static final HttpUrl PAGE = HttpUrl.get("https://site.example.org/start");
    private static final byte[] IMAGE = {1, 2, 3};

    private static PreviewClient client(Interceptor interceptor) {
        return client(31, interceptor);
    }

    private static PreviewClient client(int sdkInt, Interceptor interceptor) {
        return new PreviewClient(new OkHttpClient.Builder().addInterceptor(interceptor).build(), sdkInt);
    }

    private static Response.Builder response(Request request, int status) {
        return new Response.Builder().request(request).protocol(Protocol.HTTP_1_1).code(status).message("fixture");
    }

    private static Response html(Request request, String html) {
        return response(request, 200).body(ResponseBody.create(html, MediaType.get("text/html"))).build();
    }

    private static Response image(Request request) {
        return response(request, 200).body(ResponseBody.create(IMAGE, MediaType.get("image/png"))).build();
    }

    private static Response redirect(Request request, String target) {
        return response(request, 302).header("Location", target)
                .body(ResponseBody.create("", MediaType.get("text/html"))).build();
    }

    private static byte[] fetch(PreviewClient client, PreviewClient.Access access) throws IOException {
        return client.fetch(PAGE, access, new PreviewClient.RequestScope(), bytes -> bytes).image;
    }

    @Test
    public void prefersFirstImageAndSkipsDuplicateAndUnsafeCandidatesOnFallback() throws IOException {
        List<String> paths = new ArrayList<>();
        for (int firstStatus : List.of(200, 404)) {
            PreviewClient client = client(chain -> {
                Request request = chain.request();
                String path = request.url().encodedPath();
                paths.add(path);
                if (path.equals("/start")) {
                    return html(request, "<meta property=og:image content='http://127.0.0.1/a'>"
                            + "<meta property=og:image content=/first>"
                            + "<meta name=og:image content='/first#duplicate'>"
                            + "<meta property=og:image content=/second>");
                }
                if (path.equals("/first") && firstStatus == 404) {
                    return response(request, 404).body(ResponseBody.create("", MediaType.get("text/plain"))).build();
                }
                return image(request);
            });

            assertArrayEquals(IMAGE, fetch(client, url -> true));
            assertEquals(firstStatus == 200 ? List.of("/start", "/first")
                    : List.of("/start", "/first", "/second"), paths);
            paths.clear();
        }
    }

    @Test
    public void reportsFinalUrlOfSecondImageAfterDecodeFailure() throws IOException {
        HttpUrl finalUrl = HttpUrl.get("https://images.example.net/cover?size=2");
        PreviewClient client = client(chain -> {
            Request request = chain.request();
            switch (request.url().encodedPath()) {
                case "/start":
                    return html(request, "<meta property=og:image content=/broken>"
                            + "<meta property=og:image content=/image>");
                case "/broken":
                    return response(request, 200).body(ResponseBody.create(new byte[] {0}, MediaType.get("image/avif")))
                            .build();
                case "/image":
                    return redirect(request, finalUrl.toString());
                default:
                    return image(request);
            }
        });
        List<Integer> decodedLengths = new ArrayList<>();
        PreviewClient.FetchedImage<byte[]> actual =
                client.fetch(PAGE, url -> true, new PreviewClient.RequestScope(), bytes -> {
                    decodedLengths.add(bytes.length);
                    if (bytes.length == 1) throw new IOException("Unsupported encoded image");
                    return bytes;
                });

        assertArrayEquals(IMAGE, actual.image);
        assertEquals(finalUrl, actual.url);
        assertEquals(List.of(1, IMAGE.length), decodedLengths);
    }

    @Test
    public void negotiatesAvifStartingAtAndroid12AndFallsBackOnEarlierVersions() throws IOException {
        String commonImages = "image/webp,image/png,image/jpeg,image/gif";
        byte[] avif = {4};
        for (int sdkInt : List.of(23, 30, 31, 35)) {
            boolean supportsAvif = sdkInt >= 31;
            List<String> paths = new ArrayList<>();
            PreviewClient client = client(sdkInt, chain -> {
                Request request = chain.request();
                String path = request.url().encodedPath();
                paths.add(path);
                if (path.equals("/start")) {
                    assertEquals("text/html,application/xhtml+xml", request.header("Accept"));
                    return html(request, "<meta property=og:image content=/avif>"
                            + "<meta property=og:image content=/png>");
                }
                assertEquals(supportsAvif ? "image/avif," + commonImages : commonImages, request.header("Accept"));
                if (path.equals("/avif")) {
                    return response(request, 200).body(ResponseBody.create(avif, MediaType.get("image/avif"))).build();
                }
                return image(request);
            });

            assertArrayEquals(supportsAvif ? avif : IMAGE, fetch(client, url -> true));
            assertEquals(supportsAvif ? List.of("/start", "/avif") : List.of("/start", "/avif", "/png"), paths);
        }
    }

    @Test
    public void limitsCandidatesAndSharesImageRequestBudget() {
        for (boolean firstRedirects : List.of(false, true)) {
            List<String> paths = new ArrayList<>();
            PreviewClient client = client(chain -> {
                Request request = chain.request();
                String path = request.url().encodedPath();
                paths.add(path);
                if (path.equals("/start")) {
                    return html(request, "<meta property=og:image content=/one>"
                            + "<meta property=og:image content=/two><meta property=og:image content=/three>");
                }
                if (firstRedirects && path.equals("/one")) return redirect(request, "/one-1");
                if (firstRedirects && path.equals("/one-1")) return redirect(request, "/one-2");
                if (firstRedirects && path.equals("/two")) return redirect(request, "/over-budget");
                return html(request, "<title>Unsupported image response</title>");
            });

            assertThrows(IOException.class, () -> fetch(client, url -> true));
            assertEquals(firstRedirects ? List.of("/start", "/one", "/one-1", "/one-2", "/two")
                    : List.of("/start", "/one", "/two"), paths);
        }
    }

    @Test
    public void sharesImageByteBudgetAfterDecodeFailure() {
        PreviewClient client = client(chain -> {
            Request request = chain.request();
            if (request.url().equals(PAGE)) {
                return html(request, "<meta property=og:image content=/one><meta property=og:image content=/two>");
            }
            int size = request.url().encodedPath().equals("/one") ? 2 * 1024 * 1024 : 1024 * 1024 + 1;
            return response(request, 200).body(stream("image/png", size)).build();
        });
        List<Integer> decodedLengths = new ArrayList<>();

        IOException failure = assertThrows(IOException.class,
                () -> client.fetch(PAGE, url -> true, new PreviewClient.RequestScope(), bytes -> {
                    decodedLengths.add(bytes.length);
                    throw new IOException("Unsupported encoded image");
                }));
        assertEquals("Website preview response too large", failure.getMessage());
        assertEquals(List.of(2 * 1024 * 1024), decodedLengths);
    }

    @Test
    public void followsPageAndImageRedirectsAndResolvesMetadataAgainstFinalPage() throws IOException {
        List<String> urls = new ArrayList<>();
        PreviewClient client = client(chain -> {
            Request request = chain.request();
            String url = request.url().toString();
            urls.add(url);
            assertEquals("GET", request.method());
            for (String header : List.of("Cookie", "Authorization", "Proxy-Authorization", "Referer")) {
                assertNull(request.header(header));
            }
            if (urls.size() == 1) return redirect(request, "https://pages.example.net/news/article");
            if (urls.size() == 2) return html(request, "<head><base href='https://ignore.example.net/'>"
                    + "<meta content='../img?size=2&amp;crop=1' property='og:image'></head>");
            if (urls.size() == 3) return redirect(request, "//images.example.net/cover");
            return image(request);
        });

        assertArrayEquals(IMAGE, fetch(client, url -> true));
        assertEquals(List.of(PAGE.toString(), "https://pages.example.net/news/article",
                "https://pages.example.net/img?size=2&crop=1", "https://images.example.net/cover"), urls);
    }

    @Test
    public void missingImageFailsAndRetryFetchesPageAgain() throws IOException {
        List<HttpUrl> urls = new ArrayList<>();
        PreviewClient client = client(chain -> {
            Request request = chain.request();
            urls.add(request.url());
            if (urls.size() == 1) return html(request, "<title>No preview here</title>");
            if (urls.size() == 2) return html(request, "<meta property='og:image' content='/image'>");
            return image(request);
        });

        assertThrows(IOException.class, () -> fetch(client, url -> true));
        assertArrayEquals(IMAGE, fetch(client, url -> true));
        assertEquals(List.of(PAGE, PAGE, PAGE.resolve("/image")), urls);
    }

    @Test
    public void checksAccessBeforePageImageAndEveryRedirect() throws IOException {
        List<HttpUrl> requests = new ArrayList<>();
        PreviewClient client = client(chain -> {
            Request request = chain.request();
            requests.add(request.url());
            return request.url().equals(PAGE)
                    ? html(request, "<meta property='og:image' content='/image'>"
                            + "<meta property='og:image' content='/unused-fallback'>")
                    : redirect(request, "https://images.example.net/cover");
        });

        assertThrows(IOException.class, () -> fetch(client, url -> false));
        assertTrue(requests.isEmpty());
        assertThrows(IOException.class, () -> fetch(client, url -> url.equals(PAGE)));
        assertEquals(List.of(PAGE), requests);
        requests.clear();
        assertThrows(IOException.class, () -> fetch(client, url -> url.host().equals(PAGE.host())));
        assertEquals(List.of(PAGE, PAGE.resolve("/image")), requests);
    }

    @Test
    public void blocksInvalidUrlsBeforeAnyPrivateOrCredentialedRequest() {
        for (String invalid : List.of("file:///data/image.png", "https://name:pw@site.example.org/image",
                "https://@site.example.org/image", "https:site.example.org", "https://127.1/a",
                "http://127.0.0.1/a", "http://2130706433/a", "http://192.168.1.1/a", "http://100.100.100.200/a",
                "http://169.254.169.254/a", "http://[::ffff:7f00:1]/a", "http://[64:ff9b::a00:1]/a",
                "https://[fc00::1]/a", "https://media.local/a", "https://multi.home.arpa/a", "https://home.arpa/a")) {
            assertNull(invalid, PreviewClient.url(invalid, null));
            assertNull(invalid, PreviewClient.url(invalid, PAGE));
        }

        PreviewClient pageRedirect = client(chain -> redirect(chain.request(), "http://10.0.0.1/"));
        assertThrows(IOException.class, () -> fetch(pageRedirect, url -> true));

        List<HttpUrl> requests = new ArrayList<>();
        PreviewClient imageRedirect = client(chain -> {
            Request request = chain.request();
            requests.add(request.url());
            return request.url().equals(PAGE) ? html(request, "<meta property=og:image content=/image>")
                    : redirect(request, "http://[::1]/image");
        });
        assertThrows(IOException.class, () -> fetch(imageRedirect, url -> true));
        assertEquals(List.of(PAGE, PAGE.resolve("/image")), requests);
    }

    @Test
    public void checksDnsAnswersAndConnectedPeer() throws IOException {
        InetAddress first = InetAddress.getByName("8.8.8.8");
        InetAddress second = InetAddress.getByName("9.9.9.9");
        InetAddress ipv6 = InetAddress.getByName("2606:4700:4700::1111");
        InetAddress privateAddress = InetAddress.getByName("10.0.0.1");
        assertEquals(List.of(first, ipv6), PreviewClient.publicAnswers(new InetAddress[] {first, ipv6}));
        assertThrows(UnknownHostException.class,
                () -> PreviewClient.publicAnswers(new InetAddress[] {first, privateAddress}));
        assertThrows(UnknownHostException.class, () -> PreviewClient.publicAnswers(new InetAddress[0]));
        PreviewClient.checkPeer(first, first);
        assertThrows(IOException.class, () -> PreviewClient.checkPeer(first, second));
        assertThrows(IOException.class, () -> PreviewClient.checkPeer(privateAddress, privateAddress));
    }

    @Test
    public void checksWellKnownNat64PrefixAndEmbeddedIpv4ForLiteralsDnsAndPeers() throws IOException {
        String publicNat64 = "64:ff9b::808:808";
        InetAddress nat64 = InetAddress.getByName(publicNat64);
        InetAddress ipv4 = InetAddress.getByName("8.8.8.8");
        assertNotNull(PreviewClient.url("https://[" + publicNat64 + "]/image", null));
        assertEquals(List.of(ipv4, nat64), PreviewClient.publicAnswers(new InetAddress[] {ipv4, nat64}));
        PreviewClient.checkPeer(nat64, nat64);
        assertThrows(IOException.class, () -> PreviewClient.checkPeer(nat64, ipv4));
        assertThrows(IOException.class, () -> PreviewClient.checkPeer(nat64, InetAddress.getByName("64:ff9b::909:909")));

        for (String blocked : List.of("64:ff9b::", "64:ff9b::a00:1", "64:ff9b::7f00:1", "64:ff9b::6440:1",
                "64:ff9b::a9fe:1", "64:ff9b::c000:201", "64:ff9b::c612:1", "64:ff9b::e000:1",
                "64:ff9a::808:808", "64:ff9b:1::808:808", "64:ff9b::1:808:808")) {
            InetAddress address = InetAddress.getByName(blocked);
            assertNull(blocked, PreviewClient.url("https://[" + blocked + "]/image", null));
            assertThrows(blocked, UnknownHostException.class,
                    () -> PreviewClient.publicAnswers(new InetAddress[] {nat64, address}));
            assertThrows(blocked, IOException.class, () -> PreviewClient.checkPeer(address, address));
        }
    }

    @Test
    public void admitsFourConcurrentDnsQueriesAndRejectsAnUnqueuedFifth() throws Exception {
        InetAddress address = InetAddress.getByName("8.8.8.8");
        ExecutorService callers = Executors.newFixedThreadPool(4);
        CountDownLatch started = new CountDownLatch(4);
        CountDownLatch release = new CountDownLatch(1);
        List<Future<List<InetAddress>>> results = new ArrayList<>();
        try {
            for (int index = 0; index < 4; index++) {
                results.add(callers.submit(() -> PreviewClient.resolve(() -> {
                    started.countDown();
                    release.await();
                    return new InetAddress[] {address};
                })));
            }
            assertTrue("All four DNS queries must run concurrently", started.await(1, TimeUnit.SECONDS));
            UnknownHostException busy = assertThrows(UnknownHostException.class, () -> PreviewClient.resolve(() -> {
                throw new AssertionError("The fifth DNS query must not run");
            }));
            assertEquals("Website preview DNS busy", busy.getMessage());

            release.countDown();
            for (Future<List<InetAddress>> result : results) {
                assertEquals(List.of(address), result.get(1, TimeUnit.SECONDS));
            }
        } finally {
            release.countDown();
            callers.shutdownNow();
            assertTrue(callers.awaitTermination(2, TimeUnit.SECONDS));
        }
    }

    @Test
    public void cancelsTimedOutDnsWork() throws InterruptedException {
        CountDownLatch release = new CountDownLatch(1);
        CountDownLatch interrupted = new CountDownLatch(1);
        try {
            UnknownHostException failure = assertThrows(UnknownHostException.class, () -> PreviewClient.resolve(() -> {
                try {
                    release.await();
                    return new InetAddress[0];
                } catch (InterruptedException cancelled) {
                    interrupted.countDown();
                    throw cancelled;
                }
            }));
            assertEquals("Website preview DNS unavailable", failure.getMessage());
            assertTrue("The timed-out query must be interrupted", interrupted.await(1, TimeUnit.SECONDS));
        } finally {
            release.countDown();
        }
    }

    @Test
    public void limitsRedirectsAndUnknownLengthBodies() {
        List<HttpUrl> urls = new ArrayList<>();
        PreviewClient looping = client(chain -> {
            urls.add(chain.request().url());
            return redirect(chain.request(), PAGE.toString());
        });
        assertThrows(IOException.class, () -> fetch(looping, url -> true));
        assertEquals(4, urls.size());

        PreviewClient longPage = client(chain -> response(chain.request(), 200)
                .body(stream("text/html", 512 * 1024 + 1)).build());
        assertThrows(IOException.class, () -> fetch(longPage, url -> true));

        PreviewClient longImage = client(chain -> {
            Request request = chain.request();
            return request.url().equals(PAGE) ? html(request, "<meta property=og:image content=/image>")
                    : response(request, 200).body(stream("image/png", 3 * 1024 * 1024 + 1)).build();
        });
        assertThrows(IOException.class, () -> fetch(longImage, url -> true));
    }

    private static ResponseBody stream(String mime, int size) {
        Buffer buffer = new Buffer().write(new byte[size]);
        return new ResponseBody() {
            @Override public MediaType contentType() { return MediaType.get(mime); }
            @Override public long contentLength() { return -1; }
            @Override public BufferedSource source() { return buffer; }
        };
    }
}
