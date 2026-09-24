package app.belkart.extension.wallet;

import android.annotation.TargetApi;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.drawable.Icon;
import android.os.Build;
import android.service.quickaccesswallet.GetWalletCardsCallback;
import android.service.quickaccesswallet.GetWalletCardsError;
import android.service.quickaccesswallet.GetWalletCardsRequest;
import android.service.quickaccesswallet.GetWalletCardsResponse;
import android.service.quickaccesswallet.QuickAccessWalletService;
import android.service.quickaccesswallet.SelectWalletCardRequest;
import android.service.quickaccesswallet.WalletCard;
import android.text.TextUtils;
import android.util.Log;

import java.io.File;
import java.lang.reflect.Field;
import java.util.Collections;

/** Quick Access Wallet bridge backed by Belkart Pay's card database. */
@SuppressWarnings("unused")
@TargetApi(Build.VERSION_CODES.R)
public final class BelkartQuickAccessWalletService extends QuickAccessWalletService {
    private static final String TAG = "BelkartWallet";
    static final String EXTRA_WALLET_PAYMENT = "belkart.wallet.payment";
    static final String EXTRA_CARD_ID = "belkart.wallet.card_id";
    private static final String FALLBACK_LABEL = "Белкарт Pay";
    private static final int REQUEST_CARD = 1;
    private static final int REQUEST_QUICK_ACCESS = 2;
    private static final int REQUEST_GESTURE = 3;
    private static final int DEFAULT_CARD_WIDTH = 800;
    private static final int DEFAULT_CARD_HEIGHT = 504;

    @Override
    public void onWalletCardsRequested(GetWalletCardsRequest request, GetWalletCardsCallback callback) {
        if (request.getMaxCards() < 1) {
            callback.onSuccess(new GetWalletCardsResponse(Collections.emptyList(), 0));
            return;
        }
        new Thread(() -> {
            try {
                CardData card = readDefaultCard();
                if (card == null) {
                    Log.i(TAG, "No card found or not registered yet, providing empty cards");
                    callback.onSuccess(new GetWalletCardsResponse(Collections.emptyList(), 0));
                    return;
                }
                int width = request.getCardWidthPx() > 0 ? request.getCardWidthPx() : DEFAULT_CARD_WIDTH;
                int height = request.getCardHeightPx() > 0 ? request.getCardHeightPx() : DEFAULT_CARD_HEIGHT;
                callback.onSuccess(new GetWalletCardsResponse(Collections.singletonList(buildPaymentCard(card, width, height)), 0));
            } catch (Throwable t) {
                Log.e(TAG, "Failed to read Belkart card", t);
                callback.onFailure(new GetWalletCardsError(null, null));
            }
        }, "belkart-wallet-card").start();
    }

    private WalletCard buildPaymentCard(CardData card, int width, int height) {
        CharSequence label = TextUtils.isEmpty(card.name) ? FALLBACK_LABEL : card.name;
        Icon image = createCardImage(card, width, height);
        PendingIntent intent = buildLaunchIntent(card.id, REQUEST_CARD);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
            return new WalletCard.Builder(card.id, WalletCard.CARD_TYPE_PAYMENT, image, label, intent)
                    .setCardLabel(card.maskedNumber).build();
        }
        return new WalletCard.Builder(card.id, image, label, intent).setCardLabel(card.maskedNumber).build();
    }

    @Override public void onWalletCardSelected(SelectWalletCardRequest request) { }
    @Override public void onWalletDismissed() { }
    public PendingIntent getTargetActivityPendingIntent() { return buildLaunchIntent(null, REQUEST_QUICK_ACCESS); }
    public PendingIntent getGestureTargetActivityPendingIntent() { return buildLaunchIntent(null, REQUEST_GESTURE); }

    private PendingIntent buildLaunchIntent(String cardId, int requestCode) {
        Intent intent = getPackageManager().getLaunchIntentForPackage(getPackageName());
        if (intent == null) intent = new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER).setPackage(getPackageName());
        intent.putExtra(EXTRA_WALLET_PAYMENT, true);
        if (!TextUtils.isEmpty(cardId)) intent.putExtra(EXTRA_CARD_ID, cardId);
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
        return PendingIntent.getActivity(this, requestCode, intent, PendingIntent.FLAG_IMMUTABLE | PendingIntent.FLAG_UPDATE_CURRENT);
    }

    private Icon createCardImage(CardData card, int width, int height) {
        try {
            int id = getResources().getIdentifier("card_round_" + card.color + "_3d", "drawable", getPackageName());
            Bitmap source = id == 0 ? null : BitmapFactory.decodeResource(getResources(), id);
            Bitmap bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
            Canvas canvas = new Canvas(bitmap);
            if (source != null) { canvas.drawBitmap(source, null, new RectF(0, 0, width, height), new Paint(Paint.ANTI_ALIAS_FLAG)); source.recycle(); }
            else canvas.drawColor(Color.rgb(0, 160, 227));
            Bitmap hardware = bitmap.copy(Bitmap.Config.HARDWARE, false); bitmap.recycle();
            if (hardware != null) return Icon.createWithBitmap(hardware);
        } catch (Throwable t) { Log.w(TAG, "Failed to render real card image", t); }
        return Icon.createWithResource(getPackageName(), getApplicationInfo().icon);
    }

    private CardData readDefaultCard() {
        CardData card = readCardDirectSqlite();
        if (card != null) return card;
        return readCardViaInAppInstance();
    }

    private CardData readCardDirectSqlite() {
        try {
            File[] searchDirs = new File[] {
                getDatabasePath("test").getParentFile(),
                new File(getApplicationInfo().dataDir, "databases"),
                new File(getFilesDir().getParentFile(), "databases")
            };

            for (File dbDir : searchDirs) {
                if (dbDir == null || !dbDir.exists()) continue;
                File[] files = dbDir.listFiles((dir, name) -> !name.endsWith("-journal") && !name.endsWith("-wal") && !name.endsWith("-shm"));
                if (files == null) continue;

                for (File dbFile : files) {
                    try (SQLiteDatabase db = SQLiteDatabase.openDatabase(dbFile.getAbsolutePath(), null, SQLiteDatabase.OPEN_READONLY)) {
                        Cursor cursor = db.rawQuery("SELECT name FROM sqlite_master WHERE type='table' AND name='pp'", null);
                        boolean hasTable = cursor != null && cursor.moveToFirst();
                        if (cursor != null) cursor.close();
                        if (!hasTable) continue;

                        try (Cursor c = db.rawQuery("SELECT id, cardNumber, isDefault, colorName, cardName, cardCdId, cardStatus FROM pp ORDER BY CASE WHEN isDefault = 1 THEN 0 ELSE 1 END, id LIMIT 1", null)) {
                            if (c != null && c.moveToFirst()) {
                                String id = value(c, "cardCdId");
                                if (TextUtils.isEmpty(id)) id = String.valueOf(c.getLong(c.getColumnIndexOrThrow("id")));
                                Log.i(TAG, "Successfully read card directly from " + dbFile.getName());
                                return new CardData(id, value(c, "cardName"), mask(value(c, "cardNumber")), color(value(c, "colorName")));
                            }
                        }
                    } catch (Throwable ignored) {
                    }
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "Direct SQLite read failed", t);
        }
        return null;
    }

    private CardData readCardViaInAppInstance() {
        try {
            Class<?> appClass = Class.forName("com.belkartpay.belkartpay.app.App");
            Object app = staticField(appClass, "K0");
            if (app == null) return null;
            Object container = staticField(appClass, "L0"); // Lo1/f singleton
            if (container == null) return null;

            // Field c in Lo1/f is Lja/g (CardRepository), which contains Lha/i a (CardDao)
            Object cardRepo = field(container, "c");
            if (cardRepo == null) return null;
            Object cardDao = field(cardRepo, "a");
            if (cardDao == null) return null;
            Object roomDb = field(cardDao, "a"); // Lk4/v
            if (roomDb == null) return null;

            // In k4/v: field e is OpenHelper (k4/s)
            Object openHelper = field(roomDb, "e");
            if (openHelper == null) return null;

            // Call readable/writable database getter on openHelper
            Object sqlite = invokeFirstAvailable(openHelper, "e", "f", "c");
            if (sqlite == null) return null;

            Cursor cursor = (Cursor) sqlite.getClass().getMethod("q", String.class).invoke(sqlite, "SELECT id, cardNumber, isDefault, colorName, cardName, cardCdId, cardStatus FROM pp ORDER BY CASE WHEN isDefault = 1 THEN 0 ELSE 1 END, id LIMIT 1");
            if (cursor == null) return null;
            try {
                if (!cursor.moveToFirst()) return null;
                String id = value(cursor, "cardCdId");
                if (TextUtils.isEmpty(id)) id = String.valueOf(cursor.getLong(cursor.getColumnIndexOrThrow("id")));
                return new CardData(id, value(cursor, "cardName"), mask(value(cursor, "cardNumber")), color(value(cursor, "colorName")));
            } finally {
                cursor.close();
            }
        } catch (Throwable t) {
            Log.w(TAG, "In-app instance read failed", t);
        }
        return null;
    }

    private static Object invokeFirstAvailable(Object target, String... names) {
        for (String name : names) {
            try {
                return target.getClass().getMethod(name).invoke(target);
            } catch (Throwable ignored) {}
        }
        return null;
    }

    private static Object staticField(Class<?> type, String name) throws Exception { Field f = type.getDeclaredField(name); f.setAccessible(true); return f.get(null); }
    private static Object field(Object object, String name) throws Exception {
        Class<?> c = object.getClass();
        while (c != null && c != Object.class) {
            try {
                Field f = c.getDeclaredField(name);
                f.setAccessible(true);
                return f.get(object);
            } catch (NoSuchFieldException e) {
                c = c.getSuperclass();
            }
        }
        throw new NoSuchFieldException(name);
    }
    private static String value(Cursor c, String name) { int i = c.getColumnIndex(name); return i < 0 || c.isNull(i) ? "" : c.getString(i); }
    private static String mask(String number) { if (TextUtils.isEmpty(number)) return "Белкарт Pay"; String digits = number.replaceAll("\\D", ""); return digits.length() >= 4 ? "•••• " + digits.substring(digits.length() - 4) : number; }
    private static String color(String value) { String v = value == null ? "" : value.toLowerCase(); if (v.contains("green")) return "green"; if (v.contains("red")) return "red"; if (v.contains("yellow")) return "yellow"; if (v.contains("orange")) return "orange"; if (v.contains("grey") || v.contains("gray")) return "grey"; return "blue"; }

    private static final class CardData {
        final String id, name, maskedNumber, color;
        CardData(String id, String name, String maskedNumber, String color) { this.id = id; this.name = name; this.maskedNumber = maskedNumber; this.color = color; }
    }
}
