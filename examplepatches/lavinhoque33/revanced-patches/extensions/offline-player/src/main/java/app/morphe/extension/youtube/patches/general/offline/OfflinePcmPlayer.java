/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-24.
 * Written by lavinhoque33, 2026-11-24.
 */
package app.morphe.extension.youtube.patches.general.offline;

import android.content.Context;
import android.net.Uri;
import android.view.Surface;

import androidx.annotation.Nullable;

import rvx.offline.pcm.androidx.media3.common.AudioAttributes;
import rvx.offline.pcm.androidx.media3.common.C;
import rvx.offline.pcm.androidx.media3.common.Format;
import rvx.offline.pcm.androidx.media3.common.MediaItem;
import rvx.offline.pcm.androidx.media3.common.MimeTypes;
import rvx.offline.pcm.androidx.media3.common.PlaybackException;
import rvx.offline.pcm.androidx.media3.common.Player;
import rvx.offline.pcm.androidx.media3.common.VideoSize;
import rvx.offline.pcm.androidx.media3.exoplayer.DefaultRenderersFactory;
import rvx.offline.pcm.androidx.media3.exoplayer.ExoPlayer;
import rvx.offline.pcm.androidx.media3.exoplayer.audio.AudioOffloadSupport;
import rvx.offline.pcm.androidx.media3.exoplayer.audio.AudioSink;
import rvx.offline.pcm.androidx.media3.exoplayer.audio.DefaultAudioSink;
import rvx.offline.pcm.androidx.media3.exoplayer.audio.ForwardingAudioSink;

/** Local-file playback with software time stretching and the platform's media decoders. */
public final class OfflinePcmPlayer implements OfflinePlaybackEngine {
    private final ExoPlayer player;
    private boolean readyDispatched;

    /** Factory linked into the offline player by the Downloads patch. */
    public static OfflinePlaybackEngine create(Context context, boolean audioOnly, Listener listener) {
        return new OfflinePcmPlayer(context, audioOnly, listener);
    }

    private OfflinePcmPlayer(Context context, boolean audioOnly, Listener listener) {
        // The platform AudioTrack still plays the PCM, but never has to change its rate or pitch.
        DefaultRenderersFactory renderers = new DefaultRenderersFactory(context) {
            @Override
            protected AudioSink buildAudioSink(Context sinkContext, boolean floatOutput, boolean platformParameters) {
                AudioSink sink = new DefaultAudioSink.Builder(sinkContext)
                        .setEnableAudioOutputPlaybackParameters(false)
                        .build();
                return new ForwardingAudioSink(sink) {
                    @Override
                    public boolean supportsFormat(Format format) {
                        return getFormatSupport(format) != SINK_FORMAT_UNSUPPORTED;
                    }

                    @Override
                    public int getFormatSupport(Format format) {
                        return MimeTypes.AUDIO_RAW.equals(format.sampleMimeType)
                                ? super.getFormatSupport(format) : SINK_FORMAT_UNSUPPORTED;
                    }

                    @Override
                    public AudioOffloadSupport getFormatOffloadSupport(Format format) {
                        return AudioOffloadSupport.DEFAULT_UNSUPPORTED;
                    }
                };
            }
        };
        AudioAttributes audioAttributes = new AudioAttributes.Builder()
                .setUsage(C.USAGE_MEDIA)
                .setContentType(audioOnly ? C.AUDIO_CONTENT_TYPE_MUSIC : C.AUDIO_CONTENT_TYPE_MOVIE)
                .build();
        player = new ExoPlayer.Builder(context, renderers)
                .setAudioAttributes(audioAttributes, false) // OfflinePlayer owns audio focus.
                .setWakeMode(C.WAKE_MODE_LOCAL)
                .build();
        player.addListener(new Player.Listener() {
            @Override
            public void onPlaybackStateChanged(int playbackState) {
                if (playbackState == Player.STATE_READY && !readyDispatched) {
                    readyDispatched = true;
                    listener.onReady();
                } else if (playbackState == Player.STATE_ENDED) {
                    listener.onEnded();
                }
            }

            @Override
            public void onIsPlayingChanged(boolean isPlaying) {
                listener.onPlayingChanged();
            }

            @Override
            public void onVideoSizeChanged(VideoSize size) {
                listener.onVideoSizeChanged(size.width, size.height);
            }

            @Override
            public void onPlayerError(PlaybackException error) {
                listener.onError(error);
            }
        });
    }

    @Override
    public void prepare(Uri uri, @Nullable Surface surface) {
        player.setVideoSurface(surface);
        player.setMediaItem(MediaItem.fromUri(uri));
        player.prepare();
    }

    @Override
    public long getPosition() {
        return player.getCurrentPosition();
    }

    @Override
    public long getDuration() {
        return player.getDuration();
    }

    @Override
    public boolean isPlaying() {
        return player.isPlaying();
    }

    @Override
    public boolean isPlayRequested() {
        return player.getPlayWhenReady();
    }

    @Override
    public void play() {
        player.play();
    }

    @Override
    public void pause() {
        player.pause();
    }

    @Override
    public void seekTo(long positionMs) {
        player.seekTo(positionMs);
    }

    @Override
    public void setSpeed(float speed) {
        // Unlike MediaPlayer.setPlaybackParams, this doesn't start a paused player.
        player.setPlaybackSpeed(speed);
    }

    @Override
    public float getSpeed() {
        return player.getPlaybackParameters().speed;
    }

    @Override
    public void setVolume(float volume) {
        player.setVolume(volume);
    }

    @Override
    public void setSurface(@Nullable Surface surface) {
        player.setVideoSurface(surface);
    }

    @Override
    public void release() {
        player.release();
    }
}
