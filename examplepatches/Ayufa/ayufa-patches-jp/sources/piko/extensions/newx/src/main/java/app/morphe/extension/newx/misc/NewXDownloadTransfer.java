package app.morphe.extension.newx.misc;

import android.content.Context;

import java.util.concurrent.ConcurrentHashMap;
import java.util.function.BooleanSupplier;

import app.morphe.extension.crimera.downloader.engine.Reservation;
import app.morphe.extension.crimera.downloader.engine.TransferObserver;
import app.morphe.extension.crimera.downloader.engine.TransferOutcome;
import app.morphe.extension.crimera.downloader.engine.TransferRunner;
import app.morphe.extension.crimera.downloader.model.DownloadRequest;

/**
 * Routes playlist downloads to the HLS transfer and keeps GIF normalization inside the
 * transfer's completion and cancellation boundary.
 */
final class NewXDownloadTransfer implements TransferRunner {
    interface GifProcessor {
        TransferOutcome process(Reservation reservation, BooleanSupplier cancelled);
    }

    private final TransferRunner transfer;
    private final TransferRunner hlsTransfer;
    private final GifProcessor processor;
    private final ConcurrentHashMap<Integer, TransferState> states = new ConcurrentHashMap<>();

    NewXDownloadTransfer(TransferRunner transfer, GifProcessor processor) {
        this(transfer, new HlsTransfer(), processor);
    }

    NewXDownloadTransfer(TransferRunner transfer, TransferRunner hlsTransfer,
                         GifProcessor processor) {
        this.transfer = transfer;
        this.hlsTransfer = hlsTransfer;
        this.processor = processor;
    }

    @Override
    public TransferOutcome run(Context context, Reservation reservation, DownloadRequest request,
                               int id, TransferObserver observer) {
        TransferState state = states.computeIfAbsent(id, ignored -> new TransferState());
        try {
            // Playlist URLs are assembled segment by segment; everything else is one file.
            boolean hls = HlsPlaylist.isHlsUrl(request.url());
            state.hls = hls;
            TransferRunner runner = hls ? hlsTransfer : transfer;
            // A cancel that arrived before this run only reached the runner the state then
            // pointed at; hand it to the runner that is actually about to run.
            if (state.cancelled) runner.cancel(id);
            TransferOutcome outcome = runner.run(context, reservation, request, id, observer);
            synchronized (state) {
                state.downloading = false;
            }
            if (state.cancelled) return TransferOutcome.cancelled();
            if (outcome == null || outcome.kind() != TransferOutcome.Kind.SAVED) return outcome;
            if (hls) return outcome;
            if (!DownloadRemuxer.isGifMp4(request.url(), reservation.fileName(), reservation.mimeType())) {
                return outcome;
            }
            TransferOutcome processed = processor.process(reservation, () -> state.cancelled);
            return state.cancelled ? TransferOutcome.cancelled() : processed;
        } finally {
            states.remove(id, state);
        }
    }

    @Override
    public void cancel(int id) {
        if (id <= 0) return;
        TransferState state = states.computeIfAbsent(id, ignored -> new TransferState());
        synchronized (state) {
            state.cancelled = true;
            // HttpTransfer forgets cancellation on return. Do not leave a new HTTP cancel
            // flag behind when cancellation actually belongs to the remux stage.
            if (state.downloading) {
                if (state.hls) {
                    hlsTransfer.cancel(id);
                } else {
                    transfer.cancel(id);
                }
            }
        }
    }

    private static final class TransferState {
        volatile boolean cancelled;
        volatile boolean hls;
        boolean downloading = true;
    }
}
