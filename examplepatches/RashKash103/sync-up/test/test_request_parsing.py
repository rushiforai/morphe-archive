# /// script
# requires-python = ">=3.9"
# dependencies = []
# ///
"""Run offline request-parsing regressions with a JDK, without Android or Gradle.

Usage: uv run test/test_request_parsing.py [--java-home /path/to/jdk]

The okhttp, org.json, androidx and Morphe stubs below exist only in a temporary test
directory and are never packaged into an extension. None of the methods under test touch
them, so every stub method throws: a stub that is reached is a test that is wrong about
what it is measuring, and it fails rather than passing quietly.
"""

import argparse
import os
from pathlib import Path
import shutil
import subprocess
import tempfile


STUBS = {
    "androidx/annotation/NonNull.java": """
package androidx.annotation;
public @interface NonNull {}
""",
    "androidx/annotation/Nullable.java": """
package androidx.annotation;
public @interface Nullable {}
""",
    "app/morphe/extension/shared/Logger.java": """
package app.morphe.extension.shared;
public class Logger {
    public interface LogMessage { String buildMessageString(); }
    public static void printDebug(LogMessage message) {}
    public static void printInfo(LogMessage message) {}
    public static void printInfo(LogMessage message, Throwable ex) {}
    public static void printException(LogMessage message, Throwable ex) {}
}
""",
    "org/json/JSONException.java": """
package org.json;
public class JSONException extends Exception {
    public JSONException(String message) { super(message); }
}
""",
    "org/json/JSONObject.java": """
package org.json;
public class JSONObject {
    public static final Object NULL = new Object();
    public JSONObject() {}
    public JSONObject(String source) throws JSONException { throw new AssertionError(); }
    public JSONObject put(String key, Object value) throws JSONException { throw new AssertionError(); }
    public JSONObject put(String key, int value) throws JSONException { throw new AssertionError(); }
    public Object opt(String key) { throw new AssertionError(); }
    public JSONObject optJSONObject(String key) { throw new AssertionError(); }
    public JSONArray optJSONArray(String key) { throw new AssertionError(); }
    public String optString(String key) { throw new AssertionError(); }
    public String optString(String key, String fallback) { throw new AssertionError(); }
}
""",
    "org/json/JSONArray.java": """
package org.json;
public class JSONArray {
    public JSONArray() {}
    public JSONArray(String source) throws JSONException { throw new AssertionError(); }
    public int length() { throw new AssertionError(); }
    public JSONArray put(Object value) { throw new AssertionError(); }
    public Object get(int index) throws JSONException { throw new AssertionError(); }
    public JSONObject optJSONObject(int index) { throw new AssertionError(); }
}
""",
    "okhttp3/Interceptor.java": """
package okhttp3;
public interface Interceptor {
    Response intercept(Chain chain) throws java.io.IOException;
    interface Chain {
        Request request();
        Response proceed(Request request) throws java.io.IOException;
    }
}
""",
    "okhttp3/HttpUrl.java": """
package okhttp3;
public final class HttpUrl {
    public String host() { throw new AssertionError(); }
    public String encodedPath() { throw new AssertionError(); }
    public String queryParameter(String name) { throw new AssertionError(); }
    public static final class Builder {
        public Builder scheme(String scheme) { throw new AssertionError(); }
        public Builder host(String host) { throw new AssertionError(); }
        public Builder addPathSegment(String segment) { throw new AssertionError(); }
        public Builder addQueryParameter(String name, String value) { throw new AssertionError(); }
        public HttpUrl build() { throw new AssertionError(); }
    }
}
""",
    "okhttp3/MediaType.java": """
package okhttp3;
public final class MediaType {
    public static MediaType get(String type) { throw new AssertionError(); }
}
""",
    "okhttp3/Protocol.java": """
package okhttp3;
public enum Protocol { HTTP_1_1 }
""",
    "okhttp3/RequestBody.java": """
package okhttp3;
public abstract class RequestBody {}
""",
    "okhttp3/Request.java": """
package okhttp3;
public final class Request {
    public HttpUrl url() { throw new AssertionError(); }
    public RequestBody body() { throw new AssertionError(); }
    public Builder newBuilder() { throw new AssertionError(); }
    public static final class Builder {
        public Builder url(HttpUrl url) { throw new AssertionError(); }
        public Builder get() { throw new AssertionError(); }
        public Request build() { throw new AssertionError(); }
    }
}
""",
    "okhttp3/ResponseBody.java": """
package okhttp3;
public abstract class ResponseBody {
    public static ResponseBody create(String content, MediaType type) { throw new AssertionError(); }
    public String string() throws java.io.IOException { throw new AssertionError(); }
}
""",
    "okhttp3/Response.java": """
package okhttp3;
public final class Response {
    public boolean isSuccessful() { throw new AssertionError(); }
    public int code() { throw new AssertionError(); }
    public ResponseBody body() { throw new AssertionError(); }
    public void close() { throw new AssertionError(); }
    public Builder newBuilder() { throw new AssertionError(); }
    public static final class Builder {
        public Builder message(String message) { throw new AssertionError(); }
        public Builder code(int code) { throw new AssertionError(); }
        public Builder request(Request request) { throw new AssertionError(); }
        public Builder protocol(Protocol protocol) { throw new AssertionError(); }
        public Builder header(String name, String value) { throw new AssertionError(); }
        public Builder removeHeader(String name) { throw new AssertionError(); }
        public Builder body(ResponseBody body) { throw new AssertionError(); }
        public Response build() { throw new AssertionError(); }
    }
}
""",
}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--java-home", default=os.environ.get("JAVA_HOME"))
    args = parser.parse_args()

    def tool(name):
        executable = name + (".exe" if os.name == "nt" else "")
        found = str(Path(args.java_home) / "bin" / executable) if args.java_home else shutil.which(executable)
        if not found or not Path(found).is_file():
            raise SystemExit("Could not find " + name + "; pass --java-home or set JAVA_HOME.")
        return found

    project = Path(__file__).resolve().parent.parent
    shared = project / "extensions/shared/library/src/main/java"
    sync = project / "extensions/syncforreddit/src/main/java"
    tests = project / "test/java/app/morphe/extension/syncforreddit/http"

    sources = [
        shared / "app/morphe/extension/shared/requests/PatchedditInterceptor.java",
        sync / "app/morphe/extension/syncforreddit/http/posts/FixPostLookupPatch.java",
        sync / "app/morphe/extension/syncforreddit/http/comments/FixMoreCommentsPatch.java",
        sync / "app/morphe/extension/syncforreddit/http/imgur/ImgurIds.java",
        tests / "RequestParsingTest.java",
        tests / "ImgurIdsTest.java",
    ]
    for source in sources:
        if not source.is_file():
            raise SystemExit("Missing source: " + str(source))

    with tempfile.TemporaryDirectory(prefix="sync-up-request-tests-") as directory:
        temporary = Path(directory)
        classes = temporary / "classes"
        classes.mkdir()
        for name, contents in STUBS.items():
            path = temporary / "stubs" / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(contents, encoding="utf-8")
            sources.append(path)
        subprocess.run([tool("javac"), "--release", "11", "-nowarn",
                        "-d", str(classes), *map(str, sources)], check=True)
        for name in ("RequestParsingTest", "ImgurIdsTest"):
            subprocess.run([tool("java"), "-cp", str(classes),
                            "app.morphe.extension.syncforreddit.http." + name], check=True)


if __name__ == "__main__":
    main()
