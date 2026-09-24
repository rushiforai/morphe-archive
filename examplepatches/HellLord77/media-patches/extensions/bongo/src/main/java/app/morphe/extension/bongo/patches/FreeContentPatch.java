package app.morphe.extension.bongo.patches;

import app.morphe.extension.bongo.repos.ContentRepo;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import com.bongo.bongobd.view.model.ContentDetailsResponse;
import com.bongo.bongobd.view.network.ApiServiceSaas;
import com.goebl.david.Webb;
import java.io.IOException;
import java.util.Objects;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import kotlin.NotImplementedError;
import kotlin.Result;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import okhttp3.Request;
import okio.Timeout;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import saas.ott.smarttv.ui.details.data.DetailsEndPoint;
import saas.ott.smarttv.ui.details.model.ContentDetails;

@SuppressWarnings("unused")
public class FreeContentPatch {
  private static final ExecutorService EXECUTOR = Executors.newSingleThreadExecutor();

  @Nullable
  public static Object getContentDetails(
      @NotNull ApiServiceSaas self,
      @Nullable String bongoId,
      @NotNull Continuation<Response<ContentDetailsResponse>> continuation) {
    Utils.showToastShort(String.format("bongoId: %s", bongoId));

    return self.getContentDetails(
        bongoId,
        new Continuation<>() {
          @NotNull
          @Override
          public CoroutineContext getContext() {
            return continuation.getContext();
          }

          @SuppressWarnings({"unchecked", "DataFlowIssue"})
          @Override
          public void resumeWith(@NotNull Object result) {
            if (!(result instanceof Result.Failure)) {
              result =
                  getResponse(
                      bongoId,
                      (Response<ContentDetailsResponse>) result,
                      ContentDetailsResponse.class);
            }
            continuation.resumeWith(result);
          }
        });
  }

  @NotNull
  public static Call<ContentDetails> getVideoDetailsData(
      @NotNull DetailsEndPoint self, @NotNull String id) {
    Utils.showToastShort(String.format("id: %s", id));
    var call = self.getVideoDetailsData(id);

    return new Call<>() {
      @NotNull
      @Override
      public Response<ContentDetails> execute() throws IOException {
        return getResponse(id, call.execute(), ContentDetails.class);
      }

      @Override
      public void enqueue(@NotNull Callback<ContentDetails> callback) {
        call.enqueue(
            new Callback<>() {
              @Override
              public void onResponse(
                  @NotNull Call<ContentDetails> call, @NotNull Response<ContentDetails> response) {
                try {
                  callback.onResponse(
                      call,
                      EXECUTOR.submit(() -> getResponse(id, response, ContentDetails.class)).get());
                } catch (ExecutionException | InterruptedException t) {
                  callback.onFailure(call, t);
                }
              }

              @Override
              public void onFailure(@NotNull Call<ContentDetails> call, @NotNull Throwable t) {
                callback.onFailure(call, t);
              }
            });
      }

      @Override
      public boolean isExecuted() {
        return call.isExecuted();
      }

      @Override
      public void cancel() {
        call.cancel();
      }

      @Override
      public boolean isCanceled() {
        return call.isCanceled();
      }

      @NotNull
      @Override
      public Call<ContentDetails> clone() {
        throw new NotImplementedError();
      }

      @NotNull
      @Override
      public Request request() {
        return call.request();
      }

      @NotNull
      @Override
      public Timeout timeout() {
        return call.timeout();
      }
    };
  }

  @NotNull
  private static <T> Response<T> getResponse(
      @NotNull String systemId, @NotNull Response<T> response, @NotNull Class<T> classOfT) {
    var finalResponse = response;
    Logger.printDebug(() -> String.format("response: %s", finalResponse));

    if (response.code() == 403) {
      try {
        var raw = app.morphe.extension.shared.reflect.retrofit2.Response.raw((Object) response);
        var request =
            (Request)
                Objects.requireNonNull(
                    app.morphe.extension.shared.reflect.okhttp3.Response.request(raw));
        Logger.printDebug(() -> String.format("request: %s", request));

        var authorization =
            Objects.requireNonNull(
                app.morphe.extension.shared.reflect.okhttp3.Request.header(
                    request, Webb.HDR_AUTHORIZATION));
        Logger.printDebug(() -> String.format("authorization: %s", authorization));

        var acceptLanguage =
            Objects.requireNonNull(
                app.morphe.extension.shared.reflect.okhttp3.Request.header(
                    request, "Accept-Language"));
        Logger.printDebug(() -> String.format("acceptLanguage: %s", acceptLanguage));

        var contentDetails =
            ContentRepo.getContentDetails(systemId, authorization, acceptLanguage, classOfT);
        if (contentDetails != null) {
          response = Response.success(contentDetails);
        }

      } catch (Exception e) {
        Logger.printException(() -> "getResponse failure", e);
      }
    }
    return response;
  }
}
