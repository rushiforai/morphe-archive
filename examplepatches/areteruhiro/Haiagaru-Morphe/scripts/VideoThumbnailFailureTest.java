package app.morphe.extension.chmate;
public final class VideoThumbnailFailureTest {
 static int checks;static void ok(boolean value){if(!value)throw new AssertionError("check "+checks);checks++;}
 public static void main(String[] args){
  ok(VideoThumbnailFailure.from(new RuntimeException(new java.net.UnknownHostException("secret.example"))).kind==VideoThumbnailFailure.DNS);
  ok(VideoThumbnailFailure.from(new java.net.SocketTimeoutException()).kind==VideoThumbnailFailure.TIMEOUT);
  ok(VideoThumbnailFailure.from(new java.io.FileNotFoundException("/private/secret")).kind==VideoThumbnailFailure.STORAGE);
  ok(VideoThumbnailFailure.from(new java.io.EOFException()).kind==VideoThumbnailFailure.RANGE);
  ok(VideoThumbnailFailure.from(new OutOfMemoryError()).kind==VideoThumbnailFailure.MEMORY);
  ok(VideoThumbnailFailure.from(new java.io.IOException()).kind==VideoThumbnailFailure.NETWORK);
  ok(VideoThumbnailFailure.from(new IllegalArgumentException()).kind==VideoThumbnailFailure.DECODE);
  VideoThumbnailFailure http=new VideoThumbnailFailure(VideoThumbnailFailure.HTTP,403);ok(VideoThumbnailFailure.from(new RuntimeException(http))==http);ok(http.label().contains("403"));
  for(int kind=1;kind<=10;kind++){VideoThumbnailFailure failure=new VideoThumbnailFailure(kind,403);ok(!failure.label().isEmpty());ok(!failure.hint().isEmpty());ok(!failure.label().contains("secret"));ok(!failure.hint().contains("secret"));}
  System.out.println("PASS "+checks+" thumbnail failure classification/public-message checks");
 }
}
