package app.voidhack.extension.twitter.spaces.mute;

import android.app.Dialog;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.Window;
import android.view.WindowManager;
import android.widget.CompoundButton;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Native-styled Space UI for listener-side per-user local muting:
 * 1. Injects a 1-tap local mute toggle directly into Twitter's Space User Profile sheet.
 * 2. Injects a compact Mute pill into Live Space and Space Replay headers opening a live
 *    speaker-list mute control sheet.
 */
public final class SpaceLocalMuteUi {
    public static final String HEADER_TAG = "voidhack_space_mute_pill";
    private static final String PROFILE_MUTE_TAG = "voidhack_profile_local_mute_row";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private static volatile boolean headerPillEnabled = true;

    private static volatile Field fLiveHeaderDelegate;
    private static volatile Field fReplayHeaderDelegate;
    private static volatile Field fHeaderChevron;
    private static volatile Field fHeaderTitle;

    private static volatile boolean profileFieldsResolved;
    private static Field fProfRoot, fProfReportUser, fProfDivider2;
    private static Field fStateRoomUser, fStateTwitterUser, fStateUsername, fStateName;
    private static Method mProfUserTwitterId, mProfUserPeriscopeId, mProfUserUsername, mProfUserName;
    private static Field fK1Id, fK1Username, fK1Name;
    private static Method mUserIdentGetCurrent, mUserIdentGetId;

    private SpaceLocalMuteUi() {}

    /**
     * Allows another Space header badge to host the local-mute controls without showing
     * a duplicate pill in the Space header bar.
     */
    public static void setHeaderPillEnabled(boolean enabled) {
        headerPillEnabled = enabled;
    }

    public static View findHeaderPill(ViewGroup headerLayout) {
        return headerLayout != null ? headerLayout.findViewWithTag(HEADER_TAG) : null;
    }

    static void attachToViewDelegate(Object viewDelegate, boolean isReplay) {
        if (viewDelegate == null || !headerPillEnabled) return;
        try {
            Object headerDelegate = readHeaderDelegate(viewDelegate, isReplay);
            if (headerDelegate == null) return;

            View chevron = readHeaderField(headerDelegate, true);
            View titleView = readHeaderField(headerDelegate, false);
            if (chevron == null) return;

            ViewParent parent = chevron.getParent();
            if (!(parent instanceof ViewGroup)) return;
            ViewGroup headerLayout = (ViewGroup) parent;

            if (headerLayout.findViewWithTag(HEADER_TAG) != null) {
                return;
            }

            Context ctx = headerLayout.getContext();
            SpaceLocalMuteController.get().ensureLoaded(ctx);
            installHeaderPill(headerLayout, chevron, titleView);
        } catch (Throwable ignored) {}
    }

    static void attachProfileLocalMute(Object profileViewDelegate, Object profileState) {
        if (profileViewDelegate == null || profileState == null) return;
        try {
            resolveProfileFields(profileViewDelegate.getClass(), profileState.getClass());
            Object rootObj = fProfRoot != null ? fProfRoot.get(profileViewDelegate) : null;
            if (!(rootObj instanceof ViewGroup)) return;
            ViewGroup rootLayout = (ViewGroup) rootObj;
            Context ctx = rootLayout.getContext();
            SpaceLocalMuteController.get().ensureLoaded(ctx);

            String twitterId = "";
            String periscopeId = "";
            String username = "";
            String displayName = "";

            Object roomUserItem = fStateRoomUser != null ? fStateRoomUser.get(profileState) : null;
            if (roomUserItem != null) {
                resolveProfileRoomUserMethods(roomUserItem.getClass());
                twitterId = safeString(mProfUserTwitterId != null ? mProfUserTwitterId.invoke(roomUserItem) : null);
                periscopeId = safeString(mProfUserPeriscopeId != null ? mProfUserPeriscopeId.invoke(roomUserItem) : null);
                username = safeString(mProfUserUsername != null ? mProfUserUsername.invoke(roomUserItem) : null);
                displayName = safeString(mProfUserName != null ? mProfUserName.invoke(roomUserItem) : null);
            }

            Object k1User = fStateTwitterUser != null ? fStateTwitterUser.get(profileState) : null;
            if (k1User != null) {
                resolveProfileK1Fields(k1User.getClass());
                if (twitterId.isEmpty() && fK1Id != null) {
                    long idVal = fK1Id.getLong(k1User);
                    if (idVal > 0L) twitterId = Long.toString(idVal);
                }
                if (username.isEmpty() && fK1Username != null) {
                    username = safeString(fK1Username.get(k1User));
                }
                if (displayName.isEmpty() && fK1Name != null) {
                    displayName = safeString(fK1Name.get(k1User));
                }
            }

            if (username.isEmpty() && fStateUsername != null) {
                username = safeString(fStateUsername.get(profileState));
            }
            if (displayName.isEmpty() && fStateName != null) {
                displayName = safeString(fStateName.get(profileState));
            }

            View existing = rootLayout.findViewWithTag(PROFILE_MUTE_TAG);
            boolean emptyIdentity = twitterId.isEmpty() && periscopeId.isEmpty()
                    && SpaceLocalMuteLogic.normalizeUsername(username).isEmpty();
            boolean selfProfile = !twitterId.isEmpty()
                    && isCurrentTwitterUser(twitterId, rootLayout.getClass().getClassLoader());

            if (emptyIdentity || selfProfile) {
                if (existing != null) existing.setVisibility(View.GONE);
                return;
            }

            TextView muteRow;
            if (existing instanceof TextView) {
                muteRow = (TextView) existing;
            } else {
                Object reportObj = fProfReportUser != null ? fProfReportUser.get(profileViewDelegate) : null;
                Object div2Obj = fProfDivider2 != null ? fProfDivider2.get(profileViewDelegate) : null;
                if (!(reportObj instanceof View) || !(div2Obj instanceof View)) return;
                View reportView = (View) reportObj;
                View divider2View = (View) div2Obj;
                if (reportView.getId() == View.NO_ID || divider2View.getId() == View.NO_ID) return;

                muteRow = new TextView(ctx);
                muteRow.setTag(PROFILE_MUTE_TAG);
                int rowId = View.generateViewId();
                muteRow.setId(rowId);
                muteRow.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15.5f);
                muteRow.setTypeface(Typeface.DEFAULT_BOLD);
                muteRow.setSingleLine(true);
                muteRow.setEllipsize(TextUtils.TruncateAt.END);
                muteRow.setGravity(Gravity.CENTER_VERTICAL);
                muteRow.setPadding(dp(ctx, 12), dp(ctx, 10), dp(ctx, 12), dp(ctx, 10));

                ViewGroup.LayoutParams lp = createConstraintParams(reportView, 0, ViewGroup.LayoutParams.WRAP_CONTENT);
                if (lp == null) return;
                rootLayout.addView(muteRow, lp);
                applyProfileMuteRowConstraints(ctx, rootLayout, rowId, reportView.getId(), divider2View.getId());
            }

            final String fTwitterId = twitterId;
            final String fPeriscopeId = periscopeId;
            final String fUsername = username;
            final String fDisplayName = displayName;
            final TextView targetBtn = muteRow;

            muteRow.setVisibility(View.VISIBLE);
            styleProfileMuteRow(ctx, targetBtn,
                    SpaceLocalMuteController.get().isMuted(fTwitterId, fPeriscopeId, fUsername));
            muteRow.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    boolean nowMuted = SpaceLocalMuteController.get().toggleMute(
                            v.getContext(), fTwitterId, fPeriscopeId, fUsername, fDisplayName);
                    styleProfileMuteRow(v.getContext(), targetBtn, nowMuted);
                    String label = !fDisplayName.isEmpty() ? fDisplayName
                            : (!fUsername.isEmpty() ? "@" + SpaceLocalMuteLogic.normalizeUsername(fUsername) : fTwitterId);
                    Toast.makeText(
                            v.getContext(),
                            nowMuted ? SpaceLocalMuteStrings.toastUserMuted(v.getContext(), label)
                                    : SpaceLocalMuteStrings.toastUserUnmuted(v.getContext(), label),
                            Toast.LENGTH_SHORT).show();
                }
            });
        } catch (Throwable ignored) {}
    }

    public static void showControlSheet(final Context context) {
        if (context == null) return;
        SpaceLocalMuteController.get().ensureLoaded(context);
        final boolean dark = isDarkTheme(context);

        final int bgSurface = dark ? Color.parseColor("#16181C") : Color.parseColor("#FFFFFF");
        final int bgCard = dark ? Color.parseColor("#202327") : Color.parseColor("#F3F5F7");
        final int textPrimary = dark ? Color.parseColor("#E7E9EA") : Color.parseColor("#0F1419");
        final int textSecondary = dark ? Color.parseColor("#8B98A5") : Color.parseColor("#536471");
        final int dividerColor = dark ? Color.parseColor("#2F3336") : Color.parseColor("#EFF3F4");
        final int accentBlue = Color.parseColor("#1D9BF0");

        final Dialog dialog = new Dialog(context);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

        LinearLayout sheet = new LinearLayout(context);
        sheet.setOrientation(LinearLayout.VERTICAL);
        sheet.setPadding(dp(context, 18), dp(context, 16), dp(context, 18), dp(context, 20));
        GradientDrawable sheetBg = new GradientDrawable();
        sheetBg.setColor(bgSurface);
        float r = dp(context, 20);
        sheetBg.setCornerRadii(new float[]{r, r, r, r, 0f, 0f, 0f, 0f});
        sheet.setBackground(sheetBg);

        View handle = new View(context);
        GradientDrawable handleBg = new GradientDrawable();
        handleBg.setColor(dividerColor);
        handleBg.setCornerRadius(dp(context, 3));
        handle.setBackground(handleBg);
        LinearLayout.LayoutParams handleLp = new LinearLayout.LayoutParams(dp(context, 40), dp(context, 4));
        handleLp.gravity = Gravity.CENTER_HORIZONTAL;
        handleLp.bottomMargin = dp(context, 12);
        sheet.addView(handle, handleLp);

        LinearLayout titleRow = new LinearLayout(context);
        titleRow.setOrientation(LinearLayout.HORIZONTAL);
        titleRow.setGravity(Gravity.CENTER_VERTICAL);
        TextView titleTv = new TextView(context);
        titleTv.setText(SpaceLocalMuteStrings.sheetTitle(context));
        titleTv.setTextColor(textPrimary);
        titleTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 19);
        titleTv.setTypeface(Typeface.DEFAULT_BOLD);
        titleRow.addView(titleTv, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        TextView closeBtn = new TextView(context);
        closeBtn.setText(SpaceLocalMuteStrings.close(context));
        closeBtn.setTextColor(accentBlue);
        closeBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        closeBtn.setTypeface(Typeface.DEFAULT_BOLD);
        closeBtn.setPadding(dp(context, 8), dp(context, 6), dp(context, 4), dp(context, 6));
        closeBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dialog.dismiss();
            }
        });
        titleRow.addView(closeBtn);
        sheet.addView(titleRow);

        ScrollView scroll = new ScrollView(context);
        LinearLayout body = new LinearLayout(context);
        body.setOrientation(LinearLayout.VERTICAL);
        body.setPadding(0, dp(context, 10), 0, dp(context, 4));
        scroll.addView(body);
        sheet.addView(scroll, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        // Space session summary card
        LinearLayout sessionCard = makeCard(context, bgCard);
        final TextView sessionTv = new TextView(context);
        sessionTv.setTextColor(textPrimary);
        sessionTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
        sessionTv.setLineSpacing(dp(context, 2), 1.0f);
        sessionCard.addView(sessionTv);
        body.addView(sessionCard);

        // Local mute header + Unmute All button
        LinearLayout muteHeaderRow = new LinearLayout(context);
        muteHeaderRow.setOrientation(LinearLayout.HORIZONTAL);
        muteHeaderRow.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout.LayoutParams mhLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        mhLp.topMargin = dp(context, 14);
        mhLp.bottomMargin = dp(context, 6);

        TextView muteHeading = new TextView(context);
        muteHeading.setText(SpaceLocalMuteStrings.sectionHeader(context));
        muteHeading.setTextColor(textSecondary);
        muteHeading.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.5f);
        muteHeading.setTypeface(Typeface.DEFAULT_BOLD);
        muteHeaderRow.addView(muteHeading, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        final TextView unmuteAllBtn = new TextView(context);
        unmuteAllBtn.setTextColor(Color.parseColor("#F59E0B"));
        unmuteAllBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.5f);
        unmuteAllBtn.setTypeface(Typeface.DEFAULT_BOLD);
        unmuteAllBtn.setPadding(dp(context, 8), dp(context, 2), dp(context, 2), dp(context, 2));
        muteHeaderRow.addView(unmuteAllBtn);
        body.addView(muteHeaderRow, mhLp);

        LinearLayout muteCard = makeCard(context, bgCard);
        final TextView muteSummaryTv = new TextView(context);
        muteSummaryTv.setTextColor(textSecondary);
        muteSummaryTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11.5f);
        muteSummaryTv.setPadding(0, 0, 0, dp(context, 8));
        muteCard.addView(muteSummaryTv);

        final LinearLayout speakerMuteList = new LinearLayout(context);
        speakerMuteList.setOrientation(LinearLayout.VERTICAL);
        muteCard.addView(speakerMuteList);

        View muteDiv = new View(context);
        muteDiv.setBackgroundColor(dividerColor);
        LinearLayout.LayoutParams mdLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 1);
        mdLp.topMargin = dp(context, 6);
        muteCard.addView(muteDiv, mdLp);

        final Switch swSmartOverlap = addSwitchRow(context, muteCard,
                SpaceLocalMuteStrings.smartOverlap(context),
                SpaceLocalMuteStrings.smartOverlapSub(context),
                !SpaceLocalMuteController.get().isStrictOverlapMute(context),
                textPrimary, textSecondary);
        swSmartOverlap.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton b, boolean checked) {
                SpaceLocalMuteController.get().setStrictOverlapMute(context, !checked);
            }
        });
        body.addView(muteCard);

        final String[] lastSig = new String[]{""};
        final Runnable refreshUi = new Runnable() {
            @Override
            public void run() {
                SpaceLocalMuteController muteCtrl = SpaceLocalMuteController.get();
                SpaceLocalMuteSessionTracker.Snapshot snap = SpaceLocalMuteSessionTracker.snapshot();
                sessionTv.setText(SpaceLocalMuteStrings.sessionInfo(
                        context, snap.title, snap.playbackMode, snap.allSpeakers.size()));

                int mutedCount = muteCtrl.getMutedCount();
                boolean silencingNow = muteCtrl.isActivelySilencing();
                muteSummaryTv.setText(SpaceLocalMuteStrings.engineSummary(
                        context, muteCtrl.isWebRtcHardwareMuteActive(), silencingNow, mutedCount));
                muteSummaryTv.setTextColor(silencingNow ? Color.parseColor("#F59E0B") : textSecondary);

                if (mutedCount > 0) {
                    unmuteAllBtn.setVisibility(View.VISIBLE);
                    unmuteAllBtn.setText(SpaceLocalMuteStrings.unmuteAll(context, mutedCount));
                } else {
                    unmuteAllBtn.setVisibility(View.GONE);
                }

                String sig = buildSpeakerListSignature(snap.allSpeakers, snap.activeTalkingKeys, muteCtrl);
                if (!sig.equals(lastSig[0])) {
                    lastSig[0] = sig;
                    populateSpeakerMuteList(context, speakerMuteList, snap.allSpeakers, snap.activeTalkingKeys,
                            muteCtrl, textPrimary, textSecondary, dividerColor, dark, this);
                }
            }
        };

        unmuteAllBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                SpaceLocalMuteController.get().unmuteAll(context);
                Toast.makeText(context, SpaceLocalMuteStrings.toastUnmutedAll(context), Toast.LENGTH_SHORT).show();
                lastSig[0] = "";
                refreshUi.run();
            }
        });

        final Runnable ticker = new Runnable() {
            @Override
            public void run() {
                if (!dialog.isShowing()) return;
                refreshUi.run();
                MAIN.postDelayed(this, 1000L);
            }
        };

        final SpaceLocalMuteController.MuteStateListener muteListener = new SpaceLocalMuteController.MuteStateListener() {
            @Override
            public void onLocalMuteStateChanged() {
                if (!dialog.isShowing()) return;
                refreshUi.run();
            }
        };

        dialog.setContentView(sheet);
        Window win = dialog.getWindow();
        if (win != null) {
            win.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            win.setGravity(Gravity.BOTTOM);
            win.setLayout(WindowManager.LayoutParams.MATCH_PARENT, WindowManager.LayoutParams.WRAP_CONTENT);
        }
        dialog.setOnDismissListener(new android.content.DialogInterface.OnDismissListener() {
            @Override
            public void onDismiss(android.content.DialogInterface d) {
                MAIN.removeCallbacks(ticker);
                SpaceLocalMuteController.get().removeListener(muteListener);
            }
        });
        SpaceLocalMuteController.get().addListener(muteListener);
        refreshUi.run();
        dialog.show();
        MAIN.postDelayed(ticker, 1000L);
    }

    public static String buildSpeakerListSignature(List<SpaceLocalMuteLogic.SpeakerIdentity> speakers,
                                                   Set<String> activeTalkingKeys,
                                                   SpaceLocalMuteController muteCtrl) {
        StringBuilder sb = new StringBuilder();
        if (speakers != null) {
            for (SpaceLocalMuteLogic.SpeakerIdentity sp : speakers) {
                if (sp == null) continue;
                boolean talking = activeTalkingKeys != null && activeTalkingKeys.contains(sp.key);
                boolean muted = muteCtrl.isMuted(sp.twitterUserId, sp.periscopeUserId, sp.username)
                        || muteCtrl.isMutedByAnyId(sp.key);
                sb.append(sp.key).append(':').append(talking ? '1' : '0').append(muted ? 'M' : 'U').append('|');
            }
        }
        sb.append('#');
        for (SpaceLocalMuteLogic.MutedUser mu : muteCtrl.getMutedUsers()) {
            sb.append(mu.primaryKey).append(',');
        }
        return sb.toString();
    }

    public static void populateSpeakerMuteList(final Context context,
                                               LinearLayout container,
                                               List<SpaceLocalMuteLogic.SpeakerIdentity> speakers,
                                               Set<String> activeTalkingKeys,
                                               final SpaceLocalMuteController muteCtrl,
                                               int textPrimary, int textSecondary, int dividerColor,
                                               boolean dark, final Runnable onMutated) {
        container.removeAllViews();
        Set<String> shownMutedKeys = new HashSet<>();
        int rowCount = 0;

        if (speakers != null && !speakers.isEmpty()) {
            Set<String> seenKeys = new HashSet<>();
            for (final SpaceLocalMuteLogic.SpeakerIdentity sp : speakers) {
                if (sp == null || sp.key.isEmpty()) continue;
                if (!seenKeys.add(sp.key)) continue;

                boolean talking = activeTalkingKeys != null && activeTalkingKeys.contains(sp.key);
                boolean muted = muteCtrl.isMuted(sp.twitterUserId, sp.periscopeUserId, sp.username)
                        || muteCtrl.isMutedByAnyId(sp.key);
                if (muted) {
                    shownMutedKeys.add(SpaceLocalMuteLogic.computePrimaryKey(
                            sp.twitterUserId, sp.periscopeUserId, sp.username));
                    shownMutedKeys.add(sp.key);
                    if (!sp.username.isEmpty()) shownMutedKeys.add(sp.username);
                }

                if (rowCount > 0) {
                    View div = new View(context);
                    div.setBackgroundColor(dividerColor);
                    container.addView(div, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 1));
                }
                addSpeakerMuteRow(context, container,
                        sp.twitterUserId.isEmpty() ? sp.key : sp.twitterUserId,
                        sp.periscopeUserId, sp.username, sp.displayName,
                        sp.role, talking, muted, textPrimary, textSecondary, dark, onMutated);
                rowCount++;
            }
        }

        List<SpaceLocalMuteLogic.MutedUser> allMuted = muteCtrl.getMutedUsers();
        boolean addedOtherHeader = false;
        for (final SpaceLocalMuteLogic.MutedUser mu : allMuted) {
            if (shownMutedKeys.contains(mu.primaryKey)
                    || (!mu.twitterUserId.isEmpty() && shownMutedKeys.contains(mu.twitterUserId))
                    || (!mu.periscopeUserId.isEmpty() && shownMutedKeys.contains(mu.periscopeUserId))
                    || (!mu.username.isEmpty() && shownMutedKeys.contains(mu.username))) {
                continue;
            }
            if (!addedOtherHeader) {
                addedOtherHeader = true;
                TextView hdr = new TextView(context);
                hdr.setText(SpaceLocalMuteStrings.otherMutedHeader(context));
                hdr.setTextColor(textSecondary);
                hdr.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11.5f);
                hdr.setTypeface(Typeface.DEFAULT_BOLD);
                hdr.setPadding(0, rowCount > 0 ? dp(context, 10) : dp(context, 2), 0, dp(context, 4));
                container.addView(hdr);
            } else {
                View div = new View(context);
                div.setBackgroundColor(dividerColor);
                container.addView(div, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 1));
            }
            addSpeakerMuteRow(context, container,
                    mu.twitterUserId, mu.periscopeUserId, mu.username, mu.displayName,
                    "", false, true, textPrimary, textSecondary, dark, onMutated);
            rowCount++;
        }

        if (rowCount == 0) {
            TextView empty = new TextView(context);
            empty.setText(SpaceLocalMuteStrings.noSpeakers(context));
            empty.setTextColor(textSecondary);
            empty.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.5f);
            empty.setPadding(0, dp(context, 2), 0, dp(context, 4));
            container.addView(empty);
        }
    }

    private static void addSpeakerMuteRow(final Context context, LinearLayout container,
                                          final String twitterId, final String periscopeId,
                                          final String username, final String displayName,
                                          String role, boolean talking, boolean muted,
                                          int textPrimary, int textSecondary, boolean dark,
                                          final Runnable onMutated) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(0, dp(context, 7), 0, dp(context, 7));

        View statusDot = new View(context);
        int dotColor = muted ? Color.parseColor("#F59E0B")
                : (talking ? Color.parseColor("#00BA7C")
                : (dark ? Color.parseColor("#4B5563") : Color.parseColor("#CBD5E1")));
        statusDot.setBackground(makeRoundedBg(dotColor, dp(context, 5)));
        LinearLayout.LayoutParams dotLp = new LinearLayout.LayoutParams(dp(context, 9), dp(context, 9));
        dotLp.setMarginEnd(dp(context, 9));
        row.addView(statusDot, dotLp);

        LinearLayout infoCol = new LinearLayout(context);
        infoCol.setOrientation(LinearLayout.VERTICAL);

        String primaryName = (displayName != null && !displayName.isEmpty())
                ? displayName
                : (!username.isEmpty() ? "@" + SpaceLocalMuteLogic.normalizeUsername(username) : twitterId);
        TextView nameTv = new TextView(context);
        nameTv.setText(primaryName);
        nameTv.setTextColor(muted ? textSecondary : textPrimary);
        nameTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
        nameTv.setTypeface(Typeface.DEFAULT_BOLD);
        nameTv.setMaxLines(1);
        nameTv.setEllipsize(TextUtils.TruncateAt.END);
        infoCol.addView(nameTv);

        String normHandle = SpaceLocalMuteLogic.normalizeUsername(username);
        StringBuilder sub = new StringBuilder();
        if (!normHandle.isEmpty()) {
            sub.append('@').append(normHandle);
        }
        if ("ADMIN".equalsIgnoreCase(role) || "admin".equalsIgnoreCase(role)) {
            if (sub.length() > 0) sub.append(" · ");
            sub.append("Host");
        }
        if (talking) {
            if (sub.length() > 0) sub.append(" · ");
            sub.append(SpaceLocalMuteStrings.isJapanese(context) ? "発話中" : "Speaking");
        }
        if (sub.length() > 0) {
            TextView subTv = new TextView(context);
            subTv.setText(sub.toString());
            subTv.setTextColor(talking && !muted ? Color.parseColor("#00BA7C") : textSecondary);
            subTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11.5f);
            subTv.setMaxLines(1);
            subTv.setEllipsize(TextUtils.TruncateAt.END);
            infoCol.addView(subTv);
        }

        row.addView(infoCol, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        TextView toggleBtn = new TextView(context);
        toggleBtn.setText(muted ? SpaceLocalMuteStrings.mutedBtn(context) : SpaceLocalMuteStrings.muteBtn(context));
        toggleBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
        toggleBtn.setTypeface(Typeface.DEFAULT_BOLD);
        toggleBtn.setPadding(dp(context, 12), dp(context, 6), dp(context, 12), dp(context, 6));
        if (muted) {
            toggleBtn.setTextColor(Color.WHITE);
            toggleBtn.setBackground(makeRoundedBg(Color.parseColor("#D97706"), dp(context, 16)));
        } else {
            toggleBtn.setTextColor(textPrimary);
            toggleBtn.setBackground(makeRoundedBg(
                    dark ? Color.parseColor("#2F3336") : Color.parseColor("#E2E8F0"), dp(context, 16)));
        }
        toggleBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                SpaceLocalMuteController.get().toggleMute(
                        context, twitterId, periscopeId, username, displayName);
                if (onMutated != null) onMutated.run();
            }
        });
        row.addView(toggleBtn);
        container.addView(row);
    }

    private static void installHeaderPill(ViewGroup headerLayout, View chevron, View titleView) {
        final Context ctx = headerLayout.getContext();
        final MutePillController pill = new MutePillController(ctx);
        View pillView = pill.root;
        pillView.setTag(HEADER_TAG);
        int pillId = View.generateViewId();
        pillView.setId(pillId);

        ViewGroup.LayoutParams lp = createConstraintParams(
                chevron, ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        if (lp == null) return;

        headerLayout.addView(pillView, lp);
        applyHeaderConstraints(ctx, headerLayout, pillId, chevron, titleView);

        pillView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showControlSheet(v.getContext());
            }
        });
    }

    private static void styleProfileMuteRow(Context ctx, TextView row, boolean muted) {
        boolean dark = isDarkTheme(ctx);
        if (muted) {
            row.setText(SpaceLocalMuteStrings.profileUnmuteAction(ctx));
            row.setTextColor(Color.WHITE);
            row.setBackground(makeRoundedBg(Color.parseColor("#E6D97706"), dp(ctx, 10)));
        } else {
            row.setText(SpaceLocalMuteStrings.profileMuteAction(ctx));
            row.setTextColor(dark ? Color.parseColor("#F59E0B") : Color.parseColor("#B45309"));
            row.setBackground(makeRoundedBg(
                    dark ? Color.parseColor("#26F59E0B") : Color.parseColor("#1AD97706"),
                    dp(ctx, 10)));
        }
    }

    private static void applyHeaderConstraints(Context ctx, ViewGroup headerLayout, int pillId,
                                               View chevron, View titleView) {
        try {
            ClassLoader cl = headerLayout.getClass().getClassLoader();
            Class<?> constraintLayoutClass = Class.forName(
                    "androidx.constraintlayout.widget.ConstraintLayout", false, cl);
            if (!constraintLayoutClass.isInstance(headerLayout)) return;

            Class<?> csClass = Class.forName("androidx.constraintlayout.widget.d", false, cl);
            Object cs = csClass.getDeclaredConstructor().newInstance();
            csClass.getMethod("d", constraintLayoutClass).invoke(cs, headerLayout);
            Method connect4 = csClass.getMethod("e", int.class, int.class, int.class, int.class);
            Method connect5 = csClass.getMethod("f", int.class, int.class, int.class, int.class, int.class);

            connect5.invoke(cs, pillId, 6, chevron.getId(), 7, dp(ctx, 8));
            connect4.invoke(cs, pillId, 3, 0, 3);
            connect4.invoke(cs, pillId, 4, 0, 4);
            if (titleView != null && titleView.getId() != View.NO_ID) {
                connect5.invoke(cs, titleView.getId(), 6, pillId, 7, dp(ctx, 8));
            }
            csClass.getMethod("a", constraintLayoutClass).invoke(cs, headerLayout);
        } catch (Throwable ignored) {}
    }

    private static void applyProfileMuteRowConstraints(Context ctx, ViewGroup rootLayout,
                                                       int rowId, int reportId, int divider2Id) {
        try {
            ClassLoader cl = rootLayout.getClass().getClassLoader();
            Class<?> constraintLayoutClass = Class.forName(
                    "androidx.constraintlayout.widget.ConstraintLayout", false, cl);
            if (!constraintLayoutClass.isInstance(rootLayout)) return;

            Class<?> csClass = Class.forName("androidx.constraintlayout.widget.d", false, cl);
            Object cs = csClass.getDeclaredConstructor().newInstance();
            csClass.getMethod("d", constraintLayoutClass).invoke(cs, rootLayout);
            Method connect5 = csClass.getMethod("f", int.class, int.class, int.class, int.class, int.class);

            connect5.invoke(cs, rowId, 3, reportId, 4, dp(ctx, 8));
            connect5.invoke(cs, rowId, 6, 0, 6, dp(ctx, 16));
            connect5.invoke(cs, rowId, 7, 0, 7, dp(ctx, 16));
            connect5.invoke(cs, divider2Id, 3, rowId, 4, dp(ctx, 10));
            csClass.getMethod("a", constraintLayoutClass).invoke(cs, rootLayout);
        } catch (Throwable ignored) {}
    }

    private static ViewGroup.LayoutParams createConstraintParams(View refView, int width, int height) {
        ViewGroup.LayoutParams refLp = refView.getLayoutParams();
        if (refLp == null) return null;
        try {
            Constructor<?> ctor = refLp.getClass().getConstructor(int.class, int.class);
            return (ViewGroup.LayoutParams) ctor.newInstance(width, height);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Switch addSwitchRow(Context ctx, LinearLayout parent, String title, String subtitle,
                                       boolean initial, int textPrimary, int textSecondary) {
        LinearLayout row = new LinearLayout(ctx);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(0, dp(ctx, 8), 0, dp(ctx, 4));

        LinearLayout textCol = new LinearLayout(ctx);
        textCol.setOrientation(LinearLayout.VERTICAL);

        TextView t = new TextView(ctx);
        t.setText(title);
        t.setTextColor(textPrimary);
        t.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
        textCol.addView(t);

        if (subtitle != null && !subtitle.isEmpty()) {
            TextView sub = new TextView(ctx);
            sub.setText(subtitle);
            sub.setTextColor(textSecondary);
            sub.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11.5f);
            sub.setPadding(0, dp(ctx, 2), dp(ctx, 8), 0);
            textCol.addView(sub);
        }

        row.addView(textCol, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        Switch sw = new Switch(ctx);
        sw.setChecked(initial);
        row.addView(sw);
        parent.addView(row);
        return sw;
    }

    private static LinearLayout makeCard(Context ctx, int bgColor) {
        LinearLayout card = new LinearLayout(ctx);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(ctx, 14), dp(ctx, 12), dp(ctx, 14), dp(ctx, 12));
        card.setBackground(makeRoundedBg(bgColor, dp(ctx, 14)));
        return card;
    }

    private static GradientDrawable makeRoundedBg(int color, float radiusPx) {
        GradientDrawable d = new GradientDrawable();
        d.setColor(color);
        d.setCornerRadius(radiusPx);
        return d;
    }

    private static boolean isDarkTheme(Context ctx) {
        try {
            int night = ctx.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
            return night == Configuration.UI_MODE_NIGHT_YES;
        } catch (Throwable ignored) {
            return true;
        }
    }

    private static int dp(Context ctx, int dp) {
        return Math.round(TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, dp, ctx.getResources().getDisplayMetrics()));
    }

    private static Object readHeaderDelegate(Object viewDelegate, boolean isReplay) throws Exception {
        Field f = isReplay ? fReplayHeaderDelegate : fLiveHeaderDelegate;
        if (f == null) {
            f = viewDelegate.getClass().getDeclaredField(isReplay ? "S" : "y1");
            f.setAccessible(true);
            if (isReplay) fReplayHeaderDelegate = f;
            else fLiveHeaderDelegate = f;
        }
        return f.get(viewDelegate);
    }

    private static View readHeaderField(Object headerDelegate, boolean chevron) throws Exception {
        Field f = chevron ? fHeaderChevron : fHeaderTitle;
        if (f == null) {
            f = headerDelegate.getClass().getDeclaredField(chevron ? "a" : "b");
            f.setAccessible(true);
            if (chevron) fHeaderChevron = f;
            else fHeaderTitle = f;
        }
        Object v = f.get(headerDelegate);
        return v instanceof View ? (View) v : null;
    }

    private static void resolveProfileFields(Class<?> viewDelCls, Class<?> stateCls) {
        if (profileFieldsResolved) return;
        fProfRoot = findDeclaredField(viewDelCls, "a");
        fProfReportUser = findDeclaredField(viewDelCls, "m");
        fProfDivider2 = findDeclaredField(viewDelCls, "D");
        fStateRoomUser = findDeclaredField(stateCls, "a");
        fStateTwitterUser = findDeclaredField(stateCls, "b");
        fStateUsername = findDeclaredField(stateCls, "c");
        fStateName = findDeclaredField(stateCls, "d");
        profileFieldsResolved = true;
    }

    private static void resolveProfileRoomUserMethods(Class<?> cls) {
        if (mProfUserTwitterId != null) return;
        mProfUserTwitterId = findPublicMethod(cls, "getTwitterUserId");
        mProfUserPeriscopeId = findPublicMethod(cls, "getPeriscopeUserId");
        mProfUserUsername = findPublicMethod(cls, "getUsername");
        mProfUserName = findPublicMethod(cls, "getName");
    }

    private static void resolveProfileK1Fields(Class<?> cls) {
        if (fK1Id != null) return;
        fK1Id = findDeclaredField(cls, "a");
        fK1Username = findDeclaredField(cls, "i");
        fK1Name = findDeclaredField(cls, "c");
    }

    private static boolean isCurrentTwitterUser(String targetTwitterId, ClassLoader cl) {
        if (targetTwitterId == null || targetTwitterId.isEmpty()) return false;
        try {
            if (mUserIdentGetCurrent == null) {
                Class<?> uiCls = Class.forName("com.twitter.util.user.UserIdentifier", false, cl);
                mUserIdentGetCurrent = uiCls.getMethod("getCurrent");
                mUserIdentGetId = uiCls.getMethod("getId");
            }
            Object current = mUserIdentGetCurrent.invoke(null);
            if (current != null && mUserIdentGetId != null) {
                Object idVal = mUserIdentGetId.invoke(current);
                if (idVal instanceof Long) {
                    return targetTwitterId.equals(Long.toString((Long) idVal));
                }
            }
        } catch (Throwable ignored) {}
        return false;
    }

    private static Field findDeclaredField(Class<?> cls, String name) {
        try {
            Field f = cls.getDeclaredField(name);
            f.setAccessible(true);
            return f;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Method findPublicMethod(Class<?> cls, String name) {
        try {
            Method m = cls.getMethod(name);
            m.setAccessible(true);
            return m;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String safeString(Object o) {
        return o instanceof String ? (String) o : "";
    }

    private static final class MutePillController implements SpaceLocalMuteController.MuteStateListener,
            View.OnAttachStateChangeListener {
        final TextView root;
        final Context ctx;

        MutePillController(Context ctx) {
            this.ctx = ctx;
            this.root = new TextView(ctx);
            root.setGravity(Gravity.CENTER_VERTICAL);
            root.setPadding(dp(ctx, 10), dp(ctx, 5), dp(ctx, 10), dp(ctx, 5));
            root.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
            root.setTypeface(Typeface.DEFAULT_BOLD);
            root.setSingleLine(true);
            root.addOnAttachStateChangeListener(this);
            render();
        }

        private void render() {
            SpaceLocalMuteController ctrl = SpaceLocalMuteController.get();
            int mutedCount = ctrl.getMutedCount();
            boolean silencing = ctrl.isActivelySilencing();
            boolean dark = isDarkTheme(ctx);
            if (silencing) {
                root.setBackground(makeRoundedBg(Color.parseColor("#E6D97706"), dp(ctx, 14)));
                root.setTextColor(Color.WHITE);
                root.setText("🔇 " + mutedCount);
            } else if (mutedCount > 0) {
                root.setBackground(makeRoundedBg(
                        dark ? Color.parseColor("#4DF59E0B") : Color.parseColor("#26D97706"), dp(ctx, 14)));
                root.setTextColor(dark ? Color.parseColor("#FBBF24") : Color.parseColor("#B45309"));
                root.setText("🔇 " + mutedCount);
            } else {
                root.setBackground(makeRoundedBg(
                        dark ? Color.parseColor("#33FFFFFF") : Color.parseColor("#1A0F1419"), dp(ctx, 14)));
                root.setTextColor(dark ? Color.parseColor("#E7E9EA") : Color.parseColor("#0F1419"));
                root.setText(SpaceLocalMuteStrings.headerPillIdle(ctx));
            }
        }

        @Override
        public void onLocalMuteStateChanged() {
            render();
        }

        @Override
        public void onViewAttachedToWindow(View v) {
            SpaceLocalMuteController.get().addListener(this);
            render();
        }

        @Override
        public void onViewDetachedFromWindow(View v) {
            SpaceLocalMuteController.get().removeListener(this);
        }
    }
}
