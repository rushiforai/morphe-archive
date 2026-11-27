// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.extension.syncforreddit.translation;

import java.util.ArrayList;
import java.util.List;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public final class ModelWaitTest {
    @Test
    public void ignoresSuccessAfterTimeoutButRetryCanUseTheCompletedModel() {
        List<ModelWait.Result> results = new ArrayList<>();
        ModelWait original = new ModelWait(results::add);
        original.run();
        ModelWait retry = new ModelWait(results::add);

        original.complete(true);
        assertEquals(List.of(ModelWait.Result.TIMED_OUT), results);
        retry.complete(true);
        retry.run();
        assertEquals(List.of(ModelWait.Result.TIMED_OUT, ModelWait.Result.READY), results);
    }

    @Test
    public void ignoresFailureAndTimeoutAfterCancellation() {
        List<ModelWait.Result> results = new ArrayList<>();
        ModelWait canceled = new ModelWait(results::add);
        canceled.cancel();
        canceled.complete(false);
        canceled.run();
        assertEquals(List.of(), results);
    }

    @Test
    public void aDownloadFailureComesBeforeAndSuppressesTheTimeout() {
        List<ModelWait.Result> results = new ArrayList<>();
        ModelWait failed = new ModelWait(results::add);
        failed.complete(false);
        failed.run();
        assertEquals(List.of(ModelWait.Result.FAILED), results);
    }
}
