// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.memes;

import static app.morphe.extension.shared.StringRef.str;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import io.github.joancomasfdz.extension.baconreader.errors.ErrorDialog;

/**
 * BaconReader's own meme templates (cf-baconreader.onelouder.com/memebackgrounds) no longer exist.
 * The grid shows Imgflip's 250 px thumbnails, and a tapped template is downloaded at full size.
 */
@SuppressWarnings("unused")
public final class FixMemeTemplatesPatch {
    private static final String BASE_URL = "https://i.imgflip.com/";
    private static final String THUMBNAIL_URL = BASE_URL + "4/";
    /** The drawing screen scales the template to its width. */
    private static final int MAX_TEMPLATE_WIDTH = 1440;
    private static final int TIMEOUT_MS = 15000;

    /** Imgflip's most used meme templates (api.imgflip.com/get_memes). */
    private static final String[] TEMPLATES = {
            "30b1gx.jpg", // Drake Hotline Bling
            "1g8my4.jpg", // Two Buttons
            "1ur9b0.jpg", // Distracted Boyfriend
            "3oevdk.jpg", // Bernie I Am Once Again Asking For Your Support
            "3lmzyx.jpg", // UNO Draw 25 Cards
            "22bdq6.jpg", // Left Exit 12 Off Ramp
            "46e43q.png", // Always Has Been
            "5c7lwq.png", // Anakin Padme 4 Panel
            "28j0te.jpg", // Epic Handshake
            "26jxvz.jpg", // Gru's Plan
            "261o3j.jpg", // Running Away Balloon
            "23ls.jpg", // Disaster Girl
            "2fm6x.jpg", // Waiting Skeleton
            "1c1uej.jpg", // Sad Pablo Escobar
            "54hjww.jpg", // Trade Offer
            "24y43o.jpg", // Change My Mind
            "21uy0f.jpg", // Y'all Got Any More Of That
            "1ihzfe.jpg", // X, X Everywhere
            "9ehk.jpg", // Batman Slapping Robin
            "345v97.jpg", // Woman Yelling At Cat
            "3pdf2w.png", // Bernie Sanders Once Again Asking
            "2odckz.jpg", // Marked Safe From
            "1b42wl.jpg", // Bike Fall
            "26am.jpg", // Ancient Aliens
            "1otk96.jpg", // Mocking Spongebob
            "1bij.jpg", // One Does Not Simply
            "1o00in.jpg", // Is This A Pigeon
            "2xscjb.png", // You Guys are Getting Paid
            "2za3u1.jpg", // They're The Same Picture
            "8d317n.png", // Absolute Cinema
            "43a45p.png", // Buff Doge vs. Cheems
            "72epa9.png", // 0 days without (Lenny, Simpsons)
            "1jwhww.jpg", // Expanding Brain
            "46hhvr.jpg", // Mother Ignoring Kid Drowning In A Pool
            "145qvv.jpg", // Squidward window
            "gtj5t.jpg", // Oprah You Get A
            "1wz1x.jpg", // This Is Where I'd Put My Trophy If I Had One
            "2ybua0.png", // Tuxedo Winnie The Pooh
            "64sz4u.png", // Megamind peeking
            "3gdsh1.jpg", // George Bush 9/11
            "19vcz0.jpg", // Pawn Stars Best I Can Do
            "wxica.jpg", // This Is Fine
            "1tl71a.jpg", // I Bet He's Thinking About Other Women
            "8tw3vb.png", // Bell Curve
            "4pn1an.png", // They don't know
            "2tzo2k.jpg", // Soldier protecting sleeping child
            "2gnnjh.jpg", // Monkey Puppet
            "29v4rt.jpg", // Friendship ended
            "5v6gwj.jpg", // Two guys on a bus
            "3i7p.jpg", // Imagination Spongebob
            "38el31.jpg", // Clown Applying Makeup
            "1h7in3.jpg", // Roll Safe Think About It
            "3eqjd8.jpg", // Spider Man Triple
            "m78d.jpg", // Boardroom Meeting Suggestion
            "58eyvu.png", // where monkey
            "gk5el.jpg", // Hide the Pain Harold
            "1yz6z4.jpg", // Types of Headaches meme
            "1e7ql7.jpg", // Evil Kermit
            "2reqtg.png", // Flex Tape
            "3kwur5.jpg", // All My Homies Hate
            "27qxmb.jpg", // You know, I'm something of a scientist myself
            "1w7ygt.jpg", // Inhaling Seagull
            "33e92f.jpg", // Three-headed Dragon
            "1nck6k.jpg", // Sleeping Shaq
            "434i5j.png", // A train hitting a school bus
            "4acd7j.png", // Laughing Leo
            "3po4m7.jpg", // Anime Girl Hiding from Terminator
            "24zoa8.jpg", // No - Yes
            "3vfrmx.jpg", // AJ Styles & Undertaker
            "3qqcim.png", // Panik Kalm Panik
            "2eeunw.jpg", // Scooby doo mask reveal
            "1bip.jpg", // Bad Luck Brian
            "3nx72a.png", // Grant Gustin over grave
            "65939r.jpg", // Megamind no bitches
            "2oo7h0.jpg", // Domino Effect
            "1tkjq9.jpg", // spiderman pointing at spiderman
            "1op9wy.jpg", // Whisper and Goosebumps
            "2kbn1e.jpg", // Surprised Pikachu
            "265k.jpg", // Third World Skeptical Kid
            "28s2gu.jpg", // Who Killed Hannibal
            "8k0sa.jpg", // Star Wars Yoda
            "2cjr7j.jpg", // is this butterfly
            "1yxkcp.jpg", // Blank Nut Button
            "1qg8fp.jpg", // Grim Reaper Knocking Door
            "1bgw.jpg", // Futurama Fry
            "176h0h.jpg", // say the line bart! simpsons
            "1bhw.jpg", // Grandma Finds The Internet
            "bwu6w.jpg", // c'mon do something
            "54d9lj.png", // Two Paths
            "hlmst.jpg", // I'm The Captain Now
            "1iruch.jpg", // Drake Blank
            "1itoun.jpg", // Charlie Conspiracy (Always Sunny in Philidelphia)
            "grr.jpg", // The Rock Driving
            "39t1o.jpg", // Leonardo Dicaprio Cheers
            "2896ro.jpg", // American Chopper Argument
            "5youx3.jpg", // whe i'm in a competition and my opponent is
            "21tqf4.jpg", // The Scroll Of Truth
            "5o32tt.png", // Gus Fring we are not the same
            "1ii4oc.jpg", // Trump Bill Signing
            "44eggm.png" // Bugs bunny communist
    };

    private FixMemeTemplatesPatch() {
    }

    /** Imgflip's thumbnails are always JPEG. */
    public static String[] getTemplateUrls() {
        String[] urls = new String[TEMPLATES.length];
        for (int i = 0; i < TEMPLATES.length; i++) {
            String id = TEMPLATES[i];
            urls[i] = THUMBNAIL_URL + id.substring(0, id.lastIndexOf('.')) + ".jpg";
        }
        return urls;
    }

    private static String getFullUrl(String thumbnailUrl) {
        String name = thumbnailUrl.substring(THUMBNAIL_URL.length());
        String id = name.substring(0, name.lastIndexOf('.'));
        for (String template : TEMPLATES) {
            if (template.startsWith(id + ".")) return BASE_URL + template;
        }
        return null;
    }

    /**
     * Replaces the app's handling of a tapped template, which saves the grid's thumbnail as the background.
     *
     * @return true if the tap is handled here.
     */
    public static boolean onTemplateClick(Activity activity, Object item) {
        try {
            if (activity == null || !(item instanceof String) || !((String) item).startsWith(THUMBNAIL_URL)) {
                return false;
            }
            String fullUrl = getFullUrl((String) item);
            if (fullUrl == null) return false;

            Context context = activity;
            String directory = (String) Class.forName("com.onelouder.baconreader.utils.ExtensionHelperKt")
                    .getMethod("getMemsDirectory", Context.class).invoke(null, context);
            String fileName = (String) Class.forName("com.handmark.drawchat.DrawChat")
                    .getMethod("generateFileName").invoke(null);
            File file = new File(directory, fileName);

            ProgressDialog dialog = new ProgressDialog(activity);
            dialog.setMessage(str("revanced_meme_template_loading"));
            dialog.setIndeterminate(true);
            dialog.setCancelable(true);
            dialog.show();

            Utils.runOnBackgroundThread(() -> {
                boolean saved = download(fullUrl, file);
                Utils.runOnMainThread(() -> {
                    if (!dialog.isShowing() || activity.isFinishing()) return;
                    dialog.dismiss();
                    if (!saved) {
                        Utils.showToastShort(str("revanced_meme_template_error"));
                        return;
                    }
                    Intent intent = new Intent();
                    intent.putExtra("FILE_NAME", fileName);
                    intent.setData(Uri.parse(fullUrl));
                    activity.setResult(Activity.RESULT_OK, intent);
                    activity.finish();
                });
            });
            return true;
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not open the template", ex);
            return false;
        }
    }

    private static boolean download(String url, File file) {
        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new URL(url).openConnection();
            connection.setConnectTimeout(TIMEOUT_MS);
            connection.setReadTimeout(TIMEOUT_MS);
            if (connection.getResponseCode() != HttpURLConnection.HTTP_OK) return false;

            byte[] data;
            try (InputStream in = connection.getInputStream()) {
                ByteArrayOutputStream bytes = new ByteArrayOutputStream();
                byte[] buffer = new byte[16384];
                int read;
                while ((read = in.read(buffer)) != -1) bytes.write(buffer, 0, read);
                data = bytes.toByteArray();
            }

            BitmapFactory.Options options = new BitmapFactory.Options();
            options.inJustDecodeBounds = true;
            BitmapFactory.decodeByteArray(data, 0, data.length, options);
            options.inSampleSize = 1;
            while (options.outWidth / (options.inSampleSize * 2) >= MAX_TEMPLATE_WIDTH) options.inSampleSize *= 2;
            options.inJustDecodeBounds = false;
            Bitmap bitmap = BitmapFactory.decodeByteArray(data, 0, data.length, options);
            if (bitmap == null) return false;

            File directory = file.getParentFile();
            if (directory != null) directory.mkdirs();
            try (OutputStream out = new FileOutputStream(file)) {
                return bitmap.compress(Bitmap.CompressFormat.JPEG, 95, out);
            } finally {
                bitmap.recycle();
            }
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not download the template " + url, ex);
            return false;
        } finally {
            if (connection != null) connection.disconnect();
        }
    }
}
