package app.aidan.extension.adobescan;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.pdf.PdfRenderer;
import android.os.Handler;
import android.os.Looper;
import android.os.ParcelFileDescriptor;
import android.text.InputType;
import android.util.Log;
import android.util.LruCache;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.ScrollView;
import android.widget.TextView;
import java.io.File;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
public final class PdfCombineBridge {

    private static final String TAG = "PdfCombineBridge";

    private static final LruCache<String, Bitmap> sThumbnailCache = new LruCache<String, Bitmap>(8 * 1024) {
        @Override
        protected int sizeOf(final String key, final Bitmap bitmap) {
            return bitmap.getByteCount() / 1024;
        }
    };

    private static final Map<Object, Boolean> sProtectionCache =
            Collections.synchronizedMap(new java.util.WeakHashMap<Object, Boolean>());
    private static final ExecutorService sThumbnailExecutor = Executors.newFixedThreadPool(2);

    private PdfCombineBridge() {}

    public static void show(final Activity activity, final List<?> scanFiles) {
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) {
            return;
        }

        if (Looper.myLooper() != Looper.getMainLooper()) {
            new Handler(Looper.getMainLooper()).post(new Runnable() {
                @Override
                public void run() {
                    show(activity, scanFiles);
                }
            });
            return;
        }

        // Copy selected items immediately
        final List<Object> initialList = new ArrayList<>();
        if (scanFiles != null) {
            for (Object sf : scanFiles) {
                if (sf != null) initialList.add(sf);
            }
        }

        if (initialList.size() >= 2) {
            showOrderAndNameDialog(activity, initialList);
        } else {
            showPickerFromLibrary(activity, initialList);
        }
    }

    private static void showPickerFromLibrary(final Activity activity, final List<Object> preselected) {
        final List<Object> eligibleScans = getEligibleLocalScans();
        if (eligibleScans.size() < 2) {
            new AlertDialog.Builder(activity)
                    .setTitle("Combine Files")
                    .setMessage("At least two locally saved scans are required to combine. Scan or import more documents first.")
                    .setPositiveButton("OK", null)
                    .show();
            return;
        }

        final ScanFileAdapter adapter = ScanFileAdapter.getInstance();
        final List<Object> userSelected = new ArrayList<>(preselected);

        final ListView listView = new ListView(activity);
        final BaseAdapter listAdapter = new BaseAdapter() {
            @Override
            public int getCount() {
                return eligibleScans.size();
            }

            @Override
            public Object getItem(int position) {
                return eligibleScans.get(position);
            }

            @Override
            public long getItemId(int position) {
                return position;
            }

            @Override
            public View getView(int position, View convertView, ViewGroup parent) {
                final Object item = eligibleScans.get(position);
                final boolean isSelected = userSelected.contains(item);
                final boolean isProtected = isScanProtected(item);
                final File f = adapter.getFile(item);

                final LinearLayout row;
                final CheckBox cb;
                final ImageView thumbView;
                final TextView titleView;
                final TextView subtitleView;

                if (convertView instanceof LinearLayout) {
                    row = (LinearLayout) convertView;
                    cb = (CheckBox) row.getChildAt(0);
                    thumbView = (ImageView) row.getChildAt(1);
                    final LinearLayout textCol = (LinearLayout) row.getChildAt(2);
                    titleView = (TextView) textCol.getChildAt(0);
                    subtitleView = (TextView) textCol.getChildAt(1);
                } else {
                    row = new LinearLayout(activity);
                    row.setOrientation(LinearLayout.HORIZONTAL);
                    row.setGravity(Gravity.CENTER_VERTICAL);
                    final int padV = dpToPx(activity, 8);
                    final int padH = dpToPx(activity, 14);
                    row.setPadding(padH, padV, padH, padV);

                    cb = new CheckBox(activity);
                    cb.setClickable(false);
                    cb.setFocusable(false);
                    row.addView(cb);

                    thumbView = new ImageView(activity);
                    final int tw = dpToPx(activity, 40);
                    final int th = dpToPx(activity, 52);
                    final LinearLayout.LayoutParams thumbLp = new LinearLayout.LayoutParams(tw, th);
                    thumbLp.setMargins(dpToPx(activity, 8), 0, dpToPx(activity, 12), 0);
                    row.addView(thumbView, thumbLp);

                    final LinearLayout textCol = new LinearLayout(activity);
                    textCol.setOrientation(LinearLayout.VERTICAL);
                    final LinearLayout.LayoutParams colLp =
                            new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f);
                    row.addView(textCol, colLp);

                    titleView = new TextView(activity);
                    titleView.setTextSize(15f);
                    titleView.setMaxLines(2);
                    titleView.setEllipsize(android.text.TextUtils.TruncateAt.END);
                    textCol.addView(titleView);

                    subtitleView = new TextView(activity);
                    subtitleView.setTextSize(12f);
                    textCol.addView(subtitleView);
                }

                cb.setChecked(isSelected);
                titleView.setText(adapter.getDisplayName(item));

                if (isProtected) {
                    subtitleView.setText("🔒 Password protected");
                    subtitleView.setTextColor(0xFFC26100);
                } else if (f != null && f.exists()) {
                    final double mb = f.length() / (1024.0 * 1024.0);
                    subtitleView.setText(String.format(Locale.US, "%.1f MB", mb));
                    subtitleView.setTextColor(0xFF757575);
                } else {
                    subtitleView.setText("");
                }

                if (f != null && f.exists()) {
                    loadThumbnail(activity, f, isProtected, thumbView, 40, 52);
                }

                return row;
            }
        };

        listView.setAdapter(listAdapter);
        precomputeProtection(eligibleScans, new Runnable() {
            @Override
            public void run() {
                listAdapter.notifyDataSetChanged();
            }
        });
        listView.setOnItemClickListener(new android.widget.AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(android.widget.AdapterView<?> parent, View view, int position, long id) {
                final Object item = eligibleScans.get(position);
                if (userSelected.contains(item)) {
                    userSelected.remove(item);
                } else {
                    userSelected.add(item);
                }
                listAdapter.notifyDataSetChanged();
            }
        });

        new AlertDialog.Builder(activity)
                .setTitle("Select Scans to Combine")
                .setView(listView)
                .setPositiveButton("Next", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        if (userSelected.size() < 2) {
                            PdfOperationUi.showSnackbar(activity, "Please select at least two scans to combine.");
                            return;
                        }
                        showOrderAndNameDialog(activity, userSelected);
                    }
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    private static void showOrderAndNameDialog(final Activity activity, final List<Object> items) {
        final List<Object> orderedList = new ArrayList<>(items);
        final ScanFileAdapter adapter = ScanFileAdapter.getInstance();

        final LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        final int pad = dpToPx(activity, 16);
        root.setPadding(pad, pad, pad, pad);

        final TextView nameLabel = new TextView(activity);
        nameLabel.setText("Document Name");
        nameLabel.setTextSize(14f);
        root.addView(nameLabel);

        final EditText nameInput = new EditText(activity);
        nameInput.setText("Combined scan");
        nameInput.setSingleLine(true);
        root.addView(nameInput);

        final TextView orderLabel = new TextView(activity);
        orderLabel.setText("Combine Order (Top to Bottom):");
        orderLabel.setTextSize(14f);
        orderLabel.setPadding(0, dpToPx(activity, 12), 0, dpToPx(activity, 6));
        root.addView(orderLabel);

        final ScrollView scrollView = new ScrollView(activity);
        final LinearLayout listContainer = new LinearLayout(activity);
        listContainer.setOrientation(LinearLayout.VERTICAL);
        scrollView.addView(listContainer);
        root.addView(scrollView);

        final Runnable renderList = new Runnable() {
            @Override
            public void run() {
                listContainer.removeAllViews();
                for (int i = 0; i < orderedList.size(); i++) {
                    final int idx = i;
                    final Object item = orderedList.get(i);
                    final String title = (idx + 1) + ". " + adapter.getDisplayName(item);
                    final boolean isProtected = isScanProtected(item);
                    final File f = adapter.getFile(item);

                    final LinearLayout row = new LinearLayout(activity);
                    row.setOrientation(LinearLayout.HORIZONTAL);
                    row.setGravity(Gravity.CENTER_VERTICAL);
                    row.setPadding(0, dpToPx(activity, 4), 0, dpToPx(activity, 4));

                    final ImageView thumb = new ImageView(activity);
                    final int tw = dpToPx(activity, 30);
                    final int th = dpToPx(activity, 39);
                    final LinearLayout.LayoutParams thumbLp = new LinearLayout.LayoutParams(tw, th);
                    thumbLp.setMargins(0, 0, dpToPx(activity, 8), 0);
                    row.addView(thumb, thumbLp);
                    if (f != null && f.exists()) {
                        loadThumbnail(activity, f, isProtected, thumb, 30, 39);
                    }

                    final TextView itemText = new TextView(activity);
                    itemText.setText(title);
                    itemText.setTextSize(15f);
                    final LinearLayout.LayoutParams lpText =
                            new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f);
                    row.addView(itemText, lpText);

                    final Button upBtn = new Button(activity, null, android.R.attr.buttonStyleSmall);
                    upBtn.setText("▲");
                    upBtn.setEnabled(idx > 0);
                    upBtn.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View v) {
                            if (idx > 0) {
                                Collections.swap(orderedList, idx, idx - 1);
                                run();
                            }
                        }
                    });
                    row.addView(upBtn);

                    final Button downBtn = new Button(activity, null, android.R.attr.buttonStyleSmall);
                    downBtn.setText("▼");
                    downBtn.setEnabled(idx < orderedList.size() - 1);
                    downBtn.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View v) {
                            if (idx < orderedList.size() - 1) {
                                Collections.swap(orderedList, idx, idx + 1);
                                run();
                            }
                        }
                    });
                    row.addView(downBtn);

                    listContainer.addView(row);
                }
            }
        };

        renderList.run();
        precomputeProtection(orderedList, renderList);

        new AlertDialog.Builder(activity)
                .setTitle("Combine Files")
                .setView(root)
                .setPositiveButton("Combine", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        String rawName = nameInput.getText().toString().trim();
                        if (rawName.isEmpty()) {
                            PdfOperationUi.showSnackbar(activity, "Please enter a valid document name.");
                            return;
                        }
                        if (rawName.toLowerCase().endsWith(".pdf")) {
                            rawName = rawName.substring(0, rawName.length() - 4).trim();
                        }
                        if (rawName.isEmpty()) {
                            rawName = "Combined scan";
                        }
                        if (orderedList.size() < 2) {
                            PdfOperationUi.showSnackbar(activity, "At least two scans are required to combine.");
                            return;
                        }

                        final List<Object> protectedItems = new ArrayList<>();
                        for (Object sf : orderedList) {
                            if (isScanProtected(sf)) {
                                protectedItems.add(sf);
                            }
                        }

                        final PdfOperationCoordinator coordinator = PdfOperationCoordinator.getInstance();
                        if (coordinator == null) {
                            Log.e(TAG, "PdfOperationCoordinator is unavailable");
                            PdfOperationUi.showSnackbar(activity, "PDF service unavailable");
                            return;
                        }
                        if (protectedItems.isEmpty()) {
                            coordinator.startCombine(activity, orderedList, rawName, null);
                        } else {
                            showPasswordPromptDialog(activity, orderedList, rawName, protectedItems);
                        }
                    }
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    private static void showPasswordPromptDialog(
            final Activity activity,
            final List<Object> orderedList,
            final String rawName,
            final List<Object> protectedItems) {

        final ScanFileAdapter adapter = ScanFileAdapter.getInstance();
        final LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        final int pad = dpToPx(activity, 16);
        root.setPadding(pad, pad, pad, pad);

        final TextView msgView = new TextView(activity);
        msgView.setTextSize(14f);
        if (protectedItems.size() == 1) {
            msgView.setText("Enter the password for \"" + adapter.getDisplayName(protectedItems.get(0)) + "\" to combine.");
        } else {
            msgView.setText("The following documents are password-protected. Enter the password for each document to combine:");
        }
        msgView.setPadding(0, 0, 0, dpToPx(activity, 12));
        root.addView(msgView);

        final ScrollView scrollView = new ScrollView(activity);
        final LinearLayout listContainer = new LinearLayout(activity);
        listContainer.setOrientation(LinearLayout.VERTICAL);
        scrollView.addView(listContainer);
        root.addView(scrollView);

        final Map<String, EditText> passwordInputs = new HashMap<>();

        for (final Object item : protectedItems) {
            final File file = adapter.getFile(item);
            final String itemKey = (file != null) ? file.getAbsolutePath() : adapter.getDisplayName(item);

            final TextView itemLabel = new TextView(activity);
            itemLabel.setText("🔒 " + adapter.getDisplayName(item));
            itemLabel.setTextSize(14f);
            itemLabel.setTypeface(null, android.graphics.Typeface.BOLD);
            itemLabel.setPadding(0, dpToPx(activity, 8), 0, dpToPx(activity, 4));
            listContainer.addView(itemLabel);

            final EditText passwordInput = new EditText(activity);
            passwordInput.setHint("Password");
            passwordInput.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_PASSWORD);
            passwordInput.setSingleLine(true);
            listContainer.addView(passwordInput);

            passwordInputs.put(itemKey, passwordInput);
        }

        new AlertDialog.Builder(activity)
                .setTitle("Password Required")
                .setView(root)
                .setPositiveButton("Combine", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        for (final Object item : protectedItems) {
                            final File file = adapter.getFile(item);
                            final String itemKey = (file != null) ? file.getAbsolutePath() : adapter.getDisplayName(item);
                            final EditText et = passwordInputs.get(itemKey);
                            final String pw = (et != null) ? et.getText().toString() : "";
                            if (pw.trim().isEmpty()) {
                                PdfOperationUi.showSnackbar(
                                        activity, "Please enter the password for \"" + adapter.getDisplayName(item) + "\".");
                                return;
                            }
                        }

                        final List<String> passwords = new ArrayList<>();
                        for (final Object item : orderedList) {
                            final File file = adapter.getFile(item);
                            final String itemKey = (file != null) ? file.getAbsolutePath() : adapter.getDisplayName(item);
                            final EditText et = passwordInputs.get(itemKey);
                            if (et != null) {
                                passwords.add(et.getText().toString());
                            } else {
                                passwords.add(null);
                            }
                        }
                        final PdfOperationCoordinator coordinator = PdfOperationCoordinator.getInstance();
                        if (coordinator == null) {
                            Log.e(TAG, "PdfOperationCoordinator is unavailable");
                            PdfOperationUi.showSnackbar(activity, "PDF service unavailable");
                            return;
                        }
                        coordinator.startCombine(activity, orderedList, rawName, passwords);
                    }
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    private static boolean isScanProtected(final Object scanFile) {
        if (scanFile == null) return false;
        final ScanFileAdapter adapter = ScanFileAdapter.getInstance();
        if (adapter.isProtected(scanFile) || adapter.getProtectionStatus(scanFile) == 2) {
            return true;
        }
        final Boolean cached = sProtectionCache.get(scanFile);
        return cached != null && cached;
    }

    private static void precomputeProtection(final List<?> items, final Runnable onComplete) {
        if (items == null || items.isEmpty()) return;
        final List<Object> copy = new ArrayList<>(items);
        sThumbnailExecutor.execute(new Runnable() {
            @Override
            public void run() {
                final ScanFileAdapter adapter = ScanFileAdapter.getInstance();
                for (final Object scanFile : copy) {
                    if (scanFile == null) continue;
                    boolean isProtected = adapter.isProtected(scanFile) || adapter.getProtectionStatus(scanFile) == 2;
                    if (!isProtected) {
                        final File f = adapter.getFile(scanFile);
                        if (f != null && f.exists() && f.isFile()) {
                            ParcelFileDescriptor pfd = null;
                            try {
                                pfd = ParcelFileDescriptor.open(f, ParcelFileDescriptor.MODE_READ_ONLY);
                                final PdfRenderer renderer = new PdfRenderer(pfd);
                                renderer.close();
                            } catch (final SecurityException se) {
                                isProtected = true;
                            } catch (final Throwable ignored) {
                            } finally {
                                if (pfd != null) {
                                    try {
                                        pfd.close();
                                    } catch (final Throwable ignored) {}
                                }
                            }
                        }
                    }
                    sProtectionCache.put(scanFile, isProtected);
                }
                if (onComplete != null) {
                    new Handler(Looper.getMainLooper()).post(onComplete);
                }
            }
        });
    }

    private static Bitmap getOrCreatePlaceholder(
            final int w, final int h, final boolean locked, final float density) {
        final Bitmap bmp = Bitmap.createBitmap(w, h, Bitmap.Config.ARGB_8888);
        final Canvas canvas = new Canvas(bmp);
        final Paint bgPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        bgPaint.setColor(locked ? Color.rgb(243, 238, 230) : Color.rgb(245, 245, 247));
        final float corner = 4f * density;
        canvas.drawRoundRect(0, 0, w, h, corner, corner, bgPaint);

        final Paint borderPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        borderPaint.setStyle(Paint.Style.STROKE);
        borderPaint.setColor(locked ? Color.rgb(215, 175, 120) : Color.rgb(210, 210, 215));
        borderPaint.setStrokeWidth(1f * density);
        canvas.drawRoundRect(0.5f, 0.5f, w - 0.5f, h - 0.5f, corner, corner, borderPaint);

        final Paint textPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        textPaint.setTextAlign(Paint.Align.CENTER);
        textPaint.setTextSize(14f * density);
        final float yPos = (h / 2f) - ((textPaint.descent() + textPaint.ascent()) / 2f);
        canvas.drawText(locked ? "🔒" : "📄", w / 2f, yPos, textPaint);
        return bmp;
    }

    private static void loadThumbnail(
            final Activity activity,
            final File file,
            final boolean isProtected,
            final ImageView imageView,
            final int widthDp,
            final int heightDp) {
        final float density = activity.getResources().getDisplayMetrics().density;
        final int w = Math.round(widthDp * density);
        final int h = Math.round(heightDp * density);
        final String cacheKey = file.getAbsolutePath() + "_" + w + "x" + h;
        imageView.setTag(cacheKey);

        final Bitmap cached = sThumbnailCache.get(cacheKey);
        if (cached != null) {
            imageView.setImageBitmap(cached);
            return;
        }

        final Bitmap placeholder = getOrCreatePlaceholder(w, h, isProtected, density);
        imageView.setImageBitmap(placeholder);

        if (isProtected) {
            sThumbnailCache.put(cacheKey, placeholder);
            return;
        }

        sThumbnailExecutor.execute(new Runnable() {
            @Override
            public void run() {
                Bitmap rendered = null;
                ParcelFileDescriptor pfd = null;
                PdfRenderer renderer = null;
                PdfRenderer.Page page = null;
                try {
                    pfd = ParcelFileDescriptor.open(file, ParcelFileDescriptor.MODE_READ_ONLY);
                    renderer = new PdfRenderer(pfd);
                    if (renderer.getPageCount() > 0) {
                        page = renderer.openPage(0);
                        rendered = Bitmap.createBitmap(w, h, Bitmap.Config.ARGB_8888);
                        final Canvas canvas = new Canvas(rendered);
                        canvas.drawColor(Color.WHITE);
                        page.render(rendered, null, null, PdfRenderer.Page.RENDER_MODE_FOR_DISPLAY);

                        final Paint borderPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
                        borderPaint.setStyle(Paint.Style.STROKE);
                        borderPaint.setColor(Color.rgb(210, 210, 215));
                        borderPaint.setStrokeWidth(1f * density);
                        canvas.drawRoundRect(0.5f, 0.5f, w - 0.5f, h - 0.5f, 4f * density, 4f * density, borderPaint);
                    }
                } catch (final SecurityException se) {
                    rendered = getOrCreatePlaceholder(w, h, true, density);
                } catch (final Throwable ignored) {
                    rendered = placeholder;
                } finally {
                    if (page != null) {
                        try {
                            page.close();
                        } catch (final Throwable ignored) {
                        }
                    }
                    if (renderer != null) {
                        try {
                            renderer.close();
                        } catch (final Throwable ignored) {
                        }
                    }
                    if (pfd != null) {
                        try {
                            pfd.close();
                        } catch (final Throwable ignored) {
                        }
                    }
                }

                if (rendered != null) {
                    final Bitmap finalBmp = rendered;
                    sThumbnailCache.put(cacheKey, finalBmp);
                    activity.runOnUiThread(new Runnable() {
                        @Override
                        public void run() {
                            if (cacheKey.equals(imageView.getTag())) {
                                imageView.setImageBitmap(finalBmp);
                            }
                        }
                    });
                }
            }
        });
    }

    private static List<Object> getEligibleLocalScans() {
        final List<Object> results = new ArrayList<>();
        final ScanFileAdapter adapter = ScanFileAdapter.getInstance();
        try {
            final Class<?> v0Class = Class.forName("com.adobe.scan.android.file.v0");
            final Method bMethod = v0Class.getMethod("B");
            final Collection<?> collection = (Collection<?>) bMethod.invoke(null);
            if (collection != null) {
                for (Object sf : collection) {
                    if (sf == null) continue;
                    final File f = adapter.getFile(sf);
                    if (f != null && f.exists() && f.isFile() && f.length() > 0) {
                        results.add(sf);
                    }
                }
            }
        } catch (final Throwable t) {
            Log.e(TAG, "Failed to query local scans from v0.B()", t);
        }
        return results;
    }

    private static int dpToPx(final Activity activity, final int dp) {
        final float density = activity.getResources().getDisplayMetrics().density;
        return Math.round(dp * density);
    }
}
