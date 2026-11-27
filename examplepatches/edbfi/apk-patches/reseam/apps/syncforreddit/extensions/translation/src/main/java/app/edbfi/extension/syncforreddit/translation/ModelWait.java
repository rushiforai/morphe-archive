// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.extension.syncforreddit.translation;

import java.util.function.Consumer;

final class ModelWait implements Runnable {
    enum Result { READY, FAILED, TIMED_OUT }

    private Consumer<Result> onResult;

    ModelWait(Consumer<Result> onResult) {
        this.onResult = onResult;
    }

    void complete(boolean downloaded) {
        finish(downloaded ? Result.READY : Result.FAILED);
    }

    @Override
    public void run() {
        finish(Result.TIMED_OUT);
    }

    void cancel() {
        onResult = null;
    }

    private void finish(Result result) {
        Consumer<Result> callback = onResult;
        cancel();
        if (callback != null) callback.accept(result);
    }
}
