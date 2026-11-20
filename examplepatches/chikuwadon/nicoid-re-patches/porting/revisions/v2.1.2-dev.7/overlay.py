#!/usr/bin/env python3
"""Scoped v2.1.2-dev.2 helper/native hooks from the reviewed v2.1.0 payload."""
from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).resolve().parent))
from harden_dev5 import apply as harden_dev5


def once(body: str, old: str, new: str, name: str) -> str:
    count = body.count(old)
    if count != 1:
        raise RuntimeError(f'{name}: expected exactly one anchor, got {count}')
    return body.replace(old, new, 1)


def in_method(body: str, signature: str, fn):
    start=body.index(signature)
    end=body.index('.end method', start)
    return body[:start]+fn(body[start:end])+body[end:]


def simplify_player_buttons(helpers: Path) -> None:
    button = helpers / 'e/e/a/PopupControl222.smali'
    text = button.read_text()
    def hidden(method):
        # A hidden set is a list of explicit opt-outs. The default set is empty.
        start = method.index('    invoke-static {v1, p0}, Le/e/a/AmbientLight;->defaultHidden')
        return method[:start] + '    return-object v1\n'
    button.write_text(in_method(text, '.method public static hidden(', hidden))

    ambient = helpers / 'e/e/a/AmbientLight.smali'
    text = ambient.read_text()
    start = text.index('.method public static defaultHidden(')
    end = text.index('.end method', start) + len('.end method\n\n')
    ambient.write_text(text[:start] + text[end:])

    popup = helpers / 'e/e/a/PopupControls193.smali'
    text = popup.read_text()
    cls = 'Le/e/a/PopupControls193;'
    callback = 'Le/e/a/PopupControls193$$ExternalSyntheticLambda2;'
    slot = cls + '->preferenceUpdate:Ljava/lang/Runnable;'
    text = once(text, '.field registered:Z', '.field final preferenceUpdate:Ljava/lang/Runnable;\n\n.field registered:Z',
                'popup update callback field')
    ctor = '    invoke-direct {p0}, Ljava/lang/Object;-><init>()V'
    text = once(text, ctor, ctor + f"""
    new-instance v0, {callback}

    invoke-direct {{v0, p0}}, {callback}-><init>({cls})V

    iput-object v0, p0, {slot}
""", 'popup update callback initialization')
    post = f'''    new-instance p2, {callback}

    invoke-direct {{p2, p0}}, {callback}-><init>({cls})V

    invoke-virtual {{p1, p2}}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z'''
    replace = f'''    iget-object p2, p0, {slot}

    invoke-virtual {{p1, p2}}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    invoke-virtual {{p1, p2}}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z'''
    text = once(text, post, replace, 'coalesce popup preference notifications')
    layout_cancel = '    invoke-static {p0}, Le/e/a/PopupLayout236;->cancel(' + cls + ')V'
    text = once(text, layout_cancel, layout_cancel + f"""

    iget-object p1, p0, {cls}->root:Landroid/view/View;

    iget-object v0, p0, {slot}

    invoke-virtual {{p1, v0}}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z""",
                'cancel pending preference update on detach')
    text = in_method(text, '.method public onViewDetachedFromWindow(', lambda method:
                     once(method, '    .registers 2', '    .registers 3', 'detach temporary register'))
    popup.write_text(text)


def fix_video_lookup(helpers: Path) -> None:
    directory = helpers / 'e/e/a'
    playback = directory / 'ModernPlayback.smali'
    text = playback.read_text()
    playback.write_text(once(text, '.field public static latestWatch:',
                             '.field public static volatile latestWatch:', 'publish complete watch metadata'))

    related = directory / 'ModernRelated.smali'
    text = related.read_text()
    end_url = '    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;'
    query = """    const-string v3, "?actionTrackId=AAAAAAAAAA_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

"""
    text = once(text, end_url, query + end_url, 'guest watch tracker')
    start = text.index('    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getInputStream')
    end = text.index('    invoke-direct {v2, v5}, Lorg/json/JSONObject;', start)
    text = text[:start] + """    invoke-static {v2, v1}, Le/e/a/WatchRequestHeaders;->apply(Ljava/net/HttpURLConnection;Ljava/lang/String;)V

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    const-string v3, "Origin"

    const-string v4, "https://www.nicovideo.jp"

    invoke-virtual {v2, v3, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v2}, Le/e/a/SearchResponse212;->read(Ljava/net/HttpURLConnection;)Ljava/lang/String;

    move-result-object v5

    new-instance v2, Lorg/json/JSONObject;

""" + text[end:]
    related.write_text(text)

    cache = directory / 'PageCache.smali'
    text = cache.read_text()
    signature = '.method private static fetch(Ljava/net/HttpURLConnection;)[B'
    wrapper = signature + '''
    .registers 2

    :try_start_fetch
    invoke-static {p0}, Le/e/a/PageCache;->fetchBody(Ljava/net/HttpURLConnection;)[B

    move-result-object v0
    :try_end_fetch
    .catchall {:try_start_fetch .. :try_end_fetch} :catch_fetch

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    return-object v0

    :catch_fetch
    move-exception v0

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V

    throw v0
.end method

'''
    cache.write_text(once(text, signature, wrapper + signature.replace(' fetch(', ' fetchBody('),
                          'close ranking/search network connections on failure'))


def protect_playback_intent(helpers: Path) -> None:
    """Do not promote an explicitly paused player to playback via a mode handoff.

    Manual popup/background actions keep their existing pause-state handling.
    In addition, exit scrubbing on explicit play/pause commands so an
    interrupted progress-bar gesture cannot leave Media3 in scrub mode.
    """
    file=helpers/'e/e/a/PlaybackTransfer221.smali'
    body=file.read_text()
    def paused_switch(method):
        before='''    :cond_2b
    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;'''
        after='''    :cond_2b
    # Auto transfer is only valid while the current player intends to play.
    # Its Media3 isPlaying() reads playWhenReady on the main thread.
    const-string v2, "a0"
    invoke-static {p0, v2}, Le/e/a/PlaybackTransfer221;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v2
    invoke-static {v2}, Le/e/a/PlaybackTransfer221;->isPlaying(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :nicoid_autotransfer_playing_212
    return v0
    :nicoid_autotransfer_playing_212
    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;'''
        return once(method,before,after,'paused auto handoff guard')
    body=in_method(body,'.method public static policy(Ljava/lang/Object;Z)I',paused_switch)
    file.write_text(body)

    file=helpers/'e/e/a/MiniSession225.smali'
    body=file.read_text()
    def paused_back(method):
        before='''    :cond_37
    invoke-static {p0}, Le/e/a/MiniSession225;->minimize(Ljava/lang/Object;)Z'''
        after='''    :cond_37
    const-string p1, "a0"
    invoke-static {p0, p1}, Le/e/a/PlaybackTransfer221;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    move-result-object p1
    invoke-static {p1}, Le/e/a/PlaybackTransfer221;->isPlaying(Ljava/lang/Object;)Z
    move-result p1
    if-nez p1, :nicoid_backmini_playing_212
    return v0
    :nicoid_backmini_playing_212
    invoke-static {p0}, Le/e/a/MiniSession225;->minimize(Ljava/lang/Object;)Z'''
        return once(method,before,after,'paused back-to-mini guard')
    body=in_method(body,'.method public static back(Ljava/lang/Object;Z)Z',paused_back)
    file.write_text(body)

    file=helpers/'e/e/a/Media3VideoPlayer.smali'
    body=file.read_text()
    for signature,needle,method in [
        ('.method public start()V','    invoke-direct {p0}, Le/e/a/Media3VideoPlayer;->replayCompletedReturn()V','start'),
        ('.method public pause()V','    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;','pause'),
    ]:
        body=in_method(body,signature,lambda text: once(text,needle,
            '    invoke-virtual {p0}, Le/e/a/Media3VideoPlayer;->endScrubbing()V\n\n'+needle,
            'end interrupted scrubbing before '+method))
    file.write_text(body)



def protect_popup_startup(helpers: Path) -> None:
    """Only restore a service that already existed at foreground entry.

    A delayed app-resume callback must never capture a newly opened popup.
    """
    file = helpers/'e/e/a/AppResume253.smali'
    source = file.read_text()
    source = once(source, '.field private static restoring:Z',
                  '.field private static resumeTarget:Ljava/lang/ref/WeakReference;\n\n.field private static restoring:Z',
                  'retained resume target field')

    def only_existing_player(method: str) -> str:
        before = """    :cond_67
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J"""
        after = """    :cond_67
    # An automatic return can only reuse a session existing at foreground entry.
    invoke-static {}, Le/e/a/AppResume253;->service()Landroid/app/Service;
    move-result-object v0
    if-nez v0, :nicoid_existing_resume_target_212
    const-string v0, "nicoid-resume253"
    const-string v3, "No retained session on foreground entry; skip automatic return"
    invoke-static {v0, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    const-wide/16 v0, 0x0
    sput-wide v0, Le/e/a/AppResume253;->directReturnDeadline:J
    return v2

    :nicoid_existing_resume_target_212
    new-instance v3, Ljava/lang/ref/WeakReference;
    invoke-direct {v3, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v3, Le/e/a/AppResume253;->resumeTarget:Ljava/lang/ref/WeakReference;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J"""
        return once(method, before, after, 'foreground session binding')
    source = in_method(source,'.method public static resumed(Landroid/app/Activity;)Z', only_existing_player)

    def target_unchanged(method: str) -> str:
        before = """    .line 116
    invoke-static {}, Le/e/a/AppResume253;->service()Landroid/app/Service;

    move-result-object v0

    if-eqz v0, :cond_c1"""
        after = """    .line 116
    invoke-static {}, Le/e/a/AppResume253;->service()Landroid/app/Service;

    move-result-object v0

    sget-object v3, Le/e/a/AppResume253;->resumeTarget:Ljava/lang/ref/WeakReference;
    if-eqz v3, :nicoid_no_resume_target_212
    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v3
    if-eq v0, v3, :nicoid_resume_target_matches_212
    :nicoid_no_resume_target_212
    # The service changed while waiting; never hijack a newly opened popup.
    const-wide/16 v3, 0x0
    sput-wide v3, Le/e/a/AppResume253;->directReturnDeadline:J
    return-void

    :nicoid_resume_target_matches_212
    if-eqz v0, :cond_c1"""
        return once(method, before, after, 'prevent new popup takeover by delayed resume')
    source = in_method(source,'.method private static restore(Ljava/lang/ref/WeakReference;II)V', target_unchanged)
    file.write_text(source)


def protect_retained_return_and_seek(helpers: Path) -> None:
    # Preserve pause when a service is rebound to a normal player.
    # Pending.playing is captured before asynchronous normal-view preparation.
    # Reassert only the previously paused state; never auto-play.

    file=helpers/'e/e/a/PopupReturn244.smali'
    body=file.read_text()
    def pause_after_return(method):
        anchor='''    invoke-static {v0, p1}, Le/e/a/MiniCompletion;->restoreReturned(Landroid/view/View;Ljava/lang/Object;)V'''
        patch='''    invoke-static {v0, p1}, Le/e/a/MiniCompletion;->restoreReturned(Landroid/view/View;Ljava/lang/Object;)V

    iget-boolean v0, p0, Le/e/a/PopupReturn244$Pending;->playing:Z
    if-nez v0, :nicoid_return_play_state_preserved_213
    iget-object v0, p0, Le/e/a/PopupReturn244$Pending;->video:Landroid/view/View;
    invoke-static {v0}, Le/e/a/MediaSessionHandoff;->playback(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    instance-of v1, v0, Le/e/a/Media3VideoPlayer;
    if-eqz v1, :nicoid_return_legacy_pause_213
    check-cast v0, Le/e/a/Media3VideoPlayer;
    invoke-virtual {v0}, Le/e/a/Media3VideoPlayer;->pauseForHandoff()V
    goto :nicoid_return_play_state_preserved_213

    :nicoid_return_legacy_pause_213
    iget-object v0, p0, Le/e/a/PopupReturn244$Pending;->video:Landroid/view/View;
    const-string v1, "pause"
    const/4 v3, 0x0
    new-array v4, v3, [Ljava/lang/Class;
    new-array v5, v3, [Ljava/lang/Object;
    invoke-static {v0, v1, v4, v5}, Le/e/a/MiniSession225;->call(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    :nicoid_return_play_state_preserved_213'''
        return once(method,anchor,patch,'paused return state preservation')
    body=in_method(body,'.method static synthetic lambda$1(Le/e/a/PopupReturn244$Pending;Ljava/lang/Object;)V',pause_after_return)
    file.write_text(body)

    media=helpers/'e/e/a/Media3VideoPlayer.smali'
    body=media.read_text()
    new_method='''.method public pauseForHandoff()V
    .registers 2

    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z
    if-nez v0, :nicoid_pause_return_done_213
    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;
    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->pause()V

    :nicoid_pause_return_done_213
    return-void
.end method

'''
    anchor='.method public pause()V'
    body=once(body,anchor,new_method+anchor,'paused handoff helper')
    def finish_seek_commit(method):
        anchor='''    .line 422
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z'''
        patch='''    .line 422
    invoke-virtual {p0}, Le/e/a/Media3VideoPlayer;->endScrubbing()V

    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z'''
        return once(method,anchor,patch,'clear scrub mode for final seek')
    body=in_method(body,'.method public seekTo(J)V',finish_seek_commit)

    # A recoverable network failure otherwise retries forever, leaving a
    # permanent progress spinner with no error available to the UI.
    def bound_network_retries(method):
        anchor='''    if-eqz v0, :cond_57

    const/4 p1, 0x1'''
        patch='''    if-eqz v0, :cond_57

    iget v0, p0, Le/e/a/Media3VideoPlayer;->networkAttempts:I
    const/4 v1, 0x6
    if-ge v0, v1, :cond_57

    const/4 p1, 0x1'''
        return once(method,anchor,patch,'bound repeated recoverable network failures')
    body=in_method(body,'.method public onPlayerError(Landroidx/media3/common/PlaybackException;)V',bound_network_retries)

    def prepare_explicit_play(method):
        anchor='''    invoke-direct {p0}, Le/e/a/Media3VideoPlayer;->replayCompletedReturn()V'''
        patch='''    invoke-direct {p0}, Le/e/a/Media3VideoPlayer;->replayCompletedReturn()V

    # Media3 may be IDLE after a failed remote seek: explicit Play can prepare.
    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;
    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->getPlaybackState()I
    move-result v0
    const/4 v1, 0x1
    if-ne v0, v1, :nicoid_manual_resume_ready_213
    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;
    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->getCurrentMediaItem()Landroidx/media3/common/MediaItem;
    move-result-object v0
    if-eqz v0, :nicoid_manual_resume_ready_213
    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;
    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->prepare()V

    :nicoid_manual_resume_ready_213'''
        return once(method,anchor,patch,'prepare failed idle player before explicit play')
    body=in_method(body,'.method public start()V',prepare_explicit_play)
    media.write_text(body)


# This source is appended to overlay.py by the local candidate preparation.
def revise_resume_preferences(helpers: Path) -> None:
    file = helpers / 'e/e/a/AppResume253.smali'
    body = file.read_text()

    def replace_body(source, signature, instructions, label):
        begin = source.index(signature)
        end = source.index('.end method', begin)
        header = source[begin:source.index('\n', begin)]
        assert header == signature, label
        return source[:begin] + instructions + '.end method' + source[end+len('.end method'):]

    body = replace_body(body, '.method private static supported(Ljava/lang/String;)Z',
        '''.method private static supported(Ljava/lang/String;)Z
    .registers 2
    invoke-static {p0}, Le/e/a/ResumeModes272;->shouldArm(Ljava/lang/String;)Z
    move-result v0
    return v0
''','independent app-return arming')
    body = replace_body(body, '.method private static selection(Landroid/content/SharedPreferences;)Ljava/lang/String;',
        '''.method private static selection(Landroid/content/SharedPreferences;)Ljava/lang/String;
    .registers 2
    invoke-static {p0}, Le/e/a/ResumeModes272;->selection(Landroid/content/SharedPreferences;)Ljava/lang/String;
    move-result-object v0
    return-object v0
''','mode-specific return policy')
    body = replace_body(body, '.method public static refresh(Landroid/preference/PreferenceActivity;)V',
        '''.method public static refresh(Landroid/preference/PreferenceActivity;)V
    .registers 1
    invoke-static {p0}, Le/e/a/ResumeModes272;->refresh(Landroid/preference/PreferenceActivity;)V
    return-void
''','localized split resume settings')
    file.write_text(body)


def cleanup_stale_mini(helpers: Path) -> None:
    for filename in ('MiniSession225$Session.smali', 'DirectBackground235$State.smali'):
        path = helpers / 'e/e/a' / filename
        body = path.read_text()
        def hook(method):
            head = method.index('\n',method.index('.registers'))+1
            return method[:head] + '''
    # The mini window can be reattached after a lifecycle transition.
    # Prune only abandoned tagged views, never the current live mini panel.
    invoke-static {p0}, Le/e/a/MiniGhost272;->schedule(Ljava/lang/Object;)V
''' + method[head:]
        body = in_method(body,'.method close(Z)V',hook)
        path.write_text(body)

def patch(helpers:Path) -> None:
    simplify_player_buttons(helpers)
    fix_video_lookup(helpers)
    protect_playback_intent(helpers)
    protect_popup_startup(helpers)
    protect_retained_return_and_seek(helpers)
    revise_resume_preferences(helpers)
    cleanup_stale_mini(helpers)
    f=helpers/'e/e/a/BulkSelection.smali';s=f.read_text()
    a='''    invoke-static {v0, v1, v2}, Le/e/a/SelectionUi191;->footer(Landroid/content/Context;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/widget/LinearLayout;\n\n    move-result-object v1'''
    s=once(s,a,a+'''\n\n    invoke-static {v1, p0}, Le/e/a/BulkMove211;->installNative(Landroid/widget/LinearLayout;Ljava/lang/Object;)V''','bulk footer')
    a='''    invoke-static {p0, v2}, Le/e/a/SelectionUi191;->enabled(Landroid/widget/LinearLayout;I)V'''
    s=once(s,a,a+'''\n\n    invoke-static {p0, v2}, Le/e/a/BulkMove211;->refresh(Landroid/widget/LinearLayout;I)V''','bulk selection count')
    f.write_text(s)

    f=helpers/'e/e/a/LocalPlaylists$Page.smali';s=f.read_text()
    def selection(text):
        a='''    move-result-object v0\n\n    iput-object v0, p0, Le/e/a/LocalPlaylists$Page;->footer:Landroid/widget/LinearLayout;'''
        return once(text,a,a+'''\n\n    invoke-static {v0, p0}, Le/e/a/BulkMove211;->installLocal(Landroid/widget/LinearLayout;Ljava/lang/Object;)V''','local bulk footer')
    s=in_method(s,'.method selectionChanged()V',selection)
    def move(text):
        a='''    invoke-static {v0, v1, v2}, Le/e/a/LocalPlaylists;->choose(Landroid/content/Context;Ljava/lang/String;Ljava/util/function/Consumer;)V'''
        b='''    invoke-static {p0, v2}, Le/e/a/MoveConfirm212;->wrapLocal(Ljava/lang/Object;Ljava/util/function/Consumer;)Ljava/util/function/Consumer;\n\n    move-result-object v2\n\n'''+a
        return once(text,a,b,'local post-destination confirmation')
    s=in_method(s,'.method moveSelected()V',move)
    a='''    invoke-static {v0, v1}, Le/e/a/SelectionUi191;->enabled(Landroid/widget/LinearLayout;I)V'''
    s=once(s,a,a+'''\n\n    invoke-static {v0, v1}, Le/e/a/BulkMove211;->refresh(Landroid/widget/LinearLayout;I)V''','local selected count')
    def local_title(text):
        anchor='.registers 9'
        return once(text,anchor,anchor+'''\n\n    invoke-static {p0, p1}, Le/e/a/TabFolderNav214;->localToolbar(Ljava/lang/Object;Ljava/lang/String;)V''','local toolbar/title')
    s=in_method(s,'.method toolbar(Ljava/lang/String;)V',local_title)
    def local_long(text):
        original='''    invoke-virtual {v0, v5, v1}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;'''
        insert='''    invoke-static {v3, v5, v6}, Le/e/a/TabFolderNav214;->localMenuItems(Landroid/content/Context;[Ljava/lang/String;Z)[Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v2, v7, v4, v6}, Le/e/a/TabFolderNav214;->localMenuListener(Landroid/content/DialogInterface$OnClickListener;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v1

'''+original
        return once(text,original,insert,'local folder entry in original action list')
    s=in_method(s,'.method editCatalog(Ljava/lang/String;Ljava/lang/String;Z)V',local_long)
    f.write_text(s)

    # Compose over the pages that are actually visible, including the menu.
    f=helpers/'e/e/a/AmbientLight$Layer.smali';s=f.read_text()
    anchor='    :goto_4ab\n    iget-object v1, v0, Le/e/a/AmbientLight$Layer;->trace:Le/e/a/AmbientGeometryTrace;'
    call=('    :goto_4ab\n'
          '    invoke-static {v0, v4, v3}, Le/e/a/AmbientCard217;->update(Ljava/lang/Object;Landroid/view/View;Landroid/view/View;)V\n\n'
          +anchor.split('\n',1)[1])
    def normal_exterior(text):
        # Keep the existing throttled geometry trace below these per-sample logs.
        start=text.index('    :goto_398\n')+len('    :goto_398\n')
        end=text.index('    .line 868\n',start)
        assert '"normal-gutter measured L="' in text[start:end]
        text=text[:start]+'    const/16 v18, 0x2\n\n'+text[end:]
        start=text.index('    :cond_46a\n')+len('    :cond_46a\n')
        end=text.index('    .line 900\n',start)
        assert '"normal ambient local="' in text[start:end]
        text=text[:start]+text[end:]
        return once(text,anchor,call,'visible ambient panels')
    s=in_method(s,'.method installNormalExterior(Landroid/view/View;)V',normal_exterior)
    def clean(text):
        anchor=text.split('\n\n',1)[0]
        return once(text,anchor,anchor+'\n\n'
            '    invoke-static {p0}, Le/e/a/AmbientCard217;->deferClear(Ljava/lang/Object;)V',
            'ambient cleanup')
    s=in_method(s,'.method removePerimeter()V',clean)
    f.write_text(s)

    # The theme tracks the original drawable identity. Comparing it to the
    # ambient wrapper caused PlayerTheme to pull the wrapper off on refresh.
    f=helpers/'e/e/a/PlayerTheme.smali';s=f.read_text()
    for signature,reg,branch in [
            ('.method static detailItem(Landroid/view/View;)V','v3','if-ne v2, v3, :cond_2b'),
            ('.method static tagItem(Landroid/view/View;Z)V','v4','if-eq v3, v4, :cond_76')]:
        call=(f'    invoke-static {{{reg}}}, Le/e/a/AmbientCard217;->original'
              '(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;\n\n'
              f'    move-result-object {reg}\n\n')
        s=in_method(s,signature,lambda text: once(text,'    '+branch,call+'    '+branch,signature))
    f.write_text(s)

    # Save must have the exact same idle/ripple background, tint and layout
    # as adjacent native buttons. Keep its own tag and click listener.
    f=helpers/'e/e/a/PlayerDownloads116.smali';s=f.read_text()
    def save_row(text):
        begin=text.index('    const/16 v4, 0x10')
        end=text.index('    new-instance v4, Le/e/a/PlayerDownloads116$0;',begin)
        return text[:begin]+(
            '    invoke-static {p1, v3, v2}, Le/e/a/PlayerDownloads116;->menuButton'
            '(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Integer;)Landroid/widget/Button;\n\n'
            '    move-result-object v3\n\n'
            '    invoke-virtual {v3, v0}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V\n\n'
            '    const/4 v0, 0x0\n\n'
        )+text[end:]
    s=in_method(s,'.method static install(',save_row)
    f.write_text(s)

    # Preserve the existing v2.1.1-dev.3 tab bar glyphs.
    f=helpers/'e/e/a/MultiTabs227.smali';s=f.read_text()
    def badge(text):
        a='''    .registers 4\n\n    .line 30'''
        b='''    .registers 4\n\n    invoke-static {p0}, Le/e/a/TabSymbols213;->badge(Ljava/lang/Object;)I\n\n    move-result v0\n\n    if-eqz v0, :nicoid_tab_badge_legacy_213\n\n    return v0\n\n    :nicoid_tab_badge_legacy_213\n    .line 30'''
        return once(text,a,b,'tab badge')
    s=in_method(s,'.method static badge(Le/e/a/SavedTabs227$Tab;)I',badge)
    def independent_local_match(text):
        a="""    if-eqz v2, :cond_a

    return-object v1"""
        b="""    if-eqz v2, :cond_a

    invoke-static {p0, v1}, Le/e/a/TabFolderNav214;->sameLocalTab(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    return-object v1"""
        return once(text,a,b,'independent local playlist tabs')
    s=in_method(s,'.method static match(Le/e/a/SavedTabs227$Tab;)Le/e/a/SavedTabs227$Tab;',independent_local_match)
    f.write_text(s)
    f=helpers/'e/e/a/MultiTabs227$TabBadge.smali';s=f.read_text()
    def draw(text):
        a='''    .registers 12\n\n    .line 34'''
        b='''    .registers 12\n\n    iget v0, p0, Le/e/a/MultiTabs227$TabBadge;->kind:I\n\n    const/4 v1, 0x5\n\n    if-lt v0, v1, :nicoid_tab_badge_draw_legacy_213\n\n    iget-object v1, p0, Le/e/a/MultiTabs227$TabBadge;->paint:Landroid/graphics/Paint;\n\n    invoke-static {p1, v0, v1, p0}, Le/e/a/TabSymbols213;->draw(Landroid/graphics/Canvas;ILandroid/graphics/Paint;Landroid/graphics/drawable/Drawable;)V\n\n    return-void\n\n    :nicoid_tab_badge_draw_legacy_213\n    .line 34'''
        return once(text,a,b,'tab glyph draw')
    s=in_method(s,'.method public draw(Landroid/graphics/Canvas;)V',draw);f.write_text(s)
    f=helpers/'e/e/a/MultiTabs227$Host.smali';s=f.read_text()
    def access(text):
        a='''    invoke-virtual {v12, v2}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V'''
        return once(text,a,a+'''\n\n    invoke-static {v12, v1}, Le/e/a/TabSymbols213;->describe(Landroid/view/View;Ljava/lang/Object;)V''','tab icon accessibility')
    s=in_method(s,'.method bar()V',access);f.write_text(s)

    f=helpers/'e/e/a/MultiTabs227$1.smali';s=f.read_text()
    def resume(text):
        a='''.method public onActivityResumed(Landroid/app/Activity;)V\n    .registers 4'''
        return once(text,a,a+'''\n\n    invoke-static {p1}, Le/e/a/TabFolderNav214;->restoreMylistRoot(Landroid/app/Activity;)V''','restore root on Back')
    s=in_method(s,'.method public onActivityResumed(Landroid/app/Activity;)V',resume);f.write_text(s)

    f=helpers/'e/e/a/TabRoutes228.smali';s=f.read_text()
    def intent(text):
        a='''    :cond_69\n    iget-object p1, p1, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;'''
        return once(text,a,'''    :cond_69\n    invoke-static {p0, p1}, Le/e/a/TabFolderNav214;->localIntent(Landroid/content/Intent;Ljava/lang/Object;)V\n\n    iget-object p1, p1, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;''','local tab restoring intent')
    s=in_method(s,'.method static intent(Landroid/app/Activity;Le/e/a/SavedTabs227$Tab;)Landroid/content/Intent;',intent)
    def switch(text):
        a='''    invoke-virtual {v0, v5}, Landroid/app/Activity;->setIntent(Landroid/content/Intent;)V'''
        return once(text,a,a+'''\n\n    invoke-static {v0, p1}, Le/e/a/TabFolderNav214;->localActivated(Landroid/app/Activity;Ljava/lang/Object;)V''','local tab folder restore')
    s=in_method(s,'.method static switchPage(Le/e/a/MultiTabs227$Host;Le/e/a/SavedTabs227$Tab;)V',switch);f.write_text(s)

    # Validate the actual app lifecycle, settings category and mini detach paths.
    harden_dev5(helpers)
    protect_theme_card_and_popup_handoff(helpers)
    stabilize_buffering_after_manual_play(helpers)



def protect_theme_card_and_popup_handoff(helpers: Path) -> None:
    # ThemeChoice.background() runs again when menu tabs are recycled.
    # setBackgroundColor discards the ambient LayerDrawable, leaving a black
    # menu until the next pre-draw (which is not guaranteed on an idle page).
    # Replace exactly this call with a wrapper-preserving color update.
    theme = helpers/'e/e/a/ThemeChoice.smali'
    source = theme.read_text()
    old = '    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundColor(I)V'
    new = '    invoke-static {p0, v0}, Le/e/a/AmbientCard217;->themedColor(Landroid/view/View;I)V'
    source = in_method(source,
        '.method public static background(Landroid/view/View;)V',
        lambda method: once(method, old, new, 'preserve themed ambient card'))
    theme.write_text(source)

    # The 500ms external-switch debounce starts popup transfer after the
    # Activity has already stopped and Android has transiently paused its
    # original AudioTrack. Only the explicit popup policy on video playback
    # shortens the debounce; non-popup and in-app navigation keep 500ms.
    guard = helpers/'e/e/a/AppSwitchGuard.smali'
    source = guard.read_text()
    # Match exactly the reviewed Media3 bytecode: 500ms (0x1f4) is stored
    # in v1/v2 after v3 captures the pending Runnable. This verified anchor
    # prevents accidental register corruption in the Activity lifecycle hook.
    old = '''    .line 62
    sget-object p0, Le/e/a/AppSwitchGuard;->MAIN:Landroid/os/Handler;

    const-wide/16 v1, 0x1f4

    invoke-virtual {p0, v3, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z'''
    new = '''    .line 62
    invoke-static {p0}, Le/e/a/PopupSwitch274;->delay(Landroid/app/Activity;)J

    move-result-wide v1

    sget-object p0, Le/e/a/AppSwitchGuard;->MAIN:Landroid/os/Handler;

    invoke-virtual {p0, v3, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z'''
    source = in_method(source,
        '.method public static intercept(Ljava/lang/Object;Z)Z',
        lambda method: once(method, old, new, 'mode-scoped earlier popup handoff'))
    guard.write_text(source)



def stabilize_buffering_after_manual_play(helpers: Path) -> None:
    # The actual v2.1.2-dev.6 MediaSession repeatedly advertised PLAYING and
    # PAUSED while its position remained 136873ms. Arm a bounded recovery only
    # on manual playback, and cancel on Pause, URL change or source release.
    f=helpers/'e/e/a/Media3VideoPlayer.smali'
    source=f.read_text()
    marker='    invoke-virtual {p0}, Le/e/a/Media3VideoPlayer;->endScrubbing()V'
    def in_start(method):
        return once(method,marker,marker+'''

    invoke-static {p0}, Le/e/a/Media3Stall275;->onPlay(Ljava/lang/Object;)V''',
            'manual play stall observer')
    def in_pause(method):
        return once(method,marker,marker+'''

    invoke-static {p0}, Le/e/a/Media3Stall275;->onPause(Ljava/lang/Object;)V''',
            'cancel stalled play and record stop caller')
    source=in_method(source,'.method public start()V',in_start)
    source=in_method(source,'.method public pause()V',in_pause)
    # Ignore delayed recovery when the media item is replaced, or the player
    # is released during Activity or popup lifecycle transitions.
    def prepend(method):
        import re
        match=re.search(r'    \.(?:registers|locals) \d+\n',method)
        assert match, 'Media3 method register declaration missing'
        return method[:match.end()]+'''

    invoke-static {p0}, Le/e/a/Media3Stall275;->cancel(Ljava/lang/Object;)V'''+method[match.end():]
    # Reviewed D8 output is allowed to retain final/synchronized access flags
    # on these methods. Match by the exact method *name* rather than by the
    # unstable textual modifier sequence emitted by baksmali.
    import re
    for name in ('setVideoUri', 'release', 'stopForReplacement'):
        candidates=list(re.finditer(r'(?m)^\.method [^\n]*\b'+re.escape(name)+r'\(',source))
        if len(candidates)!=1:
            raise AssertionError(f'Media3 {name}: expected one method, got {len(candidates)}')
        start=candidates[0].start()
        signature=source[start:source.index('\n',start)]
        source=in_method(source,signature,prepend)
    f.write_text(source)


def patch_native(native:Path, helpers:Path)->None:
    # Move the reviewed native factory to a shared helper and call it from
    # both the native fragment and the additional Save row.
    f=native/'com/sauzask/nicoid/NicoidVideoPlayerMenuFragment.smali'
    s=f.read_text()
    signature='.method public final a(Ljava/lang/String;Ljava/lang/Integer;)Landroid/widget/Button;'
    begin=s.index(signature);end=s.index('.end method',begin)
    factory=s[begin:end]
    factory=once(factory,signature,
        '.method public static menuButton(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Integer;)Landroid/widget/Button;',
        'shared menu button signature')
    factory=once(factory,
        '    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment;->Z:Landroid/app/Activity;\n\n'
        '    invoke-direct {v0, v1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V',
        '    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V',
        'shared menu button context')
    helper=helpers/'e/e/a/PlayerDownloads116.smali'
    helper.write_text(helper.read_text().rstrip()+'\n\n'+factory+'.end method\n')
    delegate=signature+(
        '\n    .registers 4\n\n'
        '    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoPlayerMenuFragment;->Z:Landroid/app/Activity;\n\n'
        '    invoke-static {v0, p1, p2}, Le/e/a/PlayerDownloads116;->menuButton'
        '(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Integer;)Landroid/widget/Button;\n\n'
        '    move-result-object v0\n\n'
        '    return-object v0\n'
    )
    f.write_text(s[:begin]+delegate+s[end:])

    # The method delta also carries the native picker hook, so the standard
    # v2.1.0 patch launcher and a fresh Gradle build use the same entry point.
    picker=(Path(__file__).resolve().parent/'i2-picker.smali').read_text()
    anchor='    new-instance v0, Landroid/app/AlertDialog$Builder;'
    entry=('    invoke-static/range {p0 .. p4}, Le/e/a/NativeMylistMove215;->show'
           '(Ljava/lang/Object;ILjava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;)Z\n'
           '    move-result v0\n'
           '    if-eqz v0, :nicoid_picker_fallback\n'
           '    return-void\n'
           '    :nicoid_picker_fallback\n\n')
    dest=native/'e/e/a/i2.smali'
    existing=dest.read_text()
    if picker.splitlines()[0] in existing:
        raise RuntimeError('Native i2 picker already present in delta')
    dest.write_text(existing.rstrip()+'\n\n'+once(picker,anchor,entry+anchor,'native move picker entry point'))


    f=native/'com/sauzask/nicoid/NicoidMylistGroupActivity$a.smali';s=f.read_text()
    a='''    invoke-virtual {p1, p2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V'''
    b='''    invoke-static {p1, p2}, Le/e/a/TabFolderNav214;->routeMylistTap(Landroid/app/Activity;Landroid/content/Intent;)V\n\n'''+a
    s=in_method(s,'.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V',lambda x: once(x,a,b,'native normal mylist click'));f.write_text(s)
    f=native/'com/sauzask/nicoid/NicoidMylistGroupActivity$b.smali';s=f.read_text()
    a='''    invoke-virtual {p2, p3, p4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;'''
    b=a+'''\n\n    invoke-static {p2, p0, p1}, Le/e/a/TabFolderNav214;->prepareMylistMenu(Landroid/app/AlertDialog$Builder;Ljava/lang/Object;I)V'''
    def native_long(text):
        text=once(text,a,b,'native Mylist choice before delete')
        create='''    invoke-virtual {p2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;'''
        picker='''    invoke-static {p2}, Le/e/a/TabFolderNav214;->mylistMenu(Landroid/app/AlertDialog$Builder;)Landroid/app/AlertDialog;'''
        return once(text,create,picker,'native Mylist action picker')
    s=in_method(s,'.method public onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z',native_long);f.write_text(s)


    # Standard and three-button Back both return a reused Mylist folder tab to root.
    f=native/'com/sauzask/nicoid/NicoidVideoListActivity.smali';s=f.read_text()
    for signature in ('.method public onBackPressed()V',
                      '.method public onKeyDown(ILandroid/view/KeyEvent;)Z'):
        if signature in s:raise RuntimeError('Native Back signature already present: '+signature)
    native_back='''
.method public onBackPressed()V
    .registers 2

    invoke-static {p0}, Le/e/a/TabFolderNav214;->backToMylistRoot(Landroid/app/Activity;)Z
    move-result v0
    if-eqz v0, :default_back_215
    return-void
    :default_back_215
    invoke-super {p0}, Lcom/sauzask/nicoid/NicoidActivity;->onBackPressed()V
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 4
    const/4 v0, 0x4
    if-ne p1, v0, :default_key_215
    invoke-static {p0}, Le/e/a/TabFolderNav214;->backToMylistRoot(Landroid/app/Activity;)Z
    move-result v0
    if-eqz v0, :default_key_215
    const/4 v0, 0x1
    return v0
    :default_key_215
    invoke-super {p0, p1, p2}, Lcom/sauzask/nicoid/NicoidActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z
    move-result v0
    return v0
.end method
'''
    f.write_text(s+native_back)


if __name__=='__main__':
    import argparse
    cli=argparse.ArgumentParser();cli.add_argument('--helpers',type=Path,required=True);cli.add_argument('--native',type=Path,required=True)
    args=cli.parse_args();patch(args.helpers);patch_native(args.native)
    print('PASS: v2.1.2-dev.7 page-recreation ambient scan and user-initiated stalled-buffering recovery')